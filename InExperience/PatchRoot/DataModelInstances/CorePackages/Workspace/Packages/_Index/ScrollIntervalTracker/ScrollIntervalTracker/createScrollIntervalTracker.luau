local scrollIntervalTracker = script:FindFirstAncestor("ScrollIntervalTracker")
local loggerModule = require(scrollIntervalTracker.Logger)
local cryoModule = require(scrollIntervalTracker.Parent.Cryo)
local runService = game:GetService("RunService")
local t = { minDistancePx = 50, stableFramesRequired = 5 }

return function(p1, p2, p3, p4, p5)
	-- upvalues: cryoModule (ref), t (ref), loggerModule (ref), runService (ref)
	local var1 = cryoModule.Dictionary.join(t, p5 or {})
	local var2 = false
	local var3 = nil
	local var4 = 0
	local var5 = 0
	local var6 = nil
	
	local function _()
		-- upvalues: var5 (write), var6 (write)
		var5 = 0
		var6 = nil
	end
	
	local _ = function()
		-- upvalues: var3 (write), var4 (write)
		var3 = nil
		var4 = 0
	end
	
	local _ = function(p6)
		-- upvalues: loggerModule (copy), var1 (ref), p2 (ref), p4 (ref), var2 (write), var5 (write), var6 (write), var3 (write), var4 (write)
		loggerModule:debug("Scroll {} stopping (reason={})", var1.debugName, p6)
		p2(p4)
		var2 = false
		var5 = 0
		var6 = nil
		var3 = nil
		var4 = 0
	end
	
	local _ = function(p6)
		-- upvalues: var5 (write), var6 (write)
		var5 = 0
		var6 = p6
	end
	
	local _ = function(a)
		-- upvalues: var3 (write), var4 (write), var1 (ref)
		if var3 ~= nil then
			var4 += math.abs(a - var3)
		end
		var3 = a
		
		return var1.minDistancePx <= var4
	end
	
	local _ = function(p6)
		-- upvalues: loggerModule (copy), var1 (ref), p1 (ref), p4 (ref), var2 (write), var3 (write), var4 (write), var5 (write), var6 (write)
		loggerModule:debug("Scroll {} starting", var1.debugName)
		
		if p1(p4) then
			var2 = true
			var3 = nil
			var4 = 0
			var5 = 0
			var6 = p6
			
			return
		end
	end
	
	local renderSteppedConnection = runService.RenderStepped:Connect(function()
		-- upvalues: var2 (write), p3 (ref), var6 (write), var5 (write), var1 (ref), loggerModule (copy), p2 (ref), p4 (ref), var3 (write), var4 (write)
		if not var2 then return end
		local y = p3.CanvasPosition.Y
		
		if var6 == nil then
			var6 = y
			var5 = 0
			
			return
		end
		var5 = if math.abs(y - var6) <= 0.5 then var5 + 1 else 0
		var6 = y
		
		if var1.stableFramesRequired <= var5 then
			loggerModule:debug("Scroll {} stopping (reason={})", var1.debugName, "stableFrames")
			p2(p4)
			var2 = false
			var5 = 0
			var6 = nil
			var3 = nil
			var4 = 0
		end
	end)
	
	return {
		onScrollTick = function()
			-- upvalues: p3 (ref), var2 (write), var3 (write), var4 (write), var1 (ref), loggerModule (copy), p1 (ref), p4 (ref), var5 (write), var6 (write)
			local y = p3.CanvasPosition.Y
			
			if var2 then
				var5 = 0
				var6 = y
				
				return
			elseif var3 ~= nil then
				var4 += math.abs(y - var3)
			end
			var3 = y
			
			if var1.minDistancePx > var4 then return end
			loggerModule:debug("Scroll {} starting", var1.debugName)
			
			if p1(p4) then
				var2 = true
				var3 = nil
				var4 = 0
				var5 = 0
				var6 = y
				
				return
			end
		end,
		cleanup = function()
			-- upvalues: renderSteppedConnection (ref), var2 (write), loggerModule (copy), var1 (ref), p2 (ref), p4 (ref), var5 (write), var6 (write), var3 (write), var4 (write)
			if renderSteppedConnection then
				renderSteppedConnection:Disconnect()
			end
			if var2 then
				loggerModule:debug("Scroll {} cleanup/unmount", var1.debugName)
				loggerModule:debug("Scroll {} stopping (reason={})", var1.debugName, "cleanup")
				p2(p4)
				var2 = false
				var5 = 0
				var6 = nil
				var3 = nil
				var4 = 0
			end
		end
	}
end