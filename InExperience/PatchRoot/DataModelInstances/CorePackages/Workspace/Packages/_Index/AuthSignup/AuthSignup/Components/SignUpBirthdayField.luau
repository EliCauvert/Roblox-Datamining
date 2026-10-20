local Parent = script:FindFirstAncestor("AuthSignup").Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local FormatBoldRichTextFunction = require(Parent.AuthCommon).Utils.formatBoldRichText
local View = FoundationModule.View
local Text = FoundationModule.Text
local Icon = FoundationModule.Icon
local InputLabel = FoundationModule.InputLabel
local InputLabelSize = FoundationModule.Enums.InputLabelSize
local IconName = FoundationModule.Enums.IconName
local IconSize = FoundationModule.Enums.IconSize
local UseTokensFunction = FoundationModule.Hooks.useTokens

return function(Frame)
	-- upvalues: UseTokensFunction (copy), ReactModule (copy), View (copy), InputLabel (copy), FormatBoldRichTextFunction (copy), InputLabelSize (copy), Text (copy), Icon (copy), IconName (copy), IconSize (copy)
	local IsNotTextMatch: boolean = Frame.text ~= nil and Frame.text ~= ""
	
	return ReactModule.createElement(View, {
		tag = "col gap-small size-full-0 auto-y",
		LayoutOrder = Frame.LayoutOrder,
		ref = Frame.containerRef
	}, {
		Label = ReactModule.createElement(InputLabel, {
			isRequired = true,
			LayoutOrder = 1,
			Text = if Frame.isLabelBold then FormatBoldRichTextFunction(Frame.label) else Frame.label,
			RichText = Frame.isLabelBold,
			size = InputLabelSize.Medium
		}),
		Field = ReactModule.createElement(View, {
			LayoutOrder = 2,
			testId = "--auth-signup-birthday-field",
			tag = {
				["row align-y-center gap-small size-full-1200 padding-x-medium stroke-standard radius-medium"] = true,
				["stroke-system-emphasis"] = Frame.isFocused == true,
				["stroke-emphasis"] = Frame.isFocused ~= true
			},
			onActivated = Frame.onActivated,
			ref = Frame.buttonRef
		}, {
			Text = ReactModule.createElement(Text, {
				LayoutOrder = 1,
				Text = if IsNotTextMatch then Frame.text else Frame.placeholder,
				tag = {
					["grow auto-xy text-body-large text-align-x-left"] = true,
					["content-emphasis"] = IsNotTextMatch,
					["content-default"] = not IsNotTextMatch
				}
			}),
			CalendarIcon = ReactModule.createElement(Icon, {
				LayoutOrder = 2,
				name = IconName.Calendar,
				size = IconSize.Large,
				style = UseTokensFunction().Color.Content.Emphasis
			})
		})
	})
end