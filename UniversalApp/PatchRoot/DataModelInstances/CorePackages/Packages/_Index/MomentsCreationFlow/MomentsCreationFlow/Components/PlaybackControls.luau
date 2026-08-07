local parent = script:FindFirstAncestor("MomentsCreationFlow").Parent
local builderIconsModule = require(parent.BuilderIcons)
local foundationModule = require(parent.Foundation)
local momentsCommonModule = require(parent.MomentsCommon)
local reactModule = require(parent.React)
local iconButton = foundationModule.IconButton
local slider = foundationModule.Slider
local text = foundationModule.Text
local view = foundationModule.View
local playLarge = builderIconsModule.Icon.PlayLarge
local pauseLarge = builderIconsModule.Icon.PauseLarge
local speaker = builderIconsModule.Icon.Speaker
local speakerSlash = builderIconsModule.Icon.SpeakerSlash
local twoArrowsFromCenter = builderIconsModule.Icon.TwoArrowsFromCenter
local twoArrowsToCenter = builderIconsModule.Icon.TwoArrowsToCenter
local gradientBackdrop = momentsCommonModule.GradientBackdrop
local useCallback = reactModule.useCallback
local useDeviceInsets = momentsCommonModule.Hooks.useDeviceInsets
local useTokens = foundationModule.Hooks.useTokens
local getFormatTime = momentsCommonModule.Utils.getFormatTime

return function(p0) --[[ line: 40 | named "PlaybackControls" ]]
	-- upvalues: useDeviceInsets (ref), useTokens (ref), reactModule (ref), useCallback (ref), view (ref), gradientBackdrop (ref), slider (ref), foundationModule (ref), iconButton (ref), pauseLarge (ref), playLarge (ref), speakerSlash (ref), speaker (ref), text (ref), getFormatTime (ref), twoArrowsFromCenter (ref), twoArrowsToCenter (ref)
	local var4 = useDeviceInsets()
	local var5 = useTokens()
	local var6, var7 = reactModule.useBinding(UDim2.fromScale(1, 0))
	local var8 = reactModule.useRef(false)
	
	return reactModule.createElement(view, { tag = "auto-y size-full-0", LayoutOrder = p0.layoutOrder }, {
		GradientBackdrop = reactModule.createElement(gradientBackdrop, {
			rotation = 270,
			color3 = var5.Color.Common.Scrim.Color3,
			size = var6
		}),
		Controls = reactModule.createElement(view, {
			LayoutOrder = 1,
			tag = "auto-y col gap-xxsmall size-full-0",
			onAbsoluteSizeChanged = reactModule.useCallback(function(p1) --[[ line: 65 ]]
				-- upvalues: var7 (ref)
				var7(UDim2.new(0, p1.AbsoluteSize.X, 1, 0))
			end, {})
		}, {
			Padding = reactModule.createElement("UIPadding", {
				PaddingBottom = UDim.new(0, var5.Padding.Medium),
				PaddingLeft = UDim.new(0, math.max(var4.left, var5.Padding.Large)),
				PaddingRight = UDim.new(0, math.max(var4.right, var5.Padding.Large))
			}),
			Slider = reactModule.createElement(slider, {
				LayoutOrder = 1,
				value = p0.playbackController.timeline.elapsed / p0.playbackController.timeline.duration,
				size = foundationModule.Enums.InputSize.XSmall,
				knobVisibility = foundationModule.Enums.Visibility.None,
				variant = foundationModule.Enums.SliderVariant.Standard,
				onValueChanged = reactModule.useCallback(function(p2) --[[ line: 61 ]]
					-- upvalues: p0 (ref)
					p0.playbackController.timeline.seek(p2 * p0.playbackController.timeline.duration)
				end, {
					p0.playbackController.timeline.duration,
					p0.playbackController.timeline.seek
				}),
				onDragStarted = reactModule.useCallback(function() --[[ line: 47 ]]
					-- upvalues: p0 (ref), var8 (ref)
					if p0.playbackController.playback.isPlaying then
						var8.current = true
					end
					p0.playbackController.playback.pause()
				end, { p0.playbackController.playback.isPlaying }),
				onDragEnded = reactModule.useCallback(function() --[[ line: 54 ]]
					-- upvalues: var8 (ref), p0 (ref)
					if var8.current then
						p0.playbackController.playback.play()
					end
					var8.current = false
				end, {})
			}),
			ControlBar = reactModule.createElement(view, { tag = "auto-y size-full-0", LayoutOrder = 2 }, {
				LeftControlButtons = reactModule.createElement(view, {
					tag = "auto-xy row gap-xsmall anchor-top-left position-top-left",
					LayoutOrder = 1
				}, {
					PlaybackToggle = reactModule.createElement(iconButton, {
						LayoutOrder = 1,
						icon = if p0.playbackController.playback.isPlaying then pauseLarge else playLarge,
						onActivated = useCallback(function() --[[ line: 69 ]]
							-- upvalues: p0 (ref)
							p0.playbackController.playback.toggle()
						end, { p0.playbackController }),
						size = foundationModule.Enums.InputSize.Small
					}),
					MuteToggle = reactModule.createElement(iconButton, {
						LayoutOrder = 2,
						icon = if p0.playbackController.volume.isMuted then speakerSlash else speaker,
						onActivated = useCallback(function() --[[ line: 73 ]]
							-- upvalues: p0 (ref)
							p0.playbackController.volume.toggle()
						end, { p0.playbackController }),
						size = foundationModule.Enums.InputSize.Small
					})
				}),
				DurationDisplay = reactModule.createElement(text, {
					LayoutOrder = 2,
					tag = "auto-xy anchor-center-center position-center-center text-body-medium content-emphasis",
					Text = `{getFormatTime(p0.playbackController.timeline.elapsed)} / {getFormatTime(p0.playbackController.timeline.duration)}`
				}),
				RightControlButtons = reactModule.createElement(view, {
					tag = "auto-xy row gap-xsmall anchor-top-right position-top-right",
					LayoutOrder = 3
				}, {
					FitModeToggle = reactModule.createElement(iconButton, {
						LayoutOrder = 1,
						icon = if p0.isFitMode then twoArrowsFromCenter else twoArrowsToCenter,
						onActivated = p0.toggleFitMode,
						size = foundationModule.Enums.InputSize.Small
					})
				})
			})
		})
	})
end