local _ = require("./input_kit")
local _ = require("./input_types")
local _ = require("./types")
local _ = require("./control_types")
local _ = require("../vendor/compose/core")

return function(p1, p2, p3)
	local Runtime = p1.runtime
	local StopEnabledFunction = p3.stopEnabled
	local AdjustmentFunction = p3.adjustment
	
	function p2.feedback(p4)
		-- upvalues: p1 (copy)
		assert(type(p4) == "string", "Facet UI.feedback expects a feedback kind")
		assert(p1.haptic(p4)):Play()
	end
	
	function p2.adjustable(p4, p5)
		-- upvalues: Runtime (copy), StopEnabledFunction (copy), AdjustmentFunction (copy)
		assert(type(p5) == "table" and type(p5.onAdjust) == "function", "Facet UI.adjustable requires onAdjust")
		local Axis = p5.axis or "horizontal"
		assert(Axis == "horizontal" or (Axis == "vertical" or Axis == "none"), `Facet UI.adjustable: axis '{tostring(Axis)}' is not horizontal, vertical or none`)
		local CanAdjustFunction = p5.canAdjust
		local v1 = if Axis == "none" then nil else 1e999
		Runtime.decorate(p4, {
			Selectable = function(p6)
				-- upvalues: StopEnabledFunction (upval), p5 (copy)
				return StopEnabledFunction(p5, p6)
			end
		})
		AdjustmentFunction(p4, p5, p5.onAdjust, nil, if v1 then -v1 else nil, v1, {
			vertical = Axis == "vertical",
			once = p5.repeats ~= true,
			arrows = function(p6, p7)
				-- upvalues: CanAdjustFunction (copy)
				return CanAdjustFunction == nil or CanAdjustFunction(p7, p6)
			end
		})
	end
end