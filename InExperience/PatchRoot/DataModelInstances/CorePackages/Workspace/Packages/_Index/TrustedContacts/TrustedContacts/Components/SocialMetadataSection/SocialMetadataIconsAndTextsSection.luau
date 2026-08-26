local parent = script:FindFirstAncestor("TrustedContacts").Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local text = foundationModule.Text
local view = foundationModule.View
local useTokens = foundationModule.Hooks.useTokens
local icon = foundationModule.Icon
local iconSize = foundationModule.Enums.IconSize
local iconVariant = require(parent.BuilderIcons).IconVariant
local useDesignTokens = require(parent.Style).useDesignTokens
local useProfileInsightsToIconsAndTextsModule = require(script.Parent.useProfileInsightsToIconsAndTexts)

return function(p1)
	-- upvalues: useProfileInsightsToIconsAndTextsModule (ref), useDesignTokens (ref), useTokens (ref), reactModule (ref), view (ref), icon (ref), iconSize (ref), iconVariant (ref), text (ref)
	local var1 = useProfileInsightsToIconsAndTextsModule(p1.profileInsightIconItems)
	local var2 = reactModule.useCallback(function(p2, p3)
		-- upvalues: reactModule (copy), view (copy), icon (copy), iconSize (copy), iconVariant (copy), text (copy)
		return reactModule.createElement(view, {
			tag = "auto-xy size-0 row align-y-center gap-xsmall padding-x-xsmall",
			LayoutOrder = p3
		}, {
			Icon = reactModule.createElement(icon, {
				LayoutOrder = 1,
				name = p2.icon,
				size = iconSize.XSmall,
				variant = iconVariant.Filled
			}),
			Text = reactModule.createElement(text, {
				tag = "auto-xy size-0 text-align-x-left text-truncate-end text-body-medium",
				LayoutOrder = 2,
				Text = p2.text
			})
		})
	end, { useDesignTokens(), useTokens() })
	local t = {}
	
	for i, v in pairs(var1) do
		table.insert(t, var2(v, i))
	end
	return reactModule.useMemo(function()
		-- upvalues: reactModule (copy), view (copy), p1 (ref), t (ref)
		return reactModule.createElement(view, {
			tag = {
				["row auto-y size-full-0 wrap align-x-left"] = true,
				["gap-xsmall"] = p1.isVerticallyConstrained,
				["gap-small"] = not p1.isVerticallyConstrained
			},
			LayoutOrder = p1.layoutOrder
		}, t)
	end, { p1.profileInsightIconItems, t })
end