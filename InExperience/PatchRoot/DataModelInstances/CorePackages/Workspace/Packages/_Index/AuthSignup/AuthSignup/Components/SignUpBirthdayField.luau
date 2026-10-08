local parent = script:FindFirstAncestor("AuthSignup").Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local view = foundationModule.View
local text = foundationModule.Text
local icon = foundationModule.Icon
local inputLabel = foundationModule.InputLabel
local inputLabelSize = foundationModule.Enums.InputLabelSize
local iconName = foundationModule.Enums.IconName
local iconSize = foundationModule.Enums.IconSize
local useTokens = foundationModule.Hooks.useTokens

return function(value)
	-- upvalues: useTokens (ref), reactModule (ref), view (ref), inputLabel (ref), inputLabelSize (ref), text (ref), icon (ref), iconName (ref), iconSize (ref)
	local var1 = value.text ~= nil and value.text ~= ""
	
	return reactModule.createElement(view, {
		tag = "col gap-small size-full-0 auto-y",
		LayoutOrder = value.LayoutOrder,
		ref = value.containerRef
	}, {
		Label = reactModule.createElement(inputLabel, {
			isRequired = true,
			LayoutOrder = 1,
			Text = value.label,
			size = inputLabelSize.Medium
		}),
		Field = reactModule.createElement(view, {
			LayoutOrder = 2,
			testId = "--auth-signup-birthday-field",
			tag = {
				["row align-y-center gap-small size-full-1200 padding-x-medium stroke-standard radius-medium"] = true,
				["stroke-system-emphasis"] = value.isFocused == true,
				["stroke-emphasis"] = value.isFocused ~= true
			},
			onActivated = value.onActivated,
			ref = value.buttonRef
		}, {
			Text = reactModule.createElement(text, {
				LayoutOrder = 1,
				Text = if var1 then value.text else value.placeholder,
				tag = {
					["grow auto-xy text-body-large text-align-x-left"] = true,
					["content-emphasis"] = var1,
					["content-default"] = not var1
				}
			}),
			CalendarIcon = reactModule.createElement(icon, {
				LayoutOrder = 2,
				name = iconName.Calendar,
				size = iconSize.Large,
				style = useTokens().Color.Content.Emphasis
			})
		})
	})
end