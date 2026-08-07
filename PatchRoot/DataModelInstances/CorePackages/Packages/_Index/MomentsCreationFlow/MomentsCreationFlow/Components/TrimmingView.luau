-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:42:50 2026 Pacific Standard Time.

local momentsCreationFlow = script:FindFirstAncestor("MomentsCreationFlow")
local parent = momentsCreationFlow.Parent
local videoService = game:GetService("VideoService")
local builderIconsModule = require(parent.BuilderIcons)
local foundationModule = require(parent.Foundation)
local momentsCommonModule = require(parent.MomentsCommon)
local reactModule = require(parent.React)
local button = foundationModule.Button
local iconButton = foundationModule.IconButton
local text = foundationModule.Text
local view = foundationModule.View
local playLarge = builderIconsModule.Icon.PlayLarge
local pauseLarge = builderIconsModule.Icon.PauseLarge
local speaker = builderIconsModule.Icon.Speaker
local speakerSlash = builderIconsModule.Icon.SpeakerSlash
local dragHandleModule = require(momentsCreationFlow.Components.DragHandle)
local trimTooltipModule = require(momentsCreationFlow.Components.TrimTooltip)
local useCallback = reactModule.useCallback
local useDeviceInsets = momentsCommonModule.Hooks.useDeviceInsets
local useTokens = foundationModule.Hooks.useTokens
local useTrimDragControllerModule = require(momentsCreationFlow.Hooks.useTrimDragController)
local creationFlowContextModule = require(momentsCreationFlow.Context.CreationFlowContext)
local getContentFromCaptureModule = require(momentsCreationFlow.Utils.getContentFromCapture)
local dragHandleModule_1 = require(momentsCreationFlow.Enums.DragHandle)
local creationFlowLocalizationModule = require(momentsCreationFlow.Enums.CreationFlowLocalization)

return function(p0) --[[ line: 50 ]]
	-- upvalues: useDeviceInsets (ref), useTokens (ref), reactModule (ref), creationFlowContextModule (ref), getContentFromCaptureModule (ref), videoService (ref), useCallback (ref), useTrimDragControllerModule (ref), view (ref), button (ref), foundationModule (ref), creationFlowLocalizationModule (ref), trimTooltipModule (ref), dragHandleModule (ref), dragHandleModule_1 (ref), iconButton (ref), pauseLarge (ref), playLarge (ref), text (ref), speakerSlash (ref), speaker (ref)
	local var13 = useDeviceInsets()
	local var14 = useTokens()
	local var15 = reactModule.useContext(creationFlowContextModule)
	local var16 = reactModule.useRef(false)
	local var17 = reactModule.useRef(false)
	local var18, var19 = reactModule.useState(nil)
	local var20 = reactModule.useRef(nil)
	local var21 = getContentFromCaptureModule(p0.selectedCapture)
	local var22, var23 = reactModule.useState({})
	reactModule.useEffect(function() --[[ line: 63 ]]
		-- upvalues: var20 (ref), videoService (copy), var21 (ref), p0 (ref), var23 (ref)
		task.spawn(function() --[[ line: 64 ]]
			-- upvalues: var20 (copy), videoService (copy), var21 (copy), p0 (copy), var23 (copy)
			local ok, status = pcall(function() --[[ line: 65 ]]
				-- upvalues: var20 (copy), videoService (copy), var21 (copy)
				var20.current = videoService:CreateVideoSamplerAsync(var21)
			end)
			
			if not ok then
				warn("Failed to create VideoSampler:", status)
				
				return
			end
			local t = {}
			
			for i = 0, math.floor(p0.playbackController.timeline.timeLength) - 1 do
				table.insert(t, i)
			end
			var23(var20.current:GetSamplesAtTimesAsync(t))
		end)
	end, { p0.selectedCapture })
	local var24 = useTrimDragControllerModule(true, useCallback(function() --[[ line: 90 ]]
		-- upvalues: var16 (ref), p0 (ref), var17 (ref), var19 (ref)
		if var16.current then
			p0.playbackController.playback.play()
		end
		if not var17.current then
			p0.playbackController.volume.unmute()
		end
		var16.current = false
		var17.current = false
		var19(nil)
	end, {}), useCallback(function(p1) --[[ line: 82 ]]
		-- upvalues: var16 (ref), p0 (ref), var17 (ref), var19 (ref)
		var16.current = p0.playbackController.playback.isPlaying
		var17.current = p0.playbackController.volume.isMuted
		p0.playbackController.volume.mute()
		p0.playbackController.playback.pause()
		var19(p1)
	end, {
		p0.playbackController.playback.isPlaying,
		p0.playbackController.volume.isMuted
	}), useCallback(function(p2, p3) --[[ line: 102 ]]
		-- upvalues: p0 (ref)
		p0.onTrimUpdate({
			startTime = math.clamp(p2 or (if p0.trimEdit then p0.trimEdit.startTime else 0), 0, p0.playbackController.timeline.timeLength),
			endTime = math.clamp(p3 or (if p0.trimEdit then p0.trimEdit.endTime else p0.playbackController.timeline.timeLength), 0, p0.playbackController.timeline.timeLength)
		})
		p0.playbackController.timeline.seek(0)
	end, {
		p0.onTrimUpdate,
		p0.trimEdit,
		p0.playbackController.timeline.timeLength
	}), useCallback(function(p4) --[[ line: 123 ]]
		-- upvalues: p0 (ref)
		p0.playbackController.timeline.seek(p4 * p0.playbackController.timeline.duration)
	end, {
		p0.playbackController.timeline.seek,
		p0.playbackController.timeline.duration
	}), p0.trimEdit, p0.playbackController.timeline.timeLength)
	local dragContainerRef = var24.dragContainerRef
	local leftHandleRef = var24.leftHandleRef
	local rightHandleRef = var24.rightHandleRef
	local scrubberDisplayRef = var24.scrubberDisplayRef
	local scrubberRef = var24.scrubberRef
	local segmentRef = var24.segmentRef
	local leftHandlePosition = var24.leftHandlePosition
	local rightHandlePosition = var24.rightHandlePosition
	
	return reactModule.createElement(view, {
		tag = "align-x-center auto-y align-y-bottom anchor-bottom-center col gap-large position-bottom-center size-full-0",
		LayoutOrder = p0.layoutOrder
	}, {
		Padding = reactModule.createElement("UIPadding", {
			PaddingTop = UDim.new(0, var14.Padding.Small),
			PaddingBottom = UDim.new(0, math.max(var13.bottom, var14.Padding.Small)),
			PaddingLeft = UDim.new(0, math.max(var13.left, var14.Padding.XLarge)),
			PaddingRight = UDim.new(0, math.max(var13.right, var14.Padding.XLarge))
		}),
		Nav = reactModule.createElement(view, {
			LayoutOrder = 1,
			tag = "align-x-center align-y-center auto-y gap-small row size-full-0 flex-x-between"
		}, {
			BackButton = reactModule.createElement(button, {
				LayoutOrder = 1,
				fillBehavior = foundationModule.Enums.FillBehavior.Fit,
				text = var15.getLocalization(creationFlowLocalizationModule.GeneralCtaBack),
				variant = foundationModule.Enums.ButtonVariant.Text,
				onActivated = useCallback(function() --[[ line: 146 ]]
					-- upvalues: p0 (ref)
					if p0.onTrimDiscard then
						p0.onTrimDiscard()
					end
				end, { p0.onTrimDiscard }),
				size = foundationModule.Enums.InputSize.Medium
			}),
			DoneButton = reactModule.createElement(button, {
				LayoutOrder = 2,
				fillBehavior = foundationModule.Enums.FillBehavior.Fit,
				text = var15.getLocalization(creationFlowLocalizationModule.GeneralCtaDone),
				variant = foundationModule.Enums.ButtonVariant.Text,
				onActivated = useCallback(function() --[[ line: 152 ]]
					-- upvalues: p0 (ref)
					if p0.onTrimSave then
						p0.onTrimSave()
					end
				end, { p0.onTrimSave }),
				size = foundationModule.Enums.InputSize.Medium
			})
		}),
		Trimmer = reactModule.createElement(view, {
			LayoutOrder = 2,
			tag = "padding-x-small size-full-1000",
			ZIndex = 2
		}, {
			PaddedContainer = reactModule.createElement(view, {
				tag = "padding-x-medium size-full-full",
				ZIndex = 2,
				ref = dragContainerRef
			}, {
				TrimmerBar = reactModule.createElement(view, { tag = "size-full" }, {
					TrimTooltip = reactModule.createElement(trimTooltipModule, {
						activeHandle = var18,
						leftHandlePosition = leftHandlePosition,
						rightHandlePosition = rightHandlePosition,
						timeLength = p0.playbackController.timeline.timeLength
					}),
					LeftHandle = reactModule.createElement(dragHandleModule, {
						anchorPoint = Vector2.new(1, 0.5),
						position = leftHandlePosition:map(function(p5) --[[ line: 239 ]]
							return UDim2.fromScale(p5, 0.5)
						end),
						dragDetectorRef = leftHandleRef
					}),
					RightHandle = reactModule.createElement(dragHandleModule, {
						isFlipped = true,
						anchorPoint = Vector2.new(0, 0.5),
						position = rightHandlePosition:map(function(p6) --[[ line: 248 ]]
							return UDim2.fromScale(p6, 0.5)
						end),
						dragDetectorRef = rightHandleRef
					}),
					Outline = reactModule.createElement(view, {
						tag = "anchor-center-left",
						ZIndex = 2,
						Position = leftHandlePosition:map(function(p7) --[[ line: 255 ]]
							return UDim2.fromScale(p7, 0.5)
						end),
						Size = reactModule.joinBindings({
							leftHandlePosition = leftHandlePosition,
							rightHandlePosition = rightHandlePosition
						}):map(function(p8) --[[ line: 261 ]]
							return UDim2.fromScale(p8.rightHandlePosition - p8.leftHandlePosition, 1)
						end)
					}, {
						OutlineStroke = reactModule.createElement("UIStroke", {
							ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
							Color = var14.Color.System.Contrast.Color3,
							Transparency = var14.Color.System.Contrast.Transparency,
							Thickness = var14.Stroke.Thicker
						}),
						Scrubber = if var18 and var18 ~= dragHandleModule_1.Scrubber then nil else reactModule.createElement(view, {
							tag = "anchor-center-center bg-system-contrast size-100-1400 radius-circle",
							ref = scrubberDisplayRef,
							Position = UDim2.fromScale(p0.playbackController.timeline.elapsed / p0.playbackController.timeline.duration, 0.5)
						}, {
							DragDetector = reactModule.createElement("UIDragDetector", {
								DragStyle = Enum.UIDragDetectorDragStyle.TranslateLine,
								ref = scrubberRef,
								ResponseStyle = Enum.UIDragDetectorResponseStyle.CustomScale
							})
						}),
						DragDetector = reactModule.createElement("UIDragDetector", {
							DragStyle = Enum.UIDragDetectorDragStyle.TranslateLine,
							ref = segmentRef,
							ResponseStyle = Enum.UIDragDetectorResponseStyle.CustomScale
						})
					}),
					ShadowBlockLeft = reactModule.createElement(view, {
						tag = "anchor-center-left position-center-left",
						ZIndex = 0,
						backgroundStyle = var14.Color.Extended.Black.Black_50,
						Size = leftHandlePosition:map(function(p9) --[[ line: 303 ]]
							return UDim2.fromScale(p9, 1)
						end)
					}),
					ShadowBlockRight = reactModule.createElement(view, {
						tag = "anchor-center-right position-center-right",
						ZIndex = 0,
						backgroundStyle = var14.Color.Extended.Black.Black_50,
						Size = rightHandlePosition:map(function(p10) --[[ line: 312 ]]
							return UDim2.fromScale(1 - p10, 1)
						end)
					})
				})
			}),
			Timeline = reactModule.createElement(view, {
				tag = "bg-surface-100 radius-medium size-full-full",
				ZIndex = 1
			}, {
				OutlineStroke = reactModule.createElement("UIStroke", {
					ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
					Color = var14.Color.Surface.Surface_100.Color3,
					Transparency = var14.Color.Surface.Surface_100.Transparency,
					Thickness = var14.Stroke.Thicker
				}),
				TimelineBar = reactModule.createElement(view, {
					tag = "padding-x-medium size-full-full row",
					layout = { Padding = UDim.new(0, var14.Size.Size_50) }
				}, reactModule.useMemo(function() --[[ line: 166 ]]
					-- upvalues: p0 (ref), reactModule (copy), view (copy), var22 (ref)
					local t = {}
					
					for i = 1, math.floor(p0.playbackController.timeline.timeLength) do
						t[i] = reactModule.createElement(view, { tag = "size-full-full bg-system-neutral shrink" }, {
							content = reactModule.createElement("ImageLabel", {
								BackgroundTransparency = 1,
								Size = UDim2.fromScale(1, 1),
								ImageContent = var22[i] and var22[i].Image,
								ScaleType = Enum.ScaleType.Crop
							})
						})
					end
					return t
				end, { p0.playbackController.timeline.timeLength, var22 }))
			})
		}),
		VideoControls = reactModule.createElement(view, {
			LayoutOrder = 3,
			tag = "align-x-center align-y-center auto-y gap-small row size-full-0 flex-x-between"
		}, {
			PlaybackToggle = reactModule.createElement(iconButton, {
				LayoutOrder = 1,
				icon = if p0.playbackController.playback.isPlaying then pauseLarge else playLarge,
				onActivated = useCallback(function() --[[ line: 158 ]]
					-- upvalues: p0 (ref)
					p0.playbackController.playback.toggle()
				end, { p0.playbackController }),
				size = foundationModule.Enums.InputSize.Medium
			}),
			DurationDisplay = reactModule.createElement(text, {
				LayoutOrder = 2,
				tag = "auto-xy text-label-medium content-default",
				Text = `{string.format("%.1f", math.max(0, p0.playbackController.timeline.elapsed))} / {string.format("%.1f", p0.playbackController.timeline.duration)}`
			}),
			MuteToggle = reactModule.createElement(iconButton, {
				LayoutOrder = 3,
				icon = if p0.playbackController.volume.isMuted then speakerSlash else speaker,
				onActivated = useCallback(function() --[[ line: 162 ]]
					-- upvalues: p0 (ref)
					p0.playbackController.volume.toggle()
				end, { p0.playbackController }),
				size = foundationModule.Enums.InputSize.Medium
			})
		})
	})
end