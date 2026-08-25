local momentsCreation = script:FindFirstAncestor("MomentsCreation")
local parent = momentsCreation.Parent
local foundationModule = require(parent.Foundation)
local momentsCommonModule = require(parent.MomentsCommon)
local reactModule = require(parent.React)
local signalsModule = require(parent.Signals)
local signalsReactModule = require(parent.SignalsReact)
local button = foundationModule.Button
local loading = foundationModule.Loading
local view = foundationModule.View
local gradientBackdrop = momentsCommonModule.Components.GradientBackdrop
local musicPreviewItemModule = require(momentsCreation.Components.MusicPreviewItem)
local waveformModule = require(momentsCreation.Components.Waveform)
local useCallback = reactModule.useCallback
local useEffect = reactModule.useEffect
local useMemo = reactModule.useMemo
local useDeviceInsets = momentsCommonModule.Hooks.useDeviceInsets
local useToggleState = momentsCommonModule.Hooks.useToggleState
local useTokens = foundationModule.Hooks.useTokens
local useSignalBinding = signalsReactModule.useSignalBinding
local useMusicEditorControllerModule = require(momentsCreation.Hooks.useMusicEditorController)
local useMusicInfoModule = require(momentsCreation.Hooks.useMusicInfo)
local constantsModule = require(momentsCreation.Constants)
local useCreationFlowStringsModule = require(momentsCreation.Hooks.useCreationFlowStrings)
local _ = require(momentsCreation.Types.CreationFlowTypes)
local _ = require(parent.MomentsTypes)
local segmentSelectorWidth = constantsModule.AudioWaveform.SegmentSelectorWidth
local uDim2 = UDim2.new(0, 48, 1, 0)

return function(p0)
	-- upvalues: useTokens (ref), useDeviceInsets (ref), useCreationFlowStringsModule (ref), useToggleState (ref), useMusicInfoModule (ref), reactModule (ref), useEffect (ref), signalsModule (ref), useCallback (ref), useMusicEditorControllerModule (ref), useMemo (ref), useSignalBinding (ref), view (ref), button (ref), foundationModule (ref), gradientBackdrop (ref), uDim2 (ref), segmentSelectorWidth (ref), waveformModule (ref), loading (ref), musicPreviewItemModule (ref)
	local playback = p0.controller.preview.playback
	local var13 = useTokens()
	local var14 = useDeviceInsets()
	local var15 = useCreationFlowStringsModule()
	local var16 = useToggleState(false)
	local var17 = useToggleState(false)
	local var18 = useMusicInfoModule(p0.musicEdit.assetId)
	local var19 = if var18 == nil or var18.Duration == nil then 0 else var18.Duration
	local var20, var21 = reactModule.useState(playback.getDuration(false))
	useEffect(function()
		-- upvalues: signalsModule (copy), var21 (ref), playback (ref)
		return signalsModule.createEffect(function(p1)
			-- upvalues: var21 (copy), playback (copy)
			var21(playback.getDuration(p1))
		end)
	end, { playback })
	local var22 = useCallback(function()
		-- upvalues: playback (ref), var17 (ref)
		playback.setMuted(true)
		playback.seek(0)
		playback.pause()
		var17.enable()
	end, { playback, var17.enable })
	local var23 = useCallback(function()
		-- upvalues: playback (ref), var17 (ref)
		playback.setMuted(false)
		playback.play()
		var17.disable()
	end, { playback, var17.disable })
	local var24 = useCallback(function()
		-- upvalues: playback (ref), var16 (ref)
		playback.setMuted(false)
		playback.play()
		var16.enable()
	end, { playback, var16.enable })
	useEffect(function()
		-- upvalues: var16 (ref)
		var16.disable()
	end, { p0.musicEdit.assetId, var16.disable })
	local var25 = useMusicEditorControllerModule(var16.enabled, var23, var22, p0.onStartTimeChanged, p0.musicEdit, var19)
	
	return reactModule.createElement(view, {
		tag = "col align-x-center align-y-top gap-large position-bottom-center anchor-bottom-center size-full-0 auto-y radius-medium bg-surface-100",
		ZIndex = 5,
		padding = {
			top = UDim.new(0, var13.Padding.Small),
			bottom = UDim.new(0, math.max(var14.bottom, var13.Padding.Small)),
			left = UDim.new(0, math.max(var14.left, var13.Padding.Large)),
			right = UDim.new(0, math.max(var14.right, var13.Padding.Large))
		}
	}, {
		Nav = reactModule.createElement(view, {
			LayoutOrder = 1,
			tag = "row flex-x-between align-x-center align-y-center gap-small size-full-0 auto-y"
		}, {
			BackButton = reactModule.createElement(button, {
				ZIndex = 6,
				LayoutOrder = 1,
				fillBehavior = foundationModule.Enums.FillBehavior.Fit,
				text = var15.GeneralCtaBack,
				variant = foundationModule.Enums.ButtonVariant.Text,
				onActivated = p0.onBack,
				size = foundationModule.Enums.InputSize.Medium
			}),
			DoneButton = reactModule.createElement(button, {
				ZIndex = 6,
				LayoutOrder = 2,
				fillBehavior = foundationModule.Enums.FillBehavior.Fit,
				text = var15.GeneralCtaDone,
				variant = foundationModule.Enums.ButtonVariant.Text,
				onActivated = p0.onDone,
				size = foundationModule.Enums.InputSize.Medium
			})
		}),
		SegmentSelector = reactModule.createElement(view, { LayoutOrder = 2, tag = "size-full-1600" }, {
			Timeline = reactModule.createElement(view, { tag = "size-full-full clip", ZIndex = 1 }, {
				DragDetector = reactModule.createElement("UIDragDetector", {
					CursorIcon = "",
					DragStyle = Enum.UIDragDetectorDragStyle.TranslateLine,
					ref = var25.waveformRef,
					ResponseStyle = Enum.UIDragDetectorResponseStyle.CustomOffset
				}),
				LeftGradientBackdrop = reactModule.createElement(gradientBackdrop, {
					rotation = 0,
					startingTransparency = 0,
					zIndex = 2,
					color3 = var13.Color.Surface.Surface_100.Color3,
					size = uDim2
				}),
				RightGradientBackdrop = reactModule.createElement(gradientBackdrop, {
					rotation = 180,
					startingTransparency = 0,
					zIndex = 2,
					anchorPoint = Vector2.new(1, 0),
					color3 = var13.Color.Surface.Surface_100.Color3,
					position = UDim2.fromScale(1, 0),
					size = uDim2
				}),
				WaveformContainer = reactModule.createElement(view, {
					tag = "position-center-center anchor-center-center radius-medium",
					Size = UDim2.new(0, segmentSelectorWidth, 1, 0)
				}, {
					WaveformDisplay = reactModule.createElement(waveformModule, {
						zIndex = 1,
						audioAssetId = p0.musicEdit.assetId,
						position = var25.waveformPosition:map(function(p2)
							return UDim2.fromScale(p2, 0.5)
						end),
						onWaveformReady = var24,
						ref = var25.waveformDisplayRef,
						videoDuration = var20
					})
				})
			}),
			SegmentOutline = reactModule.createElement(view, {
				tag = "position-center-center anchor-center-center radius-medium",
				ZIndex = 2,
				Size = UDim2.new(0, segmentSelectorWidth, 1, -var13.Size.Size_100),
				stroke = {
					Color = var13.Color.System.Contrast.Color3,
					Transparency = var13.Color.System.Contrast.Transparency,
					Thickness = var13.Stroke.Thick
				}
			}, {
				Scrubber = if var16.enabled and not var17.enabled then reactModule.createElement(view, {
					tag = "anchor-center-center size-100-1900 radius-circle bg-system-contrast",
					Position = useSignalBinding(useMemo(function()
						-- upvalues: signalsModule (copy), playback (ref)
						return signalsModule.createComputed(function(p4)
							-- upvalues: playback (copy)
							local duration = playback.getDuration(p4)
							
							return if duration <= 0 then 0 else math.clamp(playback.getPosition(p4) / duration, 0, 1)
						end)
					end, { playback })):map(function(p3)
						return UDim2.fromScale(p3, 0.5)
					end)
				}) else nil,
				LoadingIndicator = if not var16.enabled then reactModule.createElement(loading, {
					AnchorPoint = Vector2.new(0.5, 0.5),
					Position = UDim2.fromScale(0.5, 0.5),
					size = foundationModule.Enums.IconSize.Medium
				}) else nil
			})
		}),
		MusicPreviewItemWrapper = reactModule.createElement(view, { tag = "size-full-0 auto-y", LayoutOrder = 3 }, {
			MusicPreviewItem = reactModule.createElement(musicPreviewItemModule, {
				layoutOrder = 1,
				isPreviewing = false,
				musicAssetId = p0.musicEdit.assetId
			})
		})
	})
end