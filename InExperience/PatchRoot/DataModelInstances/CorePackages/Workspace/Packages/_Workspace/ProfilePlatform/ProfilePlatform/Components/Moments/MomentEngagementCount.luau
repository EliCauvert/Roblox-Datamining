local Parent = script:FindFirstAncestor("ProfilePlatform").Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local UseAbbreviatedNumberLocalizationFunction = require(Parent.Localization).Hooks.useAbbreviatedNumberLocalization
local View = FoundationModule.View
local Text = FoundationModule.Text
local Icon = FoundationModule.Icon
local IconSize = FoundationModule.Enums.IconSize
local IconVariant = FoundationModule.Enums.IconVariant
local UseTokensFunction = FoundationModule.Hooks.useTokens

return function(p1)
	-- upvalues: UseAbbreviatedNumberLocalizationFunction (copy), UseTokensFunction (copy), ReactModule (copy), View (copy), Icon (copy), IconSize (copy), IconVariant (copy), Text (copy)
	local UseAbbreviatedNumberLocalizationResult = UseAbbreviatedNumberLocalizationFunction(p1.count or 0)
	local UseTokensResult = UseTokensFunction()
	local IsOnMedia = p1.onMedia == true
	local White100 = if IsOnMedia then UseTokensResult.Color.Extended.White.White_100 else nil
	
	return ReactModule.createElement(View, {
		tag = "row align-x-left align-y-center gap-xxsmall auto-xy",
		LayoutOrder = p1.layoutOrder
	}, {
		Glyph = ReactModule.createElement(Icon, {
			LayoutOrder = 1,
			name = p1.icon,
			size = IconSize.XSmall,
			variant = if IsOnMedia then IconVariant.Filled else nil,
			style = White100
		}),
		Count = ReactModule.createElement(Text, {
			LayoutOrder = 2,
			tag = {
				["auto-xy text-body-small"] = true,
				["content-default"] = not IsOnMedia
			},
			textStyle = White100,
			Text = UseAbbreviatedNumberLocalizationResult or ""
		})
	})
end