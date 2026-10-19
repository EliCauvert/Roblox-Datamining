return function() --[[ Line: 2 ]]
	local Success, Result = pcall(function() --[[ Line: 3 ]]
		return game:GetService("AppLifecycleObserverService")
	end)
	
	return if Success then Result else nil
end