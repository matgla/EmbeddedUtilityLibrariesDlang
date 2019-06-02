module eul.timeout_timer;

import eul.timer.timer_base;
import eul.time.i_time_provider;

class TimeoutTimer : TimerBase
{
public:
    this(ITimeProvider time_provider)
    {
        super(time_provider);
    }

    override Status run()
    {
        if (state_ == State.Running)
        {
            if (time_provider_.milliseconds() >= end_time_)
            {
                state_ = State.Idle;
                fire();
                return Status.Fired;
            }
            return Status.Running;
        }
        return Status.NotStarted;
    }
}
