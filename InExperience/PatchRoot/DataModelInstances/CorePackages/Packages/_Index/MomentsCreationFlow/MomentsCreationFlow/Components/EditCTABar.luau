local momentsCreationFlow = script:FindFirstAncestor("MomentsCreationFlow")
local parent = momentsCreationFlow.Parent
local builderIconsModule = require(parent.BuilderIcons)
local foundationModule = require(parent.Foundation)
local momentsCommonModule = require(parent.MomentsCommon)
local reactModule = require(parent.React)
local icon = foundationModule.Icon
local text = foundationModule.Text
local view = foundationModule.View
local textUppercaseALowercaseA = builderIconsModule.Icon.TextUppercaseALowercaseA
local threeBarsVerticalTrianglesHorizontal = builderIconsModule.Icon.ThreeBarsVerticalTrianglesHorizontal
local musicNote = builderIconsModule.Icon.MusicNote
local gradientBackdrop = momentsCommonModule.GradientBackdrop
local creationFlowStateUpdatedModule = require(momentsCreationFlow.Actions.CreationFlowStateUpdated)
local useDeviceInsets = momentsCommonModule.Hooks.useDeviceInsets
local useDispatch = momentsCommonModule.Hooks.useDispatch
local useTokens = foundationModule.Hooks.useTokens
local creationFlowContextModule = require(momentsCreationFlow.Context.CreationFlowContext)
local creationFlowStateModule = require(momentsCreationFlow.Enums.CreationFlowState)
local creationFlowLocalizationModule = require(momentsCreationFlow.Enums.CreationFlowLocalization)
local eventNamesModule = require(momentsCreationFlow.Analytics.EventNames)

return function(p1)
	-- upvalues: useDeviceInsets (ref), useTokens (ref), reactModule (ref), creationFlowContextModule (ref), useDispatch (ref), creationFlowStateUpdatedModule (ref), creationFlowStateModule (ref), eventNamesModule (ref), view (ref), gradientBackdrop (ref), icon (ref), threeBarsVerticalTrianglesHorizontal (ref), foundationModule (ref), text (ref), creationFlowLocalizationModule (ref), musicNote (ref), textUppercaseALowercaseA (ref)
	local var1 = useDeviceInsets()
	local var2 = useTokens()
	local var3 = reactModule.useContext(creationFlowContextModule)
	local var4 = useDispatch()
	local var5, var6 = reactModule.useBinding(UDim2.fromScale(1, 0))
	
	return reactModule.createElement(view, {
		tag = "auto-x anchor-center-right position-center-right size-0-full",
		ZIndex = p1.zIndex
	}, {
		GradientBackdrop = reactModule.createElement(gradientBackdrop, {
			rotation = 180,
			color3 = var2.Color.Common.Scrim.Color3,
			size = var5
		}),
		EditCTABar = reactModule.createElement(view, {
			tag = "align-x-right align-y-center anchor-center-right auto-x col gap-small position-center-right size-0-full",
			onAbsoluteSizeChanged = reactModule.useCallback(function(p2)
				-- upvalues: var6 (ref)
				var6(UDim2.new(0, 1.5 * p2.AbsoluteSize.X, 1, 0))
			end, {})
		}, {
			Padding = reactModule.createElement("UIPadding", {
				PaddingLeft = UDim.new(0, var2.Padding.Large),
				PaddingRight = UDim.new(0, var1.right + var2.Padding.Large)
			}),
			TrimCTAButton = if p1.captureType == Enum.CaptureType.Video then reactModule.createElement(view, {
				LayoutOrder = 1,
				tag = "align-x-right align-y-center auto-xy row gap-medium padding-xsmall radius-medium",
				onActivated = reactModule.useCallback(function()
					-- upvalues: var4 (ref), creationFlowStateUpdatedModule (copy), creationFlowStateModule (copy), var3 (ref), eventNamesModule (copy)
					var4(creationFlowStateUpdatedModule(creationFlowStateModule.Trimming))
					var3.fireEvent(eventNamesModule.EditingFlowTrimButtonPressed)
				end)
			}, {
				Icon = reactModule.createElement(icon, {
					LayoutOrder = 2,
					name = threeBarsVerticalTrianglesHorizontal,
					size = foundationModule.Enums.IconSize.Large
				}),
				Text = if p1.showText then reactModule.createElement(text, {
					LayoutOrder = 1,
					tag = "auto-xy text-label-medium content-emphasis",
					Text = var3.getLocalization(creationFlowLocalizationModule.EditingCtaTrimming)
				}) else nil
			}) else nil,
			MusicCTAButton = if p1.captureType == Enum.CaptureType.Video or p1.captureType == Enum.CaptureType.Screenshot then reactModule.createElement(view, {
				LayoutOrder = 2,
				tag = "align-x-right align-y-center auto-xy row gap-medium padding-xsmall radius-medium",
				onActivated = reactModule.useCallback(function()
					-- upvalues: var4 (ref), creationFlowStateUpdatedModule (copy), creationFlowStateModule (copy), var3 (ref), eventNamesModule (copy)
					var4(creationFlowStateUpdatedModule(creationFlowStateModule.Music))
					var3.fireEvent(eventNamesModule.EditingFlowMusicButtonPressed)
				end)
			}, {
				Icon = reactModule.createElement(icon, {
					LayoutOrder = 2,
					name = musicNote,
					size = foundationModule.Enums.IconSize.Large
				}),
				Text = if p1.showText then reactModule.createElement(text, {
					LayoutOrder = 1,
					tag = "auto-xy text-label-medium content-emphasis",
					Text = var3.getLocalization(creationFlowLocalizationModule.EditingCtaMusic)
				}) else nil
			}) else nil,
			TextOverlayCTAButton = if p1.captureType == Enum.CaptureType.Video then reactModule.createElement(view, {
				LayoutOrder = 3,
				tag = "align-x-right align-y-center auto-xy row gap-medium padding-xsmall radius-medium",
				onActivated = reactModule.useCallback(function()
					-- upvalues: var4 (ref), creationFlowStateUpdatedModule (copy), creationFlowStateModule (copy), var3 (ref), eventNamesModule (copy)
					var4(creationFlowStateUpdatedModule(creationFlowStateModule.TextOverlay))
					var3.fireEvent(eventNamesModule.EditingFlowTextOverlayButtonPressed)
				end)
			}, {
				Icon = reactModule.createElement(icon, {
					LayoutOrder = 2,
					name = textUppercaseALowercaseA,
					size = foundationModule.Enums.IconSize.Large
				}),
				Text = if p1.showText then reactModule.createElement(text, {
					LayoutOrder = 1,
					tag = "auto-xy text-label-medium content-emphasis",
					Text = var3.getLocalization(creationFlowLocalizationModule.EditingCtaTextOverlay)
				}) else nil
			}) else nil
		})
	})
end