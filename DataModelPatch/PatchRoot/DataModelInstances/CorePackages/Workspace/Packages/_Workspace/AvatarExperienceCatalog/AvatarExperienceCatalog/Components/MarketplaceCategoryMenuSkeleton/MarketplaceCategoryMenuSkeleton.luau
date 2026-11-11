local Parent = script:FindFirstAncestor("AvatarExperienceCatalog").Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local View = FoundationModule.View
local Skeleton = FoundationModule.Skeleton
local Radius = FoundationModule.Enums.Radius
local UseTokensFunction = FoundationModule.Hooks.useTokens

return ReactModule.memo(function(p1)
	-- upvalues: UseTokensFunction (copy), ReactModule (copy), Skeleton (copy), Radius (copy), View (copy)
	local UseTokensResult = UseTokensFunction()
	local ChipHeight = p1.chipHeight or UseTokensResult.Size.Size_800
	local ChipWidth = p1.chipWidth or UseTokensResult.Size.Size_2800
	local Elements = {}
	
	for i = 1, p1.numCategoryChips or 6 do
		Elements[`Chip-{i}`] = ReactModule.createElement(Skeleton, {
			radius = Radius.Circle,
			Size = UDim2.fromOffset(ChipWidth, ChipHeight),
			LayoutOrder = i
		})
	end
	return ReactModule.createElement(View, {
		tag = "row gap-small size-full-0 auto-y",
		LayoutOrder = p1.layoutOrder,
		testId = p1.testId or "--marketplace-category-menu-skeleton"
	}, Elements)
end)