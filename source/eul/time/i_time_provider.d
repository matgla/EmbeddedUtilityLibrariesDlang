module eul.time.i_time_provider;

import core.time : Duration;

interface ITimeProvider
{
    Duration milliseconds();
}