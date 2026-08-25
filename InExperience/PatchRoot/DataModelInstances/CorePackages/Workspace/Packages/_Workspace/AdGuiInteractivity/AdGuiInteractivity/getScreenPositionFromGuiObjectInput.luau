local guiPositionToScreenPositionModule = require(script:FindFirstAncestor("AdGuiInteractivity").guiPositionToScreenPosition)

return function(p0, p1)
	-- upvalues: guiPositionToScreenPositionModule (ref)
	local currentCamera = game.Workspace.CurrentCamera
	
	if not currentCamera then
		return Vector2.zero
	end
	local layerCollector = p0:FindFirstAncestorWhichIsA("LayerCollector")
	local var2 = currentCamera.ViewportSize / 2
	
	if not layerCollector then
		return var2
	end
	local vector2 = Vector2.new(p1.Position.X, p1.Position.Y)
	
	if vector2 == Vector2.zero then
		vector2 = p0.AbsolutePosition + p0.AbsoluteSize / 2
	end
	return guiPositionToScreenPositionModule(layerCollector, vector2, currentCamera) or var2
end