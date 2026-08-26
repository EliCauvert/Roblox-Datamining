local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local appChatPerfTrackerModule = require(appChat.Telemetry.AppChatPerfTracker)
local _ = require(appChat.Telemetry.AppChatPerfEvent)
local scrollIntervalTracker = require(appChat.Logger):new("ScrollIntervalTracker")
local cryoModule = require(parent.Cryo)
local scrollIntervalTrackerModule = require(parent.ScrollIntervalTracker)
local runService = game:GetService("RunService")
local t = {
	minDistancePx = game:DefineFastInt("AppChatScrollPerfMinDistancePx", 50),
	stableFramesRequired = game:DefineFastInt("AppChatScrollPerfMinStableFrames", 5)
}

return if game:DefineFastFlag("AppChatMigrateScrollIntervalTracker2", false) then function(p1, p2, p3, p4)
	-- upvalues: appChatPerfTrackerModule (ref), cryoModule (ref), t (ref), scrollIntervalTrackerModule (ref)
	return scrollIntervalTrackerModule.createScrollIntervalTracker(function(p5)
		-- upvalues: appChatPerfTrackerModule (copy), p1 (ref)
		return appChatPerfTrackerModule.start(p1, p5)
	end, function(p5)
		-- upvalues: appChatPerfTrackerModule (copy), p1 (ref)
		appChatPerfTrackerModule.finish(p1, p5)
	end, p2, p3, cryoModule.Dictionary.join(t, { debugName = p1 }, p4 or {}))
end else function(p1, p2, p3, p4)
	-- upvalues: cryoModule (ref), t (ref), scrollIntervalTracker (ref), appChatPerfTrackerModule (ref), runService (ref)
	local var1 = cryoModule.Dictionary.join(t, p4 or {})
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
	
	local _ = function(p5)
		-- upvalues: scrollIntervalTracker (copy), p1 (ref), appChatPerfTrackerModule (copy), p3 (ref), var2 (write), var5 (write), var6 (write), var3 (write), var4 (write)
		scrollIntervalTracker:debug("Scroll: {} stopping (reason={})", p1, p5)
		appChatPerfTrackerModule.finish(p1, p3)
		var2 = false
		var5 = 0
		var6 = nil
		var3 = nil
		var4 = 0
	end
	
	local _ = function(p5)
		-- upvalues: var5 (write), var6 (write)
		var5 = 0
		var6 = p5
	end
	
	local _ = function(a)
		-- upvalues: var3 (write), var4 (write), var1 (ref)
		if var3 ~= nil then
			var4 += math.abs(a - var3)
		end
		var3 = a
		
		return var1.minDistancePx <= var4
	end
	
	local _ = function(p5)
		-- upvalues: scrollIntervalTracker (copy), p1 (ref), appChatPerfTrackerModule (copy), p3 (ref), var2 (write), var3 (write), var4 (write), var5 (write), var6 (write)
		scrollIntervalTracker:debug("Scroll: {} starting", p1)
		
		if appChatPerfTrackerModule.start(p1, p3) then
			var2 = true
			var3 = nil
			var4 = 0
			var5 = 0
			var6 = p5
			
			return
		end
	end
	
	local renderSteppedConnection = runService.RenderStepped:Connect(function()
		-- upvalues: var2 (write), p2 (ref), var6 (write), var5 (write), var1 (ref), scrollIntervalTracker (copy), p1 (ref), appChatPerfTrackerModule (copy), p3 (ref), var3 (write), var4 (write)
		if not var2 then return end
		local y = p2.CanvasPosition.Y
		
		if var6 == nil then
			var6 = y
			var5 = 0
			
			return
		end
		var5 = if math.abs(y - var6) <= 0.5 then var5 + 1 else 0
		var6 = y
		
		if var1.stableFramesRequired <= var5 then
			scrollIntervalTracker:debug("Scroll: {} stopping (reason={})", p1, "stableFrames")
			appChatPerfTrackerModule.finish(p1, p3)
			var2 = false
			var5 = 0
			var6 = nil
			var3 = nil
			var4 = 0
		end
	end)
	
	return {
		onScrollTick = function()
			-- upvalues: p2 (ref), var2 (write), var3 (write), var4 (write), var1 (ref), scrollIntervalTracker (copy), p1 (ref), appChatPerfTrackerModule (copy), p3 (ref), var5 (write), var6 (write)
			local y = p2.CanvasPosition.Y
			
			if var2 then
				var5 = 0
				var6 = y
				
				return
			elseif var3 ~= nil then
				var4 += math.abs(y - var3)
			end
			var3 = y
			
			if var1.minDistancePx > var4 then return end
			scrollIntervalTracker:debug("Scroll: {} starting", p1)
			
			if appChatPerfTrackerModule.start(p1, p3) then
				var2 = true
				var3 = nil
				var4 = 0
				var5 = 0
				var6 = y
				
				return
			end
		end,
		cleanup = function()
			-- upvalues: renderSteppedConnection (ref), var2 (write), scrollIntervalTracker (copy), p1 (ref), appChatPerfTrackerModule (copy), p3 (ref), var5 (write), var6 (write), var3 (write), var4 (write)
			if renderSteppedConnection then
				renderSteppedConnection:Disconnect()
			end
			if var2 then
				scrollIntervalTracker:debug("Scroll: {} cleanup/unmount", p1)
				scrollIntervalTracker:debug("Scroll: {} stopping (reason={})", p1, "cleanup")
				appChatPerfTrackerModule.finish(p1, p3)
				var2 = false
				var5 = 0
				var6 = nil
				var3 = nil
				var4 = 0
			end
		end
	}
end