local MomentsCreationFlow = script:FindFirstAncestor("MomentsCreationFlow")
local Parent = MomentsCreationFlow.Parent
local VideoService = game:GetService("VideoService")
local BuilderIconsModule = require(Parent.BuilderIcons)
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local Button = FoundationModule.Button
local IconButton = FoundationModule.IconButton
local Text = FoundationModule.Text
local View = FoundationModule.View
local PlayLarge = BuilderIconsModule.Icon.PlayLarge
local PauseLarge = BuilderIconsModule.Icon.PauseLarge
local Speaker = BuilderIconsModule.Icon.Speaker
local SpeakerSlash = BuilderIconsModule.Icon.SpeakerSlash
local DragHandleModule = require(MomentsCreationFlow.Components.DragHandle)
local TrimTooltipModule = require(MomentsCreationFlow.Components.TrimTooltip)
local UseCallbackFunction = ReactModule.useCallback
local UseDeviceInsetsFunction = require(Parent.MomentsCommon).Hooks.useDeviceInsets
local UseTokensFunction = FoundationModule.Hooks.useTokens
local UseTrimDragControllerModule = require(MomentsCreationFlow.Hooks.useTrimDragController)
local CreationFlowContextModule = require(MomentsCreationFlow.Context.CreationFlowContext)
local GetContentFromCaptureModule = require(MomentsCreationFlow.Utils.getContentFromCapture)
local DragHandleModule1 = require(MomentsCreationFlow.Enums.DragHandle)
local CreationFlowLocalizationModule = require(MomentsCreationFlow.Enums.CreationFlowLocalization)

return function(p1)
	-- upvalues: UseDeviceInsetsFunction (copy), UseTokensFunction (copy), ReactModule (copy), CreationFlowContextModule (copy), GetContentFromCaptureModule (copy), VideoService (copy), UseCallbackFunction (copy), UseTrimDragControllerModule (copy), View (copy), Button (copy), FoundationModule (copy), CreationFlowLocalizationModule (copy), TrimTooltipModule (copy), DragHandleModule (copy), DragHandleModule1 (copy), IconButton (copy), PauseLarge (copy), PlayLarge (copy), Text (copy), SpeakerSlash (copy), Speaker (copy)
	local UseDeviceInsetsResult = UseDeviceInsetsFunction()
	local UseTokensResult = UseTokensFunction()
	local UseContextResult = ReactModule.useContext(CreationFlowContextModule)
	local UseRefResult = ReactModule.useRef(false)
	local UseRefResult1 = ReactModule.useRef(false)
	local UseStateResult, UseStateResult2 = ReactModule.useState(nil)
	local UseRefResult2 = ReactModule.useRef(nil)
	local ContentFromCaptureModule = GetContentFromCaptureModule(p1.selectedCapture)
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState({})
	ReactModule.useEffect(function()
		-- upvalues: UseRefResult2 (copy), VideoService (upval), ContentFromCaptureModule (copy), p1 (copy), UseStateResult2_1 (copy)
		task.spawn(function()
			-- upvalues: UseRefResult2 (upval), VideoService (upval), ContentFromCaptureModule (upval), p1 (upval), UseStateResult2_1 (upval)
			local Success, Result = pcall(function()
				-- upvalues: UseRefResult2 (upval), VideoService (upval), ContentFromCaptureModule (upval)
				UseRefResult2.current = VideoService:CreateVideoSamplerAsync(ContentFromCaptureModule)
			end)
			
			if not Success then
				warn("Failed to create VideoSampler:", Result)
				
				return
			end
			local List = {}
			
			for i = 0, math.floor(p1.playbackController.timeline.timeLength) - 1 do
				table.insert(List, i)
			end
			UseStateResult2_1(UseRefResult2.current:GetSamplesAtTimesAsync(List))
		end)
	end, { p1.selectedCapture })
	local UseTrimDragControllerModuleResult = UseTrimDragControllerModule(true, UseCallbackFunction(function()
		-- upvalues: UseRefResult (copy), p1 (copy), UseRefResult1 (copy), UseStateResult2 (copy)
		if UseRefResult.current then
			p1.playbackController.playback.play()
		end
		if not UseRefResult1.current then
			p1.playbackController.volume.unmute()
		end
		UseRefResult.current = false
		UseRefResult1.current = false
		UseStateResult2(nil)
	end, {}), UseCallbackFunction(function(p2)
		-- upvalues: UseRefResult (copy), p1 (copy), UseRefResult1 (copy), UseStateResult2 (copy)
		UseRefResult.current = p1.playbackController.playback.isPlaying
		UseRefResult1.current = p1.playbackController.volume.isMuted
		p1.playbackController.volume.mute()
		p1.playbackController.playback.pause()
		UseStateResult2(p2)
	end, {
		p1.playbackController.playback.isPlaying,
		p1.playbackController.volume.isMuted
	}), UseCallbackFunction(function(p2, p3)
		-- upvalues: p1 (copy)
		p1.onTrimUpdate({
			startTime = math.clamp(if p2 then p2 else p1.trimEdit and p1.trimEdit.startTime or 0, 0, p1.playbackController.timeline.timeLength),
			endTime = math.clamp(if p3 then p3 else p1.trimEdit and p1.trimEdit.endTime or p1.playbackController.timeline.timeLength, 0, p1.playbackController.timeline.timeLength)
		})
		p1.playbackController.timeline.seek(0)
	end, {
		p1.onTrimUpdate,
		p1.trimEdit,
		p1.playbackController.timeline.timeLength
	}), UseCallbackFunction(function(p2)
		-- upvalues: p1 (copy)
		p1.playbackController.timeline.seek(p2 * p1.playbackController.timeline.duration)
	end, {
		p1.playbackController.timeline.seek,
		p1.playbackController.timeline.duration
	}), p1.trimEdit, p1.playbackController.timeline.timeLength)
	local ScrubberDisplayRef = UseTrimDragControllerModuleResult.scrubberDisplayRef
	local ScrubberRef = UseTrimDragControllerModuleResult.scrubberRef
	local LeftHandlePosition = UseTrimDragControllerModuleResult.leftHandlePosition
	local RightHandlePosition = UseTrimDragControllerModuleResult.rightHandlePosition
	
	return ReactModule.createElement(View, {
		tag = "align-x-center auto-y align-y-bottom anchor-bottom-center col gap-large position-bottom-center size-full-0",
		LayoutOrder = p1.layoutOrder
	}, {
		Padding = ReactModule.createElement("UIPadding", {
			PaddingTop = UDim.new(0, UseTokensResult.Padding.Small),
			PaddingBottom = UDim.new(0, (math.max(UseDeviceInsetsResult.bottom, UseTokensResult.Padding.Small))),
			PaddingLeft = UDim.new(0, (math.max(UseDeviceInsetsResult.left, UseTokensResult.Padding.XLarge))),
			PaddingRight = UDim.new(0, (math.max(UseDeviceInsetsResult.right, UseTokensResult.Padding.XLarge)))
		}),
		Nav = ReactModule.createElement(View, {
			LayoutOrder = 1,
			tag = "align-x-center align-y-center auto-y gap-small row size-full-0 flex-x-between"
		}, {
			BackButton = ReactModule.createElement(Button, {
				LayoutOrder = 1,
				fillBehavior = FoundationModule.Enums.FillBehavior.Fit,
				text = UseContextResult.getLocalization(CreationFlowLocalizationModule.GeneralCtaBack),
				variant = FoundationModule.Enums.ButtonVariant.Text,
				onActivated = UseCallbackFunction(function()
					-- upvalues: p1 (copy)
					if p1.onTrimDiscard then
						p1.onTrimDiscard()
					end
				end, { p1.onTrimDiscard }),
				size = FoundationModule.Enums.InputSize.Medium
			}),
			DoneButton = ReactModule.createElement(Button, {
				LayoutOrder = 2,
				fillBehavior = FoundationModule.Enums.FillBehavior.Fit,
				text = UseContextResult.getLocalization(CreationFlowLocalizationModule.GeneralCtaDone),
				variant = FoundationModule.Enums.ButtonVariant.Text,
				onActivated = UseCallbackFunction(function()
					-- upvalues: p1 (copy)
					if p1.onTrimSave then
						p1.onTrimSave()
					end
				end, { p1.onTrimSave }),
				size = FoundationModule.Enums.InputSize.Medium
			})
		}),
		Trimmer = ReactModule.createElement(View, {
			LayoutOrder = 2,
			tag = "padding-x-small size-full-1000",
			ZIndex = 2
		}, {
			PaddedContainer = ReactModule.createElement(View, {
				tag = "padding-x-medium size-full-full",
				ZIndex = 2,
				ref = UseTrimDragControllerModuleResult.dragContainerRef
			}, {
				TrimmerBar = ReactModule.createElement(View, { tag = "size-full" }, {
					TrimTooltip = ReactModule.createElement(TrimTooltipModule, {
						activeHandle = UseStateResult,
						leftHandlePosition = LeftHandlePosition,
						rightHandlePosition = RightHandlePosition,
						timeLength = p1.playbackController.timeline.timeLength
					}),
					LeftHandle = ReactModule.createElement(DragHandleModule, {
						anchorPoint = Vector2.new(1, 0.5),
						position = LeftHandlePosition:map(function(XScale): UDim2
							return UDim2.fromScale(XScale, 0.5)
						end),
						dragDetectorRef = UseTrimDragControllerModuleResult.leftHandleRef
					}),
					RightHandle = ReactModule.createElement(DragHandleModule, {
						isFlipped = true,
						anchorPoint = Vector2.new(0, 0.5),
						position = RightHandlePosition:map(function(XScale): UDim2
							return UDim2.fromScale(XScale, 0.5)
						end),
						dragDetectorRef = UseTrimDragControllerModuleResult.rightHandleRef
					}),
					Outline = ReactModule.createElement(View, {
						tag = "anchor-center-left",
						ZIndex = 2,
						Position = LeftHandlePosition:map(function(XScale): UDim2
							return UDim2.fromScale(XScale, 0.5)
						end),
						Size = ReactModule.joinBindings({
							leftHandlePosition = LeftHandlePosition,
							rightHandlePosition = RightHandlePosition
						}):map(function(p2): UDim2
							return UDim2.fromScale(p2.rightHandlePosition - p2.leftHandlePosition, 1)
						end)
					}, {
						OutlineStroke = ReactModule.createElement("UIStroke", {
							ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
							Color = UseTokensResult.Color.System.Contrast.Color3,
							Transparency = UseTokensResult.Color.System.Contrast.Transparency,
							Thickness = UseTokensResult.Stroke.Thicker
						}),
						Scrubber = if UseStateResult and UseStateResult ~= DragHandleModule1.Scrubber then nil else ReactModule.createElement(View, {
							tag = "anchor-center-center bg-system-contrast size-100-1400 radius-circle",
							ref = ScrubberDisplayRef,
							Position = UDim2.fromScale(p1.playbackController.timeline.elapsed / p1.playbackController.timeline.duration, 0.5)
						}, {
							DragDetector = ReactModule.createElement("UIDragDetector", {
								DragStyle = Enum.UIDragDetectorDragStyle.TranslateLine,
								ref = ScrubberRef,
								ResponseStyle = Enum.UIDragDetectorResponseStyle.CustomScale
							})
						}),
						DragDetector = ReactModule.createElement("UIDragDetector", {
							DragStyle = Enum.UIDragDetectorDragStyle.TranslateLine,
							ref = UseTrimDragControllerModuleResult.segmentRef,
							ResponseStyle = Enum.UIDragDetectorResponseStyle.CustomScale
						})
					}),
					ShadowBlockLeft = ReactModule.createElement(View, {
						tag = "anchor-center-left position-center-left",
						ZIndex = 0,
						backgroundStyle = UseTokensResult.Color.Extended.Black.Black_50,
						Size = LeftHandlePosition:map(function(XScale): UDim2
							return UDim2.fromScale(XScale, 1)
						end)
					}),
					ShadowBlockRight = ReactModule.createElement(View, {
						tag = "anchor-center-right position-center-right",
						ZIndex = 0,
						backgroundStyle = UseTokensResult.Color.Extended.Black.Black_50,
						Size = RightHandlePosition:map(function(p2: number): UDim2
							return UDim2.fromScale(1 - p2, 1)
						end)
					})
				})
			}),
			Timeline = ReactModule.createElement(View, {
				tag = "bg-surface-100 radius-medium size-full-full",
				ZIndex = 1
			}, {
				OutlineStroke = ReactModule.createElement("UIStroke", {
					ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
					Color = UseTokensResult.Color.Surface.Surface_100.Color3,
					Transparency = UseTokensResult.Color.Surface.Surface_100.Transparency,
					Thickness = UseTokensResult.Stroke.Thicker
				}),
				TimelineBar = ReactModule.createElement(View, {
					tag = "padding-x-medium size-full-full row",
					layout = { Padding = UDim.new(0, UseTokensResult.Size.Size_50) }
				}, (ReactModule.useMemo(function()
					-- upvalues: p1 (copy), ReactModule (upval), View (upval), UseStateResult1 (copy)
					local Elements = {}
					
					for i = 1, math.floor(p1.playbackController.timeline.timeLength) do
						Elements[i] = ReactModule.createElement(View, { tag = "size-full-full bg-system-neutral shrink" }, {
							content = ReactModule.createElement("ImageLabel", {
								BackgroundTransparency = 1,
								Size = UDim2.fromScale(1, 1),
								ImageContent = UseStateResult1[i] and UseStateResult1[i].Image,
								ScaleType = Enum.ScaleType.Crop
							})
						})
					end
					return Elements
				end, {
					p1.playbackController.timeline.timeLength,
					UseStateResult1
				})))
			})
		}),
		VideoControls = ReactModule.createElement(View, {
			LayoutOrder = 3,
			tag = "align-x-center align-y-center auto-y gap-small row size-full-0 flex-x-between"
		}, {
			PlaybackToggle = ReactModule.createElement(IconButton, {
				LayoutOrder = 1,
				icon = p1.playbackController.playback.isPlaying and PauseLarge or PlayLarge,
				onActivated = UseCallbackFunction(function()
					-- upvalues: p1 (copy)
					p1.playbackController.playback.toggle()
				end, { p1.playbackController }),
				size = FoundationModule.Enums.InputSize.Medium
			}),
			DurationDisplay = ReactModule.createElement(Text, {
				LayoutOrder = 2,
				tag = "auto-xy text-label-medium content-default",
				Text = `{string.format("%.1f", (math.max(0, p1.playbackController.timeline.elapsed)))} / {string.format("%.1f", p1.playbackController.timeline.duration)}`
			}),
			MuteToggle = ReactModule.createElement(IconButton, {
				LayoutOrder = 3,
				icon = p1.playbackController.volume.isMuted and SpeakerSlash or Speaker,
				onActivated = UseCallbackFunction(function()
					-- upvalues: p1 (copy)
					p1.playbackController.volume.toggle()
				end, { p1.playbackController }),
				size = FoundationModule.Enums.InputSize.Medium
			})
		})
	})
end