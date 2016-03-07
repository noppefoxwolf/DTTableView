//
//  DTTableView.swift
//
//  Created by noppefoxwolf on 2016/03/07.
//  Copyright © 2016年 @noppefoxwolf All rights reserved.
//

protocol DTTableViewDelegate {
  func tableView(tableView: DTTableView, didHandleSingleTapAtIndexPath indexPath: NSIndexPath)
  func tableView(tableView: DTTableView, didHandleDoubleTapAtIndexPath indexPath: NSIndexPath)
}

final class DTTableView: UITableView {
  private var tapCount = 0
  private var tapTimer: NSTimer? = nil
  private var tappedIndexPath = NSIndexPath()
  var dt_delegate: DTTableViewDelegate? = nil
  var delay = 0.2
  
  // call in didSelectRowAtIndexPath
  func analyseTap(indexPath: NSIndexPath) {
    if tapCount == 1 && tapTimer != nil && tappedIndexPath == indexPath {
      dt_delegate?.tableView(self, didHandleDoubleTapAtIndexPath: tappedIndexPath)
      tapTimer?.invalidate()
      tapTimer = nil
      tapCount = 0
      tappedIndexPath = NSIndexPath()
    } else if tapCount == 0 {
      tapCount = tapCount + 1
      tappedIndexPath = indexPath
      tapTimer = NSTimer.scheduledTimerWithTimeInterval(delay, target: self, selector: "tapTimerFired:", userInfo: nil, repeats: false)
    } else if tappedIndexPath != indexPath.row {
      tapCount = 0
      if tapTimer != nil {
        tapTimer?.invalidate()
        tapTimer = nil
      }
    }
  }
  
  @objc private func tapTimerFired(aTimer: NSTimer?) {
    if tapTimer != nil {
      dt_delegate?.tableView(self, didHandleSingleTapAtIndexPath: tappedIndexPath)
      tapCount = 0
      tappedIndexPath = NSIndexPath()
    }
  }
}

