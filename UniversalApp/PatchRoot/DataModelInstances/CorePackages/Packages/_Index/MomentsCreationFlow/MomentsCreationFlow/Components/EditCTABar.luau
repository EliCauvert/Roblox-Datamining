local MomentsCreationFlow = script:FindFirstAncestor("MomentsCreationFlow")
local Parent = MomentsCreationFlow.Parent
local BuilderIconsModule = require(Parent.BuilderIcons)
local FoundationModule = require(Parent.Foundation)
local MomentsCommonModule = require(Parent.MomentsCommon)
local ReactModule = require(Parent.React)
local Icon = FoundationModule.Icon
local Text = FoundationModule.Text
local View = FoundationModule.View
local TextUppercaseALowercaseA = BuilderIconsModule.Icon.TextUppercaseALowercaseA
local ThreeBarsVerticalTrianglesHorizontal = BuilderIconsModule.Icon.ThreeBarsVerticalTrianglesHorizontal
local MusicNote = BuilderIconsModule.Icon.MusicNote
local GradientBackdrop = MomentsCommonModule.GradientBackdrop
local CreationFlowStateUpdatedModule = require(MomentsCreationFlow.Actions.CreationFlowStateUpdated)
local UseDeviceInsetsFunction = MomentsCommonModule.Hooks.useDeviceInsets
local UseDispatchFunction = MomentsCommonModule.Hooks.useDispatch
local UseTokensFunction = FoundationModule.Hooks.useTokens
local CreationFlowContextModule = require(MomentsCreationFlow.Context.CreationFlowContext)
local CreationFlowStateModule = require(MomentsCreationFlow.Enums.CreationFlowState)
local CreationFlowLocalizationModule = require(MomentsCreationFlow.Enums.CreationFlowLocalization)
local EventNamesModule = require(MomentsCreationFlow.Analytics.EventNames)

return function(p1) --[[ Line: 40 ]]
	-- upvalues: UseDeviceInsetsFunction (copy), UseTokensFunction (copy), ReactModule (copy), CreationFlowContextModule (copy), UseDispatchFunction (copy), CreationFlowStateUpdatedModule (copy), CreationFlowStateModule (copy), EventNamesModule (copy), View (copy), GradientBackdrop (copy), Icon (copy), ThreeBarsVerticalTrianglesHorizontal (copy), FoundationModule (copy), Text (copy), CreationFlowLocalizationModule (copy), MusicNote (copy), TextUppercaseALowercaseA (copy)
	local UseDeviceInsetsResult = UseDeviceInsetsFunction()
	local UseTokensResult = UseTokensFunction()
	local UseContextResult = ReactModule.useContext(CreationFlowContextModule)
	local UseDispatchResult = UseDispatchFunction()
	local UseBindingResult, UseBindingResult2 = ReactModule.useBinding(UDim2.fromScale(1, 0))
	local UseResult = ReactModule.useCallback(function() --[[ Line: 52 ]]
		-- upvalues: UseDispatchResult (copy), CreationFlowStateUpdatedModule (upval), CreationFlowStateModule (upval), UseContextResult (copy), EventNamesModule (upval)
		UseDispatchResult(CreationFlowStateUpdatedModule(CreationFlowStateModule.Trimming))
		UseContextResult.fireEvent(EventNamesModule.EditingFlowTrimButtonPressed)
	end)
	local UseResult1 = ReactModule.useCallback(function() --[[ Line: 57 ]]
		-- upvalues: UseDispatchResult (copy), CreationFlowStateUpdatedModule (upval), CreationFlowStateModule (upval), UseContextResult (copy), EventNamesModule (upval)
		UseDispatchResult(CreationFlowStateUpdatedModule(CreationFlowStateModule.Music))
		UseContextResult.fireEvent(EventNamesModule.EditingFlowMusicButtonPressed)
	end)
	local UseResult2 = ReactModule.useCallback(function() --[[ Line: 62 ]]
		-- upvalues: UseDispatchResult (copy), CreationFlowStateUpdatedModule (upval), CreationFlowStateModule (upval), UseContextResult (copy), EventNamesModule (upval)
		UseDispatchResult(CreationFlowStateUpdatedModule(CreationFlowStateModule.TextOverlay))
		UseContextResult.fireEvent(EventNamesModule.EditingFlowTextOverlayButtonPressed)
	end)
	
	return ReactModule.createElement(View, {
		tag = "auto-x anchor-center-right position-center-right size-0-full",
		ZIndex = p1.zIndex
	}, {
		GradientBackdrop = ReactModule.createElement(GradientBackdrop, {
			rotation = 180,
			color3 = UseTokensResult.Color.Common.Scrim.Color3,
			size = UseBindingResult
		}),
		EditCTABar = ReactModule.createElement(View, {
			tag = "align-x-right align-y-center anchor-center-right auto-x col gap-small position-center-right size-0-full",
			onAbsoluteSizeChanged = ReactModule.useCallback(function(Frame) --[[ Line: 48 ]]
				-- upvalues: UseBindingResult2 (copy)
				UseBindingResult2(UDim2.new(0, 1.5 * Frame.AbsoluteSize.X, 1, 0))
			end, {})
		}, {
			Padding = ReactModule.createElement("UIPadding", {
				PaddingLeft = UDim.new(0, UseTokensResult.Padding.Large),
				PaddingRight = UDim.new(0, UseDeviceInsetsResult.right + UseTokensResult.Padding.Large)
			}),
			TrimCTAButton = if p1.captureType == Enum.CaptureType.Video then ReactModule.createElement(View, {
				LayoutOrder = 1,
				tag = "align-x-right align-y-center auto-xy row gap-medium padding-xsmall radius-medium",
				onActivated = UseResult
			}, {
				Icon = ReactModule.createElement(Icon, {
					LayoutOrder = 2,
					name = ThreeBarsVerticalTrianglesHorizontal,
					size = FoundationModule.Enums.IconSize.Large
				}),
				Text = if p1.showText then ReactModule.createElement(Text, {
					LayoutOrder = 1,
					tag = "auto-xy text-label-medium content-emphasis",
					Text = UseContextResult.getLocalization(CreationFlowLocalizationModule.EditingCtaTrimming)
				}) else nil
			}) else nil,
			MusicCTAButton = if p1.captureType == Enum.CaptureType.Video or p1.captureType == Enum.CaptureType.Screenshot then ReactModule.createElement(View, {
				LayoutOrder = 2,
				tag = "align-x-right align-y-center auto-xy row gap-medium padding-xsmall radius-medium",
				onActivated = UseResult1
			}, {
				Icon = ReactModule.createElement(Icon, {
					LayoutOrder = 2,
					name = MusicNote,
					size = FoundationModule.Enums.IconSize.Large
				}),
				Text = if p1.showText then ReactModule.createElement(Text, {
					LayoutOrder = 1,
					tag = "auto-xy text-label-medium content-emphasis",
					Text = UseContextResult.getLocalization(CreationFlowLocalizationModule.EditingCtaMusic)
				}) else nil
			}) else nil,
			TextOverlayCTAButton = if p1.captureType == Enum.CaptureType.Video then ReactModule.createElement(View, {
				LayoutOrder = 3,
				tag = "align-x-right align-y-center auto-xy row gap-medium padding-xsmall radius-medium",
				onActivated = UseResult2
			}, {
				Icon = ReactModule.createElement(Icon, {
					LayoutOrder = 2,
					name = TextUppercaseALowercaseA,
					size = FoundationModule.Enums.IconSize.Large
				}),
				Text = if p1.showText then ReactModule.createElement(Text, {
					LayoutOrder = 1,
					tag = "auto-xy text-label-medium content-emphasis",
					Text = UseContextResult.getLocalization(CreationFlowLocalizationModule.EditingCtaTextOverlay)
				}) else nil
			}) else nil
		})
	})
end