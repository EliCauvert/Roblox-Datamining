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
local UseLocalizationFunction = require(Parent1.Localization).Hooks.useLocalization

return function(p1) --[[ Line: 26 ]]
	-- upvalues: UseTokensFunction (copy), UseLocalizationFunction (copy), ReactModule (copy), View (copy), Text (copy), ConstantsModule (copy), Icon (copy)
	local UseTokensResult = UseTokensFunction()
	local TOUCHENUMTOICONEntry = ConstantsModule.HELP_PAGE.TOUCH_ENUM_TO_ICON[p1.touchInput]
	local Element = TOUCHENUMTOICONEntry and ReactModule.createElement(Icon, {
		name = TOUCHENUMTOICONEntry,
		size = UseTokensResult.Size.Size_1200
	})
	
	return ReactModule.createElement(View, {
		tag = "align-x-center auto-xy col gap-small",
		LayoutOrder = p1.layoutOrder
	}, {
		actionComponent = ReactModule.createElement(View, {
			tag = "auto-xy padding-x-large padding-y-xsmall radius-large",
			LayoutOrder = 1,
			backgroundStyle = UseTokensResult.Color.Extended.Gray.Gray_600
		}, {
			InnerAction = ReactModule.createElement(Text, {
				tag = "auto-xy text-align-x-center text-title-small",
				textStyle = UseTokensResult.Color.Extended.White.White_100,
				Text = UseLocalizationFunction({ action = p1.action }).action
			})
		}),
		iconComponent = TOUCHENUMTOICONEntry and ReactModule.createElement(View, { tag = "auto-xy", LayoutOrder = 2 }, { InnerIcon = Element }) or nil
	})
end