local Parent = script:FindFirstAncestor("Groups").Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local Radius = FoundationModule.Enums.Radius

local function SkeletonRow(p1)
	-- upvalues: FoundationModule (copy), ReactModule (copy), Radius (copy)
	local UseTokensResult = FoundationModule.Hooks.useTokens()
	
	return ReactModule.createElement(FoundationModule.View, {
		tag = "row align-y-center gap-medium size-full-1200 padding-x-small padding-y-xsmall",
		LayoutOrder = p1.layoutOrder
	}, {
		Leading = ReactModule.createElement(FoundationModule.View, {
			tag = "col align-x-center align-y-center size-600-full",
			LayoutOrder = 1
		}, {
			LeadingSkeleton = ReactModule.createElement(FoundationModule.Skeleton, {
				Size = UDim2.fromOffset(UseTokensResult.Size.Size_600, UseTokensResult.Size.Size_600),
				radius = Radius.Small
			})
		}),
		Name = ReactModule.createElement(FoundationModule.View, {
			tag = "row align-y-center fill size-0-full",
			LayoutOrder = 2
		}, {
			NameSkeleton = ReactModule.createElement(FoundationModule.View, {
				Size = UDim2.new(1, 0, 0, UseTokensResult.Size.Size_350),
				sizeConstraint = { MaxSize = Vector2.new(200, 1e999) }
			}, {
				Bar = ReactModule.createElement(FoundationModule.Skeleton, { Size = UDim2.fromScale(1, 1), radius = Radius.Small })
			})
		})
	})
end

return function()
	-- upvalues: FoundationModule (copy), ReactModule (copy), SkeletonRow (copy)
	local UseTokensResult = FoundationModule.Hooks.useTokens()
	local Elements = {}
	
	for i = 1, 3 do
		Elements[`Row_{i}`] = ReactModule.createElement(SkeletonRow, { layoutOrder = i })
	end
	return ReactModule.createElement(FoundationModule.View, {
		tag = "col gap-xxsmall size-full-0 auto-y",
		testId = "GroupSidebar.Skeleton",
		padding = {
			left = UDim.new(0, UseTokensResult.Padding.Medium),
			right = UDim.new(0, UseTokensResult.Padding.Medium)
		}
	}, Elements)
end