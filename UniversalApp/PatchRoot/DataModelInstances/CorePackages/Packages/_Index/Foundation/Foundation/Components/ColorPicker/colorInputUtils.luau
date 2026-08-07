local foundation = script:FindFirstAncestor("Foundation")
local parent = foundation.Parent
local dashModule = require(parent.Dash)
local _ = require(parent.React)
local colorInputModeModule = require(foundation.Enums.ColorInputMode)

return {
	createInputConfigs = function(p0, p1, p2, p3, p4, p5, p6, p7, _) --[[ line: 24 ]]
		-- upvalues: dashModule (ref), colorInputModeModule (ref)
		local var3 = dashModule.map({ "R", "G", "B" }, function(p8) --[[ line: 35 ]]
			-- upvalues: p0 (ref), p4 (ref)
			return {
				minimum = 0,
				maximum = 255,
				step = 1,
				key = p8,
				component = p8:lower(),
				value = p0:map(function(p9) --[[ line: 39 ]]
					-- upvalues: p8 (ref)
					return p9[p8:lower()]
				end),
				handler = p4
			}
		end)
		local cloned = table.clone(var3)
		table.insert(cloned, {
			key = "A",
			minimum = 0,
			maximum = 1,
			step = 0.01,
			precision = 3,
			value = p3,
			handler = p7
		})
		
		return {
			[colorInputModeModule.RGB] = var3,
			[colorInputModeModule.RGBA] = cloned,
			[colorInputModeModule.HSV] = dashModule.map({ "H", "S", "V" }, function(p10) --[[ line: 60 ]]
				-- upvalues: p1 (ref), p5 (ref)
				return {
					minimum = 0,
					key = p10,
					component = p10:lower(),
					value = p1:map(function(p11) --[[ line: 64 ]]
						-- upvalues: p10 (ref)
						return p11[p10:lower()]
					end),
					handler = p5,
					maximum = if p10 == "H" then 360 else nil
				}
			end),
			[colorInputModeModule.Hex] = {
				{
					placeholder = "#000000",
					key = tostring(colorInputModeModule.Hex),
					value = p2,
					handler = p6,
					width = UDim.new(1, 0)
				}
			}
		}
	end
}