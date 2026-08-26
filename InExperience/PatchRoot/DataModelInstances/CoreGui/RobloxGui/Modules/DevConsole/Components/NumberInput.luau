local constantsModule = require(script.Parent.Parent.Constants)
local roactModule = require(game:GetService("CorePackages").Packages.Roact)
local numberInput = roactModule.Component:extend("NumberInput")

function numberInput.init(p1)
	p1.state = { Value = p1.props.DefaultValue }
end

function numberInput.render(p1)
	-- upvalues: roactModule (ref), constantsModule (ref)
	local props = p1.props
	
	return roactModule.createElement("TextBox", {
		Font = constantsModule.Font.Log,
		Text = `{p1.state.Value}`,
		TextColor3 = constantsModule.Color.Text,
		TextSize = constantsModule.GeneralFormatting.NumberInputTextSize,
		TextXAlignment = props.TextXAlignment or Enum.TextXAlignment.Center,
		BackgroundColor3 = constantsModule.Color.TextBoxGray,
		BorderColor3 = constantsModule.GeneralFormatting.LineColor,
		LayoutOrder = props.LayoutOrder,
		Size = props.Size,
		ClearTextOnFocus = true,
		[roactModule.Event.FocusLost] = function(p2)
			-- upvalues: p1 (ref), props (ref)
			local var1 = tonumber(p2.Text)
			
			if var1 == nil or var1 ~= var1 then
				p2.Text = `{p1.state.Value}`
				
				return
			elseif props.IntegerOnly then
				var1 = math.floor(var1)
			end
			local clampedValue = math.clamp(var1, props.Range.Min, props.Range.Max)
			p1:setState({ Value = clampedValue })
			p2.Text = `{clampedValue}`
			
			if props.OnNumberInputChanged then
				props.OnNumberInputChanged(clampedValue)
			end
		end
	})
end

return numberInput