local momentsCreationFlow = script:FindFirstAncestor("MomentsCreationFlow")
local parent = momentsCreationFlow.Parent
local foundationModule = require(parent.Foundation)
local momentsCommonModule = require(parent.MomentsCommon)
local reactModule = require(parent.React)
local button = foundationModule.Button
local buttonVariant = foundationModule.Enums.ButtonVariant
local inputSize = foundationModule.Enums.InputSize
local view = foundationModule.View
local useDeviceInsets = momentsCommonModule.Hooks.useDeviceInsets
local useTokens = foundationModule.Hooks.useTokens
local creationFlowContextModule = require(momentsCreationFlow.Context.CreationFlowContext)
local constantsModule = require(momentsCreationFlow.Constants)
local creationFlowLocalizationModule = require(momentsCreationFlow.Enums.CreationFlowLocalization)

return function(p0)
	-- upvalues: useDeviceInsets (ref), useTokens (ref), reactModule (ref), creationFlowContextModule (ref), view (ref), constantsModule (ref), button (ref), foundationModule (ref), inputSize (ref), creationFlowLocalizationModule (ref), buttonVariant (ref)
	local var7 = useDeviceInsets()
	local var8 = useTokens()
	local var9 = reactModule.useContext(creationFlowContextModule)
	
	return reactModule.createElement(view, {
		tag = "align-x-center auto-y size-full-0",
		LayoutOrder = p0.layoutOrder
	}, {
		Padding = reactModule.createElement("UIPadding", {
			PaddingTop = UDim.new(0, var8.Padding.Large),
			PaddingBottom = UDim.new(0, math.max(var7.bottom, var8.Padding.Large)),
			PaddingLeft = UDim.new(0, math.max(var7.left, var8.Padding.XLarge)),
			PaddingRight = UDim.new(0, math.max(var7.right, var8.Padding.XLarge))
		}),
		SizeConstraint = reactModule.createElement(view, {
			tag = "align-x-center auto-y gap-small row size-full-0",
			sizeConstraint = { MaxSize = constantsModule.BottomBarSizeConstraint }
		}, {
			ContinueButton = reactModule.createElement(button, {
				LayoutOrder = 1,
				fillBehavior = foundationModule.Enums.FillBehavior.Fill,
				onActivated = p0.onContinueCallback,
				size = inputSize.Medium,
				text = var9.getLocalization(creationFlowLocalizationModule.PublishingCtaContinue),
				variant = buttonVariant.Emphasis,
				width = UDim.new(0.5, 0)
			}),
			ReturnToGalleryButton = if p0.onReturnToGalleryCallback then reactModule.createElement(button, {
				LayoutOrder = 2,
				fillBehavior = foundationModule.Enums.FillBehavior.Fill,
				text = var9.getLocalization(creationFlowLocalizationModule.PublishingCtaReturn),
				variant = buttonVariant.Standard,
				width = UDim.new(0.5, 0),
				onActivated = p0.onReturnToGalleryCallback,
				size = inputSize.Medium
			}) else nil
		})
	})
end