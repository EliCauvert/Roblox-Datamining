local ScrollIntervalTracker = script:FindFirstAncestor("ScrollIntervalTracker")
local LoggerModule = require(ScrollIntervalTracker.Logger)
local CryoModule = require(ScrollIntervalTracker.Parent.Cryo)
local RunService = game:GetService("RunService")
local config = { minDistancePx = 50, stableFramesRequired = 5 }

return function(Callback1, Callback, ScrollFrame, p1, p2)
	-- upvalues: CryoModule (copy), config (copy), LoggerModule (copy), RunService (copy)
	local JoinResult = CryoModule.Dictionary.join(config, p2 or {})
	local Flag = false
	local v1 = nil
	local NewMagnitude = 0
	local Count = 0
	local v2 = nil
	
	local function _()
		-- upvalues: Count (ref), v2 (ref)
		Count = 0
		v2 = nil
	end
	
	local _ = function()
		-- upvalues: v1 (ref), NewMagnitude (ref)
		v1 = nil
		NewMagnitude = 0
	end
	
	local _ = function(p3)
		-- upvalues: LoggerModule (upval), JoinResult (copy), Callback (copy), p1 (copy), Flag (ref), Count (ref), v2 (ref), v1 (ref), NewMagnitude (ref)
		LoggerModule:debug("Scroll {} stopping (reason={})", JoinResult.debugName, p3)
		Callback(p1)
		Flag = false
		Count = 0
		v2 = nil
		v1 = nil
		NewMagnitude = 0
	end
	
	local _ = function(p3)
		-- upvalues: Count (ref), v2 (ref)
		Count = 0
		v2 = p3
	end
	
	local _ = function(p3): boolean
		-- upvalues: v1 (ref), NewMagnitude (ref), JoinResult (copy)
		if v1 ~= nil then
			NewMagnitude += math.abs(p3 - v1)
		end
		v1 = p3
		
		return JoinResult.minDistancePx <= NewMagnitude
	end
	
	local _ = function(p3)
		-- upvalues: LoggerModule (upval), JoinResult (copy), Callback1 (copy), p1 (copy), Flag (ref), v1 (ref), NewMagnitude (ref), Count (ref), v2 (ref)
		LoggerModule:debug("Scroll {} starting", JoinResult.debugName)
		
		if Callback1(p1) then
			Flag = true
			v1 = nil
			NewMagnitude = 0
			Count = 0
			v2 = p3
			
			return
		end
	end
	
	local RenderSteppedConnection = RunService.RenderStepped:Connect(function()
		-- upvalues: Flag (ref), ScrollFrame (copy), v2 (ref), Count (ref), JoinResult (copy), LoggerModule (upval), Callback (copy), p1 (copy), v1 (ref), NewMagnitude (ref)
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
			LoggerModule:debug("Scroll {} stopping (reason={})", JoinResult.debugName, "stableFrames")
			Callback(p1)
			Flag = false
			Count = 0
			v2 = nil
			v1 = nil
			NewMagnitude = 0
		end
	end)
	
	return {
		onScrollTick = function()
			-- upvalues: ScrollFrame (copy), Flag (ref), v1 (ref), NewMagnitude (ref), JoinResult (copy), LoggerModule (upval), Callback1 (copy), p1 (copy), Count (ref), v2 (ref)
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
			LoggerModule:debug("Scroll {} starting", JoinResult.debugName)
			
			if Callback1(p1) then
				Flag = true
				v1 = nil
				NewMagnitude = 0
				Count = 0
				v2 = Y
				
				return
			end
		end,
		cleanup = function()
			-- upvalues: RenderSteppedConnection (copy), Flag (ref), LoggerModule (upval), JoinResult (copy), Callback (copy), p1 (copy), Count (ref), v2 (ref), v1 (ref), NewMagnitude (ref)
			if RenderSteppedConnection then
				RenderSteppedConnection:Disconnect()
			end
			if Flag then
				LoggerModule:debug("Scroll {} cleanup/unmount", JoinResult.debugName)
				LoggerModule:debug("Scroll {} stopping (reason={})", JoinResult.debugName, "cleanup")
				Callback(p1)
				Flag = false
				Count = 0
				v2 = nil
				v1 = nil
				NewMagnitude = 0
			end
		end
	}
end