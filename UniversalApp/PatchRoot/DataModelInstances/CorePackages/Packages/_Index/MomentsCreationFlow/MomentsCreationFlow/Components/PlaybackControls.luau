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

return function(p1)
	-- upvalues: useDeviceInsets (ref), useTokens (ref), reactModule (ref), useCallback (ref), view (ref), gradientBackdrop (ref), slider (ref), foundationModule (ref), iconButton (ref), pauseLarge (ref), playLarge (ref), speakerSlash (ref), speaker (ref), text (ref), getFormatTime (ref), twoArrowsFromCenter (ref), twoArrowsToCenter (ref)
	local var1 = useDeviceInsets()
	local var2 = useTokens()
	local var3, var4 = reactModule.useBinding(UDim2.fromScale(1, 0))
	local var5 = reactModule.useRef(false)
	
	return reactModule.createElement(view, { tag = "auto-y size-full-0", LayoutOrder = p1.layoutOrder }, {
		GradientBackdrop = reactModule.createElement(gradientBackdrop, {
			rotation = 270,
			color3 = var2.Color.Common.Scrim.Color3,
			size = var3
		}),
		Controls = reactModule.createElement(view, {
			LayoutOrder = 1,
			tag = "auto-y col gap-xxsmall size-full-0",
			onAbsoluteSizeChanged = reactModule.useCallback(function(p1)
				-- upvalues: var4 (ref)
				var4(UDim2.new(0, p1.AbsoluteSize.X, 1, 0))
			end, {})
		}, {
			Padding = reactModule.createElement("UIPadding", {
				PaddingBottom = UDim.new(0, var2.Padding.Medium),
				PaddingLeft = UDim.new(0, math.max(var1.left, var2.Padding.Large)),
				PaddingRight = UDim.new(0, math.max(var1.right, var2.Padding.Large))
			}),
			Slider = reactModule.createElement(slider, {
				LayoutOrder = 1,
				value = p1.playbackController.timeline.elapsed / p1.playbackController.timeline.duration,
				size = foundationModule.Enums.InputSize.XSmall,
				knobVisibility = foundationModule.Enums.Visibility.None,
				variant = foundationModule.Enums.SliderVariant.Standard,
				onValueChanged = reactModule.useCallback(function(p1)
					-- upvalues: p1 (ref)
					p1.playbackController.timeline.seek(p1 * p1.playbackController.timeline.duration)
				end, {
					p1.playbackController.timeline.duration,
					p1.playbackController.timeline.seek
				}),
				onDragStarted = reactModule.useCallback(function()
					-- upvalues: p1 (ref), var5 (ref)
					if p1.playbackController.playback.isPlaying then
						var5.current = true
					end
					p1.playbackController.playback.pause()
				end, { p1.playbackController.playback.isPlaying }),
				onDragEnded = reactModule.useCallback(function()
					-- upvalues: var5 (ref), p1 (ref)
					if var5.current then
						p1.playbackController.playback.play()
					end
					var5.current = false
				end, {})
			}),
			ControlBar = reactModule.createElement(view, { tag = "auto-y size-full-0", LayoutOrder = 2 }, {
				LeftControlButtons = reactModule.createElement(view, {
					tag = "auto-xy row gap-xsmall anchor-top-left position-top-left",
					LayoutOrder = 1
				}, {
					PlaybackToggle = reactModule.createElement(iconButton, {
						LayoutOrder = 1,
						icon = if p1.playbackController.playback.isPlaying then pauseLarge else playLarge,
						onActivated = useCallback(function()
							-- upvalues: p1 (ref)
							p1.playbackController.playback.toggle()
						end, { p1.playbackController }),
						size = foundationModule.Enums.InputSize.Small
					}),
					MuteToggle = reactModule.createElement(iconButton, {
						LayoutOrder = 2,
						icon = if p1.playbackController.volume.isMuted then speakerSlash else speaker,
						onActivated = useCallback(function()
							-- upvalues: p1 (ref)
							p1.playbackController.volume.toggle()
						end, { p1.playbackController }),
						size = foundationModule.Enums.InputSize.Small
					})
				}),
				DurationDisplay = reactModule.createElement(text, {
					LayoutOrder = 2,
					tag = "auto-xy anchor-center-center position-center-center text-body-medium content-emphasis",
					Text = `{getFormatTime(p1.playbackController.timeline.elapsed)} / {getFormatTime(p1.playbackController.timeline.duration)}`
				}),
				RightControlButtons = reactModule.createElement(view, {
					tag = "auto-xy row gap-xsmall anchor-top-right position-top-right",
					LayoutOrder = 3
				}, {
					FitModeToggle = reactModule.createElement(iconButton, {
						LayoutOrder = 1,
						icon = if p1.isFitMode then twoArrowsFromCenter else twoArrowsToCenter,
						onActivated = p1.toggleFitMode,
						size = foundationModule.Enums.InputSize.Small
					})
				})
			})
		})
	})
end