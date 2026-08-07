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

return if game:DefineFastFlag("AppChatMigrateScrollIntervalTracker2", false) then function(p7, p8, p9, p10) --[[ line: 51 | named "createScrollIntervalTracker" ]]
	-- upvalues: appChatPerfTrackerModule (ref), cryoModule (ref), t (ref), scrollIntervalTrackerModule (ref)
	return scrollIntervalTrackerModule.createScrollIntervalTracker(function(p11) --[[ line: 57 | named "tryStart" ]]
		-- upvalues: appChatPerfTrackerModule (copy), p7 (ref)
		return appChatPerfTrackerModule.start(p7, p11)
	end, function(p12) --[[ line: 60 | named "finish" ]]
		-- upvalues: appChatPerfTrackerModule (copy), p7 (ref)
		appChatPerfTrackerModule.finish(p7, p12)
	end, p8, p9, cryoModule.Dictionary.join(t, { debugName = p7 }, p10 or {}))
end else function(p0, p1, p2, p3) --[[ line: 72 | named "createScrollIntervalTracker" ]]
	-- upvalues: cryoModule (ref), t (ref), scrollIntervalTracker (ref), appChatPerfTrackerModule (ref), runService (ref)
	local var7 = cryoModule.Dictionary.join(t, p3 or {})
	local var8 = false
	local var9 = nil
	local var10 = 0
	local var11 = 0
	local var12 = nil
	
	local function _() --[[ line: 90 | named "resetStopDetection" ]]
		-- upvalues: var11 (write), var12 (write)
		var11 = 0
		var12 = nil
	end
	
	local _ = function() --[[ line: 95 | named "resetStartDetection" ]]
		-- upvalues: var9 (write), var10 (write)
		var9 = nil
		var10 = 0
	end
	
	local _ = function(p4) --[[ line: 100 | named "stopInterval" ]]
		-- upvalues: scrollIntervalTracker (copy), p0 (ref), appChatPerfTrackerModule (copy), p2 (ref), var8 (write), var11 (write), var12 (write), var9 (write), var10 (write)
		scrollIntervalTracker:debug("Scroll: {} stopping (reason={})", p0, p4)
		appChatPerfTrackerModule.finish(p0, p2)
		var8 = false
		var11 = 0
		var12 = nil
		var9 = nil
		var10 = 0
	end
	
	local _ = function(p5) --[[ line: 108 | named "recordCanvasPositionChanged" ]]
		-- upvalues: var11 (write), var12 (write)
		var11 = 0
		var12 = p5
	end
	
	local _ = function(a) --[[ line: 114 | named "isPastMinScrollDistance" ]]
		-- upvalues: var9 (write), var10 (write), var7 (ref)
		if var9 ~= nil then
			var10 += math.abs(a - var9)
		end
		var9 = a
		
		return var7.minDistancePx <= var10
	end
	
	local _ = function(p6) --[[ line: 122 | named "tryStartInterval" ]]
		-- upvalues: scrollIntervalTracker (copy), p0 (ref), appChatPerfTrackerModule (copy), p2 (ref), var8 (write), var9 (write), var10 (write), var11 (write), var12 (write)
		scrollIntervalTracker:debug("Scroll: {} starting", p0)
		
		if appChatPerfTrackerModule.start(p0, p2) then
			var8 = true
			var9 = nil
			var10 = 0
			var11 = 0
			var12 = p6
			
			return
		end
	end
	
	local renderSteppedConnection = runService.RenderStepped:Connect(function() --[[ line: 138 ]]
		-- upvalues: var8 (write), p1 (ref), var12 (write), var11 (write), var7 (ref), scrollIntervalTracker (copy), p0 (ref), appChatPerfTrackerModule (copy), p2 (ref), var9 (write), var10 (write)
		if not var8 then return end
		local y = p1.CanvasPosition.Y
		
		if var12 == nil then
			var12 = y
			var11 = 0
			
			return
		end
		var11 = if math.abs(y - var12) <= 0.5 then var11 + 1 else 0
		var12 = y
		
		if var7.stableFramesRequired <= var11 then
			scrollIntervalTracker:debug("Scroll: {} stopping (reason={})", p0, "stableFrames")
			appChatPerfTrackerModule.finish(p0, p2)
			var8 = false
			var11 = 0
			var12 = nil
			var9 = nil
			var10 = 0
		end
	end)
	
	return {
		onScrollTick = function() --[[ line: 163 ]]
			-- upvalues: p1 (ref), var8 (write), var9 (write), var10 (write), var7 (ref), scrollIntervalTracker (copy), p0 (ref), appChatPerfTrackerModule (copy), p2 (ref), var11 (write), var12 (write)
			local y = p1.CanvasPosition.Y
			
			if var8 then
				var11 = 0
				var12 = y
				
				return
			elseif var9 ~= nil then
				var10 += math.abs(y - var9)
			end
			var9 = y
			
			if var7.minDistancePx > var10 then return end
			scrollIntervalTracker:debug("Scroll: {} starting", p0)
			
			if appChatPerfTrackerModule.start(p0, p2) then
				var8 = true
				var9 = nil
				var10 = 0
				var11 = 0
				var12 = y
				
				return
			end
		end,
		cleanup = function() --[[ line: 178 ]]
			-- upvalues: renderSteppedConnection (ref), var8 (write), scrollIntervalTracker (copy), p0 (ref), appChatPerfTrackerModule (copy), p2 (ref), var11 (write), var12 (write), var9 (write), var10 (write)
			if renderSteppedConnection then
				renderSteppedConnection:Disconnect()
			end
			if var8 then
				scrollIntervalTracker:debug("Scroll: {} cleanup/unmount", p0)
				scrollIntervalTracker:debug("Scroll: {} stopping (reason={})", p0, "cleanup")
				appChatPerfTrackerModule.finish(p0, p2)
				var8 = false
				var11 = 0
				var12 = nil
				var9 = nil
				var10 = 0
			end
		end
	}
end