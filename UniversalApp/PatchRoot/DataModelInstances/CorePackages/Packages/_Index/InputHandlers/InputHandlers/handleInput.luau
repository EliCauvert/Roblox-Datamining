local _ = require(script.Parent.Parent.FocusNavigation)
local heartbeatModule = require(script.Parent.Heartbeat)

local function cancellableDelay(p0, p1)
	local var2 = false
	task.delay(p0, function()
		-- upvalues: var2 (write), p1 (ref)
		if not var2 then
			p1()
		end
	end)
	
	return {
		cancel = function()
			-- upvalues: var2 (write)
			var2 = true
		end
	}
end

return function(p2)
	-- upvalues: cancellableDelay (ref), heartbeatModule (ref)
	local hold = p2.hold
	local var3 = nil
	local var4 = nil
	local var5 = false
	
	local function _()
		-- upvalues: var3 (write), var4 (write), var5 (write)
		if var3 then
			var3.cancel()
			var3 = nil
		end
		if var4 then
			var4:Disconnect()
			var4 = nil
		end
		var5 = false
	end
	
	return function(p3)
		-- upvalues: var5 (write), p2 (ref), var3 (write), var4 (write), hold (ref), cancellableDelay (copy), heartbeatModule (copy)
		local eventData = p3.eventData
		local var6 = if eventData then eventData.immediateDispatch else false
		var5 = var6 or var5
		local var7 = if eventData then eventData.UserInputState else nil
		
		if var7 == Enum.UserInputState.Begin then
			if p2.onPress then
				p2.onPress(p3)
			end
			if var3 then
				var3.cancel()
				var3 = nil
			end
			if var4 then
				var4:Disconnect()
				var4 = nil
			end
			var5 = false
			
			if hold then
				if var6 then
					hold.onComplete()
				else
					var3 = cancellableDelay(hold.durationSeconds, function()
						-- upvalues: hold (copy), var5 (copy), var4 (copy)
						if not hold.allowReleaseAfterHold then
							var5 = false
						end
						hold.onComplete()
						
						if var4 then
							var4:Disconnect()
							var4 = nil
						end
					end)
					var4 = if hold.onStep then heartbeatModule:Connect(hold.onStep) else nil
				end
			end
			if var6 then
				if var3 then
					var3.cancel()
					var3 = nil
				end
				if var4 then
					var4:Disconnect()
					var4 = nil
				end
				var5 = false
			else
				var5 = true
			end
		end
		if var7 == Enum.UserInputState.End then
			if p2.onRelease and var5 then
				p2.onRelease(p3)
			end
			if var3 then
				var3.cancel()
				var3 = nil
			end
			if var4 then
				var4:Disconnect()
				var4 = nil
			end
			var5 = false
		end
		if var7 == Enum.UserInputState.Cancel then
			if var3 then
				var3.cancel()
				var3 = nil
			end
			if var4 then
				var4:Disconnect()
				var4 = nil
			end
			var5 = false
		end
	end
end