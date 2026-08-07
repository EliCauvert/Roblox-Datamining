local momentsCreation = script:FindFirstAncestor("MomentsCreation")
local parent = momentsCreation.Parent
local foundationModule = require(parent.Foundation)
local momentsCommonModule = require(parent.MomentsCommon)
local reactModule = require(parent.React)
local button = foundationModule.Button
local buttonVariant = foundationModule.Enums.ButtonVariant
local inputSize = foundationModule.Enums.InputSize
local view = foundationModule.View
local useDeviceInsets = momentsCommonModule.Hooks.useDeviceInsets
local useTokens = foundationModule.Hooks.useTokens
local constantsModule = require(momentsCreation.Constants)
local useCreationFlowStringsModule = require(momentsCreation.Hooks.useCreationFlowStrings)

return function(p0) --[[ line: 28 ]]
	-- upvalues: useDeviceInsets (ref), useTokens (ref), useCreationFlowStringsModule (ref), reactModule (ref), view (ref), constantsModule (ref), button (ref), foundationModule (ref), inputSize (ref), buttonVariant (ref)
	local var6 = useDeviceInsets()
	local var7 = useTokens()
	local var8 = useCreationFlowStringsModule()
	
	return reactModule.createElement(view, {
		tag = "align-x-center size-full-0 auto-y",
		LayoutOrder = p0.layoutOrder,
		padding = {
			top = UDim.new(0, var7.Padding.Large),
			bottom = UDim.new(0, math.max(var6.bottom, var7.Padding.Large)),
			left = UDim.new(0, math.max(var6.left, var7.Padding.XLarge)),
			right = UDim.new(0, math.max(var6.right, var7.Padding.XLarge))
		}
	}, {
		SizeConstraint = reactModule.createElement(view, {
			tag = "row align-x-center gap-small size-full-0 auto-y",
			sizeConstraint = { MaxSize = constantsModule.BottomBarSizeConstraint }
		}, {
			ContinueButton = reactModule.createElement(button, {
				LayoutOrder = 1,
				fillBehavior = foundationModule.Enums.FillBehavior.Fill,
				onActivated = p0.onContinueCallback,
				size = inputSize.Medium,
				text = var8.PublishingCtaContinue,
				variant = buttonVariant.Emphasis,
				width = UDim.new(0.5, 0)
			}),
			ReturnToGalleryButton = if p0.onReturnToGalleryCallback then reactModule.createElement(button, {
				LayoutOrder = 2,
				fillBehavior = foundationModule.Enums.FillBehavior.Fill,
				text = var8.PublishingCtaReturn,
				variant = buttonVariant.Standard,
				width = UDim.new(0.5, 0),
				onActivated = p0.onReturnToGalleryCallback,
				size = inputSize.Medium
			}) else nil
		})
	})
end