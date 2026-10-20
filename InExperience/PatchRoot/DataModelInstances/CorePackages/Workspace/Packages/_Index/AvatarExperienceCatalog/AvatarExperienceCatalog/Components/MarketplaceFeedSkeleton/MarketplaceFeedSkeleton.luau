local Parent = script:FindFirstAncestor("AvatarExperienceCatalog").Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local View = FoundationModule.View
local Skeleton = FoundationModule.Skeleton
local Radius = FoundationModule.Enums.Radius
local UseTokensFunction = FoundationModule.Hooks.useTokens
local CompositionTags = require(Parent.AppComposition).CompositionTags

return ReactModule.memo(function(p1)
	-- upvalues: UseTokensFunction (copy), ReactModule (copy), View (copy), Skeleton (copy), Radius (copy), CompositionTags (copy)
	local UseTokensResult = UseTokensFunction()
	local RowHeight = p1.rowHeight or UseTokensResult.Size.Size_3000 * 2
	local HeaderHeight = p1.headerHeight or UseTokensResult.Size.Size_400
	local HeaderWidthFraction = p1.headerWidthFraction or 0.4
	local Elements = {}
	
	for i = 1, p1.numCarousels or 4 do
		Elements[`Carousel-{i}`] = ReactModule.createElement(View, {
			tag = "col gap-medium size-full-0 auto-y",
			LayoutOrder = i
		}, {
			Header = ReactModule.createElement(Skeleton, {
				LayoutOrder = 1,
				Size = UDim2.new(HeaderWidthFraction, 0, 0, HeaderHeight),
				radius = Radius.Medium
			}),
			Row = ReactModule.createElement(Skeleton, {
				LayoutOrder = 2,
				Size = UDim2.new(1, 0, 0, RowHeight),
				radius = Radius.Medium
			})
		})
	end
	return ReactModule.createElement(View, {
		tag = {
			["col gap-xlarge size-full auto-y padding-y-small"] = true,
			[CompositionTags.ContentRegion.Body] = true
		},
		LayoutOrder = p1.layoutOrder,
		testId = p1.testId or "--marketplace-feed-skeleton"
	}, Elements)
end)