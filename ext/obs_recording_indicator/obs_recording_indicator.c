#include "obs_recording_indicator.h"

VALUE rb_mObsRecordingIndicator;

void
Init_obs_recording_indicator(void)
{
  rb_mObsRecordingIndicator = rb_define_module("ObsRecordingIndicator");
}
