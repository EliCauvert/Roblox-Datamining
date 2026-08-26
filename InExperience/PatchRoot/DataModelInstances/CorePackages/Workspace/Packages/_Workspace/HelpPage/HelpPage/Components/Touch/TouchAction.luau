local parent = script.Parent.Parent.Parent
local parent_1 = parent.Parent
local reactModule = require(parent_1.React)
local constantsModule = require(parent.Constants)
local foundationModule = require(parent_1.Foundation)
local localizationModule = require(parent_1.Localization)
local _ = require(parent.Enums.TouchControlsEnum)
local text = foundationModule.Text
local view = foundationModule.View
local icon = foundationModule.Icon
local useTokens = foundationModule.Hooks.useTokens
local useLocalization = localizationModule.Hooks.useLocalization

return function(p1)
	-- upvalues: useTokens (ref), useLocalization (ref), reactModule (ref), view (ref), text (ref), constantsModule (ref), icon (ref)
	local var1 = useTokens()
	local touchInput = constantsModule.HELP_PAGE.TOUCH_ENUM_TO_ICON[p1.touchInput]
	
	return reactModule.createElement(view, {
		tag = "align-x-center auto-xy col gap-small",
		LayoutOrder = p1.layoutOrder
	}, {
		actionComponent = reactModule.createElement(view, {
			tag = "auto-xy padding-x-large padding-y-xsmall radius-large",
			LayoutOrder = 1,
			backgroundStyle = var1.Color.Extended.Gray.Gray_600
		}, {
			InnerAction = reactModule.createElement(text, {
				tag = "auto-xy text-align-x-center text-title-small",
				textStyle = var1.Color.Extended.White.White_100,
				Text = useLocalization({ action = p1.action }).action
			})
		}),
		iconComponent = touchInput and reactModule.createElement(view, { tag = "auto-xy", LayoutOrder = 2 }, {
			InnerIcon = touchInput and reactModule.createElement(icon, { name = touchInput, size = var1.Size.Size_1200 })
		}) or nil
	})
end