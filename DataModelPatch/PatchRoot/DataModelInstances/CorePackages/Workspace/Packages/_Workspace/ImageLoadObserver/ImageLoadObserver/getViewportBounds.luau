local Workspace = game:GetService("Workspace")

return function(p1)
	-- upvalues: Workspace (copy)
	local LayerCollector = p1:FindFirstAncestorWhichIsA("LayerCollector")
	
	if LayerCollector then
		local AbsolutePosition = LayerCollector.AbsolutePosition
		
		return AbsolutePosition, AbsolutePosition + LayerCollector.AbsoluteSize
	end
	local CurrentCamera = Workspace.CurrentCamera
	
	if CurrentCamera then
		return Vector2.zero, CurrentCamera.ViewportSize
	else
		return Vector2.zero, Vector2.zero
	end
end