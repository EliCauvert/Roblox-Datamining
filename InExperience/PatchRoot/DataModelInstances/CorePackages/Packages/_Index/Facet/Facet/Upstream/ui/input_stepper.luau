local InputValueModule = require("./input_value")
local _ = require("./input_kit")
local _ = require("./input_types")
local _ = require("./types")
local _ = require("./control_types")
local _ = require("../vendor/compose/core")

return function(p1, p2, p3)
	-- upvalues: InputValueModule (copy)
	local Host = p1.Host
	local ReadFunction = p1.read
	local Compose = p1.Compose
	local TypesUDim2 = p1.types.UDim2
	local TypesEnum = p1.types.Enum
	local Lists = p3.lists
	local EnabledFunction = p3.enabled
	local ChangedFunction = p3.changed
	p2.Stepper = p1.construct("Stepper", function(p4)
		-- upvalues: p3 (copy), InputValueModule (upval), ReadFunction (copy), Compose (copy), ReadFunction (copy), EnabledFunction (copy), ChangedFunction (copy), p2 (copy), TypesUDim2 (copy), TypesEnum (copy), p1 (copy), Host (copy), Lists (copy)
		p3.requireValue(p4, "number", "Stepper")
		local InputValueModuleResult = InputValueModule({
			min = p4.min,
			max = p4.max,
			step = p4.step or 1,
			format = p4.format
		}, ReadFunction)
		local SelectorResult = Compose.selector(Compose.formula(function(p5): number
			-- upvalues: ReadFunction (upval), p4 (copy), InputValueModuleResult (copy)
			local ReadResult = ReadFunction(p4.value, p5)
			
			return if ReadResult == ReadResult then if ReadResult <= InputValueModuleResult.min then -1 elseif InputValueModuleResult.max <= ReadResult then 1 else 0 else 2
		end))
		
		local function adjust(p5)
			-- upvalues: EnabledFunction (upval), p4 (copy), ChangedFunction (upval), InputValueModuleResult (copy), ReadFunction (upval)
			if EnabledFunction(p4) then
				ChangedFunction(p4, InputValueModuleResult.stepped(ReadFunction(p4.value), p5))
			end
		end
		
		local function stepButton(Name, Icon, p5: number, Enabled)
			-- upvalues: p2 (upval), p4 (copy), p3 (upval), TypesUDim2 (upval), TypesEnum (upval), EnabledFunction (upval), ChangedFunction (upval), InputValueModuleResult (copy), ReadFunction (upval)
			local Object = p2.Button(Name)({
				haptic = true,
				Selectable = false,
				icon = Icon,
				name = Name,
				repeatDelay = p4.repeatDelay or p3.repeatDelay,
				repeatInterval = p4.repeatInterval or p3.repeatInterval,
				LayoutOrder = if p5 < 0 then 1 else 3,
				Size = TypesUDim2.fromOffset(44, 44),
				AutomaticSize = TypesEnum.AutomaticSize.None,
				enabled = Enabled,
				onActivate = function()
					-- upvalues: p5 (copy), EnabledFunction (upval), p4 (upval), ChangedFunction (upval), InputValueModuleResult (upval), ReadFunction (upval)
					if EnabledFunction(p4) then
						ChangedFunction(p4, InputValueModuleResult.stepped(ReadFunction(p4.value), p5))
					end
				end
			})
			Object:AddTag("facet-stepper-button")
			
			return Object
		end
		
		local Value = p1.text({
			Name = "Value",
			LayoutOrder = 2,
			Text = "",
			Size = TypesUDim2.fromOffset(40, 44),
			AutomaticSize = TypesEnum.AutomaticSize.X,
			TextXAlignment = TypesEnum.TextXAlignment.Center,
			TextYAlignment = TypesEnum.TextYAlignment.Center
		})
		local Labels = {
			Lists.list({ gap = 12, align = "center" }, false),
			(p1.styled(Host.Frame("Controls")({
				LayoutOrder = 2,
				Size = TypesUDim2.fromOffset(0, 44),
				AutomaticSize = TypesEnum.AutomaticSize.X,
				Lists.list({ align = "center" }, false),
				Lists.insets({ left = 2, right = 2 }),
				stepButton("Decrease", "decrement", -1, function(Callback)
					-- upvalues: EnabledFunction (upval), p4 (copy), SelectorResult (copy)
					return EnabledFunction(p4, Callback) and (Callback(SelectorResult(0)) or Callback(SelectorResult(1)))
				end),
				Value,
				(stepButton("Increase", "increment", 1, function(Callback)
					-- upvalues: EnabledFunction (upval), p4 (copy), SelectorResult (copy)
					return EnabledFunction(p4, Callback) and (Callback(SelectorResult(0)) or Callback(SelectorResult(-1)))
				end))
			}), "stepper-track"))
		}
		
		if p4.label then
			table.insert(Labels, p1.text({
				Name = "Label",
				LayoutOrder = 1,
				Text = p4.label,
				Size = TypesUDim2.fromScale(0, 0),
				AutomaticSize = TypesEnum.AutomaticSize.Y,
				TextXAlignment = TypesEnum.TextXAlignment.Left,
				Host.UIFlexItem({ FlexMode = TypesEnum.UIFlexMode.Fill }),
				p1.styled(Host.UIPadding({}), "stepper-inset")
			}))
		end
		local PropsResult = p1.props(p4, {
			"value", "min", "max", "step", "format", "enabled", "onChange", "label",
			"repeatDelay", "repeatInterval"
		}, {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Selectable = function(p5)
				-- upvalues: p3 (upval), p4 (copy)
				return p3.stopEnabled(p4, p5)
			end,
			Size = if p4.label then TypesUDim2.new(1, 0, 0, 0) else TypesUDim2.fromOffset(0, 0),
			AutomaticSize = if p4.label then TypesEnum.AutomaticSize.Y else TypesEnum.AutomaticSize.XY
		})
		PropsResult[#PropsResult + 1] = Host.Frame("Content")({
			ZIndex = 1,
			BackgroundTransparency = 1,
			Size = if p4.label then TypesUDim2.new(1, 0, 0, 44) else TypesUDim2.fromOffset(0, 44),
			AutomaticSize = if p4.label then TypesEnum.AutomaticSize.None else TypesEnum.AutomaticSize.X,
			table.unpack(Labels)
		})
		local Stepper = p1.styled(Host.Frame(PropsResult), "stepper")
		p1.skin(Stepper, "stepperPlate")
		p3.valueAttributes(Stepper, p4.value, InputValueModuleResult, Value)
		
		if p4.label ~= nil then
			p3.attributes(Stepper, {
				AccessibleLabel = function(p5)
					-- upvalues: ReadFunction (upval), p4 (copy)
					return ReadFunction(p4.label, p5) or ""
				end
			})
		end
		p3.adjustment(Stepper, p4, adjust, nil, InputValueModuleResult.min, InputValueModuleResult.max)
		
		return Stepper
	end)
end