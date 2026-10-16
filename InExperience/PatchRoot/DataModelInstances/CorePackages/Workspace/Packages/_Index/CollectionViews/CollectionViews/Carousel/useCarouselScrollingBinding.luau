local RunService = game:GetService("RunService")
local ReactModule = require(script:FindFirstAncestor("CollectionViews").Parent.React)

return function(p1, p2) --[[ Line: 9 | Named "useCarouselScrollingBinding" ]]
	-- upvalues: ReactModule (copy), RunService (copy)
	local UseBindingResult, UseBindingResult2 = ReactModule.useBinding(false)
	ReactModule.useEffect(function() --[[ Line: 15 ]]
		-- upvalues: p1 (copy), p2 (copy), UseBindingResult2 (copy), RunService (upval)
		local Current = p1.current
		
		if p2 and Current then
			assert(Current, "scrollingFrame must exist")
			local NewClockTime = 0
			local HeartbeatConnection = nil
			local Connection = Current:GetPropertyChangedSignal("CanvasPosition"):Connect(function() --[[ Line: 25 ]]
				-- upvalues: NewClockTime (ref), HeartbeatConnection (ref), UseBindingResult2 (upval), RunService (upval)
				NewClockTime = os.clock() + 0.01
				
				if not HeartbeatConnection then
					UseBindingResult2(true)
					HeartbeatConnection = RunService.Heartbeat:Connect(function() --[[ Line: 29 ]]
						-- upvalues: NewClockTime (upval), UseBindingResult2 (upval), HeartbeatConnection (upval)
						if NewClockTime <= os.clock() then
							UseBindingResult2(false)
							
							if HeartbeatConnection then
								HeartbeatConnection:Disconnect()
								HeartbeatConnection = nil
							end
						end
					end)
				end
			end)
			
			return function() --[[ Line: 41 ]]
				-- upvalues: Connection (copy), HeartbeatConnection (ref)
				Connection:Disconnect()
				
				if HeartbeatConnection then
					HeartbeatConnection:Disconnect()
				end
			end
		else
			return nil
		end
	end, { p1 })
	
	return UseBindingResult
end