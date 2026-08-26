local guiPositionToScreenPositionModule = require(script:FindFirstAncestor("AdGuiInteractivity").guiPositionToScreenPosition)

return function(p1, p2)
	-- upvalues: guiPositionToScreenPositionModule (ref)
	local currentCamera = game.Workspace.CurrentCamera
	
	if not currentCamera then
		return Vector2.zero
	end
	local layerCollector = p1:FindFirstAncestorWhichIsA("LayerCollector")
	local var1 = currentCamera.ViewportSize / 2
	
	if not layerCollector then
		return var1
	end
	local vector2 = Vector2.new(p2.Position.X, p2.Position.Y)
	
	if vector2 == Vector2.zero then
		vector2 = p1.AbsolutePosition + p1.AbsoluteSize / 2
	end
	return guiPositionToScreenPositionModule(layerCollector, vector2, currentCamera) or var1
end