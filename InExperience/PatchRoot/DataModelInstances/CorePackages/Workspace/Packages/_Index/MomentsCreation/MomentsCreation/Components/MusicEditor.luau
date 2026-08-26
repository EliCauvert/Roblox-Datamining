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

return function(p1)
	-- upvalues: useTokens (ref), useDeviceInsets (ref), useCreationFlowStringsModule (ref), useToggleState (ref), useMusicInfoModule (ref), reactModule (ref), useEffect (ref), signalsModule (ref), useCallback (ref), useMusicEditorControllerModule (ref), useMemo (ref), useSignalBinding (ref), view (ref), button (ref), foundationModule (ref), gradientBackdrop (ref), uDim2 (ref), segmentSelectorWidth (ref), waveformModule (ref), loading (ref), musicPreviewItemModule (ref)
	local playback = p1.controller.preview.playback
	local var1 = useTokens()
	local var2 = useDeviceInsets()
	local var3 = useCreationFlowStringsModule()
	local var4 = useToggleState(false)
	local var5 = useToggleState(false)
	local var6 = useMusicInfoModule(p1.musicEdit.assetId)
	local var7 = if var6 == nil or var6.Duration == nil then 0 else var6.Duration
	local var8, var9 = reactModule.useState(playback.getDuration(false))
	useEffect(function()
		-- upvalues: signalsModule (copy), var9 (ref), playback (ref)
		return signalsModule.createEffect(function(p2)
			-- upvalues: var9 (copy), playback (copy)
			var9(playback.getDuration(p2))
		end)
	end, { playback })
	local var10 = useCallback(function()
		-- upvalues: playback (ref), var5 (ref)
		playback.setMuted(true)
		playback.seek(0)
		playback.pause()
		var5.enable()
	end, { playback, var5.enable })
	local var11 = useCallback(function()
		-- upvalues: playback (ref), var5 (ref)
		playback.setMuted(false)
		playback.play()
		var5.disable()
	end, { playback, var5.disable })
	local var12 = useCallback(function()
		-- upvalues: playback (ref), var4 (ref)
		playback.setMuted(false)
		playback.play()
		var4.enable()
	end, { playback, var4.enable })
	useEffect(function()
		-- upvalues: var4 (ref)
		var4.disable()
	end, { p1.musicEdit.assetId, var4.disable })
	local var13 = useMusicEditorControllerModule(var4.enabled, var11, var10, p1.onStartTimeChanged, p1.musicEdit, var7)
	
	return reactModule.createElement(view, {
		tag = "col align-x-center align-y-top gap-large position-bottom-center anchor-bottom-center size-full-0 auto-y radius-medium bg-surface-100",
		ZIndex = 5,
		padding = {
			top = UDim.new(0, var1.Padding.Small),
			bottom = UDim.new(0, math.max(var2.bottom, var1.Padding.Small)),
			left = UDim.new(0, math.max(var2.left, var1.Padding.Large)),
			right = UDim.new(0, math.max(var2.right, var1.Padding.Large))
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
				text = var3.GeneralCtaBack,
				variant = foundationModule.Enums.ButtonVariant.Text,
				onActivated = p1.onBack,
				size = foundationModule.Enums.InputSize.Medium
			}),
			DoneButton = reactModule.createElement(button, {
				ZIndex = 6,
				LayoutOrder = 2,
				fillBehavior = foundationModule.Enums.FillBehavior.Fit,
				text = var3.GeneralCtaDone,
				variant = foundationModule.Enums.ButtonVariant.Text,
				onActivated = p1.onDone,
				size = foundationModule.Enums.InputSize.Medium
			})
		}),
		SegmentSelector = reactModule.createElement(view, { LayoutOrder = 2, tag = "size-full-1600" }, {
			Timeline = reactModule.createElement(view, { tag = "size-full-full clip", ZIndex = 1 }, {
				DragDetector = reactModule.createElement("UIDragDetector", {
					CursorIcon = "",
					DragStyle = Enum.UIDragDetectorDragStyle.TranslateLine,
					ref = var13.waveformRef,
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
					tag = "position-center-center anchor-center-center radius-medium",
					Size = UDim2.new(0, segmentSelectorWidth, 1, 0)
				}, {
					WaveformDisplay = reactModule.createElement(waveformModule, {
						zIndex = 1,
						audioAssetId = p1.musicEdit.assetId,
						position = var13.waveformPosition:map(function(p2)
							return UDim2.fromScale(p2, 0.5)
						end),
						onWaveformReady = var12,
						ref = var13.waveformDisplayRef,
						videoDuration = var8
					})
				})
			}),
			SegmentOutline = reactModule.createElement(view, {
				tag = "position-center-center anchor-center-center radius-medium",
				ZIndex = 2,
				Size = UDim2.new(0, segmentSelectorWidth, 1, -var1.Size.Size_100),
				stroke = {
					Color = var1.Color.System.Contrast.Color3,
					Transparency = var1.Color.System.Contrast.Transparency,
					Thickness = var1.Stroke.Thick
				}
			}, {
				Scrubber = if var4.enabled and not var5.enabled then reactModule.createElement(view, {
					tag = "anchor-center-center size-100-1900 radius-circle bg-system-contrast",
					Position = useSignalBinding(useMemo(function()
						-- upvalues: signalsModule (copy), playback (ref)
						return signalsModule.createComputed(function(p2)
							-- upvalues: playback (copy)
							local duration = playback.getDuration(p2)
							
							return if duration <= 0 then 0 else math.clamp(playback.getPosition(p2) / duration, 0, 1)
						end)
					end, { playback })):map(function(p2)
						return UDim2.fromScale(p2, 0.5)
					end)
				}) else nil,
				LoadingIndicator = if not var4.enabled then reactModule.createElement(loading, {
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
				musicAssetId = p1.musicEdit.assetId
			})
		})
	})
end