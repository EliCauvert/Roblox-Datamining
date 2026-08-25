local parent = script:FindFirstAncestor("GenericAbuseReporting").Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local radius = foundationModule.Enums.Radius
local sheet = foundationModule.Sheet
local skeleton = foundationModule.Skeleton
local view = foundationModule.View

return reactModule.memo(function(_)
	-- upvalues: reactModule (ref), sheet (ref), skeleton (ref), radius (ref), view (ref)
	return reactModule.createElement(reactModule.Fragment, nil, {
		Header = reactModule.createElement(sheet.Header, { hasCloseAffordance = true }, reactModule.createElement(skeleton, { Size = UDim2.new(1, 0, 0, 24), radius = radius.Medium })),
		Content = reactModule.createElement(sheet.Content, nil, reactModule.createElement(view, { tag = "size-full-0 auto-y col gap-medium" }, {
			Title = reactModule.createElement(skeleton, {
				LayoutOrder = 1,
				Size = UDim2.new(0.8, 0, 0, 40),
				radius = radius.Medium
			}),
			Item1 = reactModule.createElement(skeleton, {
				LayoutOrder = 2,
				Size = UDim2.new(1, 0, 0, 50),
				radius = radius.Medium
			}),
			Item2 = reactModule.createElement(skeleton, {
				LayoutOrder = 3,
				Size = UDim2.new(1, 0, 0, 50),
				radius = radius.Medium
			}),
			Item3 = reactModule.createElement(skeleton, {
				LayoutOrder = 4,
				Size = UDim2.new(1, 0, 0, 50),
				radius = radius.Medium
			}),
			Item4 = reactModule.createElement(skeleton, {
				LayoutOrder = 5,
				Size = UDim2.new(1, 0, 0, 50),
				radius = radius.Medium
			}),
			Item5 = reactModule.createElement(skeleton, {
				LayoutOrder = 6,
				Size = UDim2.new(1, 0, 0, 50),
				radius = radius.Medium
			})
		}))
	})
end)