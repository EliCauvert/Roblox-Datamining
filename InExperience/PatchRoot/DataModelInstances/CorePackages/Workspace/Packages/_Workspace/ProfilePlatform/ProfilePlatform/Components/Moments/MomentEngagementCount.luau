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

return function(p0) --[[ line: 23 | named "MomentEngagementCount" ]]
	-- upvalues: useAbbreviatedNumberLocalization (ref), useTokens (ref), reactModule (ref), view (ref), icon (ref), iconSize (ref), iconVariant (ref), text (ref)
	local var2 = useAbbreviatedNumberLocalization(p0.count or 0)
	local var3 = p0.onMedia == true
	local var4 = if var3 then useTokens().Color.Extended.White.White_100 else nil
	
	return reactModule.createElement(view, {
		tag = "row align-x-left align-y-center gap-xxsmall auto-xy",
		LayoutOrder = p0.layoutOrder
	}, {
		Glyph = reactModule.createElement(icon, {
			LayoutOrder = 1,
			name = p0.icon,
			size = iconSize.XSmall,
			variant = if var3 then iconVariant.Filled else nil,
			style = var4
		}),
		Count = reactModule.createElement(text, {
			LayoutOrder = 2,
			tag = {
				["auto-xy text-body-small"] = true,
				["content-default"] = not var3
			},
			textStyle = var4,
			Text = var2 or ""
		})
	})
end