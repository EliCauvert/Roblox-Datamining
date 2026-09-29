local moments = script:FindFirstAncestor("Moments")
local parent = moments.Parent
local builderIconsModule = require(parent.BuilderIcons)
local foundationModule = require(parent.Foundation)
local momentsCommonModule = require(parent.MomentsCommon)
local reactModule = require(parent.React)
local chevronLargeUp = builderIconsModule.Icon.ChevronLargeUp
local chevronLargeDown = builderIconsModule.Icon.ChevronLargeDown
local iconButton = foundationModule.IconButton
local view = foundationModule.View
local useDeviceInsets = momentsCommonModule.Hooks.useDeviceInsets
local useFormFactor = momentsCommonModule.Hooks.useFormFactor
local usePreferredInputModule = require(moments.Hooks.usePreferredInput)
local useTokens = foundationModule.Hooks.useTokens
local fFlagLuaSupportMicroGamepadPreferredInput = require(parent.SharedFlags).FFlagLuaSupportMicroGamepadPreferredInput
local formFactor = momentsCommonModule.Enums.FormFactor

return function(p1)
	-- upvalues: useDeviceInsets (ref), useFormFactor (ref), usePreferredInputModule (ref), useTokens (ref), moments (ref), parent (ref), formFactor (ref), fFlagLuaSupportMicroGamepadPreferredInput (ref), reactModule (ref), view (ref), iconButton (ref), chevronLargeUp (ref), foundationModule (ref), chevronLargeDown (ref)
	local var1 = useDeviceInsets()
	local var2 = useFormFactor()
	local var3 = usePreferredInputModule()
	local var4 = useTokens()
	local fFlagMomentsAlignFeedNavArrowsWithHeaderModule = require(moments.Flags.FFlagMomentsAlignFeedNavArrowsWithHeader)
	local var5 = nil
	
	if fFlagMomentsAlignFeedNavArrowsWithHeaderModule then
		if require(moments.Flags.FFlagMomentsUseCompositionLibrary) and require(moments.Flags.FFlagMomentsUseFoundationHeaderBar) then
			var5 = require(parent.AppComposition).useCompositionLayout()
		end
	end
	return if var2 == formFactor.MobileLandscape then nil elseif not (var3 ~= Enum.PreferredInput.KeyboardAndMouse and not (if var3 ~= Enum.PreferredInput.Gamepad then fFlagLuaSupportMicroGamepadPreferredInput and var3 == Enum.PreferredInput.MicroGamepad else true)) then if p1.active then reactModule.createElement(view, {
		tag = "size-full",
		padding = {
			right = UDim.new(0, if fFlagMomentsAlignFeedNavArrowsWithHeaderModule then require(script.Parent.resolveFeedRightChromeInset)(var1, if var5 ~= nil then nil else var5.margin, var4.Padding.XLarge) else math.max(var1.right, var4.Padding.XLarge))
		},
		ZIndex = p1.zIndex
	}, {
		NavControls = reactModule.createElement(view, {
			tag = "col align-x-center align-y-center position-center-right anchor-center-right auto-xy radius-circle clip bg-over-media-0"
		}, {
			PreviousButton = reactModule.createElement(iconButton, {
				isCircular = true,
				LayoutOrder = 1,
				icon = chevronLargeUp,
				isDisabled = p1.currentIndex == 1,
				onActivated = p1.onScrollToPrevious,
				size = foundationModule.Enums.IconSize.Medium
			}),
			NextButton = reactModule.createElement(iconButton, {
				isCircular = true,
				LayoutOrder = 2,
				icon = chevronLargeDown,
				isDisabled = p1.currentIndex == p1.numItems,
				onActivated = p1.onScrollToNext,
				size = foundationModule.Enums.IconSize.Medium
			})
		})
	}) else nil else nil
end