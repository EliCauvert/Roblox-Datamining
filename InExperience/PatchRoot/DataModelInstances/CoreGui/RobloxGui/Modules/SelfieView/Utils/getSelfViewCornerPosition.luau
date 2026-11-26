return function(SelfViewPosition, p1)
	local ScreenSize = p1.screenSize
	local WindowSize = p1.windowSize
	local ScreenSideOffset = p1.screenSideOffset
	
	return if SelfViewPosition == Enum.SelfViewPosition.TopLeft then UDim2.fromOffset(ScreenSideOffset, p1.windowPadding) elseif SelfViewPosition == Enum.SelfViewPosition.TopRight then UDim2.fromOffset(ScreenSize.X - (WindowSize.X.Offset + ScreenSideOffset), p1.windowPadding) elseif SelfViewPosition == Enum.SelfViewPosition.BottomLeft then UDim2.fromOffset(ScreenSideOffset, ScreenSize.Y - (p1.topBarHeight + WindowSize.Y.Offset + p1.windowPadding)) elseif SelfViewPosition == Enum.SelfViewPosition.BottomRight then UDim2.fromOffset(ScreenSize.X - (WindowSize.X.Offset + ScreenSideOffset), ScreenSize.Y - (p1.topBarHeight + WindowSize.Y.Offset + p1.windowPadding)) else nil
end