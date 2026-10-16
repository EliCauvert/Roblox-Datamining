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
local FFlagLuaSupportMicroGamepadPreferredInput = require(Parent.SharedFlags).FFlagLuaSupportMicroGamepadPreferredInput
local FormFactor = MomentsCommonModule.Enums.FormFactor

return function(p1) --[[ Line: 41 | Named "NavigationBar" ]]
	-- upvalues: UseDeviceInsetsFunction (copy), UseFormFactorFunction (copy), UsePreferredInputModule (copy), UseTokensFunction (copy), Moments (copy), Parent (copy), FormFactor (copy), FFlagLuaSupportMicroGamepadPreferredInput (copy), ReactModule (copy), View (copy), IconButton (copy), ChevronLargeUp (copy), FoundationModule (copy), ChevronLargeDown (copy)
	local UseDeviceInsetsResult = UseDeviceInsetsFunction()
	local UseFormFactorResult = UseFormFactorFunction()
	local UsePreferredInputModuleResult = UsePreferredInputModule()
	local UseTokensResult = UseTokensFunction()
	local FFlagMomentsAlignFeedNavArrowsWithHeaderModule = require(Moments.Flags.FFlagMomentsAlignFeedNavArrowsWithHeader)
	local UseCompositionLayoutResult = if FFlagMomentsAlignFeedNavArrowsWithHeaderModule then require(Parent.AppComposition).useCompositionLayout() else nil
	
	if UseFormFactorResult == FormFactor.MobileLandscape then
		return nil
	else
		local IsUsePreferredInputModuleResultMatch: boolean = UsePreferredInputModuleResult == Enum.PreferredInput.Gamepad or FFlagLuaSupportMicroGamepadPreferredInput and UsePreferredInputModuleResult == Enum.PreferredInput.MicroGamepad
		
		return if (UsePreferredInputModuleResult == Enum.PreferredInput.KeyboardAndMouse or IsUsePreferredInputModuleResultMatch) and p1.active then ReactModule.createElement(View, {
			tag = "size-full",
			padding = {
				right = UDim.new(0, if FFlagMomentsAlignFeedNavArrowsWithHeaderModule then require(script.Parent.resolveFeedRightChromeInset)(UseDeviceInsetsResult, if UseCompositionLayoutResult == nil then nil else UseCompositionLayoutResult.margin, UseTokensResult.Padding.XLarge) else math.max(UseDeviceInsetsResult.right, UseTokensResult.Padding.XLarge))
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
end