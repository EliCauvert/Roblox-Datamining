local MomentsCreation = script:FindFirstAncestor("MomentsCreation")
local Parent = MomentsCreation.Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local Button = FoundationModule.Button
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local InputSize = FoundationModule.Enums.InputSize
local View = FoundationModule.View
local UseDeviceInsetsFunction = require(Parent.MomentsCommon).Hooks.useDeviceInsets
local UseTokensFunction = FoundationModule.Hooks.useTokens
local ConstantsModule = require(MomentsCreation.Constants)
local UseCreationFlowStringsModule = require(MomentsCreation.Hooks.useCreationFlowStrings)

return function(p1) --[[ Line: 28 ]]
	-- upvalues: UseDeviceInsetsFunction (copy), UseTokensFunction (copy), UseCreationFlowStringsModule (copy), ReactModule (copy), View (copy), ConstantsModule (copy), Button (copy), FoundationModule (copy), InputSize (copy), ButtonVariant (copy)
	local UseDeviceInsetsResult = UseDeviceInsetsFunction()
	local UseTokensResult = UseTokensFunction()
	local UseCreationFlowStringsModuleResult = UseCreationFlowStringsModule()
	local PublishingCtaReturn = UseCreationFlowStringsModuleResult.PublishingCtaReturn
	
	return ReactModule.createElement(View, {
		tag = "align-x-center size-full-0 auto-y",
		LayoutOrder = p1.layoutOrder,
		padding = {
			top = UDim.new(0, UseTokensResult.Padding.Large),
			bottom = UDim.new(0, (math.max(UseDeviceInsetsResult.bottom, UseTokensResult.Padding.Large))),
			left = UDim.new(0, (math.max(UseDeviceInsetsResult.left, UseTokensResult.Padding.XLarge))),
			right = UDim.new(0, (math.max(UseDeviceInsetsResult.right, UseTokensResult.Padding.XLarge)))
		}
	}, {
		SizeConstraint = ReactModule.createElement(View, {
			tag = "row align-x-center gap-small size-full-0 auto-y",
			sizeConstraint = { MaxSize = ConstantsModule.BottomBarSizeConstraint }
		}, {
			ContinueButton = ReactModule.createElement(Button, {
				LayoutOrder = 1,
				fillBehavior = FoundationModule.Enums.FillBehavior.Fill,
				onActivated = p1.onContinueCallback,
				size = InputSize.Medium,
				text = UseCreationFlowStringsModuleResult.PublishingCtaContinue,
				variant = ButtonVariant.Emphasis,
				width = UDim.new(0.5, 0)
			}),
			ReturnToGalleryButton = if p1.onReturnToGalleryCallback then ReactModule.createElement(Button, {
				LayoutOrder = 2,
				fillBehavior = FoundationModule.Enums.FillBehavior.Fill,
				text = PublishingCtaReturn,
				variant = ButtonVariant.Standard,
				width = UDim.new(0.5, 0),
				onActivated = p1.onReturnToGalleryCallback,
				size = InputSize.Medium
			}) else nil
		})
	})
end