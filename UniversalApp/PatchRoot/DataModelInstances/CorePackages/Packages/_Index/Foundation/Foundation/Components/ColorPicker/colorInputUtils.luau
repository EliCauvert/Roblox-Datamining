local Foundation = script:FindFirstAncestor("Foundation")
local Parent = Foundation.Parent
local DashModule = require(Parent.Dash)
local _ = require(Parent.React)
local ColorInputModeModule = require(Foundation.Enums.ColorInputMode)

return {
	createInputConfigs = function(p1, p2, Value, Value1, Handler, Handler1, Handler2, Handler3, _) --[[ Line: 24 ]]
		-- upvalues: DashModule (copy), ColorInputModeModule (copy)
		local MapResult = DashModule.map({ "R", "G", "B" }, function(Text: string) --[[ Line: 35 ]]
			-- upvalues: p1 (copy), Handler (copy)
			return {
				minimum = 0,
				maximum = 255,
				step = 1,
				key = Text,
				component = Text:lower(),
				value = p1:map(function(p3) --[[ Line: 39 ]]
					-- upvalues: Text (copy)
					return p3[Text:lower()]
				end),
				handler = Handler
			}
		end)
		local Copy = table.clone(MapResult)
		table.insert(Copy, {
			key = "A",
			minimum = 0,
			maximum = 1,
			step = 0.01,
			precision = 3,
			value = Value1,
			handler = Handler3
		})
		
		return {
			[ColorInputModeModule.RGB] = MapResult,
			[ColorInputModeModule.RGBA] = Copy,
			[ColorInputModeModule.HSV] = DashModule.map({ "H", "S", "V" }, function(Text: string) --[[ Line: 60 ]]
				-- upvalues: p2 (copy), Handler1 (copy)
				return {
					minimum = 0,
					key = Text,
					component = Text:lower(),
					value = p2:map(function(p3) --[[ Line: 64 ]]
						-- upvalues: Text (copy)
						return p3[Text:lower()]
					end),
					handler = Handler1,
					maximum = if Text == "H" then 360 else nil
				}
			end),
			[ColorInputModeModule.Hex] = {
				{
					placeholder = "#000000",
					key = tostring(ColorInputModeModule.Hex),
					value = Value,
					handler = Handler2,
					width = UDim.new(1, 0)
				}
			}
		}
	end
}