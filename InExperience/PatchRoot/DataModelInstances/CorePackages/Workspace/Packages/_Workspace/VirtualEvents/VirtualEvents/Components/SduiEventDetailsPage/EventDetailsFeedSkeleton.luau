local Parent = script:FindFirstAncestor("VirtualEvents").Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local View = FoundationModule.View
local Skeleton = FoundationModule.Skeleton
local Radius = FoundationModule.Enums.Radius
local UseTokensFunction = FoundationModule.Hooks.useTokens
local EventDetailsActionBarSkeletonModule = require(script.Parent.EventDetailsActionBarSkeleton)
local FFlagLuaAppSduiEventDetailsActionBarInFeed = require(Parent.SharedFlags).FFlagLuaAppSduiEventDetailsActionBarInFeed

return ReactModule.memo(function() --[[ Line: 19 | Named "EventDetailsFeedSkeleton" ]]
	-- upvalues: UseTokensFunction (copy), ReactModule (copy), View (copy), Skeleton (copy), Radius (copy), FFlagLuaAppSduiEventDetailsActionBarInFeed (copy), EventDetailsActionBarSkeletonModule (copy)
	local UseTokensResult = UseTokensFunction()
	local Size1400 = UseTokensResult.Size.Size_1400
	local ScaledLineHeight = UseTokensResult.Typography.CaptionLarge.LineHeight * UseTokensResult.Typography.CaptionLarge.FontSize
	
	return ReactModule.createElement(View, {
		tag = "col gap-large size-full auto-y padding-top-medium",
		testId = "--event-details-feed-skeleton"
	}, {
		AttributionRow = ReactModule.createElement(View, {
			tag = "row align-y-center gap-medium size-full-0 auto-y",
			LayoutOrder = 1
		}, {
			Icon = ReactModule.createElement(Skeleton, {
				LayoutOrder = 1,
				Size = UDim2.fromOffset(Size1400, Size1400),
				radius = Radius.Medium
			}),
			TextColumn = ReactModule.createElement(View, { tag = "col fill gap-small auto-xy", LayoutOrder = 2 }, {
				Title = ReactModule.createElement(Skeleton, {
					LayoutOrder = 1,
					Size = UDim2.fromOffset(UseTokensResult.Size.Size_2800 * 2, ScaledLineHeight),
					radius = Radius.Small
				}),
				Host = ReactModule.createElement(Skeleton, {
					LayoutOrder = 2,
					Size = UDim2.fromOffset(UseTokensResult.Size.Size_2800, ScaledLineHeight),
					radius = Radius.Small
				})
			})
		}),
		ActionBar = if FFlagLuaAppSduiEventDetailsActionBarInFeed then ReactModule.createElement(View, { tag = "size-full-0 auto-y", LayoutOrder = 2 }, {
			Skeleton = ReactModule.createElement(EventDetailsActionBarSkeletonModule)
		}) else nil,
		Description = ReactModule.createElement(View, {
			tag = "col gap-medium size-full-0 auto-y",
			LayoutOrder = 3
		}, {
			Header = ReactModule.createElement(Skeleton, {
				LayoutOrder = 1,
				Size = UDim2.fromOffset(UseTokensResult.Size.Size_2800 * 2, UseTokensResult.Typography.HeadingSmall.LineHeight * UseTokensResult.Typography.HeadingSmall.FontSize),
				radius = Radius.Small
			}),
			Text = ReactModule.createElement(Skeleton, {
				LayoutOrder = 2,
				Size = UDim2.new(1, 0, 0, UseTokensResult.Typography.CaptionMedium.LineHeight * UseTokensResult.Typography.CaptionMedium.FontSize * 3),
				radius = Radius.Small
			})
		})
	})
end)