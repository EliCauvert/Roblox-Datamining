local NotificationsCommon = script:FindFirstAncestor("NotificationsCommon")
local ReactModule = require(NotificationsCommon.Parent.React)
local DeeplinkTapListenersModule = require(NotificationsCommon.DeeplinkTapListeners)

return function(Current)
	-- upvalues: ReactModule (copy), DeeplinkTapListenersModule (copy)
	local UseRefResult = ReactModule.useRef(Current)
	ReactModule.useLayoutEffect(function()
		-- upvalues: UseRefResult (copy), Current (copy)
		UseRefResult.current = Current
	end, { Current })
	ReactModule.useEffect(function()
		-- upvalues: DeeplinkTapListenersModule (upval), UseRefResult (copy)
		return DeeplinkTapListenersModule.connect(function(p1)
			-- upvalues: UseRefResult (upval)
			UseRefResult.current(p1)
		end)
	end, {})
end