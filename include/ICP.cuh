// Copyright 2020 Vladimir
// Author: Vladimir
#pragma once

#ifndef ICP_H
#define ICP_H

#include <memory>
#include <utility>
#include <vector>

#include "Eigen.h"
#include "Frame.cuh"

class ICP {
 public:
  ICP(Frame &_prevFrame, Frame &_curFrame, double distanceThreshold,
      double normalThreshold);

  Matrix4f estimatePose(
      Eigen::Matrix4f& estimatedPose,
      int iterationsNum = 10 );

  std::vector<std::pair<size_t, size_t>> findIndicesOfCorrespondingPoints(
      Eigen::Matrix4f &estimatedPose);

 private:
  Frame &prevFrame;
  Frame &curFrame;
  const double distanceThreshold;
  const double normalThreshold;
};

#endif // !ICP_H