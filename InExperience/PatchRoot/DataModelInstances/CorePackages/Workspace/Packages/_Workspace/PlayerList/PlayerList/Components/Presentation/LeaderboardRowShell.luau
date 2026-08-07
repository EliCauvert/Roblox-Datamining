local parent = script.Parent.Parent.Parent
local parent_1 = parent.Parent
local reactModule = require(parent_1.React)
local foundationModule = require(parent_1.Foundation)
local view = foundationModule.View
local useTokens = foundationModule.Hooks.useTokens
local usePreferences = foundationModule.Hooks.usePreferences
local constantsModule = require(parent.Common.Constants)

return reactModule.memo(function(p0) --[[ line: 25 | named "LeaderboardRowShell" ]]
	-- upvalues: useTokens (ref), usePreferences (ref), constantsModule (ref), reactModule (ref), view (ref), foundationModule (ref)
	local var3 = useTokens()
	local var4 = usePreferences()
	local t = {
		RowContent = reactModule.createElement(view, {
			tag = `size-full {p0.flexTag or constantsModule.ROW_FLEX_TAG}`
		}, p0.children)
	}
	
	if p0.isHighlighted then
		local overMedia100 = var3.Color.OverMedia.OverMedia_100
		t.Highlight = reactModule.createElement(view, {
			ZIndex = 0,
			backgroundStyle = {
				Color3 = overMedia100.Color3,
				Transparency = overMedia100.Transparency * var4.preferredTransparency
			},
			Size = UDim2.fromScale(1, 1)
		})
	end
	if p0.showDivider then
		t.Divider = reactModule.createElement(foundationModule.Divider, {
			AnchorPoint = Vector2.new(0, 1),
			Position = UDim2.fromScale(0, 1)
		})
	end
	return reactModule.createElement(view, {
		Size = UDim2.new(1, 0, 0, p0.rowHeight),
		LayoutOrder = p0.layoutOrder,
		onActivated = p0.onActivated,
		ref = p0.rowRef
	}, t)
end)