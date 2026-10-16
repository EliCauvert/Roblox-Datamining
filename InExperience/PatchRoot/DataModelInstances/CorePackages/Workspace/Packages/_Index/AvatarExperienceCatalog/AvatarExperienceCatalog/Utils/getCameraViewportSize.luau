return function() --[[ Line: 5 | Named "getCameraViewportSize" ]]
	local CurrentCamera = workspace.CurrentCamera
	
	return if CurrentCamera then CurrentCamera.ViewportSize else nil
end