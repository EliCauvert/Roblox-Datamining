local ReactModule = require(script:FindFirstAncestor("RealtimeDelivery").Parent.React)
local _ = require(script.Parent.TopicEventReceiver)
local TopicRealtimeContextModule = require(script.Parent.TopicRealtimeContext)

return function(p1, Current, p2) --[[ Line: 10 | Named "useTopicNotification" ]]
	-- upvalues: ReactModule (copy), TopicRealtimeContextModule (copy)
	local UseContextResult = ReactModule.useContext(TopicRealtimeContextModule)
	local UseRefResult = ReactModule.useRef(Current)
	local OnError = if p2 then p2.onError else nil
	local UseRefResult1 = ReactModule.useRef(OnError)
	local UseRefResult2 = ReactModule.useRef(nil)
	ReactModule.useEffect(function() --[[ Line: 21 ]]
		-- upvalues: UseRefResult (copy), Current (copy)
		UseRefResult.current = Current
	end, { Current })
	ReactModule.useEffect(function() --[[ Line: 25 ]]
		-- upvalues: UseRefResult1 (copy), OnError (copy)
		UseRefResult1.current = OnError
	end, { OnError or false })
	ReactModule.useEffect(function() --[[ Line: 31 ]]
		-- upvalues: UseRefResult2 (copy), p1 (copy), UseContextResult (copy), UseRefResult (copy), UseRefResult1 (copy)
		local Current = UseRefResult2.current
		UseRefResult2.current = if p1 then UseContextResult:observeTopic(p1, function(p3) --[[ Line: 34 ]]
			-- upvalues: UseRefResult (upval)
			UseRefResult.current(p3)
		end, {
			onError = function(p3) --[[ Line: 37 ]]
				-- upvalues: UseRefResult1 (upval)
				local CurrentFunction: (any) -> () = UseRefResult1.current
				
				if CurrentFunction then
					CurrentFunction(p3)
				end
			end
		}) else nil
		
		if Current then
			Current:disconnect()
		end
	end, { p1 or false, UseContextResult })
	ReactModule.useEffect(function() --[[ Line: 50 ]]
		-- upvalues: UseRefResult2 (copy)
		return function() --[[ Line: 51 ]]
			-- upvalues: UseRefResult2 (upval)
			local Current = UseRefResult2.current
			UseRefResult2.current = nil
			
			if Current then
				Current:disconnect()
			end
		end
	end, {})
end