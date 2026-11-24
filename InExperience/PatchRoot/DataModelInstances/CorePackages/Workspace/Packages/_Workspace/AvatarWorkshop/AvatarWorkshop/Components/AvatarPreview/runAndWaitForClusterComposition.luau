local AvatarPreviewConstantsModule = require(script.Parent.AvatarPreviewConstants)

return function(Signal, Callback1, p1, Callback)
	-- upvalues: AvatarPreviewConstantsModule (copy)
	local Flag = false
	local Flag1 = false
	local Callback2 = nil
	local Connection = Signal:Connect(function()
		-- upvalues: Flag (ref), Callback2 (ref)
		if Flag then return end
		Flag = true
		
		if Callback2 then
			task.spawn(Callback2)
		end
	end)
	local Success, Result = pcall(function()
		-- upvalues: Callback1 (copy)
		Callback1()
		
		return nil
	end)
	
	if Success and not Flag and (Callback == nil or Callback()) then
		local DelayedThread = task.delay(p1 or AvatarPreviewConstantsModule.ClusterCompositionTimeoutSeconds, function()
			-- upvalues: Flag1 (ref), Flag (ref), Callback2 (ref)
			Flag1 = true
			
			if Flag then return end
			Flag = true
			
			if Callback2 then
				task.spawn(Callback2)
			end
		end)
		Callback2 = coroutine.running()
		coroutine.yield()
		
		if not Flag1 then
			task.cancel(DelayedThread)
		end
	end
	Connection:Disconnect()
	
	if not Success then
		error(Result, 0)
	end
end