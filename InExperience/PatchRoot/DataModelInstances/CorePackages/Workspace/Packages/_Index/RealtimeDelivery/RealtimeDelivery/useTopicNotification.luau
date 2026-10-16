local reactModule = require(script:FindFirstAncestor("RealtimeDelivery").Parent.React)
local _ = require(script.Parent.TopicEventReceiver)
local topicRealtimeContextModule = require(script.Parent.TopicRealtimeContext)

return function(value, p1)
	-- upvalues: reactModule (ref), topicRealtimeContextModule (ref)
	local var1 = reactModule.useContext(topicRealtimeContextModule)
	local var2 = reactModule.useRef(p1)
	local var3 = reactModule.useRef(nil)
	reactModule.useEffect(function()
		-- upvalues: var2 (ref), p1 (ref)
		var2.current = p1
	end, { p1 })
	reactModule.useEffect(function()
		-- upvalues: var3 (ref), value (ref), var1 (ref), var2 (ref)
		local current = var3.current
		var3.current = if value then var1:observeTopic(value, function(p2)
			-- upvalues: var2 (copy)
			var2.current(p2)
		end) else nil
		
		if current then
			current:disconnect()
		end
	end, { value or false, var1 })
	reactModule.useEffect(function()
		-- upvalues: var3 (ref)
		return function()
			-- upvalues: var3 (copy)
			local current = var3.current
			var3.current = nil
			
			if current then
				current:disconnect()
			end
		end
	end, {})
end