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

return function(p1)
	-- upvalues: useDeviceInsets (ref), useTokens (ref), reactModule (ref), creationFlowContextModule (ref), getContentFromCaptureModule (ref), videoService (ref), useCallback (ref), useTrimDragControllerModule (ref), view (ref), button (ref), foundationModule (ref), creationFlowLocalizationModule (ref), trimTooltipModule (ref), dragHandleModule (ref), dragHandleModule_1 (ref), iconButton (ref), pauseLarge (ref), playLarge (ref), text (ref), speakerSlash (ref), speaker (ref)
	local var1 = useDeviceInsets()
	local var2 = useTokens()
	local var3 = reactModule.useContext(creationFlowContextModule)
	local var4 = reactModule.useRef(false)
	local var5 = reactModule.useRef(false)
	local var6, var7 = reactModule.useState(nil)
	local var8 = reactModule.useRef(nil)
	local var9 = getContentFromCaptureModule(p1.selectedCapture)
	local var10, var11 = reactModule.useState({})
	reactModule.useEffect(function()
		-- upvalues: var8 (ref), videoService (copy), var9 (ref), p1 (ref), var11 (ref)
		task.spawn(function()
			-- upvalues: var8 (copy), videoService (copy), var9 (copy), p1 (copy), var11 (copy)
			local ok, status = pcall(function()
				-- upvalues: var8 (copy), videoService (copy), var9 (copy)
				var8.current = videoService:CreateVideoSamplerAsync(var9)
			end)
			
			if not ok then
				warn("Failed to create VideoSampler:", status)
				
				return
			end
			local t = {}
			
			for i = 0, math.floor(p1.playbackController.timeline.timeLength) - 1 do
				table.insert(t, i)
			end
			var11(var8.current:GetSamplesAtTimesAsync(t))
		end)
	end, { p1.selectedCapture })
	local var1 = useTrimDragControllerModule(true, useCallback(function()
		-- upvalues: var4 (ref), p1 (ref), var5 (ref), var7 (ref)
		if var4.current then
			p1.playbackController.playback.play()
		end
		if not var5.current then
			p1.playbackController.volume.unmute()
		end
		var4.current = false
		var5.current = false
		var7(nil)
	end, {}), useCallback(function(p1)
		-- upvalues: var4 (ref), p1 (ref), var5 (ref), var7 (ref)
		var4.current = p1.playbackController.playback.isPlaying
		var5.current = p1.playbackController.volume.isMuted
		p1.playbackController.volume.mute()
		p1.playbackController.playback.pause()
		var7(p1)
	end, {
		p1.playbackController.playback.isPlaying,
		p1.playbackController.volume.isMuted
	}), useCallback(function(p1, p2)
		-- upvalues: p1 (ref)
		p1.onTrimUpdate({
			startTime = math.clamp(p1 or (if p1.trimEdit then p1.trimEdit.startTime else 0), 0, p1.playbackController.timeline.timeLength),
			endTime = math.clamp(p2 or (if p1.trimEdit then p1.trimEdit.endTime else p1.playbackController.timeline.timeLength), 0, p1.playbackController.timeline.timeLength)
		})
		p1.playbackController.timeline.seek(0)
	end, {
		p1.onTrimUpdate,
		p1.trimEdit,
		p1.playbackController.timeline.timeLength
	}), useCallback(function(p1)
		-- upvalues: p1 (ref)
		p1.playbackController.timeline.seek(p1 * p1.playbackController.timeline.duration)
	end, {
		p1.playbackController.timeline.seek,
		p1.playbackController.timeline.duration
	}), p1.trimEdit, p1.playbackController.timeline.timeLength)
	local dragContainerRef = var1.dragContainerRef
	local leftHandleRef = var1.leftHandleRef
	local rightHandleRef = var1.rightHandleRef
	local scrubberDisplayRef = var1.scrubberDisplayRef
	local scrubberRef = var1.scrubberRef
	local segmentRef = var1.segmentRef
	local leftHandlePosition = var1.leftHandlePosition
	local rightHandlePosition = var1.rightHandlePosition
	
	return reactModule.createElement(view, {
		tag = "align-x-center auto-y align-y-bottom anchor-bottom-center col gap-large position-bottom-center size-full-0",
		LayoutOrder = p1.layoutOrder
	}, {
		Padding = reactModule.createElement("UIPadding", {
			PaddingTop = UDim.new(0, var2.Padding.Small),
			PaddingBottom = UDim.new(0, math.max(var1.bottom, var2.Padding.Small)),
			PaddingLeft = UDim.new(0, math.max(var1.left, var2.Padding.XLarge)),
			PaddingRight = UDim.new(0, math.max(var1.right, var2.Padding.XLarge))
		}),
		Nav = reactModule.createElement(view, {
			LayoutOrder = 1,
			tag = "align-x-center align-y-center auto-y gap-small row size-full-0 flex-x-between"
		}, {
			BackButton = reactModule.createElement(button, {
				LayoutOrder = 1,
				fillBehavior = foundationModule.Enums.FillBehavior.Fit,
				text = var3.getLocalization(creationFlowLocalizationModule.GeneralCtaBack),
				variant = foundationModule.Enums.ButtonVariant.Text,
				onActivated = useCallback(function()
					-- upvalues: p1 (ref)
					if p1.onTrimDiscard then
						p1.onTrimDiscard()
					end
				end, { p1.onTrimDiscard }),
				size = foundationModule.Enums.InputSize.Medium
			}),
			DoneButton = reactModule.createElement(button, {
				LayoutOrder = 2,
				fillBehavior = foundationModule.Enums.FillBehavior.Fit,
				text = var3.getLocalization(creationFlowLocalizationModule.GeneralCtaDone),
				variant = foundationModule.Enums.ButtonVariant.Text,
				onActivated = useCallback(function()
					-- upvalues: p1 (ref)
					if p1.onTrimSave then
						p1.onTrimSave()
					end
				end, { p1.onTrimSave }),
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
						activeHandle = var6,
						leftHandlePosition = leftHandlePosition,
						rightHandlePosition = rightHandlePosition,
						timeLength = p1.playbackController.timeline.timeLength
					}),
					LeftHandle = reactModule.createElement(dragHandleModule, {
						anchorPoint = Vector2.new(1, 0.5),
						position = leftHandlePosition:map(function(p1)
							return UDim2.fromScale(p1, 0.5)
						end),
						dragDetectorRef = leftHandleRef
					}),
					RightHandle = reactModule.createElement(dragHandleModule, {
						isFlipped = true,
						anchorPoint = Vector2.new(0, 0.5),
						position = rightHandlePosition:map(function(p1)
							return UDim2.fromScale(p1, 0.5)
						end),
						dragDetectorRef = rightHandleRef
					}),
					Outline = reactModule.createElement(view, {
						tag = "anchor-center-left",
						ZIndex = 2,
						Position = leftHandlePosition:map(function(p1)
							return UDim2.fromScale(p1, 0.5)
						end),
						Size = reactModule.joinBindings({
							leftHandlePosition = leftHandlePosition,
							rightHandlePosition = rightHandlePosition
						}):map(function(p1)
							return UDim2.fromScale(p1.rightHandlePosition - p1.leftHandlePosition, 1)
						end)
					}, {
						OutlineStroke = reactModule.createElement("UIStroke", {
							ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
							Color = var2.Color.System.Contrast.Color3,
							Transparency = var2.Color.System.Contrast.Transparency,
							Thickness = var2.Stroke.Thicker
						}),
						Scrubber = if var6 and var6 ~= dragHandleModule_1.Scrubber then nil else reactModule.createElement(view, {
							tag = "anchor-center-center bg-system-contrast size-100-1400 radius-circle",
							ref = scrubberDisplayRef,
							Position = UDim2.fromScale(p1.playbackController.timeline.elapsed / p1.playbackController.timeline.duration, 0.5)
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
						backgroundStyle = var2.Color.Extended.Black.Black_50,
						Size = leftHandlePosition:map(function(p1)
							return UDim2.fromScale(p1, 1)
						end)
					}),
					ShadowBlockRight = reactModule.createElement(view, {
						tag = "anchor-center-right position-center-right",
						ZIndex = 0,
						backgroundStyle = var2.Color.Extended.Black.Black_50,
						Size = rightHandlePosition:map(function(p1)
							return UDim2.fromScale(1 - p1, 1)
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
					Color = var2.Color.Surface.Surface_100.Color3,
					Transparency = var2.Color.Surface.Surface_100.Transparency,
					Thickness = var2.Stroke.Thicker
				}),
				TimelineBar = reactModule.createElement(view, {
					tag = "padding-x-medium size-full-full row",
					layout = { Padding = UDim.new(0, var2.Size.Size_50) }
				}, reactModule.useMemo(function()
					-- upvalues: p1 (ref), reactModule (copy), view (copy), var10 (ref)
					local t = {}
					
					for i = 1, math.floor(p1.playbackController.timeline.timeLength) do
						t[i] = reactModule.createElement(view, { tag = "size-full-full bg-system-neutral shrink" }, {
							content = reactModule.createElement("ImageLabel", {
								BackgroundTransparency = 1,
								Size = UDim2.fromScale(1, 1),
								ImageContent = var10[i] and var10[i].Image,
								ScaleType = Enum.ScaleType.Crop
							})
						})
					end
					return t
				end, { p1.playbackController.timeline.timeLength, var10 }))
			})
		}),
		VideoControls = reactModule.createElement(view, {
			LayoutOrder = 3,
			tag = "align-x-center align-y-center auto-y gap-small row size-full-0 flex-x-between"
		}, {
			PlaybackToggle = reactModule.createElement(iconButton, {
				LayoutOrder = 1,
				icon = if p1.playbackController.playback.isPlaying then pauseLarge else playLarge,
				onActivated = useCallback(function()
					-- upvalues: p1 (ref)
					p1.playbackController.playback.toggle()
				end, { p1.playbackController }),
				size = foundationModule.Enums.InputSize.Medium
			}),
			DurationDisplay = reactModule.createElement(text, {
				LayoutOrder = 2,
				tag = "auto-xy text-label-medium content-default",
				Text = `{string.format("%.1f", math.max(0, p1.playbackController.timeline.elapsed))} / {string.format("%.1f", p1.playbackController.timeline.duration)}`
			}),
			MuteToggle = reactModule.createElement(iconButton, {
				LayoutOrder = 3,
				icon = if p1.playbackController.volume.isMuted then speakerSlash else speaker,
				onActivated = useCallback(function()
					-- upvalues: p1 (ref)
					p1.playbackController.volume.toggle()
				end, { p1.playbackController }),
				size = foundationModule.Enums.InputSize.Medium
			})
		})
	})
end