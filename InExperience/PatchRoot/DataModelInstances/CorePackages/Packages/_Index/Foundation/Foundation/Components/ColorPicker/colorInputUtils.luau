local foundation = script:FindFirstAncestor("Foundation")
local parent = foundation.Parent
local dashModule = require(parent.Dash)
local _ = require(parent.React)
local colorInputModeModule = require(foundation.Enums.ColorInputMode)

return {
	createInputConfigs = function(p1, p2, p3, p4, p5, p6, p7, p8, _)
		-- upvalues: dashModule (ref), colorInputModeModule (ref)
		local var1 = dashModule.map({ "R", "G", "B" }, function(p9)
			-- upvalues: p1 (ref), p5 (ref)
			return {
				minimum = 0,
				maximum = 255,
				step = 1,
				key = p9,
				component = p9:lower(),
				value = p1:map(function(p10)
					-- upvalues: p9 (ref)
					return p10[p9:lower()]
				end),
				handler = p5
			}
		end)
		local cloned = table.clone(var1)
		table.insert(cloned, {
			key = "A",
			minimum = 0,
			maximum = 1,
			step = 0.01,
			precision = 3,
			value = p4,
			handler = p8
		})
		
		return {
			[colorInputModeModule.RGB] = var1,
			[colorInputModeModule.RGBA] = cloned,
			[colorInputModeModule.HSV] = dashModule.map({ "H", "S", "V" }, function(p9)
				-- upvalues: p2 (ref), p6 (ref)
				return {
					minimum = 0,
					key = p9,
					component = p9:lower(),
					value = p2:map(function(p10)
						-- upvalues: p9 (ref)
						return p10[p9:lower()]
					end),
					handler = p6,
					maximum = if p9 == "H" then 360 else nil
				}
			end),
			[colorInputModeModule.Hex] = {
				{
					placeholder = "#000000",
					key = tostring(colorInputModeModule.Hex),
					value = p3,
					handler = p7,
					width = UDim.new(1, 0)
				}
			}
		}
	end
}