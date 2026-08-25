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

return function(p0)
	-- upvalues: useProfileInsightsToIconsAndTextsModule (ref), useDesignTokens (ref), useTokens (ref), reactModule (ref), view (ref), icon (ref), iconSize (ref), iconVariant (ref), text (ref)
	local var3 = useProfileInsightsToIconsAndTextsModule(p0.profileInsightIconItems)
	local var4 = reactModule.useCallback(function(p1, p2)
		-- upvalues: reactModule (copy), view (copy), icon (copy), iconSize (copy), iconVariant (copy), text (copy)
		return reactModule.createElement(view, {
			tag = "auto-xy size-0 row align-y-center gap-xsmall padding-x-xsmall",
			LayoutOrder = p2
		}, {
			Icon = reactModule.createElement(icon, {
				LayoutOrder = 1,
				name = p1.icon,
				size = iconSize.XSmall,
				variant = iconVariant.Filled
			}),
			Text = reactModule.createElement(text, {
				tag = "auto-xy size-0 text-align-x-left text-truncate-end text-body-medium",
				LayoutOrder = 2,
				Text = p1.text
			})
		})
	end, { useDesignTokens(), useTokens() })
	local t = {}
	
	for i, v in pairs(var3) do
		table.insert(t, var4(v, i))
	end
	return reactModule.useMemo(function()
		-- upvalues: reactModule (copy), view (copy), p0 (ref), t (ref)
		return reactModule.createElement(view, {
			tag = {
				["row auto-y size-full-0 wrap align-x-left"] = true,
				["gap-xsmall"] = p0.isVerticallyConstrained,
				["gap-small"] = not p0.isVerticallyConstrained
			},
			LayoutOrder = p0.layoutOrder
		}, t)
	end, { p0.profileInsightIconItems, t })
end