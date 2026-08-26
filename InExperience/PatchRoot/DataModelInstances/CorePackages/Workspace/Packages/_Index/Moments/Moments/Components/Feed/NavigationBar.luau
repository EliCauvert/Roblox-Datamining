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
local formFactor = momentsCommonModule.Enums.FormFactor

return function(p1)
	-- upvalues: useDeviceInsets (ref), useFormFactor (ref), usePreferredInputModule (ref), useTokens (ref), formFactor (ref), reactModule (ref), view (ref), iconButton (ref), chevronLargeUp (ref), foundationModule (ref), chevronLargeDown (ref)
	local var1 = usePreferredInputModule()
	
	return if useFormFactor() == formFactor.MobileLandscape then nil elseif not (var1 ~= Enum.PreferredInput.KeyboardAndMouse and var1 ~= Enum.PreferredInput.Gamepad) then if p1.active then reactModule.createElement(view, {
		tag = "size-full",
		padding = {
			right = UDim.new(0, math.max(useDeviceInsets().right, useTokens().Padding.XLarge))
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