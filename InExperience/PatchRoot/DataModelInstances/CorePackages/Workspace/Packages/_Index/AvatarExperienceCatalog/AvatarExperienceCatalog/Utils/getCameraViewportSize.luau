return function()
	local CurrentCamera = workspace.CurrentCamera
	
	return if CurrentCamera then CurrentCamera.ViewportSize else nil
end