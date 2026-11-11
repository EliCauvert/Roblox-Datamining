local Parent = script.Parent.Parent.Parent
local Parent1 = Parent.Parent
local ReactModule = require(Parent1.React)
local FoundationModule = require(Parent1.Foundation)
local View = FoundationModule.View
local UseTokensFunction = FoundationModule.Hooks.useTokens
local UsePreferencesFunction = FoundationModule.Hooks.usePreferences
local ConstantsModule = require(Parent.Common.Constants)

return ReactModule.memo(function(p1)
	-- upvalues: UseTokensFunction (copy), UsePreferencesFunction (copy), ConstantsModule (copy), ReactModule (copy), View (copy), FoundationModule (copy)
	local UseTokensResult = UseTokensFunction()
	local UsePreferencesResult = UsePreferencesFunction()
	local config = {
		RowContent = ReactModule.createElement(View, {
			tag = `size-full {p1.flexTag or ConstantsModule.ROW_FLEX_TAG}`
		}, p1.children)
	}
	
	if p1.isHighlighted then
		local OverMedia100 = UseTokensResult.Color.OverMedia.OverMedia_100
		config.Highlight = ReactModule.createElement(View, {
			ZIndex = 0,
			backgroundStyle = {
				Color3 = OverMedia100.Color3,
				Transparency = OverMedia100.Transparency * UsePreferencesResult.preferredTransparency
			},
			Size = UDim2.fromScale(1, 1)
		})
	end
	if p1.showDivider then
		config.Divider = ReactModule.createElement(FoundationModule.Divider, {
			AnchorPoint = Vector2.new(0, 1),
			Position = UDim2.fromScale(0, 1)
		})
	end
	return ReactModule.createElement(View, {
		Size = UDim2.new(1, 0, 0, p1.rowHeight),
		LayoutOrder = p1.layoutOrder,
		onActivated = p1.onActivated,
		ref = p1.rowRef
	}, config)
end)