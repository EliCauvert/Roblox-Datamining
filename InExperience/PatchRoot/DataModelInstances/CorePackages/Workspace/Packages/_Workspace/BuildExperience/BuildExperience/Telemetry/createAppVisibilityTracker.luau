return function(AppLifecycleObserverService)
	local Flag = false
	AppLifecycleObserverService.OnHide:Connect(function()
		-- upvalues: Flag (ref)
		Flag = true
	end)
	AppLifecycleObserverService.OnUnhide:Connect(function()
		-- upvalues: Flag (ref)
		Flag = false
	end)
	
	return function()
		-- upvalues: Flag (ref)
		return Flag
	end
end