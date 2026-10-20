local GenericAbuseReporting = script:FindFirstAncestor("GenericAbuseReporting")
local Parent = GenericAbuseReporting.Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local LayoutSlotsModule = require(GenericAbuseReporting.BeduiV2.Components.LayoutSlots)
local Layout = LayoutSlotsModule.inlineSlots.Layout
local OverlaidControlsProvider = LayoutSlotsModule.OverlaidControlsProvider
local Radius = FoundationModule.Enums.Radius
local Skeleton = FoundationModule.Skeleton
local View = FoundationModule.View

return ReactModule.memo(function(p1)
	-- upvalues: ReactModule (copy), OverlaidControlsProvider (copy), Layout (copy), Skeleton (copy), Radius (copy), View (copy)
	return ReactModule.createElement(OverlaidControlsProvider, { value = p1.shouldUseOverlaidControls }, {
		Layout = ReactModule.createElement(Layout, {
			body = ReactModule.createElement(ReactModule.Fragment, nil, {
				Title = ReactModule.createElement(Skeleton, {
					LayoutOrder = 1,
					Size = UDim2.new(0.8, 0, 0, 40),
					radius = Radius.Medium
				}),
				Items = ReactModule.createElement(View, {
					tag = "col gap-medium size-full-0 auto-y",
					LayoutOrder = 2
				}, {
					Item1 = ReactModule.createElement(Skeleton, { Size = UDim2.new(1, 0, 0, 50), radius = Radius.Medium }),
					Item2 = ReactModule.createElement(Skeleton, { Size = UDim2.new(1, 0, 0, 50), radius = Radius.Medium }),
					Item3 = ReactModule.createElement(Skeleton, { Size = UDim2.new(1, 0, 0, 50), radius = Radius.Medium }),
					Item4 = ReactModule.createElement(Skeleton, { Size = UDim2.new(1, 0, 0, 50), radius = Radius.Medium }),
					Item5 = ReactModule.createElement(Skeleton, { Size = UDim2.new(1, 0, 0, 50), radius = Radius.Medium })
				})
			})
		})
	})
end)