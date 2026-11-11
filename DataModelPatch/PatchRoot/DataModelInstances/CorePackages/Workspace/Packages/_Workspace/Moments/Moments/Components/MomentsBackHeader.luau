local Moments = script:FindFirstAncestor("Moments")
local Parent = Moments.Parent
local FoundationModule = require(Parent.Foundation)
local MomentsCommonModule = require(Parent.MomentsCommon)
local ReactModule = require(Parent.React)
local FoundationProvider = FoundationModule.FoundationProvider
local IconButton = FoundationModule.IconButton
local View = FoundationModule.View
local IconName = FoundationModule.Enums.IconName
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local InputSize = FoundationModule.Enums.InputSize
local Theme = FoundationModule.Enums.Theme
local GradientBackdrop = MomentsCommonModule.Components.GradientBackdrop
local UseDeviceInsetsFunction = MomentsCommonModule.Hooks.useDeviceInsets
local UseTokensFunction = FoundationModule.Hooks.useTokens
local ConstantsModule = require(Moments.Constants)

return function(p1)
	-- upvalues: UseTokensFunction (copy), UseDeviceInsetsFunction (copy), ReactModule (copy), View (copy), ConstantsModule (copy), GradientBackdrop (copy), FoundationProvider (copy), Theme (copy), IconButton (copy), IconName (copy), ButtonVariant (copy), InputSize (copy)
	local UseTokensResult = UseTokensFunction()
	local UseDeviceInsetsResult = UseDeviceInsetsFunction()
	
	return ReactModule.createElement(View, {
		tag = "size-full-0 auto-y",
		LayoutOrder = p1.layoutOrder,
		ZIndex = ConstantsModule.DisplayOrder.FeedTopBar
	}, {
		GradientScrim = ReactModule.createElement(GradientBackdrop, {
			startingTransparency = 0.4,
			endingTransparency = 1,
			rotation = 90,
			zIndex = 1,
			color3 = Color3.new(0, 0, 0),
			position = UDim2.fromScale(0, 0),
			size = UDim2.new(1, 0, 0, UseDeviceInsetsResult.top + UseTokensResult.Size.Size_2000 + UseTokensResult.Size.Size_1600)
		}),
		HeaderContent = ReactModule.createElement(View, {
			tag = "size-full-0 auto-y",
			ZIndex = 2,
			padding = {
				left = UDim.new(0, UseDeviceInsetsResult.left),
				right = UDim.new(0, UseDeviceInsetsResult.right),
				top = UDim.new(0, UseDeviceInsetsResult.top)
			}
		}, {
			OverMediaTheme = ReactModule.createElement(FoundationProvider, { theme = Theme.Light }, {
				HeaderRow = ReactModule.createElement(View, {
					tag = "row align-x-left align-y-center size-full-0 auto-y padding-x-large padding-top-medium"
				}, {
					BackButton = ReactModule.createElement(IconButton, {
						isCircular = true,
						Selectable = true,
						testId = "--moments-back-header-back",
						icon = IconName.ChevronLargeLeft,
						onActivated = p1.onBack,
						variant = ButtonVariant.OverMedia,
						size = InputSize.Medium
					})
				})
			})
		})
	})
end