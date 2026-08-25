local bindableEventQueueModule = require(script.Parent.bindableEventQueue)

return function(p0)
	-- upvalues: bindableEventQueueModule (ref)
	return function(p1)
		-- upvalues: p0 (ref), bindableEventQueueModule (copy)
		return function(...)
			-- upvalues: p1 (ref), p0 (copy), bindableEventQueueModule (copy)
			local var1 = p1(...)
			
			if p0:GetAttribute("isConnected") == true then
				p0:Fire(var1)
				
				return
			end
			bindableEventQueueModule:add(var1)
		end
	end
end