import numpy as np
import pandas as pd
from sklearn.linear_model import LinearRegression
import matplotlib.pyplot as plt
from sklearn.model_selection import train_test_split
from sklearn.model_selection import KFold
from sklearn.model_selection._validation import cross_val_score

dataDir = "data"
filesDir = "textFiles"
imgDir = "img"

def validacionSimple():
    water = pd.read_csv(dataDir+"/salidaWaterClean.csv")

    # print(water)
    x = water["Salnty"].values
    y = water["T_degC"].values

    # Dividimos el Trainset en 80-20
    x_train, x_test, y_train, y_test = train_test_split(x, y, test_size=0.2, train_size=0.8, random_state=42)

    model = LinearRegression()

    model.fit(x_train.reshape(-1, 1), y_train.reshape(-1, 1))

    y_pred = model.predict(x_test.reshape(-1, 1))

    # Plot outputs
    plt.scatter(x_test, y_test, color='black')
    plt.scatter(x_test, y_pred, color='blue', linewidth=3)

    # plt.xticks(())
    # plt.yticks(())

    # plt.show()
    plt.savefig(imgDir+'/validacionSimpleWater.png')
    score = model.score(x_test.reshape(-1, 1),y_test)
    print("Accuracy: %.2f%%" % (score*100.0))

    # cnt = 0
    # for (idx, _), value in np.ndenumerate(y_pred):
    #     print(y_pred[idx])
    #     print(y_test[idx])
    #     if y_pred[idx] == y_test[idx]:
    #         cnt = cnt + 1
    #
    # print(cnt)
    res = y_pred - y_test.reshape(-1, 1)
    res2 = np.power(res, 2)
    res3 = res2.sum()
    res4 = res3 / len(res)
    # print(res)
    # print(res2)
    # print(res3)
    # print("Accuracy: %.2f%%" % res4)
    print(res4)



def NFold():
    cars = pd.read_table(dataDir+"/mtcars.txt", sep=" ")
    # print(cars)
    cars2 = cars.loc[:, ["hp", "wt", "disp"]]
    # print(cars2)

    y = cars2["hp"]
    x = cars2[["wt","disp"]]
    # print(cars2)
    kf = KFold(5)
    # print(x)
    # print(y)
    kf.get_n_splits(x)
    # print(kf)

    model = LinearRegression()
    resKFold = cross_val_score(model, x, y, cv=kf)
    print(resKFold)
    precFinal = resKFold.sum() / 5
    print(precFinal)

    # print("Accuracy: %.2f%%" % (resKFold * 100.0))

    i = 0
    for train_index,test_index in kf.split(x):
        print("TRAIN:", train_index, "TEST:", test_index)
        x_train = x.iloc[train_index]
        x_test = x.iloc[test_index]
        y_train = y[train_index]
        y_test = y[test_index]

        model = LinearRegression()
        model.fit(x_train.values, y_train.values)

        y_pred = model.predict(x_test)
        plt.scatter(x_test[["wt"]].values, y_test, color='black')
        plt.plot(x_test[["wt"]].values, y_pred, color='blue', linewidth=3)

        # plt.xticks(())
        # plt.yticks(())

        # plt.show()
        plt.savefig('nFold_WT_' + str(i) + '.png')
        plt.clf()

        plt.scatter(x_test[["disp"]].values, y_test, color='black')
        plt.plot(x_test[["disp"]].values, y_pred, color='blue', linewidth=3)

        # plt.xticks(())
        # plt.yticks(())

        # plt.show()
        plt.savefig('nFold_DISP_' + str(i) + '.png')
        plt.clf()

        print(i)
        print(x_test)
        print(x_test[["wt"]])
        print(x_test[["disp"]])
        print(y_test)
        i = i + 1

validacionSimple()
# NFold()
