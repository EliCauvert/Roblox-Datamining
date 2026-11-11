local MomentsCreationFlow = script:FindFirstAncestor("MomentsCreationFlow")
local Parent = MomentsCreationFlow.Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local Button = FoundationModule.Button
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local InputSize = FoundationModule.Enums.InputSize
local View = FoundationModule.View
local UseDeviceInsetsFunction = require(Parent.MomentsCommon).Hooks.useDeviceInsets
local UseTokensFunction = FoundationModule.Hooks.useTokens
local CreationFlowContextModule = require(MomentsCreationFlow.Context.CreationFlowContext)
local ConstantsModule = require(MomentsCreationFlow.Constants)
local CreationFlowLocalizationModule = require(MomentsCreationFlow.Enums.CreationFlowLocalization)

return function(p1)
	-- upvalues: UseDeviceInsetsFunction (copy), UseTokensFunction (copy), ReactModule (copy), CreationFlowContextModule (copy), View (copy), ConstantsModule (copy), Button (copy), FoundationModule (copy), InputSize (copy), CreationFlowLocalizationModule (copy), ButtonVariant (copy)
	local UseDeviceInsetsResult = UseDeviceInsetsFunction()
	local UseTokensResult = UseTokensFunction()
	local UseContextResult = ReactModule.useContext(CreationFlowContextModule)
	
	return ReactModule.createElement(View, {
		tag = "align-x-center auto-y size-full-0",
		LayoutOrder = p1.layoutOrder
	}, {
		Padding = ReactModule.createElement("UIPadding", {
			PaddingTop = UDim.new(0, UseTokensResult.Padding.Large),
			PaddingBottom = UDim.new(0, (math.max(UseDeviceInsetsResult.bottom, UseTokensResult.Padding.Large))),
			PaddingLeft = UDim.new(0, (math.max(UseDeviceInsetsResult.left, UseTokensResult.Padding.XLarge))),
			PaddingRight = UDim.new(0, (math.max(UseDeviceInsetsResult.right, UseTokensResult.Padding.XLarge)))
		}),
		SizeConstraint = ReactModule.createElement(View, {
			tag = "align-x-center auto-y gap-small row size-full-0",
			sizeConstraint = { MaxSize = ConstantsModule.BottomBarSizeConstraint }
		}, {
			ContinueButton = ReactModule.createElement(Button, {
				LayoutOrder = 1,
				fillBehavior = FoundationModule.Enums.FillBehavior.Fill,
				onActivated = p1.onContinueCallback,
				size = InputSize.Medium,
				text = UseContextResult.getLocalization(CreationFlowLocalizationModule.PublishingCtaContinue),
				variant = ButtonVariant.Emphasis,
				width = UDim.new(0.5, 0)
			}),
			ReturnToGalleryButton = if p1.onReturnToGalleryCallback then ReactModule.createElement(Button, {
				LayoutOrder = 2,
				fillBehavior = FoundationModule.Enums.FillBehavior.Fill,
				text = UseContextResult.getLocalization(CreationFlowLocalizationModule.PublishingCtaReturn),
				variant = ButtonVariant.Standard,
				width = UDim.new(0.5, 0),
				onActivated = p1.onReturnToGalleryCallback,
				size = InputSize.Medium
			}) else nil
		})
	})
end