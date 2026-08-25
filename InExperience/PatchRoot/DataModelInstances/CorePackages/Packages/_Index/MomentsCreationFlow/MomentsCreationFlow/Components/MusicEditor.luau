local momentsCreationFlow = script:FindFirstAncestor("MomentsCreationFlow")
local parent = momentsCreationFlow.Parent
local foundationModule = require(parent.Foundation)
local momentsCommonModule = require(parent.MomentsCommon)
local reactModule = require(parent.React)
local button = foundationModule.Button
local loading = foundationModule.Loading
local view = foundationModule.View
local gradientBackdrop = momentsCommonModule.GradientBackdrop
local musicPreviewItemModule = require(momentsCreationFlow.Components.MusicPreviewItem)
local waveformModule = require(momentsCreationFlow.Components.Waveform)
local useCallback = reactModule.useCallback
local useDeviceInsets = momentsCommonModule.Hooks.useDeviceInsets
local useMusicEditorControllerModule = require(momentsCreationFlow.Hooks.useMusicEditorController)
local useToggleState = momentsCommonModule.Hooks.useToggleState
local useTokens = foundationModule.Hooks.useTokens
local creationFlowContextModule = require(momentsCreationFlow.Context.CreationFlowContext)
local creationFlowLocalizationModule = require(momentsCreationFlow.Enums.CreationFlowLocalization)
local segmentSelectorWidth = require(momentsCreationFlow.Constants).AudioWaveform.SegmentSelectorWidth
local uDim2 = UDim2.new(0, 48, 1, 0)

return function(p0)
	-- upvalues: useTokens (ref), useDeviceInsets (ref), reactModule (ref), creationFlowContextModule (ref), useToggleState (ref), useCallback (ref), useMusicEditorControllerModule (ref), view (ref), button (ref), foundationModule (ref), creationFlowLocalizationModule (ref), gradientBackdrop (ref), uDim2 (ref), segmentSelectorWidth (ref), waveformModule (ref), loading (ref), musicPreviewItemModule (ref)
	local var10 = useTokens()
	local var11 = useDeviceInsets()
	local var12 = reactModule.useContext(creationFlowContextModule)
	local var13 = useToggleState(false)
	local var14 = useToggleState(false)
	local var15 = useCallback(function()
		-- upvalues: p0 (ref), var14 (ref)
		p0.playbackController.volume.mute()
		p0.playbackController.timeline.seek(0)
		p0.playbackController.playback.pause()
		var14.enable()
	end, { p0.playbackController.timeline.seek })
	local var16 = useCallback(function()
		-- upvalues: p0 (ref), var14 (ref)
		p0.playbackController.volume.unmute()
		p0.playbackController.playback.play()
		var14.disable()
	end, {})
	local var17 = useCallback(function()
		-- upvalues: p0 (ref), var13 (ref)
		p0.playbackController.volume.unmute()
		p0.playbackController.playback.play()
		var13.enable()
	end, {})
	reactModule.useEffect(function()
		-- upvalues: var13 (ref)
		var13.disable()
	end, { p0.musicEdit.assetId })
	local var18 = useMusicEditorControllerModule(var13.enabled, var16, var15, p0.onStartTimeChanged, p0.musicEdit, p0.playbackController.audio.timeLength)
	
	return reactModule.createElement(view, {
		tag = "auto-y align-x-center align-y-top anchor-bottom-center bg-surface-100 col gap-large position-bottom-center radius-medium size-full-0",
		ZIndex = 5
	}, {
		Padding = reactModule.createElement("UIPadding", {
			PaddingTop = UDim.new(0, var10.Padding.Small),
			PaddingBottom = UDim.new(0, math.max(var11.bottom, var10.Padding.Small)),
			PaddingLeft = UDim.new(0, math.max(var11.left, var10.Padding.Large)),
			PaddingRight = UDim.new(0, math.max(var11.right, var10.Padding.Large))
		}),
		Nav = reactModule.createElement(view, {
			LayoutOrder = 1,
			tag = "align-x-center align-y-center auto-y gap-small row size-full-0 flex-x-between"
		}, {
			BackButton = reactModule.createElement(button, {
				ZIndex = 6,
				LayoutOrder = 1,
				fillBehavior = foundationModule.Enums.FillBehavior.Fit,
				text = var12.getLocalization(creationFlowLocalizationModule.GeneralCtaBack),
				variant = foundationModule.Enums.ButtonVariant.Text,
				onActivated = p0.onBack,
				size = foundationModule.Enums.InputSize.Medium
			}),
			DoneButton = reactModule.createElement(button, {
				ZIndex = 6,
				LayoutOrder = 2,
				fillBehavior = foundationModule.Enums.FillBehavior.Fit,
				text = var12.getLocalization(creationFlowLocalizationModule.GeneralCtaDone),
				variant = foundationModule.Enums.ButtonVariant.Text,
				onActivated = p0.onDone,
				size = foundationModule.Enums.InputSize.Medium
			})
		}),
		SegmentSelector = reactModule.createElement(view, { LayoutOrder = 2, tag = "size-full-1600" }, {
			Timeline = reactModule.createElement(view, { tag = "clip size-full-full", ZIndex = 1 }, {
				DragDetector = reactModule.createElement("UIDragDetector", {
					DragStyle = Enum.UIDragDetectorDragStyle.TranslateLine,
					ref = var18.waveformRef,
					ResponseStyle = Enum.UIDragDetectorResponseStyle.CustomOffset
				}),
				LeftGradientBackdrop = reactModule.createElement(gradientBackdrop, {
					rotation = 0,
					startingTransparency = 0,
					zIndex = 2,
					color3 = var10.Color.Surface.Surface_100.Color3,
					size = uDim2
				}),
				RightGradientBackdrop = reactModule.createElement(gradientBackdrop, {
					rotation = 180,
					startingTransparency = 0,
					zIndex = 2,
					anchorPoint = Vector2.new(1, 0),
					color3 = var10.Color.Surface.Surface_100.Color3,
					position = UDim2.fromScale(1, 0),
					size = uDim2
				}),
				WaveformContainer = reactModule.createElement(view, {
					tag = "anchor-center-center position-center-center radius-medium",
					Size = UDim2.new(0, segmentSelectorWidth, 1, 0)
				}, {
					WaveformDisplay = reactModule.createElement(waveformModule, {
						zIndex = 1,
						audioAssetId = p0.musicEdit.assetId,
						position = var18.waveformPosition:map(function(p1)
							return UDim2.fromScale(p1, 0.5)
						end),
						onWaveformReady = var17,
						ref = var18.waveformDisplayRef,
						videoDuration = p0.playbackController.timeline.duration
					})
				})
			}),
			SegmentOutline = reactModule.createElement(view, {
				tag = "anchor-center-center position-center-center radius-medium",
				ZIndex = 2,
				Size = UDim2.new(0, segmentSelectorWidth, 1, -var10.Size.Size_100)
			}, {
				Scrubber = if var13.enabled and not var14.enabled then reactModule.createElement(view, {
					tag = "anchor-center-center bg-system-contrast size-100-1900 radius-circle",
					Position = UDim2.fromScale(p0.playbackController.timeline.elapsed / p0.playbackController.timeline.duration, 0.5)
				}) else nil,
				LoadingIndicator = if not var13.enabled then reactModule.createElement(loading, {
					AnchorPoint = Vector2.new(0.5, 0.5),
					Position = UDim2.fromScale(0.5, 0.5),
					size = foundationModule.Enums.IconSize.Medium
				}) else nil,
				OutlineStroke = reactModule.createElement("UIStroke", {
					ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
					Color = var10.Color.System.Contrast.Color3,
					Transparency = var10.Color.System.Contrast.Transparency,
					Thickness = var10.Stroke.Thick
				})
			})
		}),
		MusicPreviewItemWrapper = reactModule.createElement(view, { tag = "auto-y size-full-0", LayoutOrder = 3 }, {
			MusicPreviewItem = reactModule.createElement(musicPreviewItemModule, { musicAssetId = p0.musicEdit.assetId })
		})
	})
end