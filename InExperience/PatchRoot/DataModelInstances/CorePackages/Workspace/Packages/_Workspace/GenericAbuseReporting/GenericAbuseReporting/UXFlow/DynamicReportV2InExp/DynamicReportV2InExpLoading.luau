local genericAbuseReporting = script:FindFirstAncestor("GenericAbuseReporting")
local parent = genericAbuseReporting.Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local layoutSlotsModule = require(genericAbuseReporting.BeduiV2.Components.LayoutSlots)
local layout = layoutSlotsModule.inlineSlots.Layout
local overlaidControlsProvider = layoutSlotsModule.OverlaidControlsProvider
local radius = foundationModule.Enums.Radius
local skeleton = foundationModule.Skeleton
local view = foundationModule.View

return reactModule.memo(function(p0) --[[ line: 24 | named "DynamicReportV2InExpLoading" ]]
	-- upvalues: reactModule (ref), overlaidControlsProvider (ref), layout (ref), skeleton (ref), radius (ref), view (ref)
	return reactModule.createElement(overlaidControlsProvider, { value = p0.shouldUseOverlaidControls }, {
		Layout = reactModule.createElement(layout, {
			body = reactModule.createElement(reactModule.Fragment, nil, {
				Title = reactModule.createElement(skeleton, {
					LayoutOrder = 1,
					Size = UDim2.new(0.8, 0, 0, 40),
					radius = radius.Medium
				}),
				Items = reactModule.createElement(view, {
					tag = "col gap-medium size-full-0 auto-y",
					LayoutOrder = 2
				}, {
					Item1 = reactModule.createElement(skeleton, { Size = UDim2.new(1, 0, 0, 50), radius = radius.Medium }),
					Item2 = reactModule.createElement(skeleton, { Size = UDim2.new(1, 0, 0, 50), radius = radius.Medium }),
					Item3 = reactModule.createElement(skeleton, { Size = UDim2.new(1, 0, 0, 50), radius = radius.Medium }),
					Item4 = reactModule.createElement(skeleton, { Size = UDim2.new(1, 0, 0, 50), radius = radius.Medium }),
					Item5 = reactModule.createElement(skeleton, { Size = UDim2.new(1, 0, 0, 50), radius = radius.Medium })
				})
			})
		})
	})
end)