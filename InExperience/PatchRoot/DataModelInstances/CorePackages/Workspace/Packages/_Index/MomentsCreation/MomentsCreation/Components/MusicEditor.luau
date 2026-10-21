local MomentsCreation = script:FindFirstAncestor("MomentsCreation")
local Parent = MomentsCreation.Parent
local FoundationModule = require(Parent.Foundation)
local MomentsCommonModule = require(Parent.MomentsCommon)
local ReactModule = require(Parent.React)
local SignalsModule = require(Parent.Signals)
local Button = FoundationModule.Button
local Loading = FoundationModule.Loading
local View = FoundationModule.View
local EditorTopNavModule = require(MomentsCreation.Components.EditorTopNav)
local GradientBackdrop = MomentsCommonModule.Components.GradientBackdrop
local MusicPreviewItemModule = require(MomentsCreation.Components.MusicPreviewItem)
local WaveformModule = require(MomentsCreation.Components.Waveform)
local UseCallbackFunction = ReactModule.useCallback
local UseContextFunction = ReactModule.useContext
local UseEffectFunction = ReactModule.useEffect
local UseMemoFunction = ReactModule.useMemo
local UseDeviceInsetsFunction = MomentsCommonModule.Hooks.useDeviceInsets
local UseToggleStateFunction = MomentsCommonModule.Hooks.useToggleState
local UseTokensFunction = FoundationModule.Hooks.useTokens
local UseSignalBindingFunction = require(Parent.SignalsReact).useSignalBinding
local UseMusicEditorControllerModule = require(MomentsCreation.Hooks.useMusicEditorController)
local UseMusicInfoModule = require(MomentsCreation.Hooks.useMusicInfo)
local DockedEditorContextModule = require(MomentsCreation.Contexts.DockedEditorContext)
local UseCreationFlowStringsModule = require(MomentsCreation.Hooks.useCreationFlowStrings)
local FFlagMomentsCreationMusicEditorRedesignModule = require(MomentsCreation.Flags.FFlagMomentsCreationMusicEditorRedesign)
local FFlagMomentsCreationStartAudioOnLoadModule = require(MomentsCreation.Flags.FFlagMomentsCreationStartAudioOnLoad)
local _ = require(MomentsCreation.Types.CreationFlowTypes)
local _ = require(Parent.MomentsTypes)
local SegmentSelectorWidth = require(MomentsCreation.Constants).AudioWaveform.SegmentSelectorWidth
local _UDim2 = UDim2.new(0, 48, 1, 0)

return function(p1)
	-- upvalues: UseTokensFunction (copy), UseDeviceInsetsFunction (copy), UseCreationFlowStringsModule (copy), UseToggleStateFunction (copy), ReactModule (copy), UseMusicInfoModule (copy), UseEffectFunction (copy), SignalsModule (copy), UseCallbackFunction (copy), FFlagMomentsCreationStartAudioOnLoadModule (copy), UseMusicEditorControllerModule (copy), FFlagMomentsCreationMusicEditorRedesignModule (copy), UseContextFunction (copy), DockedEditorContextModule (copy), UseMemoFunction (copy), UseSignalBindingFunction (copy), View (copy), GradientBackdrop (copy), _UDim2 (copy), SegmentSelectorWidth (copy), WaveformModule (copy), Loading (copy), FoundationModule (copy), MusicPreviewItemModule (copy), EditorTopNavModule (copy), Button (copy)
	local Playback = p1.controller.preview.playback
	local UseTokensResult = UseTokensFunction()
	local UseDeviceInsetsResult = UseDeviceInsetsFunction()
	local UseCreationFlowStringsModuleResult = UseCreationFlowStringsModule()
	local UseToggleStateResult = UseToggleStateFunction(false)
	local UseToggleStateResult1 = UseToggleStateFunction(false)
	local UseRefResult = ReactModule.useRef(nil)
	local UseMusicInfoModuleResult = UseMusicInfoModule(p1.musicEdit.assetId)
	local Duration = if UseMusicInfoModuleResult == nil or UseMusicInfoModuleResult.Duration == nil then 0 else UseMusicInfoModuleResult.Duration
	local UseStateResult, UseStateResult2 = ReactModule.useState(Playback.getDuration(false))
	UseEffectFunction(function()
		-- upvalues: SignalsModule (upval), UseStateResult2 (copy), Playback (copy)
		return SignalsModule.createEffect(function(p2)
			-- upvalues: UseStateResult2 (upval), Playback (upval)
			UseStateResult2(Playback.getDuration(p2))
		end)
	end, { Playback })
	local UseCallbackResult = UseCallbackFunction(function()
		-- upvalues: Playback (copy), UseToggleStateResult1 (copy)
		Playback.setMuted(true)
		Playback.seek(0)
		Playback.pause()
		UseToggleStateResult1.enable()
	end, { Playback, UseToggleStateResult1.enable })
	local UseCallbackResult1 = UseCallbackFunction(function()
		-- upvalues: Playback (copy), UseToggleStateResult1 (copy)
		Playback.setMuted(false)
		Playback.play()
		UseToggleStateResult1.disable()
	end, { Playback, UseToggleStateResult1.disable })
	local UseCallbackResult2 = UseCallbackFunction(function()
		-- upvalues: FFlagMomentsCreationStartAudioOnLoadModule (upval), UseRefResult (copy), p1 (copy), Playback (copy), UseToggleStateResult (copy)
		if FFlagMomentsCreationStartAudioOnLoadModule and UseRefResult.current ~= p1.musicEdit.assetId then
			UseRefResult.current = p1.musicEdit.assetId
			Playback.seek(0)
		end
		Playback.setMuted(false)
		Playback.play()
		UseToggleStateResult.enable()
	end, {
		Playback,
		p1.musicEdit.assetId,
		UseToggleStateResult.enable
	})
	UseEffectFunction(function()
		-- upvalues: UseToggleStateResult (copy)
		UseToggleStateResult.disable()
	end, { p1.musicEdit.assetId, UseToggleStateResult.disable })
	local UseMusicEditorControllerModuleResult = UseMusicEditorControllerModule(UseToggleStateResult.enabled, UseCallbackResult1, UseCallbackResult, p1.onStartTimeChanged, p1.musicEdit, Duration)
	local OnAbsoluteSizeChanged = nil
	
	if FFlagMomentsCreationMusicEditorRedesignModule then
		local UseContextResult = UseContextFunction(DockedEditorContextModule)
		OnAbsoluteSizeChanged = UseCallbackFunction(function(Frame)
			-- upvalues: UseContextResult (copy)
			UseContextResult.setDockedEditorHeight(Frame.AbsoluteSize.Y)
		end, { UseContextResult })
		UseEffectFunction(function()
			-- upvalues: UseContextResult (copy)
			return function()
				-- upvalues: UseContextResult (upval)
				UseContextResult.setDockedEditorHeight(0)
			end
		end, { UseContextResult })
	end
	local WaveformRef = UseMusicEditorControllerModuleResult.waveformRef
	local WaveformPosition = UseMusicEditorControllerModuleResult.waveformPosition
	local WaveformDisplayRef = UseMusicEditorControllerModuleResult.waveformDisplayRef
	local UseSignalBindingResult = UseSignalBindingFunction((UseMemoFunction(function()
		-- upvalues: SignalsModule (upval), Playback (copy)
		return SignalsModule.createComputed(function(p2): number
			-- upvalues: Playback (upval)
			local Duration: number = Playback.getDuration(p2)
			
			return if Duration <= 0 then 0 else math.clamp(Playback.getPosition(p2) / Duration, 0, 1)
		end)
	end, { Playback })))
	local SurfaceColor3 = if FFlagMomentsCreationMusicEditorRedesignModule then UseTokensResult.Color.Surface.Surface_0.Color3 else UseTokensResult.Color.Surface.Surface_100.Color3
	local Element = ReactModule.createElement(View, { LayoutOrder = 2, tag = "size-full-1600" }, {
		Timeline = ReactModule.createElement(View, { tag = "size-full-full clip", ZIndex = 1 }, {
			DragDetector = ReactModule.createElement("UIDragDetector", {
				CursorIcon = "",
				DragStyle = Enum.UIDragDetectorDragStyle.TranslateLine,
				ref = WaveformRef,
				ResponseStyle = Enum.UIDragDetectorResponseStyle.CustomOffset
			}),
			LeftGradientBackdrop = ReactModule.createElement(GradientBackdrop, {
				rotation = 0,
				startingTransparency = 0,
				zIndex = 2,
				color3 = SurfaceColor3,
				size = _UDim2
			}),
			RightGradientBackdrop = ReactModule.createElement(GradientBackdrop, {
				rotation = 180,
				startingTransparency = 0,
				zIndex = 2,
				anchorPoint = Vector2.new(1, 0),
				color3 = SurfaceColor3,
				position = UDim2.fromScale(1, 0),
				size = _UDim2
			}),
			WaveformContainer = ReactModule.createElement(View, {
				tag = "position-center-center anchor-center-center radius-medium",
				Size = UDim2.new(0, SegmentSelectorWidth, 1, 0)
			}, {
				WaveformDisplay = ReactModule.createElement(WaveformModule, {
					zIndex = 1,
					audioAssetId = p1.musicEdit.assetId,
					position = WaveformPosition:map(function(XScale): UDim2
						return UDim2.fromScale(XScale, 0.5)
					end),
					onWaveformReady = UseCallbackResult2,
					ref = WaveformDisplayRef,
					videoDuration = UseStateResult
				})
			})
		}),
		SegmentOutline = ReactModule.createElement(View, {
			tag = "position-center-center anchor-center-center radius-medium",
			ZIndex = 2,
			Size = UDim2.new(0, SegmentSelectorWidth, 1, -UseTokensResult.Size.Size_100),
			stroke = {
				Color = UseTokensResult.Color.System.Contrast.Color3,
				Transparency = UseTokensResult.Color.System.Contrast.Transparency,
				Thickness = UseTokensResult.Stroke.Thick
			}
		}, {
			Scrubber = if UseToggleStateResult.enabled and not UseToggleStateResult1.enabled then ReactModule.createElement(View, {
				tag = "anchor-center-center size-100-1900 radius-circle bg-system-contrast",
				Position = UseSignalBindingResult:map(function(XScale): UDim2
					return UDim2.fromScale(XScale, 0.5)
				end)
			}) else nil,
			LoadingIndicator = if UseToggleStateResult.enabled then nil else ReactModule.createElement(Loading, {
				AnchorPoint = Vector2.new(0.5, 0.5),
				Position = UDim2.fromScale(0.5, 0.5),
				size = FoundationModule.Enums.IconSize.Medium
			})
		})
	})
	local Element1 = ReactModule.createElement(View, {
		tag = "size-full-0 auto-y",
		LayoutOrder = 3,
		padding = if FFlagMomentsCreationMusicEditorRedesignModule then {
			left = UDim.new(0, UseTokensResult.Padding.Large),
			right = UDim.new(0, UseTokensResult.Padding.Large)
		} else nil
	}, {
		MusicPreviewItem = ReactModule.createElement(MusicPreviewItemModule, {
			layoutOrder = 1,
			isPreviewing = false,
			musicAssetId = p1.musicEdit.assetId
		})
	})
	
	return if FFlagMomentsCreationMusicEditorRedesignModule then ReactModule.createElement(View, { tag = "size-full", ZIndex = 5 }, {
		TopNav = ReactModule.createElement(EditorTopNavModule, {
			backTestId = "--moments-creation-view-musiceditor-back",
			saveTestId = "--moments-creation-button-musiceditor-save",
			onBack = p1.onBack,
			onSave = p1.onDone
		}),
		DockedPanel = ReactModule.createElement(View, {
			tag = "col align-x-center align-y-top gap-large position-bottom-center anchor-bottom-center size-full-0 auto-y radius-large bg-surface-0",
			onAbsoluteSizeChanged = OnAbsoluteSizeChanged,
			padding = {
				top = UDim.new(0, UseTokensResult.Padding.XLarge),
				bottom = UDim.new(0, (math.max(UseDeviceInsetsResult.bottom, UseTokensResult.Padding.Small))),
				left = UDim.new(0, UseDeviceInsetsResult.left),
				right = UDim.new(0, UseDeviceInsetsResult.right)
			}
		}, {
			SegmentSelector = Element,
			MusicPreviewItemWrapper = Element1
		})
	}) else ReactModule.createElement(View, {
		tag = "col align-x-center align-y-top gap-large position-bottom-center anchor-bottom-center size-full-0 auto-y radius-medium bg-surface-100",
		ZIndex = 5,
		padding = {
			top = UDim.new(0, UseTokensResult.Padding.Small),
			bottom = UDim.new(0, (math.max(UseDeviceInsetsResult.bottom, UseTokensResult.Padding.Small))),
			left = UDim.new(0, (math.max(UseDeviceInsetsResult.left, UseTokensResult.Padding.Large))),
			right = UDim.new(0, (math.max(UseDeviceInsetsResult.right, UseTokensResult.Padding.Large)))
		}
	}, {
		Nav = ReactModule.createElement(View, {
			LayoutOrder = 1,
			tag = "row flex-x-between align-x-center align-y-center gap-small size-full-0 auto-y"
		}, {
			BackButton = ReactModule.createElement(Button, {
				ZIndex = 6,
				LayoutOrder = 1,
				fillBehavior = FoundationModule.Enums.FillBehavior.Fit,
				text = UseCreationFlowStringsModuleResult.GeneralCtaBack,
				variant = FoundationModule.Enums.ButtonVariant.Text,
				onActivated = p1.onBack,
				size = FoundationModule.Enums.InputSize.Medium
			}),
			DoneButton = ReactModule.createElement(Button, {
				ZIndex = 6,
				LayoutOrder = 2,
				fillBehavior = FoundationModule.Enums.FillBehavior.Fit,
				text = UseCreationFlowStringsModuleResult.GeneralCtaDone,
				variant = FoundationModule.Enums.ButtonVariant.Text,
				onActivated = p1.onDone,
				size = FoundationModule.Enums.InputSize.Medium
			})
		}),
		SegmentSelector = Element,
		MusicPreviewItemWrapper = Element1
	})
end