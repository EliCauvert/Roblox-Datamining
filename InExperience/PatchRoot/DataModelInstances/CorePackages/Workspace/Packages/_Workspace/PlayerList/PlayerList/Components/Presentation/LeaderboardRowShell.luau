local Parent = script.Parent.Parent.Parent
local Parent1 = Parent.Parent
local ReactModule = require(Parent1.React)
local FoundationModule = require(Parent1.Foundation)
local View = FoundationModule.View
local UseTokensFunction = FoundationModule.Hooks.useTokens
local ConstantsModule = require(Parent.Common.Constants)
local UsePreferredBackgroundStyleModule = require(Parent.Hooks.usePreferredBackgroundStyle)

return ReactModule.memo(function(p1) --[[ Line: 26 | Named "LeaderboardRowShell" ]]
	-- upvalues: UseTokensFunction (copy), UsePreferredBackgroundStyleModule (copy), ConstantsModule (copy), ReactModule (copy), View (copy), FoundationModule (copy)
	local UsePreferredBackgroundStyleModuleResult = UsePreferredBackgroundStyleModule(UseTokensFunction().Color.OverMedia.OverMedia_100)
	local config = {
		RowContent = ReactModule.createElement(View, {
			tag = `size-full {p1.flexTag or ConstantsModule.ROW_FLEX_TAG}`
		}, p1.children)
	}
	
	if p1.isHighlighted then
		config.Highlight = ReactModule.createElement(View, {
			tag = "size-full",
			ZIndex = 0,
			backgroundStyle = UsePreferredBackgroundStyleModuleResult
		})
	end
	if p1.showDivider then
		config.Divider = ReactModule.createElement(FoundationModule.Divider, {
			AnchorPoint = Vector2.new(0, 1),
			Position = UDim2.fromScale(0, 1)
		})
	end
	local Selection = p1.selection
	
	if Selection == nil then
		Selection = if p1.onActivated then ConstantsModule.SELECTABLE else ConstantsModule.NOT_SELECTABLE
	end
	return ReactModule.createElement(View, {
		testId = "leaderboard-row-shell",
		Size = UDim2.new(1, 0, 0, p1.rowHeight),
		LayoutOrder = p1.layoutOrder,
		onActivated = p1.onActivated,
		ref = p1.rowRef,
		selection = Selection
	}, config)
end)