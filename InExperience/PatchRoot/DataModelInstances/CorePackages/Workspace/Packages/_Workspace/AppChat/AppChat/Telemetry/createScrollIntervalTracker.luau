local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local AppChatPerfTrackerModule = require(AppChat.Telemetry.AppChatPerfTracker)
local _ = require(AppChat.Telemetry.AppChatPerfEvent)
local ScrollIntervalTracker = require(AppChat.Logger):new("ScrollIntervalTracker")
local CryoModule = require(Parent.Cryo)
local ScrollIntervalTrackerModule = require(Parent.ScrollIntervalTracker)
local RunService = game:GetService("RunService")
local config = {
	minDistancePx = game:DefineFastInt("AppChatScrollPerfMinDistancePx", 50),
	stableFramesRequired = game:DefineFastInt("AppChatScrollPerfMinStableFrames", 5)
}

return if game:DefineFastFlag("AppChatMigrateScrollIntervalTracker2", false) then function(DebugName, p1, p2, p3) --[[ Line: 50 | Named "createScrollIntervalTracker" ]]
	-- upvalues: AppChatPerfTrackerModule (copy), CryoModule (copy), config (copy), ScrollIntervalTrackerModule (copy)
	return ScrollIntervalTrackerModule.createScrollIntervalTracker(function(p4) --[[ Line: 56 | Named "tryStart" ]]
		-- upvalues: AppChatPerfTrackerModule (upval), DebugName (copy), p1 (copy)
		return AppChatPerfTrackerModule.start(DebugName, p4, p1)
	end, function(p4) --[[ Line: 59 | Named "finish" ]]
		-- upvalues: AppChatPerfTrackerModule (upval), DebugName (copy)
		AppChatPerfTrackerModule.finish(DebugName, p4)
	end, p1, p2, (CryoModule.Dictionary.join(config, { debugName = DebugName }, p3 or {})))
end else function(p1, ScrollFrame, p2, p3) --[[ Line: 71 | Named "createScrollIntervalTracker" ]]
	-- upvalues: CryoModule (copy), config (copy), ScrollIntervalTracker (copy), AppChatPerfTrackerModule (copy), RunService (copy)
	local JoinResult = CryoModule.Dictionary.join(config, p3 or {})
	local Flag = false
	local v1 = nil
	local NewMagnitude = 0
	local Count = 0
	local v2 = nil
	
	local function _() --[[ Line: 89 | Named "resetStopDetection" ]]
		-- upvalues: Count (ref), v2 (ref)
		Count = 0
		v2 = nil
	end
	
	local _ = function() --[[ Line: 94 | Named "resetStartDetection" ]]
		-- upvalues: v1 (ref), NewMagnitude (ref)
		v1 = nil
		NewMagnitude = 0
	end
	
	local _ = function(p4) --[[ Line: 99 | Named "stopInterval" ]]
		-- upvalues: ScrollIntervalTracker (upval), p1 (copy), AppChatPerfTrackerModule (upval), p2 (copy), Flag (ref), Count (ref), v2 (ref), v1 (ref), NewMagnitude (ref)
		ScrollIntervalTracker:debug("Scroll: {} stopping (reason={})", p1, p4)
		AppChatPerfTrackerModule.finish(p1, p2)
		Flag = false
		Count = 0
		v2 = nil
		v1 = nil
		NewMagnitude = 0
	end
	
	local _ = function(p4) --[[ Line: 107 | Named "recordCanvasPositionChanged" ]]
		-- upvalues: Count (ref), v2 (ref)
		Count = 0
		v2 = p4
	end
	
	local _ = function(p4): boolean --[[ Line: 113 | Named "isPastMinScrollDistance" ]]
		-- upvalues: v1 (ref), NewMagnitude (ref), JoinResult (copy)
		if v1 ~= nil then
			NewMagnitude += math.abs(p4 - v1)
		end
		v1 = p4
		
		return JoinResult.minDistancePx <= NewMagnitude
	end
	
	local _ = function(p4) --[[ Line: 121 | Named "tryStartInterval" ]]
		-- upvalues: ScrollIntervalTracker (upval), p1 (copy), AppChatPerfTrackerModule (upval), p2 (copy), ScrollFrame (copy), Flag (ref), v1 (ref), NewMagnitude (ref), Count (ref), v2 (ref)
		ScrollIntervalTracker:debug("Scroll: {} starting", p1)
		
		if AppChatPerfTrackerModule.start(p1, p2, ScrollFrame) then
			Flag = true
			v1 = nil
			NewMagnitude = 0
			Count = 0
			v2 = p4
			
			return
		end
	end
	
	local RenderSteppedConnection = RunService.RenderStepped:Connect(function() --[[ Line: 137 ]]
		-- upvalues: Flag (ref), ScrollFrame (copy), v2 (ref), Count (ref), JoinResult (copy), ScrollIntervalTracker (upval), p1 (copy), AppChatPerfTrackerModule (upval), p2 (copy), v1 (ref), NewMagnitude (ref)
		if not Flag then return end
		local Y = ScrollFrame.CanvasPosition.Y
		
		if v2 == nil then
			v2 = Y
			Count = 0
			
			return
		end
		if math.abs(Y - v2) <= 0.5 then
			Count += 1
		else
			Count = 0
		end
		v2 = Y
		
		if JoinResult.stableFramesRequired <= Count then
			ScrollIntervalTracker:debug("Scroll: {} stopping (reason={})", p1, "stableFrames")
			AppChatPerfTrackerModule.finish(p1, p2)
			Flag = false
			Count = 0
			v2 = nil
			v1 = nil
			NewMagnitude = 0
		end
	end)
	
	return {
		onScrollTick = function() --[[ Line: 162 ]]
			-- upvalues: ScrollFrame (copy), Flag (ref), v1 (ref), NewMagnitude (ref), JoinResult (copy), ScrollIntervalTracker (upval), p1 (copy), AppChatPerfTrackerModule (upval), p2 (copy), Count (ref), v2 (ref)
			local Y = ScrollFrame.CanvasPosition.Y
			
			if Flag then
				Count = 0
				v2 = Y
				
				return
			end
			if v1 ~= nil then
				NewMagnitude += math.abs(Y - v1)
			end
			v1 = Y
			
			if NewMagnitude < JoinResult.minDistancePx then return end
			ScrollIntervalTracker:debug("Scroll: {} starting", p1)
			
			if AppChatPerfTrackerModule.start(p1, p2, ScrollFrame) then
				Flag = true
				v1 = nil
				NewMagnitude = 0
				Count = 0
				v2 = Y
				
				return
			end
		end,
		cleanup = function() --[[ Line: 177 ]]
			-- upvalues: RenderSteppedConnection (copy), Flag (ref), ScrollIntervalTracker (upval), p1 (copy), AppChatPerfTrackerModule (upval), p2 (copy), Count (ref), v2 (ref), v1 (ref), NewMagnitude (ref)
			if RenderSteppedConnection then
				RenderSteppedConnection:Disconnect()
			end
			if Flag then
				ScrollIntervalTracker:debug("Scroll: {} cleanup/unmount", p1)
				ScrollIntervalTracker:debug("Scroll: {} stopping (reason={})", p1, "cleanup")
				AppChatPerfTrackerModule.finish(p1, p2)
				Flag = false
				Count = 0
				v2 = nil
				v1 = nil
				NewMagnitude = 0
			end
		end
	}
end