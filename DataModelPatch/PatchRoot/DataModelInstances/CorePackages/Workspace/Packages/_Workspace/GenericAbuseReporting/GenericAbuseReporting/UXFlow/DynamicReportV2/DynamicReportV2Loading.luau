local Parent = script:FindFirstAncestor("GenericAbuseReporting").Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local Radius = FoundationModule.Enums.Radius
local Sheet = FoundationModule.Sheet
local Skeleton = FoundationModule.Skeleton
local View = FoundationModule.View

return ReactModule.memo(function(_)
	-- upvalues: ReactModule (copy), Sheet (copy), Skeleton (copy), Radius (copy), View (copy)
	return ReactModule.createElement(ReactModule.Fragment, nil, {
		Header = ReactModule.createElement(Sheet.Header, { hasCloseAffordance = true }, ReactModule.createElement(Skeleton, { Size = UDim2.new(1, 0, 0, 24), radius = Radius.Medium })),
		Content = ReactModule.createElement(Sheet.Content, nil, ReactModule.createElement(View, { tag = "size-full-0 auto-y col gap-medium" }, {
			Title = ReactModule.createElement(Skeleton, {
				LayoutOrder = 1,
				Size = UDim2.new(0.8, 0, 0, 40),
				radius = Radius.Medium
			}),
			Item1 = ReactModule.createElement(Skeleton, {
				LayoutOrder = 2,
				Size = UDim2.new(1, 0, 0, 50),
				radius = Radius.Medium
			}),
			Item2 = ReactModule.createElement(Skeleton, {
				LayoutOrder = 3,
				Size = UDim2.new(1, 0, 0, 50),
				radius = Radius.Medium
			}),
			Item3 = ReactModule.createElement(Skeleton, {
				LayoutOrder = 4,
				Size = UDim2.new(1, 0, 0, 50),
				radius = Radius.Medium
			}),
			Item4 = ReactModule.createElement(Skeleton, {
				LayoutOrder = 5,
				Size = UDim2.new(1, 0, 0, 50),
				radius = Radius.Medium
			}),
			Item5 = ReactModule.createElement(Skeleton, {
				LayoutOrder = 6,
				Size = UDim2.new(1, 0, 0, 50),
				radius = Radius.Medium
			})
		}))
	})
end)