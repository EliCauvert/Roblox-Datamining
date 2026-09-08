local parent = script:FindFirstAncestor("AvatarExperienceCatalog").Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local view = foundationModule.View
local skeleton = foundationModule.Skeleton
local radius = foundationModule.Enums.Radius
local useTokens = foundationModule.Hooks.useTokens

return reactModule.memo(function(p1)
	-- upvalues: useTokens (ref), reactModule (ref), skeleton (ref), radius (ref), view (ref)
	local var1 = useTokens()
	local numCategoryChips = p1.numCategoryChips or 6
	local chipHeight = p1.chipHeight or var1.Size.Size_800
	local chipWidth = p1.chipWidth or var1.Size.Size_2800
	local t = {}
	
	for i = 1, numCategoryChips do
		t[`Chip-{i}`] = reactModule.createElement(skeleton, {
			radius = radius.Circle,
			Size = UDim2.fromOffset(chipWidth, chipHeight),
			LayoutOrder = i
		})
	end
	return reactModule.createElement(view, {
		tag = "row gap-small size-full-0 auto-y",
		LayoutOrder = p1.layoutOrder,
		testId = p1.testId or "--marketplace-category-menu-skeleton"
	}, t)
end)