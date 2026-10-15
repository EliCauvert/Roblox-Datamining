local reactModule = require(script:FindFirstAncestor("RealtimeDelivery").Parent.React)
local _ = require(script.Parent.TopicEventReceiver)
local topicRealtimeContextModule = require(script.Parent.TopicRealtimeContext)

return function(value, p1, p2)
	-- upvalues: reactModule (ref), topicRealtimeContextModule (ref)
	local var1 = reactModule.useContext(topicRealtimeContextModule)
	local var2 = reactModule.useRef(p1)
	local var3 = if p2 then p2.onError else nil
	local var4 = reactModule.useRef(var3)
	local var5 = reactModule.useRef(nil)
	reactModule.useEffect(function()
		-- upvalues: var2 (ref), p1 (ref)
		var2.current = p1
	end, { p1 })
	reactModule.useEffect(function()
		-- upvalues: var4 (ref), var3 (ref)
		var4.current = var3
	end, { var3 or false })
	reactModule.useEffect(function()
		-- upvalues: var5 (ref), value (ref), var1 (ref), var2 (ref), var4 (ref)
		local current = var5.current
		var5.current = if value then var1:observeTopic(value, function(p3)
			-- upvalues: var2 (copy)
			var2.current(p3)
		end, {
			onError = function(p3)
				-- upvalues: var4 (copy)
				local current = var4.current
				
				if current then
					current(p3)
				end
			end
		}) else nil
		
		if current then
			current:disconnect()
		end
	end, { value or false, var1 })
	reactModule.useEffect(function()
		-- upvalues: var5 (ref)
		return function()
			-- upvalues: var5 (copy)
			local current = var5.current
			var5.current = nil
			
			if current then
				current:disconnect()
			end
		end
	end, {})
end