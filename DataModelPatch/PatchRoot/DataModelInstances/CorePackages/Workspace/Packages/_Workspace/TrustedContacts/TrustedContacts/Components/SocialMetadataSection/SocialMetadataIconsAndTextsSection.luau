local Parent = script:FindFirstAncestor("TrustedContacts").Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local Text = FoundationModule.Text
local View = FoundationModule.View
local UseTokensFunction = FoundationModule.Hooks.useTokens
local Icon = FoundationModule.Icon
local IconSize = FoundationModule.Enums.IconSize
local IconVariant = require(Parent.BuilderIcons).IconVariant
local UseDesignTokensFunction = require(Parent.Style).useDesignTokens
local UseProfileInsightsToIconsAndTextsModule = require(script.Parent.useProfileInsightsToIconsAndTexts)

return function(p1)
	-- upvalues: UseProfileInsightsToIconsAndTextsModule (copy), UseDesignTokensFunction (copy), UseTokensFunction (copy), ReactModule (copy), View (copy), Icon (copy), IconSize (copy), IconVariant (copy), Text (copy)
	local UseProfileInsightsToIconsAndTextsModuleResult = UseProfileInsightsToIconsAndTextsModule(p1.profileInsightIconItems)
	local UseResult = ReactModule.useCallback(function(p2, LayoutOrder)
		-- upvalues: ReactModule (upval), View (upval), Icon (upval), IconSize (upval), IconVariant (upval), Text (upval)
		return ReactModule.createElement(View, {
			tag = "auto-xy size-0 row align-y-center gap-xsmall padding-x-xsmall",
			LayoutOrder = LayoutOrder
		}, {
			Icon = ReactModule.createElement(Icon, {
				LayoutOrder = 1,
				name = p2.icon,
				size = IconSize.XSmall,
				variant = IconVariant.Filled
			}),
			Text = ReactModule.createElement(Text, {
				tag = "auto-xy size-0 text-align-x-left text-truncate-end text-body-medium",
				LayoutOrder = 2,
				Text = p2.text
			})
		})
	end, { UseDesignTokensFunction(), (UseTokensFunction()) })
	local List = {}
	
	for i, value in pairs(UseProfileInsightsToIconsAndTextsModuleResult) do
		table.insert(List, (UseResult(value, i)))
	end
	return ReactModule.useMemo(function()
		-- upvalues: ReactModule (upval), View (upval), p1 (copy), List (copy)
		return ReactModule.createElement(View, {
			tag = {
				["row auto-y size-full-0 wrap align-x-left"] = true,
				["gap-xsmall"] = p1.isVerticallyConstrained,
				["gap-small"] = not p1.isVerticallyConstrained
			},
			LayoutOrder = p1.layoutOrder
		}, List)
	end, { p1.profileInsightIconItems, List })
end