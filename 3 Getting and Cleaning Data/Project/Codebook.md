# Codebook

The data set has been obtained from the larger "Human Activity Recognition
Using Smartphones Data Set", available at the [UCI Machine Learning
Repository](https://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).

## Variables

The first two variables identify the subject and the activity:

- `Subject`: Id that identifies the subject that performed the activity. Its
  range is from 1 to 30
- `Activity`: Name of the activity. It can have one of six values: `WALKING`,
  `WALKING_UPSTAIRS`, `WALKING_DOWNSTAIRS`, `SITTING`, `STANDING` or `LAYING`.

The rest of the variables encode the mean and standard deviation of each
measurement, each appended by `.Mean` and `StdDev` respectively. They are
computed as the average for each activity and subject. All variables are
normalized and bounded within [-1,1]. They are:

- `BodyAcceleration.X.Mean`
- `BodyAcceleration.Y.Mean`
- `BodyAcceleration.Z.Mean`
- `GravityAcceleration.X.Mean`
- `GravityAcceleration.Y.Mean`
- `GravityAcceleration.Z.Mean`
- `BodyAccelerationJerk.X.Mean`
- `BodyAccelerationJerk.Y.Mean`
- `BodyAccelerationJerk.Z.Mean`
- `BodyGyroscope.X.Mean`
- `BodyGyroscope.Y.Mean`
- `BodyGyroscope.Z.Mean`
- `BodyGyroscopeJerk.X.Mean`
- `BodyGyroscopeJerk.Y.Mean`
- `BodyGyroscopeJerk.Z.Mean`
- `BodyAccelerationMagnitude.Mean`
- `GravityAccelerationMagnitude.Mean`
- `BodyAccelerationJerkMagnitude.Mean`
- `BodyGyroscopeMagnitude.Mean`
- `BodyGyroscopeJerkMagnitude.Mean`
- `BodyAcceleration.X.Frequency.Mean`
- `BodyAcceleration.Y.Frequency.Mean`
- `BodyAcceleration.Z.Frequency.Mean`
- `BodyAccelerationFreq.X.Frequency.Mean`
- `BodyAccelerationFreq.Y.Frequency.Mean`
- `BodyAccelerationFreq.Z.Frequency.Mean`
- `BodyAccelerationJerk.X.Frequency.Mean`
- `BodyAccelerationJerk.Y.Frequency.Mean`
- `BodyAccelerationJerk.Z.Frequency.Mean`
- `BodyAccelerationJerkFreq.X.Frequency.Mean`
- `BodyAccelerationJerkFreq.Y.Frequency.Mean`
- `BodyAccelerationJerkFreq.Z.Frequency.Mean`
- `BodyGyroscope.X.Frequency.Mean`
- `BodyGyroscope.Y.Frequency.Mean`
- `BodyGyroscope.Z.Frequency.Mean`
- `BodyGyroscopeFreq.X.Frequency.Mean`
- `BodyGyroscopeFreq.Y.Frequency.Mean`
- `BodyGyroscopeFreq.Z.Frequency.Mean`
- `BodyAccelerationMagnitude.Frequency.Mean`
- `BodyAccelerationMagnitudeFreq.Frequency.Mean`
- `BodyBodyAccelerationJerkMagnitude.Frequency.Mean`
- `BodyBodyAccelerationJerkMagnitudeFreq.Frequency.Mean`
- `BodyBodyGyroscopeMagnitude.Frequency.Mean`
- `BodyBodyGyroscopeMagnitudeFreq.Frequency.Mean`
- `BodyBodyGyroscopeJerkMagnitude.Frequency.Mean`
- `BodyBodyGyroscopeJerkMagnitudeFreq.Frequency.Mean`
- `angle.BodyAccelerationMean.gravity`
- `angle.BodyAccelerationJerkMean.gravityMean`
- `angle.BodyGyroscopeMean.gravityMean`
- `angle.BodyGyroscopeJerkMean.gravityMean`
- `angle.X.gravityMean`
- `angle.Y.gravityMean`
- `angle.Z.gravityMean`
- `BodyAcceleration.X.StdDev`
- `BodyAcceleration.Y.StdDev`
- `BodyAcceleration.Z.StdDev`
- `GravityAcceleration.X.StdDev`
- `GravityAcceleration.Y.StdDev`
- `GravityAcceleration.Z.StdDev`
- `BodyAccelerationJerk.X.StdDev`
- `BodyAccelerationJerk.Y.StdDev`
- `BodyAccelerationJerk.Z.StdDev`
- `BodyGyroscope.X.StdDev`
- `BodyGyroscope.Y.StdDev`
- `BodyGyroscope.Z.StdDev`
- `BodyGyroscopeJerk.X.StdDev`
- `BodyGyroscopeJerk.Y.StdDev`
- `BodyGyroscopeJerk.Z.StdDev`
- `BodyAccelerationMagnitude.StdDev`
- `GravityAccelerationMagnitude.StdDev`
- `BodyAccelerationJerkMagnitude.StdDev`
- `BodyGyroscopeMagnitude.StdDev`
- `BodyGyroscopeJerkMagnitude.StdDev`
- `BodyAcceleration.X.Frequency.StdDev`
- `BodyAcceleration.Y.Frequency.StdDev`
- `BodyAcceleration.Z.Frequency.StdDev`
- `BodyAccelerationJerk.X.Frequency.StdDev`
- `BodyAccelerationJerk.Y.Frequency.StdDev`
- `BodyAccelerationJerk.Z.Frequency.StdDev`
- `BodyGyroscope.X.Frequency.StdDev`
- `BodyGyroscope.Y.Frequency.StdDev`
- `BodyGyroscope.Z.Frequency.StdDev`
- `BodyAccelerationMagnitude.Frequency.StdDev`
- `BodyBodyAccelerationJerkMagnitude.Frequency.StdDev`
- `BodyBodyGyroscopeMagnitude.Frequency.StdDev`
- `BodyBodyGyroscopeJerkMagnitude.Frequency.StdDev`
