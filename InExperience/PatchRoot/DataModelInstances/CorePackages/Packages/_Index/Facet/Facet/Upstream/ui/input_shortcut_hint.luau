local _ = require("./input_kit")
local InputKeyGlyphModule = require("./input_key_glyph")
local _ = require("./input_types")
local _ = require("./types")
local _ = require("./control_types")
local _ = require("./input_props")
local _ = require("../vendor/compose/core")

return function(p1, p2, p3)
	-- upvalues: InputKeyGlyphModule (copy)
	local Runtime = p1.runtime
	local Host = p1.Host
	local Compose = p1.Compose
	local ReadFunction = p1.read
	local PropsFunction = p1.props
	local TypesUDim2 = p1.types.UDim2
	local TypesEnum = p1.types.Enum
	local InputKeyGlyphModuleResult = InputKeyGlyphModule(p1, p3.noKey)
	p2.ShortcutHint = p1.construct("ShortcutHint", function(p4)
		-- upvalues: p1 (copy), p2 (copy), TypesEnum (copy), PropsFunction (copy), TypesUDim2 (copy), Host (copy), ReadFunction (copy), Runtime (copy), Compose (copy), InputKeyGlyphModuleResult (copy)
		assert(p4.action == nil ~= (p4.keys == nil), "Facet.ShortcutHint: supply action or keys")
		assert(p4.action == nil or p4.separator == nil, "Facet.ShortcutHint: separator applies only to keys")
		assert(p4.cap == nil or type(p4.cap) == "boolean", "Facet.ShortcutHint: cap must be a boolean")
		local list = {
			"action",
			"keys",
			"separator",
			"controlSize",
			"cap"
		}
		
		local function _(p5)
			-- upvalues: p1 (upval), p4 (copy)
			p1.styled(p5, "shortcut-hint")
			
			if p4.cap == false then
				p1.styled(p5, "shortcut-hint-bare")
			end
			return p5
		end
		
		if p4.label ~= nil then
			assert(p4.labelPosition == nil or (p4.labelPosition == "start" or p4.labelPosition == "end"), "Facet.ShortcutHint: labelPosition must be start or end")
			local Keys = p2.ShortcutHint({
				Name = "Keys",
				action = p4.action,
				keys = p4.keys,
				separator = p4.separator,
				controlSize = p4.controlSize,
				cap = p4.cap
			})
			local Secondary = p1.styled(p1.text({
				Name = "Label",
				Text = p4.label,
				AutomaticSize = TypesEnum.AutomaticSize.XY
			}), "secondary")
			
			return p1.row(if p4.labelPosition == "start" then { Secondary, Keys } else { Keys, Secondary }, (PropsFunction(p4, {
				"action", "keys", "separator", "controlSize", "label", "labelPosition", "cap"
			}, {
				Name = "ShortcutHint",
				BackgroundTransparency = 1,
				Size = TypesUDim2.fromOffset(0, 0),
				AutomaticSize = TypesEnum.AutomaticSize.XY
			})))
		end
		if p4.keys then
			local Text = p1.styled(Host.TextLabel(PropsFunction(p4, list, {
				Text = function(p5): string
					-- upvalues: ReadFunction (upval), p4 (copy)
					local ReadResult = ReadFunction(assert(p4.keys), p5)
					assert(type(ReadResult) == "table" and #ReadResult > 0, "Facet.ShortcutHint: keys must be a nonempty list of chords")
					local List = {}
					
					for _, value in ReadResult do
						assert(type(value) == "table" and #value > 0, "Facet.ShortcutHint: chords cannot be empty")
						
						for _, value1 in value do
							assert(type(value1) == "string" and value1 ~= "", "Facet.ShortcutHint: key names must be nonempty strings")
						end
						table.insert(List, table.concat(value, "+"))
					end
					local ReadResult1 = ReadFunction(p4.separator, p5) or " / "
					assert(type(ReadResult1) == "string" and ReadResult1 ~= "", "Facet.ShortcutHint: separator must be a nonempty string")
					
					if string.find(ReadResult1, "^%a+$") then
						ReadResult1 = ` {ReadResult1} `
					end
					return table.concat(List, ReadResult1)
				end,
				Size = function(p6)
					-- upvalues: p1 (upval), p4 (copy), TypesUDim2 (upval)
					local NewIconSize = p1.controlSize(p4.controlSize, "iconSize", p6) + 8
					
					return TypesUDim2.fromOffset(NewIconSize, NewIconSize)
				end,
				AutomaticSize = TypesEnum.AutomaticSize.XY,
				BackgroundTransparency = if p4.cap == false then 1 else 0,
				BorderSizePixel = 0,
				TextXAlignment = TypesEnum.TextXAlignment.Center,
				Host.UIPadding({})
			})), "Text")
			p1.styled(Text, "shortcut-hint")
			
			if p4.cap == false then
				p1.styled(Text, "shortcut-hint-bare")
			end
			p1.textRole(Text, "caption")
			p1.textLayout(Text, nil, true)
			
			if p4.Size == nil then
				local LayoutBoundsResult = p1.layoutBounds(Text, p1.layoutUnit(Text, "CapUnit"))
				Runtime.decorate(Text, {
					Size = function(Callback)
						-- upvalues: p1 (upval), p4 (copy), LayoutBoundsResult (copy), TypesUDim2 (upval)
						local NewLargest = math.max(p1.controlSize(p4.controlSize, "iconSize", Callback), Callback(LayoutBoundsResult).Y) + 8
						
						return TypesUDim2.fromOffset(NewLargest, NewLargest)
					end
				})
			end
			return Text
		else
			local Action = p4.action
			assert(Action and (Action.IsA and Action:IsA("InputAction")), "Facet.ShortcutHint: action must be a native InputAction")
			local PreferredBindingResult = p1.observe.PreferredBinding(Action)
			local EffectiveInputResult = p1.effectiveInput()
			
			local function shown(Callback)
				-- upvalues: PreferredBindingResult (copy), EffectiveInputResult (copy)
				local CallbackResult = Callback(PreferredBindingResult)
				
				if CallbackResult and EffectiveInputResult(Callback) == "Gamepad" then
					local KeyCode = CallbackResult.KeyCode
					local Name = if KeyCode then KeyCode.Name else ""
					local HasFoundAt: boolean = string.find(Name, "^Button") ~= nil or string.find(Name, "^DPad") ~= nil or string.find(Name, "^Thumbstick") ~= nil
					
					return if HasFoundAt then CallbackResult else nil
				else
					return CallbackResult
				end
			end
			
			local PropsResult = PropsFunction(p4, list, {
				Size = TypesUDim2.fromOffset(0, 0),
				AutomaticSize = TypesEnum.AutomaticSize.XY,
				BackgroundTransparency = function(p6): number
					-- upvalues: p4 (copy), shown (copy)
					return if p4.cap == false or shown(p6) == nil then 1 else 0
				end
			})
			PropsResult[#PropsResult + 1] = Compose.keyed({
				from = function(p6)
					-- upvalues: shown (copy)
					local ShownResult = shown(p6)
					
					return if ShownResult then { ShownResult } else {}
				end,
				render = function(_, _, p6)
					-- upvalues: InputKeyGlyphModuleResult (upval), p4 (copy), p1 (upval)
					return InputKeyGlyphModuleResult("PreferredBinding", p4.controlSize, {
						key = p1.observe.KeyCode(p6),
						name = p1.observe.DisplayName(p6),
						primary = p1.observe.PrimaryModifier(p6),
						secondary = p1.observe.SecondaryModifier(p6),
						image = p1.observe.DisplayImage(p6)
					})
				end
			})
			local FrameResult = Host.Frame(PropsResult)
			p1.styled(FrameResult, "shortcut-hint")
			
			if p4.cap == false then
				p1.styled(FrameResult, "shortcut-hint-bare")
			end
			return FrameResult
		end
	end)
end