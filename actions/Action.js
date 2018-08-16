class Action {
    constructor(message, connection, finished) {
        this.message = message;
        this.connection = connection;
        this.finished = finished;
        this.STEP = 0;
    }
}

module.exports = Action;