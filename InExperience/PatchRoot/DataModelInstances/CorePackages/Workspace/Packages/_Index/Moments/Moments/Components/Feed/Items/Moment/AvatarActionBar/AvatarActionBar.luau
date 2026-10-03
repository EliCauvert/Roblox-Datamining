local moments = script:FindFirstAncestor("Moments")
local parent = moments.Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local button = foundationModule.Button
local icon = foundationModule.Icon
local skeleton = foundationModule.Skeleton
local text = foundationModule.Text
local view = foundationModule.View
local iconName = foundationModule.Enums.IconName
local iconSize = foundationModule.Enums.IconSize
local radius = foundationModule.Enums.Radius
local useTokens = foundationModule.Hooks.useTokens
local imageWithSkeletonModule = require(moments.Components.ImageWithSkeleton)

return function(p1)
	-- upvalues: useTokens (ref), reactModule (ref), view (ref), skeleton (ref), radius (ref), imageWithSkeletonModule (ref), icon (ref), iconName (ref), iconSize (ref), text (ref), button (ref), foundationModule (ref)
	local var1 = useTokens()
	local size1000 = var1.Size.Size_1000
	
	return if p1.isLoading then reactModule.createElement(view, {
		tag = "row align-x-left align-y-center gap-medium size-full-0 auto-y",
		testId = "moments-avatar-action-bar-skeleton",
		LayoutOrder = p1.LayoutOrder
	}, {
		Thumbnail = reactModule.createElement(skeleton, {
			LayoutOrder = 1,
			Size = UDim2.fromOffset(size1000, size1000),
			radius = radius.Medium
		}),
		Lines = reactModule.createElement(view, {
			LayoutOrder = 2,
			tag = "col align-x-left align-y-center gap-xsmall auto-xy"
		}, {
			Price = reactModule.createElement(skeleton, {
				LayoutOrder = 1,
				Size = UDim2.fromOffset(64, var1.Size.Size_400)
			}),
			ItemCount = reactModule.createElement(skeleton, {
				LayoutOrder = 2,
				Size = UDim2.fromOffset(112, var1.Size.Size_300)
			})
		})
	}) else reactModule.createElement(view, {
		tag = "row align-x-left align-y-center gap-medium size-full-0 auto-y",
		testId = "moments-avatar-action-bar",
		LayoutOrder = p1.LayoutOrder
	}, {
		Thumbnail = reactModule.createElement(imageWithSkeletonModule, {
			LayoutOrder = 1,
			Image = p1.thumbnailImage,
			Size = UDim2.fromOffset(size1000, size1000),
			radius = radius.Medium,
			backgroundStyle = var1.Color.Shift.Shift_300
		}),
		Totals = reactModule.createElement(view, {
			LayoutOrder = 2,
			tag = "col align-x-left align-y-center grow gap-xsmall auto-y"
		}, {
			Price = if p1.priceText then reactModule.createElement(view, {
				LayoutOrder = 1,
				tag = "row align-x-left align-y-center gap-xsmall auto-xy"
			}, {
				RobuxIcon = reactModule.createElement(icon, {
					LayoutOrder = 1,
					name = iconName.Robux,
					size = iconSize.Small
				}),
				Amount = reactModule.createElement(text, {
					LayoutOrder = 2,
					tag = "auto-xy text-title-medium text-align-x-left content-emphasis",
					testId = "moments-look-price",
					Text = p1.priceText
				})
			}) else nil,
			ItemCount = reactModule.createElement(text, {
				LayoutOrder = 2,
				tag = "auto-xy text-body-medium text-align-x-left content-default",
				testId = "moments-look-item-count",
				Text = p1.itemCountText
			})
		}),
		ShopButton = if p1.showShopButton then reactModule.createElement(button, {
			LayoutOrder = 3,
			testId = "moments-shop-cta",
			isDisabled = p1.isShopDisabled,
			onActivated = p1.onShop,
			size = foundationModule.Enums.InputSize.Medium,
			text = p1.shopText,
			variant = foundationModule.Enums.ButtonVariant.Emphasis
		}) else nil
	})
end