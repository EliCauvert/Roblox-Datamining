local parent = script.Parent.Parent.Parent
local parent_1 = parent.Parent
local reactModule = require(parent_1.React)
local foundationModule = require(parent_1.Foundation)
local view = foundationModule.View
local useTokens = foundationModule.Hooks.useTokens
local constantsModule = require(parent.Common.Constants)
local usePreferredBackgroundStyleModule = require(parent.Hooks.usePreferredBackgroundStyle)

return reactModule.memo(function(p0)
	-- upvalues: useTokens (ref), usePreferredBackgroundStyleModule (ref), constantsModule (ref), reactModule (ref), view (ref), foundationModule (ref)
	local var4 = usePreferredBackgroundStyleModule(useTokens().Color.OverMedia.OverMedia_100)
	local t = {
		RowContent = reactModule.createElement(view, {
			tag = `size-full {p0.flexTag or constantsModule.ROW_FLEX_TAG}`
		}, p0.children)
	}
	
	if p0.isHighlighted then
		t.Highlight = reactModule.createElement(view, { tag = "size-full", ZIndex = 0, backgroundStyle = var4 })
	end
	if p0.showDivider then
		t.Divider = reactModule.createElement(foundationModule.Divider, {
			AnchorPoint = Vector2.new(0, 1),
			Position = UDim2.fromScale(0, 1)
		})
	end
	local selection = p0.selection
	
	if selection == nil then
		selection = if p0.onActivated then constantsModule.SELECTABLE else constantsModule.NOT_SELECTABLE
	end
	return reactModule.createElement(view, {
		testId = "leaderboard-row-shell",
		Size = UDim2.new(1, 0, 0, p0.rowHeight),
		LayoutOrder = p0.layoutOrder,
		onActivated = p0.onActivated,
		ref = p0.rowRef,
		selection = selection
	}, t)
end)