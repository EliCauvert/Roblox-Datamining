local _ = require("./types")
local _ = require("../vendor/compose/core")
local MotionModule = require("./motion")
local FeedbackPaintModule = require("./feedback_paint")

return function(p1, p2, p3)
	-- upvalues: MotionModule (copy), FeedbackPaintModule (copy)
	local Compose = p1.Compose
	local CellResult = Compose.cell(false)
	local CellResult1 = Compose.cell(false)
	local ReadFunction = p1.read
	local TweenResult = p1.runtime.tween(function(Callback)
		-- upvalues: CellResult (copy), ReadFunction (copy), p3 (copy)
		return if Callback(CellResult) then ReadFunction(p3, Callback) else 1
	end, {
		seconds = function(p4)
			-- upvalues: p1 (copy)
			return p1.metric("motion.durations.pressLift", p4)
		end,
		ease = p1.motionEase("present"),
		reducedMotion = MotionModule.reduced(p1)
	})
	
	return {
		value = TweenResult,
		visual = FeedbackPaintModule(p1, p2, p1.Host.UIScale({
			Name = "PressLift",
			Scale = function(Callback)
				-- upvalues: CellResult1 (copy), TweenResult (copy)
				return if Callback(CellResult1) then 1 else Callback(TweenResult)
			end
		}), {}),
		press = function()
			-- upvalues: CellResult1 (copy), CellResult (copy)
			CellResult1:set(false)
			CellResult:set(true)
		end,
		release = function()
			-- upvalues: CellResult (copy)
			CellResult:set(false)
		end,
		carry = function()
			-- upvalues: CellResult1 (copy)
			CellResult1:set(true)
		end
	}
end