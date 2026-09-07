local parent = script.Parent.Parent.Parent
local parent_1 = parent.Parent
local reactModule = require(parent_1.React)
local foundationModule = require(parent_1.Foundation)
local view = foundationModule.View
local useTokens = foundationModule.Hooks.useTokens
local constantsModule = require(parent.Common.Constants)
local usePreferredBackgroundStyleModule = require(parent.Hooks.usePreferredBackgroundStyle)

return reactModule.memo(function(p1)
	-- upvalues: useTokens (ref), usePreferredBackgroundStyleModule (ref), constantsModule (ref), reactModule (ref), view (ref), foundationModule (ref)
	local var1 = usePreferredBackgroundStyleModule(useTokens().Color.OverMedia.OverMedia_100)
	local t = {
		RowContent = reactModule.createElement(view, {
			tag = `size-full {p1.flexTag or constantsModule.ROW_FLEX_TAG}`
		}, p1.children)
	}
	
	if p1.isHighlighted then
		t.Highlight = reactModule.createElement(view, { tag = "size-full", ZIndex = 0, backgroundStyle = var1 })
	end
	if p1.showDivider then
		t.Divider = reactModule.createElement(foundationModule.Divider, {
			AnchorPoint = Vector2.new(0, 1),
			Position = UDim2.fromScale(0, 1)
		})
	end
	return reactModule.createElement(view, {
		Size = UDim2.new(1, 0, 0, p1.rowHeight),
		LayoutOrder = p1.layoutOrder,
		onActivated = p1.onActivated,
		ref = p1.rowRef,
		selection = p1.selection
	}, t)
end)