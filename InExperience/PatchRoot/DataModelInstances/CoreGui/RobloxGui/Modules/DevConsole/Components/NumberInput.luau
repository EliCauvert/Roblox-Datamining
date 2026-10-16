local ConstantsModule = require(script.Parent.Parent.Constants)
local RoactModule = require(game:GetService("CorePackages").Packages.Roact)
local NumberInput = RoactModule.Component:extend("NumberInput")

function NumberInput.init(p1) --[[ Line: 18 ]]
	p1.state = { Value = p1.props.DefaultValue }
end

function NumberInput.render(p1) --[[ Line: 26 ]]
	-- upvalues: RoactModule (copy), ConstantsModule (copy)
	local Props = p1.props
	
	return RoactModule.createElement("TextBox", {
		Font = ConstantsModule.Font.Log,
		Text = `{p1.state.Value}`,
		TextColor3 = ConstantsModule.Color.Text,
		TextSize = ConstantsModule.GeneralFormatting.NumberInputTextSize,
		TextXAlignment = Props.TextXAlignment or Enum.TextXAlignment.Center,
		BackgroundColor3 = ConstantsModule.Color.TextBoxGray,
		BorderColor3 = ConstantsModule.GeneralFormatting.LineColor,
		LayoutOrder = Props.LayoutOrder,
		Size = Props.Size,
		ClearTextOnFocus = true,
		[RoactModule.Event.FocusLost] = function(p2) --[[ Line: 43 ]]
			-- upvalues: p1 (copy), Props (copy)
			local Number: number? = tonumber(p2.Text)
			
			if Number == nil or Number ~= Number then
				p2.Text = `{p1.state.Value}`
				
				return
			end
			if Props.IntegerOnly then
				Number = math.floor(Number)
			end
			local ClampedValue = math.clamp(Number, Props.Range.Min, Props.Range.Max)
			p1:setState({ Value = ClampedValue })
			p2.Text = `{ClampedValue}`
			
			if Props.OnNumberInputChanged then
				Props.OnNumberInputChanged(ClampedValue)
			end
		end
	})
end

return NumberInput