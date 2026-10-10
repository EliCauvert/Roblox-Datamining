return function()
	local currentCamera = workspace.CurrentCamera
	
	return if currentCamera then currentCamera.ViewportSize else nil
end