local Moments = script:FindFirstAncestor("Moments")
local Parent = Moments.Parent
local BuilderIconsModule = require(Parent.BuilderIcons)
local FoundationModule = require(Parent.Foundation)
local MomentsCommonModule = require(Parent.MomentsCommon)
local ReactModule = require(Parent.React)
local ChevronLargeUp = BuilderIconsModule.Icon.ChevronLargeUp
local ChevronLargeDown = BuilderIconsModule.Icon.ChevronLargeDown
local IconButton = FoundationModule.IconButton
local View = FoundationModule.View
local UseDeviceInsetsFunction = MomentsCommonModule.Hooks.useDeviceInsets
local UseFormFactorFunction = MomentsCommonModule.Hooks.useFormFactor
local UsePreferredInputModule = require(Moments.Hooks.usePreferredInput)
local UseTokensFunction = FoundationModule.Hooks.useTokens
local FormFactor = MomentsCommonModule.Enums.FormFactor

return function(p1)
	-- upvalues: UseDeviceInsetsFunction (copy), UseFormFactorFunction (copy), UsePreferredInputModule (copy), UseTokensFunction (copy), FormFactor (copy), ReactModule (copy), View (copy), IconButton (copy), ChevronLargeUp (copy), FoundationModule (copy), ChevronLargeDown (copy)
	local UseDeviceInsetsResult = UseDeviceInsetsFunction()
	local UseFormFactorResult = UseFormFactorFunction()
	local UsePreferredInputModuleResult = UsePreferredInputModule()
	local UseTokensResult = UseTokensFunction()
	
	return if UseFormFactorResult == FormFactor.MobileLandscape then nil elseif (UsePreferredInputModuleResult == Enum.PreferredInput.KeyboardAndMouse or UsePreferredInputModuleResult == Enum.PreferredInput.Gamepad) and p1.active then ReactModule.createElement(View, {
		tag = "size-full",
		padding = {
			right = UDim.new(0, (math.max(UseDeviceInsetsResult.right, UseTokensResult.Padding.XLarge)))
		},
		ZIndex = p1.zIndex
	}, {
		NavControls = ReactModule.createElement(View, {
			tag = "col align-x-center align-y-center position-center-right anchor-center-right auto-xy radius-circle clip bg-over-media-0"
		}, {
			PreviousButton = ReactModule.createElement(IconButton, {
				isCircular = true,
				LayoutOrder = 1,
				icon = ChevronLargeUp,
				isDisabled = p1.currentIndex == 1,
				onActivated = p1.onScrollToPrevious,
				size = FoundationModule.Enums.IconSize.Medium
			}),
			NextButton = ReactModule.createElement(IconButton, {
				isCircular = true,
				LayoutOrder = 2,
				icon = ChevronLargeDown,
				isDisabled = p1.currentIndex == p1.numItems,
				onActivated = p1.onScrollToNext,
				size = FoundationModule.Enums.IconSize.Medium
			})
		})
	}) else nil
end