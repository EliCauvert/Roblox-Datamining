local MomentsCreationFlow = script:FindFirstAncestor("MomentsCreationFlow")
local Parent = MomentsCreationFlow.Parent
local FoundationModule = require(Parent.Foundation)
local MomentsCommonModule = require(Parent.MomentsCommon)
local ReactModule = require(Parent.React)
local Button = FoundationModule.Button
local Loading = FoundationModule.Loading
local View = FoundationModule.View
local GradientBackdrop = MomentsCommonModule.GradientBackdrop
local MusicPreviewItemModule = require(MomentsCreationFlow.Components.MusicPreviewItem)
local WaveformModule = require(MomentsCreationFlow.Components.Waveform)
local UseCallbackFunction = ReactModule.useCallback
local UseDeviceInsetsFunction = MomentsCommonModule.Hooks.useDeviceInsets
local UseMusicEditorControllerModule = require(MomentsCreationFlow.Hooks.useMusicEditorController)
local UseToggleStateFunction = MomentsCommonModule.Hooks.useToggleState
local UseTokensFunction = FoundationModule.Hooks.useTokens
local CreationFlowContextModule = require(MomentsCreationFlow.Context.CreationFlowContext)
local CreationFlowLocalizationModule = require(MomentsCreationFlow.Enums.CreationFlowLocalization)
local SegmentSelectorWidth = require(MomentsCreationFlow.Constants).AudioWaveform.SegmentSelectorWidth
local _UDim2 = UDim2.new(0, 48, 1, 0)

return function(p1) --[[ Line: 43 | Named "MusicEditor" ]]
	-- upvalues: UseTokensFunction (copy), UseDeviceInsetsFunction (copy), ReactModule (copy), CreationFlowContextModule (copy), UseToggleStateFunction (copy), UseCallbackFunction (copy), UseMusicEditorControllerModule (copy), View (copy), Button (copy), FoundationModule (copy), CreationFlowLocalizationModule (copy), GradientBackdrop (copy), _UDim2 (copy), SegmentSelectorWidth (copy), WaveformModule (copy), Loading (copy), MusicPreviewItemModule (copy)
	local UseTokensResult = UseTokensFunction()
	local UseDeviceInsetsResult = UseDeviceInsetsFunction()
	local UseContextResult = ReactModule.useContext(CreationFlowContextModule)
	local UseToggleStateResult = UseToggleStateFunction(false)
	local UseToggleStateResult1 = UseToggleStateFunction(false)
	local UseCallbackResult = UseCallbackFunction(function() --[[ Line: 51 ]]
		-- upvalues: p1 (copy), UseToggleStateResult1 (copy)
		p1.playbackController.volume.mute()
		p1.playbackController.timeline.seek(0)
		p1.playbackController.playback.pause()
		UseToggleStateResult1.enable()
	end, { p1.playbackController.timeline.seek })
	local UseCallbackResult1 = UseCallbackFunction(function() --[[ Line: 58 ]]
		-- upvalues: p1 (copy), UseToggleStateResult1 (copy)
		p1.playbackController.volume.unmute()
		p1.playbackController.playback.play()
		UseToggleStateResult1.disable()
	end, {})
	local UseCallbackResult2 = UseCallbackFunction(function() --[[ Line: 64 ]]
		-- upvalues: p1 (copy), UseToggleStateResult (copy)
		p1.playbackController.volume.unmute()
		p1.playbackController.playback.play()
		UseToggleStateResult.enable()
	end, {})
	ReactModule.useEffect(function() --[[ Line: 70 ]]
		-- upvalues: UseToggleStateResult (copy)
		UseToggleStateResult.disable()
	end, { p1.musicEdit.assetId })
	local UseMusicEditorControllerModuleResult = UseMusicEditorControllerModule(UseToggleStateResult.enabled, UseCallbackResult1, UseCallbackResult, p1.onStartTimeChanged, p1.musicEdit, p1.playbackController.audio.timeLength)
	
	return ReactModule.createElement(View, {
		tag = "auto-y align-x-center align-y-top anchor-bottom-center bg-surface-100 col gap-large position-bottom-center radius-medium size-full-0",
		ZIndex = 5
	}, {
		Padding = ReactModule.createElement("UIPadding", {
			PaddingTop = UDim.new(0, UseTokensResult.Padding.Small),
			PaddingBottom = UDim.new(0, (math.max(UseDeviceInsetsResult.bottom, UseTokensResult.Padding.Small))),
			PaddingLeft = UDim.new(0, (math.max(UseDeviceInsetsResult.left, UseTokensResult.Padding.Large))),
			PaddingRight = UDim.new(0, (math.max(UseDeviceInsetsResult.right, UseTokensResult.Padding.Large)))
		}),
		Nav = ReactModule.createElement(View, {
			LayoutOrder = 1,
			tag = "align-x-center align-y-center auto-y gap-small row size-full-0 flex-x-between"
		}, {
			BackButton = ReactModule.createElement(Button, {
				ZIndex = 6,
				LayoutOrder = 1,
				fillBehavior = FoundationModule.Enums.FillBehavior.Fit,
				text = UseContextResult.getLocalization(CreationFlowLocalizationModule.GeneralCtaBack),
				variant = FoundationModule.Enums.ButtonVariant.Text,
				onActivated = p1.onBack,
				size = FoundationModule.Enums.InputSize.Medium
			}),
			DoneButton = ReactModule.createElement(Button, {
				ZIndex = 6,
				LayoutOrder = 2,
				fillBehavior = FoundationModule.Enums.FillBehavior.Fit,
				text = UseContextResult.getLocalization(CreationFlowLocalizationModule.GeneralCtaDone),
				variant = FoundationModule.Enums.ButtonVariant.Text,
				onActivated = p1.onDone,
				size = FoundationModule.Enums.InputSize.Medium
			})
		}),
		SegmentSelector = ReactModule.createElement(View, { LayoutOrder = 2, tag = "size-full-1600" }, {
			Timeline = ReactModule.createElement(View, { tag = "clip size-full-full", ZIndex = 1 }, {
				DragDetector = ReactModule.createElement("UIDragDetector", {
					DragStyle = Enum.UIDragDetectorDragStyle.TranslateLine,
					ref = UseMusicEditorControllerModuleResult.waveformRef,
					ResponseStyle = Enum.UIDragDetectorResponseStyle.CustomOffset
				}),
				LeftGradientBackdrop = ReactModule.createElement(GradientBackdrop, {
					rotation = 0,
					startingTransparency = 0,
					zIndex = 2,
					color3 = UseTokensResult.Color.Surface.Surface_100.Color3,
					size = _UDim2
				}),
				RightGradientBackdrop = ReactModule.createElement(GradientBackdrop, {
					rotation = 180,
					startingTransparency = 0,
					zIndex = 2,
					anchorPoint = Vector2.new(1, 0),
					color3 = UseTokensResult.Color.Surface.Surface_100.Color3,
					position = UDim2.fromScale(1, 0),
					size = _UDim2
				}),
				WaveformContainer = ReactModule.createElement(View, {
					tag = "anchor-center-center position-center-center radius-medium",
					Size = UDim2.new(0, SegmentSelectorWidth, 1, 0)
				}, {
					WaveformDisplay = ReactModule.createElement(WaveformModule, {
						zIndex = 1,
						audioAssetId = p1.musicEdit.assetId,
						position = UseMusicEditorControllerModuleResult.waveformPosition:map(function(XScale): UDim2 --[[ Line: 161 ]]
							return UDim2.fromScale(XScale, 0.5)
						end),
						onWaveformReady = UseCallbackResult2,
						ref = UseMusicEditorControllerModuleResult.waveformDisplayRef,
						videoDuration = p1.playbackController.timeline.duration
					})
				})
			}),
			SegmentOutline = ReactModule.createElement(View, {
				tag = "anchor-center-center position-center-center radius-medium",
				ZIndex = 2,
				Size = UDim2.new(0, SegmentSelectorWidth, 1, -UseTokensResult.Size.Size_100)
			}, {
				Scrubber = if UseToggleStateResult.enabled and not UseToggleStateResult1.enabled then ReactModule.createElement(View, {
					tag = "anchor-center-center bg-system-contrast size-100-1900 radius-circle",
					Position = UDim2.fromScale(p1.playbackController.timeline.elapsed / p1.playbackController.timeline.duration, 0.5)
				}) else nil,
				LoadingIndicator = if UseToggleStateResult.enabled then nil else ReactModule.createElement(Loading, {
					AnchorPoint = Vector2.new(0.5, 0.5),
					Position = UDim2.fromScale(0.5, 0.5),
					size = FoundationModule.Enums.IconSize.Medium
				}),
				OutlineStroke = ReactModule.createElement("UIStroke", {
					ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
					Color = UseTokensResult.Color.System.Contrast.Color3,
					Transparency = UseTokensResult.Color.System.Contrast.Transparency,
					Thickness = UseTokensResult.Stroke.Thick
				})
			})
		}),
		MusicPreviewItemWrapper = ReactModule.createElement(View, { tag = "auto-y size-full-0", LayoutOrder = 3 }, {
			MusicPreviewItem = ReactModule.createElement(MusicPreviewItemModule, { musicAssetId = p1.musicEdit.assetId })
		})
	})
end