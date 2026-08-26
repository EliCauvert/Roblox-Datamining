local parent = script:FindFirstAncestor("ProfilePlatform").Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local useAbbreviatedNumberLocalization = require(parent.Localization).Hooks.useAbbreviatedNumberLocalization
local view = foundationModule.View
local text = foundationModule.Text
local icon = foundationModule.Icon
local iconSize = foundationModule.Enums.IconSize
local iconVariant = foundationModule.Enums.IconVariant
local useTokens = foundationModule.Hooks.useTokens

return function(p1)
	-- upvalues: useAbbreviatedNumberLocalization (ref), useTokens (ref), reactModule (ref), view (ref), icon (ref), iconSize (ref), iconVariant (ref), text (ref)
	local var1 = useAbbreviatedNumberLocalization(p1.count or 0)
	local var2 = p1.onMedia == true
	local var3 = if var2 then useTokens().Color.Extended.White.White_100 else nil
	
	return reactModule.createElement(view, {
		tag = "row align-x-left align-y-center gap-xxsmall auto-xy",
		LayoutOrder = p1.layoutOrder
	}, {
		Glyph = reactModule.createElement(icon, {
			LayoutOrder = 1,
			name = p1.icon,
			size = iconSize.XSmall,
			variant = if var2 then iconVariant.Filled else nil,
			style = var3
		}),
		Count = reactModule.createElement(text, {
			LayoutOrder = 2,
			tag = {
				["auto-xy text-body-small"] = true,
				["content-default"] = not var2
			},
			textStyle = var3,
			Text = var1 or ""
		})
	})
end