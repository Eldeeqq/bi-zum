import os

os.environ["TF_CPP_MIN_LOG_LEVEL"] = "4"

from keras.models import Sequential, Model
from keras.layers import Dense, Activation, Input
import numpy as np

config = [[12, 6], [6], [6, 1], [1]]


class NN:
    def __init__(self, params, conf):
        _params = list(params)
        _weights = []
        for x in conf:
            total = x[0] * (1 if len(x) is 1 else x[1])
            _weights.append(np.array(_params[0:total]).reshape(x))
            _params = _params[total:]
        self.model = Sequential()
        self.model.add(
            Dense(6, input_dim=12, kernel_initializer="normal", activation="tanh")
        )
        self.model.add(Dense(1, kernel_initializer="normal"))
        self.model.compile(loss="mean_squared_error", optimizer="adam")
        self.model.set_weights(_weights)

    def __call__(self, data):
        pred = self.model.predict(data)
        if pred < 0:
            return 1
        if pred > 0:
            return 2
        return 0


def create_nn(weights, conf=None) -> NN:
    if not conf:
        conf = config
    return NN(weights, conf)
