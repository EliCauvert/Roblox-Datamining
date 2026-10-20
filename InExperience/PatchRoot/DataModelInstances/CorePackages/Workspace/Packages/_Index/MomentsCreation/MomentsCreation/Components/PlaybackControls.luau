local MomentsCreation = script:FindFirstAncestor("MomentsCreation")
local Parent = MomentsCreation.Parent
local BuilderIconsModule = require(Parent.BuilderIcons)
local FoundationModule = require(Parent.Foundation)
local MomentsCommonModule = require(Parent.MomentsCommon)
local ReactModule = require(Parent.React)
local SignalsModule = require(Parent.Signals)
local SignalsReactModule = require(Parent.SignalsReact)
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
local GradientBackdrop = MomentsCommonModule.Components.GradientBackdrop
local UseDeviceInsetsFunction = MomentsCommonModule.Hooks.useDeviceInsets
local UseTokensFunction = FoundationModule.Hooks.useTokens
local UseSignalBindingFunction = SignalsReactModule.useSignalBinding
local UseSignalStateFunction = SignalsReactModule.useSignalState
local GetFormatTimeModule = require(MomentsCreation.Utils.getFormatTime)

return function(p1)
	-- upvalues: UseDeviceInsetsFunction (copy), UseTokensFunction (copy), ReactModule (copy), SignalsModule (copy), UseSignalBindingFunction (copy), GetFormatTimeModule (copy), UseSignalStateFunction (copy), View (copy), GradientBackdrop (copy), Slider (copy), FoundationModule (copy), IconButton (copy), PauseLarge (copy), PlayLarge (copy), SpeakerSlash (copy), Speaker (copy), Text (copy), TwoArrowsFromCenter (copy), TwoArrowsToCenter (copy)
	local UseDeviceInsetsResult = UseDeviceInsetsFunction()
	local UseTokensResult = UseTokensFunction()
	local Playback = p1.preview.playback
	local UseBindingResult, UseBindingResult2 = ReactModule.useBinding(UDim2.fromScale(1, 0))
	local UseRefResult = ReactModule.useRef(false)
	local UseSignalBindingResult = UseSignalBindingFunction((ReactModule.useMemo(function()
		-- upvalues: SignalsModule (upval), Playback (copy)
		return SignalsModule.createComputed(function(p2): number
			-- upvalues: Playback (upval)
			local Duration: number = Playback.getDuration(p2)
			
			return if Duration <= 0 then 0 else math.clamp(Playback.getPosition(p2) / Duration, 0, 1)
		end)
	end, { Playback })))
	local UseSignalBindingResult1 = UseSignalBindingFunction((ReactModule.useMemo(function()
		-- upvalues: SignalsModule (upval), GetFormatTimeModule (upval), Playback (copy)
		return SignalsModule.createComputed(function(p2): string
			-- upvalues: GetFormatTimeModule (upval), Playback (upval)
			return `{GetFormatTimeModule(Playback.getPosition(p2))} / {GetFormatTimeModule(Playback.getDuration(p2))}`
		end)
	end, { Playback })))
	local UseSignalStateResult = UseSignalStateFunction(Playback.getIsPlaying)
	local UseSignalStateResult1 = UseSignalStateFunction(Playback.getIsMuted)
	local OnSeekFunction = p1.onSeek
	
	return ReactModule.createElement(View, { tag = "size-full-0 auto-y", LayoutOrder = p1.layoutOrder }, {
		GradientBackdrop = ReactModule.createElement(GradientBackdrop, {
			rotation = 270,
			color3 = UseTokensResult.Color.Common.Scrim.Color3,
			size = UseBindingResult
		}),
		Controls = ReactModule.createElement(View, {
			LayoutOrder = 1,
			tag = "col gap-xxsmall size-full-0 auto-y",
			onAbsoluteSizeChanged = ReactModule.useCallback(function(Frame)
				-- upvalues: UseBindingResult2 (copy)
				UseBindingResult2(UDim2.new(0, Frame.AbsoluteSize.X, 1, 0))
			end, {}),
			padding = {
				bottom = UDim.new(0, UseTokensResult.Padding.Medium),
				left = UDim.new(0, (math.max(UseDeviceInsetsResult.left, UseTokensResult.Padding.Large))),
				right = UDim.new(0, (math.max(UseDeviceInsetsResult.right, UseTokensResult.Padding.Large)))
			}
		}, {
			Slider = ReactModule.createElement(Slider, {
				LayoutOrder = 1,
				value = UseSignalBindingResult,
				size = FoundationModule.Enums.InputSize.XSmall,
				knobVisibility = FoundationModule.Enums.Visibility.None,
				variant = FoundationModule.Enums.SliderVariant.Standard,
				onValueChanged = ReactModule.useCallback(function(p2)
					-- upvalues: Playback (copy), OnSeekFunction (copy)
					local ScaledDuration = p2 * Playback.getDuration(false)
					Playback.seek(ScaledDuration)
					
					if OnSeekFunction then
						OnSeekFunction(ScaledDuration)
					end
				end, { Playback, OnSeekFunction }),
				onDragStarted = ReactModule.useCallback(function()
					-- upvalues: Playback (copy), UseRefResult (copy)
					if Playback.getIsPlaying(false) then
						UseRefResult.current = true
						Playback.toggle()
					end
				end, { Playback }),
				onDragEnded = ReactModule.useCallback(function()
					-- upvalues: UseRefResult (copy), Playback (copy)
					if UseRefResult.current and not Playback.getIsPlaying(false) then
						Playback.toggle()
					end
					UseRefResult.current = false
				end, { Playback })
			}),
			ControlBar = ReactModule.createElement(View, { tag = "size-full-0 auto-y", LayoutOrder = 2 }, {
				LeftControlButtons = ReactModule.createElement(View, {
					tag = "row gap-xsmall position-top-left anchor-top-left auto-xy",
					LayoutOrder = 1
				}, {
					PlaybackToggle = ReactModule.createElement(IconButton, {
						LayoutOrder = 1,
						icon = if UseSignalStateResult then PauseLarge else PlayLarge,
						onActivated = ReactModule.useCallback(function()
							-- upvalues: Playback (copy)
							Playback.toggle()
						end, { Playback }),
						size = FoundationModule.Enums.InputSize.Small
					}),
					MuteToggle = ReactModule.createElement(IconButton, {
						LayoutOrder = 2,
						icon = if UseSignalStateResult1 then SpeakerSlash else Speaker,
						onActivated = ReactModule.useCallback(function()
							-- upvalues: Playback (copy)
							Playback.toggleMute()
						end, { Playback }),
						size = FoundationModule.Enums.InputSize.Small
					})
				}),
				DurationDisplay = ReactModule.createElement(Text, {
					LayoutOrder = 2,
					tag = "position-center-center anchor-center-center auto-xy text-body-medium content-emphasis",
					Text = UseSignalBindingResult1
				}),
				RightControlButtons = ReactModule.createElement(View, {
					tag = "row gap-xsmall position-top-right anchor-top-right auto-xy",
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