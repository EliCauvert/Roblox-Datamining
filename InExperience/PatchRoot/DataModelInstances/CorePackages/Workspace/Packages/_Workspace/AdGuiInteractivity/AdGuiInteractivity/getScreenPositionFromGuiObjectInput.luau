local GuiPositionToScreenPositionModule = require(script:FindFirstAncestor("AdGuiInteractivity").guiPositionToScreenPosition)

return function(Frame: Frame, p1) --[[ Line: 5 ]]
	-- upvalues: GuiPositionToScreenPositionModule (copy)
	local CurrentCamera = game.Workspace.CurrentCamera
	
	if not CurrentCamera then
		return Vector2.zero
	end
	local LayerCollector = Frame:FindFirstAncestorWhichIsA("LayerCollector")
	local ViewportSizeRatio = CurrentCamera.ViewportSize / 2
	
	if not LayerCollector then
		return ViewportSizeRatio
	end
	local _Vector2 = Vector2.new(p1.Position.X, p1.Position.Y)
	
	if _Vector2 == Vector2.zero then
		_Vector2 = Frame.AbsolutePosition + Frame.AbsoluteSize / 2
	end
	return GuiPositionToScreenPositionModule(LayerCollector, _Vector2, CurrentCamera) or ViewportSizeRatio
end