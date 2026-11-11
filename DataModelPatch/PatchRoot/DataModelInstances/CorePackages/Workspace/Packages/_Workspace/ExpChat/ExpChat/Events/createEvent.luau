local BindableEventQueueModule = require(script.Parent.bindableEventQueue)

return function(Signal)
	-- upvalues: BindableEventQueueModule (copy)
	return function(Callback)
		-- upvalues: Signal (copy), BindableEventQueueModule (upval)
		return function(...)
			-- upvalues: Callback (copy), Signal (upval), BindableEventQueueModule (upval)
			local CallbackResult = Callback(...)
			
			if Signal:GetAttribute("isConnected") == true then
				Signal:Fire(CallbackResult)
				
				return
			else
				BindableEventQueueModule:add(CallbackResult)
			end
		end
	end
end