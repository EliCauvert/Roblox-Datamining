local parent = script:FindFirstAncestor("AvatarExperienceCatalog").Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local view = foundationModule.View
local skeleton = foundationModule.Skeleton
local radius = foundationModule.Enums.Radius
local useTokens = foundationModule.Hooks.useTokens
local compositionTags = require(parent.AppComposition).CompositionTags

return reactModule.memo(function(p1)
	-- upvalues: useTokens (ref), reactModule (ref), view (ref), skeleton (ref), radius (ref), compositionTags (ref)
	local var1 = useTokens()
	local numCarousels = p1.numCarousels or 4
	local rowHeight = p1.rowHeight or var1.Size.Size_3000 * 2
	local headerHeight = p1.headerHeight or var1.Size.Size_400
	local headerWidthFraction = p1.headerWidthFraction or 0.4
	local t = {}
	
	for i = 1, numCarousels do
		t[`Carousel-{i}`] = reactModule.createElement(view, {
			tag = "col gap-medium size-full-0 auto-y",
			LayoutOrder = i
		}, {
			Header = reactModule.createElement(skeleton, {
				LayoutOrder = 1,
				Size = UDim2.new(headerWidthFraction, 0, 0, headerHeight),
				radius = radius.Medium
			}),
			Row = reactModule.createElement(skeleton, {
				LayoutOrder = 2,
				Size = UDim2.new(1, 0, 0, rowHeight),
				radius = radius.Medium
			})
		})
	end
	return reactModule.createElement(view, {
		tag = {
			["col gap-xlarge size-full auto-y padding-y-small"] = true,
			[compositionTags.ContentRegion.Body] = true
		},
		LayoutOrder = p1.layoutOrder,
		testId = p1.testId or "--marketplace-feed-skeleton"
	}, t)
end)