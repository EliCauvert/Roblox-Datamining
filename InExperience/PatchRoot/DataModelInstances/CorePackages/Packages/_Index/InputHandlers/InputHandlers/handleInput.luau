local _ = require(script.Parent.Parent.FocusNavigation)
local HeartbeatModule = require(script.Parent.Heartbeat)

local function cancellableDelay(Delay, Callback) --[[ Line: 28 ]]
	local Flag = false
	task.delay(Delay, function() --[[ Line: 30 ]]
		-- upvalues: Flag (ref), Callback (copy)
		if not Flag then
			Callback()
		end
	end)
	
	return {
		cancel = function() --[[ Line: 36 ]]
			-- upvalues: Flag (ref)
			Flag = true
		end
	}
end

return function(p1) --[[ Line: 42 | Named "handleInput" ]]
	-- upvalues: cancellableDelay (copy), HeartbeatModule (copy)
	local Hold = p1.hold
	local v1 = nil
	local Connection = nil
	local Flag = false
	
	local function _() --[[ Line: 49 | Named "clearHeldState" ]]
		-- upvalues: v1 (ref), Connection (ref), Flag (ref)
		if v1 then
			v1.cancel()
			v1 = nil
		end
		if Connection then
			Connection:Disconnect()
			Connection = nil
		end
		Flag = false
	end
	
	return function(p2) --[[ Line: 61 ]]
		-- upvalues: Flag (ref), p1 (copy), v1 (ref), Connection (ref), Hold (copy), cancellableDelay (upval), HeartbeatModule (upval)
		local EventData = p2.eventData
		local ImmediateDispatch = EventData and EventData.immediateDispatch or false
		Flag = ImmediateDispatch or Flag
		local UserInputState = if EventData then EventData.UserInputState else nil
		
		if UserInputState == Enum.UserInputState.Begin then
			if p1.onPress then
				p1.onPress(p2)
			end
			if v1 then
				v1.cancel()
				v1 = nil
			end
			if Connection then
				Connection:Disconnect()
				Connection = nil
			end
			Flag = false
			
			if Hold then
				if ImmediateDispatch then
					Hold.onComplete()
				else
					v1 = cancellableDelay(Hold.durationSeconds, function() --[[ Line: 81 ]]
						-- upvalues: Hold (upval), Flag (upval), Connection (upval)
						if not Hold.allowReleaseAfterHold then
							Flag = false
						end
						Hold.onComplete()
						
						if Connection then
							Connection:Disconnect()
							Connection = nil
						end
					end)
					Connection = if Hold.onStep then HeartbeatModule:Connect(Hold.onStep) else nil
				end
			end
			if ImmediateDispatch then
				if v1 then
					v1.cancel()
					v1 = nil
				end
				if Connection then
					Connection:Disconnect()
					Connection = nil
				end
				Flag = false
			else
				Flag = true
			end
		end
		if UserInputState == Enum.UserInputState.End then
			if p1.onRelease and Flag then
				p1.onRelease(p2)
			end
			if v1 then
				v1.cancel()
				v1 = nil
			end
			if Connection then
				Connection:Disconnect()
				Connection = nil
			end
			Flag = false
		end
		if UserInputState == Enum.UserInputState.Cancel then
			if v1 then
				v1.cancel()
				v1 = nil
			end
			if Connection then
				Connection:Disconnect()
				Connection = nil
			end
			Flag = false
		end
	end
end