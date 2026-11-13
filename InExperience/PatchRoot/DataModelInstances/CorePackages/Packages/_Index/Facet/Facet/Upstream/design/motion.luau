local _ = require("../vendor/compose/core")
local _ = require("../vendor/compose/design/types")
local _ = require("../ui/control_types")
local _ = require("../ui/effect_types")
local _ = require("./types")

return {
	roles = {
		"control", "flick", "move", "quick", "sheet", "snappy", "travel"
	},
	motion = function(p1)
		return {
			animate = function(p2, p3)
				-- upvalues: p1 (copy)
				return p1.follow(p2, p3)
			end,
			sequence = function(p2, p3, p4)
				-- upvalues: p1 (copy)
				local Steps = {}
				
				for _, step in p2.steps do
					local config = {
						delay = step.delay,
						duration = step.duration,
						easing = step.easing
					}
					local State = step.state
					local To = step.to
					local v1 = if State == nil then nil else p3[State]
					
					if v1 ~= nil and To ~= nil then
						if type(To) == "number" then
							local v2 = nil
							
							function config.sample(p5: number)
								-- upvalues: v1 (copy), v2 (ref), To (copy)
								local PeekResult = v1:peek()
								local PeekResult1 = if p5 > 0 and v2 ~= nil then v2 elseif type(PeekResult) == "number" then PeekResult else To
								v2 = if p5 >= 1 then nil else PeekResult1
								v1:set(PeekResult1 + (To - PeekResult1) * p5)
							end
						else
							function config.onStart()
								-- upvalues: v1 (copy), To (copy)
								v1:set(To)
							end
						end
					end
					local Output = step.output
					
					if Output ~= nil then
						config.onEnd = p4[Output]
					end
					table.insert(Steps, config)
				end
				return p1.sequence({ steps = Steps })
			end
		}
	end
}