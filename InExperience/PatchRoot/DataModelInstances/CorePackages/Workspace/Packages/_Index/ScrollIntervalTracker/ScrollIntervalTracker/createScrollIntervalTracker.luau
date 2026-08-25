local scrollIntervalTracker = script:FindFirstAncestor("ScrollIntervalTracker")
local loggerModule = require(scrollIntervalTracker.Logger)
local cryoModule = require(scrollIntervalTracker.Parent.Cryo)
local runService = game:GetService("RunService")
local t = { minDistancePx = 50, stableFramesRequired = 5 }

return function(p0, p1, p2, p3, p4)
	-- upvalues: cryoModule (ref), t (ref), loggerModule (ref), runService (ref)
	local var5 = cryoModule.Dictionary.join(t, p4 or {})
	local var6 = false
	local var7 = nil
	local var8 = 0
	local var9 = 0
	local var10 = nil
	
	local function _()
		-- upvalues: var9 (write), var10 (write)
		var9 = 0
		var10 = nil
	end
	
	local _ = function()
		-- upvalues: var7 (write), var8 (write)
		var7 = nil
		var8 = 0
	end
	
	local _ = function(p5)
		-- upvalues: loggerModule (copy), var5 (ref), p1 (ref), p3 (ref), var6 (write), var9 (write), var10 (write), var7 (write), var8 (write)
		loggerModule:debug("Scroll {} stopping (reason={})", var5.debugName, p5)
		p1(p3)
		var6 = false
		var9 = 0
		var10 = nil
		var7 = nil
		var8 = 0
	end
	
	local _ = function(p6)
		-- upvalues: var9 (write), var10 (write)
		var9 = 0
		var10 = p6
	end
	
	local _ = function(a)
		-- upvalues: var7 (write), var8 (write), var5 (ref)
		if var7 ~= nil then
			var8 += math.abs(a - var7)
		end
		var7 = a
		
		return var5.minDistancePx <= var8
	end
	
	local _ = function(p7)
		-- upvalues: loggerModule (copy), var5 (ref), p0 (ref), p3 (ref), var6 (write), var7 (write), var8 (write), var9 (write), var10 (write)
		loggerModule:debug("Scroll {} starting", var5.debugName)
		
		if p0(p3) then
			var6 = true
			var7 = nil
			var8 = 0
			var9 = 0
			var10 = p7
			
			return
		end
	end
	
	local renderSteppedConnection = runService.RenderStepped:Connect(function()
		-- upvalues: var6 (write), p2 (ref), var10 (write), var9 (write), var5 (ref), loggerModule (copy), p1 (ref), p3 (ref), var7 (write), var8 (write)
		if not var6 then return end
		local y = p2.CanvasPosition.Y
		
		if var10 == nil then
			var10 = y
			var9 = 0
			
			return
		end
		var9 = if math.abs(y - var10) <= 0.5 then var9 + 1 else 0
		var10 = y
		
		if var5.stableFramesRequired <= var9 then
			loggerModule:debug("Scroll {} stopping (reason={})", var5.debugName, "stableFrames")
			p1(p3)
			var6 = false
			var9 = 0
			var10 = nil
			var7 = nil
			var8 = 0
		end
	end)
	
	return {
		onScrollTick = function()
			-- upvalues: p2 (ref), var6 (write), var7 (write), var8 (write), var5 (ref), loggerModule (copy), p0 (ref), p3 (ref), var9 (write), var10 (write)
			local y = p2.CanvasPosition.Y
			
			if var6 then
				var9 = 0
				var10 = y
				
				return
			elseif var7 ~= nil then
				var8 += math.abs(y - var7)
			end
			var7 = y
			
			if var5.minDistancePx > var8 then return end
			loggerModule:debug("Scroll {} starting", var5.debugName)
			
			if p0(p3) then
				var6 = true
				var7 = nil
				var8 = 0
				var9 = 0
				var10 = y
				
				return
			end
		end,
		cleanup = function()
			-- upvalues: renderSteppedConnection (ref), var6 (write), loggerModule (copy), var5 (ref), p1 (ref), p3 (ref), var9 (write), var10 (write), var7 (write), var8 (write)
			if renderSteppedConnection then
				renderSteppedConnection:Disconnect()
			end
			if var6 then
				loggerModule:debug("Scroll {} cleanup/unmount", var5.debugName)
				loggerModule:debug("Scroll {} stopping (reason={})", var5.debugName, "cleanup")
				p1(p3)
				var6 = false
				var9 = 0
				var10 = nil
				var7 = nil
				var8 = 0
			end
		end
	}
end