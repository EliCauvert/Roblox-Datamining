local momentsCreation = script:FindFirstAncestor("MomentsCreation")
local parent = momentsCreation.Parent
local builderIconsModule = require(parent.BuilderIcons)
local foundationModule = require(parent.Foundation)
local momentsCommonModule = require(parent.MomentsCommon)
local reactModule = require(parent.React)
local signalsModule = require(parent.Signals)
local signalsReactModule = require(parent.SignalsReact)
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
local gradientBackdrop = momentsCommonModule.Components.GradientBackdrop
local useDeviceInsets = momentsCommonModule.Hooks.useDeviceInsets
local useTokens = foundationModule.Hooks.useTokens
local useSignalBinding = signalsReactModule.useSignalBinding
local useSignalState = signalsReactModule.useSignalState
local getFormatTimeModule = require(momentsCreation.Utils.getFormatTime)

return function(p0)
	-- upvalues: useDeviceInsets (ref), useTokens (ref), reactModule (ref), signalsModule (ref), useSignalBinding (ref), getFormatTimeModule (ref), useSignalState (ref), view (ref), gradientBackdrop (ref), slider (ref), foundationModule (ref), iconButton (ref), pauseLarge (ref), playLarge (ref), speakerSlash (ref), speaker (ref), text (ref), twoArrowsFromCenter (ref), twoArrowsToCenter (ref)
	local var8 = useDeviceInsets()
	local var9 = useTokens()
	local playback = p0.preview.playback
	local var10, var11 = reactModule.useBinding(UDim2.fromScale(1, 0))
	local var12 = reactModule.useRef(false)
	local onSeek = p0.onSeek
	
	return reactModule.createElement(view, { tag = "size-full-0 auto-y", LayoutOrder = p0.layoutOrder }, {
		GradientBackdrop = reactModule.createElement(gradientBackdrop, {
			rotation = 270,
			color3 = var9.Color.Common.Scrim.Color3,
			size = var10
		}),
		Controls = reactModule.createElement(view, {
			LayoutOrder = 1,
			tag = "col gap-xxsmall size-full-0 auto-y",
			onAbsoluteSizeChanged = reactModule.useCallback(function(p1)
				-- upvalues: var11 (ref)
				var11(UDim2.new(0, p1.AbsoluteSize.X, 1, 0))
			end, {}),
			padding = {
				bottom = UDim.new(0, var9.Padding.Medium),
				left = UDim.new(0, math.max(var8.left, var9.Padding.Large)),
				right = UDim.new(0, math.max(var8.right, var9.Padding.Large))
			}
		}, {
			Slider = reactModule.createElement(slider, {
				LayoutOrder = 1,
				value = useSignalBinding(reactModule.useMemo(function()
					-- upvalues: signalsModule (copy), playback (ref)
					return signalsModule.createComputed(function(p2)
						-- upvalues: playback (copy)
						local duration = playback.getDuration(p2)
						
						return if duration <= 0 then 0 else math.clamp(playback.getPosition(p2) / duration, 0, 1)
					end)
				end, { playback })),
				size = foundationModule.Enums.InputSize.XSmall,
				knobVisibility = foundationModule.Enums.Visibility.None,
				variant = foundationModule.Enums.SliderVariant.Standard,
				onValueChanged = reactModule.useCallback(function(p3)
					-- upvalues: playback (ref), onSeek (ref)
					local var14 = p3 * playback.getDuration(false)
					playback.seek(var14)
					
					if onSeek then
						onSeek(var14)
					end
				end, { playback, onSeek }),
				onDragStarted = reactModule.useCallback(function()
					-- upvalues: playback (ref), var12 (ref)
					if playback.getIsPlaying(false) then
						var12.current = true
						playback.toggle()
					end
				end, { playback }),
				onDragEnded = reactModule.useCallback(function()
					-- upvalues: var12 (ref), playback (ref)
					if var12.current and not playback.getIsPlaying(false) then
						playback.toggle()
					end
					var12.current = false
				end, { playback })
			}),
			ControlBar = reactModule.createElement(view, { tag = "size-full-0 auto-y", LayoutOrder = 2 }, {
				LeftControlButtons = reactModule.createElement(view, {
					tag = "row gap-xsmall position-top-left anchor-top-left auto-xy",
					LayoutOrder = 1
				}, {
					PlaybackToggle = reactModule.createElement(iconButton, {
						LayoutOrder = 1,
						icon = if useSignalState(playback.getIsPlaying) then pauseLarge else playLarge,
						onActivated = reactModule.useCallback(function()
							-- upvalues: playback (ref)
							playback.toggle()
						end, { playback }),
						size = foundationModule.Enums.InputSize.Small
					}),
					MuteToggle = reactModule.createElement(iconButton, {
						LayoutOrder = 2,
						icon = if useSignalState(playback.getIsMuted) then speakerSlash else speaker,
						onActivated = reactModule.useCallback(function()
							-- upvalues: playback (ref)
							playback.toggleMute()
						end, { playback }),
						size = foundationModule.Enums.InputSize.Small
					})
				}),
				DurationDisplay = reactModule.createElement(text, {
					LayoutOrder = 2,
					tag = "position-center-center anchor-center-center auto-xy text-body-medium content-emphasis",
					Text = useSignalBinding(reactModule.useMemo(function()
						-- upvalues: signalsModule (copy), getFormatTimeModule (copy), playback (ref)
						return signalsModule.createComputed(function(p4)
							-- upvalues: getFormatTimeModule (copy), playback (copy)
							return `{getFormatTimeModule(playback.getPosition(p4))} / {getFormatTimeModule(playback.getDuration(p4))}`
						end)
					end, { playback }))
				}),
				RightControlButtons = reactModule.createElement(view, {
					tag = "row gap-xsmall position-top-right anchor-top-right auto-xy",
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