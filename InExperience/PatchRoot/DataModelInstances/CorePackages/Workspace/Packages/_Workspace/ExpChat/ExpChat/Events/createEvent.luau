local bindableEventQueueModule = require(script.Parent.bindableEventQueue)

return function(p1)
	-- upvalues: bindableEventQueueModule (ref)
	return function(p2)
		-- upvalues: p1 (ref), bindableEventQueueModule (copy)
		return function(...)
			-- upvalues: p2 (ref), p1 (copy), bindableEventQueueModule (copy)
			local var1 = p2(...)
			
			if p1:GetAttribute("isConnected") == true then
				p1:Fire(var1)
				
				return
			end
			bindableEventQueueModule:add(var1)
		end
	end
end