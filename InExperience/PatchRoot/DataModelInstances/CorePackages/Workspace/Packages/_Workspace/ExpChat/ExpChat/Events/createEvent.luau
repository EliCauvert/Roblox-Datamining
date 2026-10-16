local BindableEventQueueModule = require(script.Parent.bindableEventQueue)

return function(Signal) --[[ Line: 3 ]]
	-- upvalues: BindableEventQueueModule (copy)
	return function(Callback) --[[ Line: 4 | Named "createEvent" ]]
		-- upvalues: Signal (copy), BindableEventQueueModule (upval)
		return function(...) --[[ Line: 5 ]]
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