local TooltipOrientationModule = require(script.Parent.Enum.TooltipOrientation)

return function(XOffset: number, YOffset1: number, Bottom, Vector: number, Vector1: number, Vector3, Vector4) --[[ Line: 22 ]]
	-- upvalues: TooltipOrientationModule (copy)
	local t = {}
	local NewVector = Vector + Vector1 * 0.5
	local NewVector1 = Vector + Vector1
	local XOffset2 = 0
	local YOffset2 = 0
	local ClampedValue = nil
	local YOffset = nil
	local ClampedValue1 = nil
	local XOffset1 = nil
	
	if Bottom == TooltipOrientationModule.Bottom or Bottom == TooltipOrientationModule.Top then
		if not Vector4 and Vector3.Y - NewVector1.Y < YOffset1 + 8 + 12 then
			Bottom = TooltipOrientationModule.Top
		end
		ClampedValue1 = math.clamp(NewVector.X - XOffset * 0.5, 12, Vector3.X - 12 - XOffset)
		XOffset1 = ClampedValue1 - Vector.X
		local XOffsetDelta = XOffset - 12 - 16
		
		if XOffset < 40 then
			t.caretPosition = UDim2.fromScale(0.5, 0)
		elseif Vector4 then
			t.caretPosition = UDim2.fromOffset(math.clamp(Vector1.X * 0.5 + math.abs(Vector1.X * Vector4.X.Scale + Vector4.X.Offset), 12, XOffsetDelta), 0)
		elseif NewVector.X - XOffset * 0.5 >= 12 and NewVector.X + XOffset * 0.5 <= Vector3.X - 12 then
			t.caretPosition = UDim2.fromScale(0.5, 0)
		else
			t.caretPosition = UDim2.fromOffset(math.clamp(NewVector.X - ClampedValue1, 12, XOffsetDelta), 0)
		end
		t.caretFrameSize = UDim2.fromOffset(XOffset, 8)
		t.caretImageSize = UDim2.fromOffset(16, 8)
		t.caretAnchorPoint = Vector2.new(0.5, 0)
		t.fillDirection = Enum.FillDirection.Vertical
		
		if Bottom == TooltipOrientationModule.Bottom then
			ClampedValue = Vector.Y + Vector1.Y
			YOffset = Vector1.Y
			t.caretLayoutOrder = 1
			t.contentLayoutOrder = 2
			YOffset2 = 4
		else
			ClampedValue = Vector.Y - YOffset1 - 8
			YOffset = -(YOffset1 + 8)
			t.caretLayoutOrder = 2
			t.contentLayoutOrder = 1
			YOffset2 = -4
		end
	else
		ClampedValue = math.clamp(NewVector.Y - YOffset1 * 0.5, 12, Vector3.Y - 12 - YOffset1)
		YOffset = ClampedValue - Vector.Y
		local YOffsetDelta = YOffset1 - 12 - 16
		
		if Vector4 then
			t.caretPosition = UDim2.fromOffset(0, (math.clamp(Vector1.Y * 0.5 + math.abs(Vector1.Y * Vector4.Y.Scale + Vector4.Y.Offset), 12, YOffsetDelta)))
		elseif NewVector.Y - YOffset1 * 0.5 >= 12 and NewVector.Y + YOffset1 * 0.5 <= Vector3.Y - 12 or YOffset1 <= 40 then
			t.caretPosition = UDim2.fromScale(0, 0.5)
		else
			t.caretPosition = UDim2.fromOffset(0, (math.clamp(NewVector.Y - ClampedValue, 12, YOffset1 - 12 - 16)))
		end
		t.caretFrameSize = UDim2.fromOffset(8, YOffset1)
		t.caretImageSize = UDim2.fromOffset(8, 16)
		t.caretAnchorPoint = Vector2.new(0, 0.5)
		t.fillDirection = Enum.FillDirection.Horizontal
		
		if Bottom == TooltipOrientationModule.Right then
			ClampedValue1 = NewVector1.X
			XOffset1 = Vector1.X
			t.caretLayoutOrder = 1
			t.contentLayoutOrder = 2
			XOffset2 = 4
		else
			ClampedValue1 = Vector.X - XOffset - 8
			XOffset1 = -(XOffset - 8)
			t.caretLayoutOrder = 2
			t.contentLayoutOrder = 1
			XOffset2 = -4
		end
	end
	t.absolutePosition = UDim2.fromOffset(ClampedValue1, ClampedValue)
	t.position = UDim2.fromOffset(XOffset1, YOffset)
	t.animatedDistance = UDim2.fromOffset(XOffset2, YOffset2)
	t.updatedOrientation = Bottom
	
	return t
end