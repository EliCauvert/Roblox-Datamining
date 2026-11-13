local _ = require("../vendor/compose/core")
local _ = require("./types")
local ReducedFunction = require("./motion").reduced

return function(p1, Callback, p2, p3)
	-- upvalues: ReducedFunction (copy)
	local Compose = p1.Compose
	local Frames = p1.runtime.host.frames
	local ReducedResult = ReducedFunction(p1)
	local Callback1 = p3 or function()
		-- upvalues: ReducedResult (copy)
		return ReducedResult()
	end
	local CellResult = Compose.cell(nil)
	local v1 = nil
	local Flag = false
	
	local function halt()
		-- upvalues: v1 (ref), CellResult (copy)
		local Callback: () -> () = v1
		v1 = nil
		
		if Callback then
			Callback()
		end
		CellResult:set(nil)
	end
	
	local function launch(p4, Value: number, p5): boolean
		-- upvalues: v1 (ref), CellResult (copy), p2 (copy), Frames (copy), Flag (ref), Callback1 (copy), p1 (copy), Compose (copy), Callback (copy)
		local Callback2: () -> () = v1
		v1 = nil
		
		if Callback2 then
			Callback2()
		end
		CellResult:set(nil)
		local P4 = p5 or p2
		local IsDampingAbove = P4.damping >= 1
		
		if Flag or Frames == nil or Callback1() then
			return false
		else
			local MotionFlingMaxSpeed: number = p1.metric("motion.fling.maxSpeed")
			local SpringState = Compose.createSpringState({ p4 }, 1)
			SpringState.velocity[1] = math.clamp(Value, -MotionFlingMaxSpeed, MotionFlingMaxSpeed)
			CellResult:set(p4)
			local OnFrameResult = nil
			OnFrameResult = Frames.onFrame(function(p6)
				-- upvalues: v1 (upval), OnFrameResult (ref), Callback (upval), SpringState (copy), Compose (upval), P4 (copy), IsDampingAbove (copy), CellResult (upval)
				if v1 ~= OnFrameResult then return end
				local CallbackResult: number = Callback()
				local PositionEntry: number = SpringState.position[1]
				Compose.stepSpring(SpringState, { CallbackResult }, p6, P4.period, P4.damping)
				local PositionEntry1: number = SpringState.position[1]
				
				if PositionEntry1 == PositionEntry1 and math.abs(PositionEntry1) ~= 1e999 and (not IsDampingAbove or (PositionEntry1 - CallbackResult) * (PositionEntry - CallbackResult) >= 0) and (math.abs(PositionEntry1 - CallbackResult) >= 0.5 or math.abs(SpringState.velocity[1]) >= 5) then
					CellResult:set(PositionEntry1)
					
					return
				end
				local Callback1: () -> () = v1
				v1 = nil
				
				if Callback1 then
					Callback1()
				end
				CellResult:set(nil)
			end)
			v1 = OnFrameResult
			
			return true
		end
	end
	
	Compose.cleanup(function()
		-- upvalues: Flag (ref), v1 (ref), CellResult (copy)
		Flag = true
		local Callback: () -> () = v1
		v1 = nil
		
		if Callback then
			Callback()
		end
		CellResult:set(nil)
	end)
	
	return { value = CellResult, launch = launch, halt = halt }
end