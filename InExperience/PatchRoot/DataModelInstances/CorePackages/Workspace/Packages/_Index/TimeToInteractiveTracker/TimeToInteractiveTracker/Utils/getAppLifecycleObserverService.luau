return function()
	local Success, Result = pcall(function()
		return game:GetService("AppLifecycleObserverService")
	end)
	
	return if Success then Result else nil
end