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

return function(p1)
	-- upvalues: useTokens (ref), useDeviceInsets (ref), reactModule (ref), creationFlowContextModule (ref), useToggleState (ref), useCallback (ref), useMusicEditorControllerModule (ref), view (ref), button (ref), foundationModule (ref), creationFlowLocalizationModule (ref), gradientBackdrop (ref), uDim2 (ref), segmentSelectorWidth (ref), waveformModule (ref), loading (ref), musicPreviewItemModule (ref)
	local var1 = useTokens()
	local var2 = useDeviceInsets()
	local var3 = reactModule.useContext(creationFlowContextModule)
	local var4 = useToggleState(false)
	local var5 = useToggleState(false)
	local var6 = useCallback(function()
		-- upvalues: p1 (ref), var5 (ref)
		p1.playbackController.volume.mute()
		p1.playbackController.timeline.seek(0)
		p1.playbackController.playback.pause()
		var5.enable()
	end, { p1.playbackController.timeline.seek })
	local var7 = useCallback(function()
		-- upvalues: p1 (ref), var5 (ref)
		p1.playbackController.volume.unmute()
		p1.playbackController.playback.play()
		var5.disable()
	end, {})
	local var8 = useCallback(function()
		-- upvalues: p1 (ref), var4 (ref)
		p1.playbackController.volume.unmute()
		p1.playbackController.playback.play()
		var4.enable()
	end, {})
	reactModule.useEffect(function()
		-- upvalues: var4 (ref)
		var4.disable()
	end, { p1.musicEdit.assetId })
	local var9 = useMusicEditorControllerModule(var4.enabled, var7, var6, p1.onStartTimeChanged, p1.musicEdit, p1.playbackController.audio.timeLength)
	
	return reactModule.createElement(view, {
		tag = "auto-y align-x-center align-y-top anchor-bottom-center bg-surface-100 col gap-large position-bottom-center radius-medium size-full-0",
		ZIndex = 5
	}, {
		Padding = reactModule.createElement("UIPadding", {
			PaddingTop = UDim.new(0, var1.Padding.Small),
			PaddingBottom = UDim.new(0, math.max(var2.bottom, var1.Padding.Small)),
			PaddingLeft = UDim.new(0, math.max(var2.left, var1.Padding.Large)),
			PaddingRight = UDim.new(0, math.max(var2.right, var1.Padding.Large))
		}),
		Nav = reactModule.createElement(view, {
			LayoutOrder = 1,
			tag = "align-x-center align-y-center auto-y gap-small row size-full-0 flex-x-between"
		}, {
			BackButton = reactModule.createElement(button, {
				ZIndex = 6,
				LayoutOrder = 1,
				fillBehavior = foundationModule.Enums.FillBehavior.Fit,
				text = var3.getLocalization(creationFlowLocalizationModule.GeneralCtaBack),
				variant = foundationModule.Enums.ButtonVariant.Text,
				onActivated = p1.onBack,
				size = foundationModule.Enums.InputSize.Medium
			}),
			DoneButton = reactModule.createElement(button, {
				ZIndex = 6,
				LayoutOrder = 2,
				fillBehavior = foundationModule.Enums.FillBehavior.Fit,
				text = var3.getLocalization(creationFlowLocalizationModule.GeneralCtaDone),
				variant = foundationModule.Enums.ButtonVariant.Text,
				onActivated = p1.onDone,
				size = foundationModule.Enums.InputSize.Medium
			})
		}),
		SegmentSelector = reactModule.createElement(view, { LayoutOrder = 2, tag = "size-full-1600" }, {
			Timeline = reactModule.createElement(view, { tag = "clip size-full-full", ZIndex = 1 }, {
				DragDetector = reactModule.createElement("UIDragDetector", {
					DragStyle = Enum.UIDragDetectorDragStyle.TranslateLine,
					ref = var9.waveformRef,
					ResponseStyle = Enum.UIDragDetectorResponseStyle.CustomOffset
				}),
				LeftGradientBackdrop = reactModule.createElement(gradientBackdrop, {
					rotation = 0,
					startingTransparency = 0,
					zIndex = 2,
					color3 = var1.Color.Surface.Surface_100.Color3,
					size = uDim2
				}),
				RightGradientBackdrop = reactModule.createElement(gradientBackdrop, {
					rotation = 180,
					startingTransparency = 0,
					zIndex = 2,
					anchorPoint = Vector2.new(1, 0),
					color3 = var1.Color.Surface.Surface_100.Color3,
					position = UDim2.fromScale(1, 0),
					size = uDim2
				}),
				WaveformContainer = reactModule.createElement(view, {
					tag = "anchor-center-center position-center-center radius-medium",
					Size = UDim2.new(0, segmentSelectorWidth, 1, 0)
				}, {
					WaveformDisplay = reactModule.createElement(waveformModule, {
						zIndex = 1,
						audioAssetId = p1.musicEdit.assetId,
						position = var9.waveformPosition:map(function(p2)
							return UDim2.fromScale(p2, 0.5)
						end),
						onWaveformReady = var8,
						ref = var9.waveformDisplayRef,
						videoDuration = p1.playbackController.timeline.duration
					})
				})
			}),
			SegmentOutline = reactModule.createElement(view, {
				tag = "anchor-center-center position-center-center radius-medium",
				ZIndex = 2,
				Size = UDim2.new(0, segmentSelectorWidth, 1, -var1.Size.Size_100)
			}, {
				Scrubber = if var4.enabled and not var5.enabled then reactModule.createElement(view, {
					tag = "anchor-center-center bg-system-contrast size-100-1900 radius-circle",
					Position = UDim2.fromScale(p1.playbackController.timeline.elapsed / p1.playbackController.timeline.duration, 0.5)
				}) else nil,
				LoadingIndicator = if not var4.enabled then reactModule.createElement(loading, {
					AnchorPoint = Vector2.new(0.5, 0.5),
					Position = UDim2.fromScale(0.5, 0.5),
					size = foundationModule.Enums.IconSize.Medium
				}) else nil,
				OutlineStroke = reactModule.createElement("UIStroke", {
					ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
					Color = var1.Color.System.Contrast.Color3,
					Transparency = var1.Color.System.Contrast.Transparency,
					Thickness = var1.Stroke.Thick
				})
			})
		}),
		MusicPreviewItemWrapper = reactModule.createElement(view, { tag = "auto-y size-full-0", LayoutOrder = 3 }, {
			MusicPreviewItem = reactModule.createElement(musicPreviewItemModule, { musicAssetId = p1.musicEdit.assetId })
		})
	})
end