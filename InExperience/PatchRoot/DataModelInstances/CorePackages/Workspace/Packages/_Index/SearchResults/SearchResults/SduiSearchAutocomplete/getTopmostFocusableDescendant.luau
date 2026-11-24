return function(Object)
	local Frame = nil
	
	for _, Gui in Object:GetDescendants() do
		if Gui:IsA("GuiObject") and Gui.Selectable and Gui.Visible and (Frame == nil or (Gui.AbsolutePosition.Y < Frame.AbsolutePosition.Y or Gui.AbsolutePosition.Y == Frame.AbsolutePosition.Y and Gui.AbsolutePosition.X < Frame.AbsolutePosition.X)) then
			Frame = Gui
		end
	end
	return Frame
end