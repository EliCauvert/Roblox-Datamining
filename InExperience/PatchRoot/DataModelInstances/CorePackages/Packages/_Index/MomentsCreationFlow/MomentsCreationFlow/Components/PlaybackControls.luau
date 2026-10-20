local Parent = script:FindFirstAncestor("MomentsCreationFlow").Parent
local BuilderIconsModule = require(Parent.BuilderIcons)
local FoundationModule = require(Parent.Foundation)
local MomentsCommonModule = require(Parent.MomentsCommon)
local ReactModule = require(Parent.React)
local IconButton = FoundationModule.IconButton
local Slider = FoundationModule.Slider
local Text = FoundationModule.Text
local View = FoundationModule.View
local PlayLarge = BuilderIconsModule.Icon.PlayLarge
local PauseLarge = BuilderIconsModule.Icon.PauseLarge
local Speaker = BuilderIconsModule.Icon.Speaker
local SpeakerSlash = BuilderIconsModule.Icon.SpeakerSlash
local TwoArrowsFromCenter = BuilderIconsModule.Icon.TwoArrowsFromCenter
local TwoArrowsToCenter = BuilderIconsModule.Icon.TwoArrowsToCenter
local GradientBackdrop = MomentsCommonModule.GradientBackdrop
local UseCallbackFunction = ReactModule.useCallback
local UseDeviceInsetsFunction = MomentsCommonModule.Hooks.useDeviceInsets
local UseTokensFunction = FoundationModule.Hooks.useTokens
local GetFormatTimeFunction = MomentsCommonModule.Utils.getFormatTime

return function(p1)
	-- upvalues: UseDeviceInsetsFunction (copy), UseTokensFunction (copy), ReactModule (copy), UseCallbackFunction (copy), View (copy), GradientBackdrop (copy), Slider (copy), FoundationModule (copy), IconButton (copy), PauseLarge (copy), PlayLarge (copy), SpeakerSlash (copy), Speaker (copy), Text (copy), GetFormatTimeFunction (copy), TwoArrowsFromCenter (copy), TwoArrowsToCenter (copy)
	local UseDeviceInsetsResult = UseDeviceInsetsFunction()
	local UseTokensResult = UseTokensFunction()
	local UseBindingResult, UseBindingResult2 = ReactModule.useBinding(UDim2.fromScale(1, 0))
	local UseRefResult = ReactModule.useRef(false)
	
	return ReactModule.createElement(View, { tag = "auto-y size-full-0", LayoutOrder = p1.layoutOrder }, {
		GradientBackdrop = ReactModule.createElement(GradientBackdrop, {
			rotation = 270,
			color3 = UseTokensResult.Color.Common.Scrim.Color3,
			size = UseBindingResult
		}),
		Controls = ReactModule.createElement(View, {
			LayoutOrder = 1,
			tag = "auto-y col gap-xxsmall size-full-0",
			onAbsoluteSizeChanged = ReactModule.useCallback(function(Frame)
				-- upvalues: UseBindingResult2 (copy)
				UseBindingResult2(UDim2.new(0, Frame.AbsoluteSize.X, 1, 0))
			end, {})
		}, {
			Padding = ReactModule.createElement("UIPadding", {
				PaddingBottom = UDim.new(0, UseTokensResult.Padding.Medium),
				PaddingLeft = UDim.new(0, (math.max(UseDeviceInsetsResult.left, UseTokensResult.Padding.Large))),
				PaddingRight = UDim.new(0, (math.max(UseDeviceInsetsResult.right, UseTokensResult.Padding.Large)))
			}),
			Slider = ReactModule.createElement(Slider, {
				LayoutOrder = 1,
				value = p1.playbackController.timeline.elapsed / p1.playbackController.timeline.duration,
				size = FoundationModule.Enums.InputSize.XSmall,
				knobVisibility = FoundationModule.Enums.Visibility.None,
				variant = FoundationModule.Enums.SliderVariant.Standard,
				onValueChanged = ReactModule.useCallback(function(p2)
					-- upvalues: p1 (copy)
					p1.playbackController.timeline.seek(p2 * p1.playbackController.timeline.duration)
				end, {
					p1.playbackController.timeline.duration,
					p1.playbackController.timeline.seek
				}),
				onDragStarted = ReactModule.useCallback(function()
					-- upvalues: p1 (copy), UseRefResult (copy)
					if p1.playbackController.playback.isPlaying then
						UseRefResult.current = true
					end
					p1.playbackController.playback.pause()
				end, { p1.playbackController.playback.isPlaying }),
				onDragEnded = ReactModule.useCallback(function()
					-- upvalues: UseRefResult (copy), p1 (copy)
					if UseRefResult.current then
						p1.playbackController.playback.play()
					end
					UseRefResult.current = false
				end, {})
			}),
			ControlBar = ReactModule.createElement(View, { tag = "auto-y size-full-0", LayoutOrder = 2 }, {
				LeftControlButtons = ReactModule.createElement(View, {
					tag = "auto-xy row gap-xsmall anchor-top-left position-top-left",
					LayoutOrder = 1
				}, {
					PlaybackToggle = ReactModule.createElement(IconButton, {
						LayoutOrder = 1,
						icon = p1.playbackController.playback.isPlaying and PauseLarge or PlayLarge,
						onActivated = UseCallbackFunction(function()
							-- upvalues: p1 (copy)
							p1.playbackController.playback.toggle()
						end, { p1.playbackController }),
						size = FoundationModule.Enums.InputSize.Small
					}),
					MuteToggle = ReactModule.createElement(IconButton, {
						LayoutOrder = 2,
						icon = p1.playbackController.volume.isMuted and SpeakerSlash or Speaker,
						onActivated = UseCallbackFunction(function()
							-- upvalues: p1 (copy)
							p1.playbackController.volume.toggle()
						end, { p1.playbackController }),
						size = FoundationModule.Enums.InputSize.Small
					})
				}),
				DurationDisplay = ReactModule.createElement(Text, {
					LayoutOrder = 2,
					tag = "auto-xy anchor-center-center position-center-center text-body-medium content-emphasis",
					Text = `{GetFormatTimeFunction(p1.playbackController.timeline.elapsed)} / {GetFormatTimeFunction(p1.playbackController.timeline.duration)}`
				}),
				RightControlButtons = ReactModule.createElement(View, {
					tag = "auto-xy row gap-xsmall anchor-top-right position-top-right",
					LayoutOrder = 3
				}, {
					FitModeToggle = ReactModule.createElement(IconButton, {
						LayoutOrder = 1,
						icon = if p1.isFitMode then TwoArrowsFromCenter else TwoArrowsToCenter,
						onActivated = p1.toggleFitMode,
						size = FoundationModule.Enums.InputSize.Small
					})
				})
			})
		})
	})
end