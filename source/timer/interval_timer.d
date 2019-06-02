module eul.timer.interval_timer;

import eul.time.i_time_provider;
import eul.timer.timer_base;

class IntervalTimer : TimerBase
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
            immutable auto current_time = time_provider_.milliseconds();
            if (current_time >= end_time_)
            {
                fire();
                immutable auto requested_time = end_time_ - start_time_;
                start_time_ = current_time;
                end_time_ = current_time + requested_time;
            }
            return Status.Running;
        }
        return Status.NotStarted;
    }
}
