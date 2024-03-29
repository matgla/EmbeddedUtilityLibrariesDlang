module eul.timer.i_timer;

interface ITimer
{
    enum Status
    {
        Started,
        Running,
        Fired,
        NotStarted
    }

    Status run();
}
