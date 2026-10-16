local Moments = script:FindFirstAncestor("Moments")
local Parent = Moments.Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local Button = FoundationModule.Button
local Icon = FoundationModule.Icon
local Skeleton = FoundationModule.Skeleton
local Text = FoundationModule.Text
local View = FoundationModule.View
local IconName = FoundationModule.Enums.IconName
local IconSize = FoundationModule.Enums.IconSize
local Radius = FoundationModule.Enums.Radius
local UseTokensFunction = FoundationModule.Hooks.useTokens
local ImageWithSkeletonModule = require(Moments.Components.ImageWithSkeleton)

return function(Frame: Frame) --[[ Line: 53 | Named "AvatarActionBar" ]]
	-- upvalues: UseTokensFunction (copy), ReactModule (copy), View (copy), Skeleton (copy), Radius (copy), ImageWithSkeletonModule (copy), Icon (copy), IconName (copy), IconSize (copy), Text (copy), Button (copy), FoundationModule (copy)
	local UseTokensResult = UseTokensFunction()
	local Size1000 = UseTokensResult.Size.Size_1000
	
	return if Frame.isLoading then ReactModule.createElement(View, {
		tag = "row align-x-left align-y-center gap-medium size-full-0 auto-y",
		testId = "moments-avatar-action-bar-skeleton",
		LayoutOrder = Frame.LayoutOrder
	}, {
		Thumbnail = ReactModule.createElement(Skeleton, {
			LayoutOrder = 1,
			Size = UDim2.fromOffset(Size1000, Size1000),
			radius = Radius.Medium
		}),
		Lines = ReactModule.createElement(View, {
			LayoutOrder = 2,
			tag = "col align-x-left align-y-center gap-xsmall auto-xy"
		}, {
			Price = ReactModule.createElement(Skeleton, {
				LayoutOrder = 1,
				Size = UDim2.fromOffset(64, UseTokensResult.Size.Size_400)
			}),
			ItemCount = ReactModule.createElement(Skeleton, {
				LayoutOrder = 2,
				Size = UDim2.fromOffset(112, UseTokensResult.Size.Size_300)
			})
		})
	}) else ReactModule.createElement(View, {
		tag = "row align-x-left align-y-center gap-medium size-full-0 auto-y",
		testId = "moments-avatar-action-bar",
		LayoutOrder = Frame.LayoutOrder
	}, {
		Thumbnail = ReactModule.createElement(ImageWithSkeletonModule, {
			LayoutOrder = 1,
			Image = Frame.thumbnailImage,
			Size = UDim2.fromOffset(Size1000, Size1000),
			radius = Radius.Medium,
			backgroundStyle = UseTokensResult.Color.Shift.Shift_300
		}),
		Totals = ReactModule.createElement(View, {
			LayoutOrder = 2,
			tag = "col align-x-left align-y-center grow gap-xsmall auto-y"
		}, {
			Price = if Frame.priceText then ReactModule.createElement(View, {
				LayoutOrder = 1,
				tag = "row align-x-left align-y-center gap-xsmall auto-xy"
			}, {
				RobuxIcon = ReactModule.createElement(Icon, {
					LayoutOrder = 1,
					name = IconName.Robux,
					size = IconSize.Small
				}),
				Amount = ReactModule.createElement(Text, {
					LayoutOrder = 2,
					tag = "auto-xy text-title-medium text-align-x-left content-emphasis",
					testId = "moments-look-price",
					Text = Frame.priceText
				})
			}) else nil,
			ItemCount = ReactModule.createElement(Text, {
				LayoutOrder = 2,
				tag = "auto-xy text-body-medium text-align-x-left content-default",
				testId = "moments-look-item-count",
				Text = Frame.itemCountText
			})
		}),
		ShopButton = if Frame.showShopButton then ReactModule.createElement(Button, {
			LayoutOrder = 3,
			testId = "moments-shop-cta",
			isDisabled = Frame.isShopDisabled,
			onActivated = Frame.onShop,
			size = FoundationModule.Enums.InputSize.Medium,
			text = Frame.shopText,
			variant = FoundationModule.Enums.ButtonVariant.Emphasis
		}) else nil
	})
end