return function(Frame: Frame): boolean
	return if (Frame:IsA("GuiButton") or Frame:IsA("TextBox")) and (Frame.Active and Frame.Selectable) then Frame.AbsoluteSize.X ~= 0 and Frame.AbsoluteSize.Y ~= 0 else false
end