local Parent = script.Parent.Parent.Parent
local Parent1 = Parent.Parent
local ReactModule = require(Parent1.React)
local ConstantsModule = require(Parent.Constants)
local FoundationModule = require(Parent1.Foundation)
local _ = require(Parent.Enums.TouchControlsEnum)
local Text = FoundationModule.Text
local View = FoundationModule.View
local Icon = FoundationModule.Icon
local UseTokensFunction = FoundationModule.Hooks.useTokens
local UseLocalizedLabelsModule = require(Parent.Hooks.useLocalizedLabels)

return function(p1)
	-- upvalues: UseTokensFunction (copy), UseLocalizedLabelsModule (copy), ReactModule (copy), View (copy), Text (copy), ConstantsModule (copy), Icon (copy)
	local UseTokensResult = UseTokensFunction()
	local TOUCHENUMTOICONEntry = ConstantsModule.HELP_PAGE.TOUCH_ENUM_TO_ICON[p1.touchInput]
	local Element = TOUCHENUMTOICONEntry and ReactModule.createElement(Icon, {
		name = TOUCHENUMTOICONEntry,
		size = UseTokensResult.Size.Size_1200
	})
	
	return ReactModule.createElement(View, {
		tag = "col align-x-center gap-small auto-xy",
		LayoutOrder = p1.layoutOrder
	}, {
		actionComponent = ReactModule.createElement(View, {
			tag = "auto-xy padding-x-large padding-y-xsmall radius-large",
			LayoutOrder = 1,
			backgroundStyle = UseTokensResult.Color.Extended.Gray.Gray_600
		}, {
			InnerAction = ReactModule.createElement(Text, {
				tag = "auto-xy text-title-small text-align-x-center",
				textStyle = UseTokensResult.Color.Extended.White.White_100,
				Text = UseLocalizedLabelsModule({ action = p1.action }).action
			})
		}),
		iconComponent = TOUCHENUMTOICONEntry and ReactModule.createElement(View, { tag = "auto-xy", LayoutOrder = 2 }, { InnerIcon = Element }) or nil
	})
end