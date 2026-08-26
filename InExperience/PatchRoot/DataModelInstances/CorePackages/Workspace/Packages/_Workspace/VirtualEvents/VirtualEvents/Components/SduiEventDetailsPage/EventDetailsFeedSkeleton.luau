local parent = script:FindFirstAncestor("VirtualEvents").Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local view = foundationModule.View
local skeleton = foundationModule.Skeleton
local radius = foundationModule.Enums.Radius
local useTokens = foundationModule.Hooks.useTokens
local eventDetailsActionBarSkeletonModule = require(script.Parent.EventDetailsActionBarSkeleton)
local fFlagLuaAppSduiEventDetailsActionBarInFeed = require(parent.SharedFlags).FFlagLuaAppSduiEventDetailsActionBarInFeed

return reactModule.memo(function()
	-- upvalues: useTokens (ref), reactModule (ref), view (ref), skeleton (ref), radius (ref), fFlagLuaAppSduiEventDetailsActionBarInFeed (ref), eventDetailsActionBarSkeletonModule (ref)
	local var1 = useTokens()
	local size1400 = var1.Size.Size_1400
	local var2 = var1.Typography.CaptionLarge.LineHeight * var1.Typography.CaptionLarge.FontSize
	
	return reactModule.createElement(view, {
		tag = "col gap-large size-full auto-y padding-top-medium",
		testId = "--event-details-feed-skeleton"
	}, {
		AttributionRow = reactModule.createElement(view, {
			tag = "row align-y-center gap-medium size-full-0 auto-y",
			LayoutOrder = 1
		}, {
			Icon = reactModule.createElement(skeleton, {
				LayoutOrder = 1,
				Size = UDim2.fromOffset(size1400, size1400),
				radius = radius.Medium
			}),
			TextColumn = reactModule.createElement(view, { tag = "col fill gap-small auto-xy", LayoutOrder = 2 }, {
				Title = reactModule.createElement(skeleton, {
					LayoutOrder = 1,
					Size = UDim2.fromOffset(var1.Size.Size_2800 * 2, var2),
					radius = radius.Small
				}),
				Host = reactModule.createElement(skeleton, {
					LayoutOrder = 2,
					Size = UDim2.fromOffset(var1.Size.Size_2800, var2),
					radius = radius.Small
				})
			})
		}),
		ActionBar = if fFlagLuaAppSduiEventDetailsActionBarInFeed then reactModule.createElement(view, { tag = "size-full-0 auto-y", LayoutOrder = 2 }, {
			Skeleton = reactModule.createElement(eventDetailsActionBarSkeletonModule)
		}) else nil,
		Description = reactModule.createElement(view, {
			tag = "col gap-medium size-full-0 auto-y",
			LayoutOrder = 3
		}, {
			Header = reactModule.createElement(skeleton, {
				LayoutOrder = 1,
				Size = UDim2.fromOffset(var1.Size.Size_2800 * 2, var1.Typography.HeadingSmall.LineHeight * var1.Typography.HeadingSmall.FontSize),
				radius = radius.Small
			}),
			Text = reactModule.createElement(skeleton, {
				LayoutOrder = 2,
				Size = UDim2.new(1, 0, 0, var1.Typography.CaptionMedium.LineHeight * var1.Typography.CaptionMedium.FontSize * 3),
				radius = radius.Small
			})
		})
	})
end)