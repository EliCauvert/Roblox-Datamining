local _ = require(script.Parent.Parent.FocusNavigation)
local heartbeatModule = require(script.Parent.Heartbeat)

local function cancellableDelay(p1, p2)
	local var1 = false
	task.delay(p1, function()
		-- upvalues: var1 (write), p2 (ref)
		if not var1 then
			p2()
		end
	end)
	
	return {
		cancel = function()
			-- upvalues: var1 (write)
			var1 = true
		end
	}
end

return function(p1)
	-- upvalues: cancellableDelay (ref), heartbeatModule (ref)
	local hold = p1.hold
	local var1 = nil
	local var2 = nil
	local var3 = false
	
	local function _()
		-- upvalues: var1 (write), var2 (write), var3 (write)
		if var1 then
			var1.cancel()
			var1 = nil
		end
		if var2 then
			var2:Disconnect()
			var2 = nil
		end
		var3 = false
	end
	
	return function(p2)
		-- upvalues: var3 (write), p1 (ref), var1 (write), var2 (write), hold (ref), cancellableDelay (copy), heartbeatModule (copy)
		local eventData = p2.eventData
		local var4 = if eventData then eventData.immediateDispatch else false
		var3 = var4 or var3
		local var5 = if eventData then eventData.UserInputState else nil
		
		if var5 == Enum.UserInputState.Begin then
			if p1.onPress then
				p1.onPress(p2)
			end
			if var1 then
				var1.cancel()
				var1 = nil
			end
			if var2 then
				var2:Disconnect()
				var2 = nil
			end
			var3 = false
			
			if hold then
				if var4 then
					hold.onComplete()
				else
					var1 = cancellableDelay(hold.durationSeconds, function()
						-- upvalues: hold (copy), var3 (copy), var2 (copy)
						if not hold.allowReleaseAfterHold then
							var3 = false
						end
						hold.onComplete()
						
						if var2 then
							var2:Disconnect()
							var2 = nil
						end
					end)
					var2 = if hold.onStep then heartbeatModule:Connect(hold.onStep) else nil
				end
			end
			if var4 then
				if var1 then
					var1.cancel()
					var1 = nil
				end
				if var2 then
					var2:Disconnect()
					var2 = nil
				end
				var3 = false
			else
				var3 = true
			end
		end
		if var5 == Enum.UserInputState.End then
			if p1.onRelease and var3 then
				p1.onRelease(p2)
			end
			if var1 then
				var1.cancel()
				var1 = nil
			end
			if var2 then
				var2:Disconnect()
				var2 = nil
			end
			var3 = false
		end
		if var5 == Enum.UserInputState.Cancel then
			if var1 then
				var1.cancel()
				var1 = nil
			end
			if var2 then
				var2:Disconnect()
				var2 = nil
			end
			var3 = false
		end
	end
end