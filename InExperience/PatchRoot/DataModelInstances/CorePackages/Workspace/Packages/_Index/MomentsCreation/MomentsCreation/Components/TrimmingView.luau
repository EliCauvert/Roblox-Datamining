local momentsCreation = script:FindFirstAncestor("MomentsCreation")
local parent = momentsCreation.Parent
local builderIconsModule = require(parent.BuilderIcons)
local foundationModule = require(parent.Foundation)
local momentsCommonModule = require(parent.MomentsCommon)
local reactModule = require(parent.React)
local signalsModule = require(parent.Signals)
local signalsReactModule = require(parent.SignalsReact)
local button = foundationModule.Button
local iconButton = foundationModule.IconButton
local text = foundationModule.Text
local view = foundationModule.View
local playLarge = builderIconsModule.Icon.PlayLarge
local pauseLarge = builderIconsModule.Icon.PauseLarge
local speaker = builderIconsModule.Icon.Speaker
local speakerSlash = builderIconsModule.Icon.SpeakerSlash
local useCallback = reactModule.useCallback
local useEffect = reactModule.useEffect
local useMemo = reactModule.useMemo
local useRef = reactModule.useRef
local useState = reactModule.useState
local useDeviceInsets = momentsCommonModule.Hooks.useDeviceInsets
local useTokens = foundationModule.Hooks.useTokens
local useSignalState = signalsReactModule.useSignalState
local useSignalBinding = signalsReactModule.useSignalBinding
local dragHandleModule = require(momentsCreation.Components.DragHandle)
local trimTooltipModule = require(momentsCreation.Components.TrimTooltip)
local useTrimDragControllerModule = require(momentsCreation.Hooks.useTrimDragController)
local getCaptureVideoContentModule = require(momentsCreation.Capture.getCaptureVideoContent)
local sampleVideoFramesModule = require(momentsCreation.Capture.sampleVideoFrames)
local dragHandleModule_1 = require(momentsCreation.Enums.DragHandle)
local useCreationFlowStringsModule = require(momentsCreation.Hooks.useCreationFlowStrings)
local _ = require(momentsCreation.Types.CreationFlowTypes)

return function(p0)
	-- upvalues: useDeviceInsets (ref), useTokens (ref), useCreationFlowStringsModule (ref), useSignalState (ref), useMemo (ref), signalsModule (ref), useRef (ref), useState (ref), useEffect (ref), getCaptureVideoContentModule (ref), sampleVideoFramesModule (ref), useCallback (ref), useTrimDragControllerModule (ref), useSignalBinding (ref), reactModule (ref), view (ref), button (ref), foundationModule (ref), trimTooltipModule (ref), dragHandleModule (ref), dragHandleModule_1 (ref), iconButton (ref), pauseLarge (ref), playLarge (ref), text (ref), speakerSlash (ref), speaker (ref)
	local controller = p0.controller
	local playback = controller.preview.playback
	local var14 = useDeviceInsets()
	local var15 = useTokens()
	local var16 = useCreationFlowStringsModule()
	local var17 = useSignalState(controller.getSelectedCapture)
	local var18 = useSignalState(playback.getTimeLength)
	local var19 = useSignalState(playback.getIsPlaying)
	local var20 = useSignalState(playback.getIsMuted)
	local var21 = useSignalState(useMemo(function()
		-- upvalues: signalsModule (copy), controller (ref)
		return signalsModule.createComputed(function(p1)
			-- upvalues: controller (copy)
			local activeSession = controller.getActiveSession(p1)
			
			return if activeSession == nil then nil else activeSession.getDraft(p1)
		end)
	end, { controller }))
	local var22 = useRef(false)
	local var23 = useRef(false)
	local var24, var25 = useState(nil)
	local var26, var27 = useState({})
	useEffect(function()
		-- upvalues: var17 (ref), var18 (ref), getCaptureVideoContentModule (copy), sampleVideoFramesModule (copy), var27 (ref)
		if var17 == nil or var18 <= 0 then return end
		local var30 = getCaptureVideoContentModule(var17)
		
		if var30 == nil and typeof(var17) ~= "table" then
			local ok, status = pcall(Content.fromObject, var17)
			
			if ok then
				var30 = status
			end
		end
		if var30 ~= nil then
			sampleVideoFramesModule(var30, var18, var27)
		end
	end, { var17, var18 })
	local var28 = useTrimDragControllerModule(true, useCallback(function()
		-- upvalues: var22 (ref), playback (ref), var23 (ref), var25 (ref)
		if var22.current then
			playback.play()
		end
		if not var23.current then
			playback.setMuted(false)
		end
		var22.current = false
		var23.current = false
		var25(nil)
	end, { playback }), useCallback(function(p2)
		-- upvalues: var22 (ref), playback (ref), var23 (ref), var25 (ref)
		var22.current = playback.getIsPlaying(false)
		var23.current = playback.getIsMuted(false)
		playback.setMuted(true)
		playback.pause()
		var25(p2)
	end, { playback }), useCallback(function(p3, p4)
		-- upvalues: controller (ref), playback (ref)
		local activeSession = controller.getActiveSession(false)
		
		if activeSession == nil then
			return
		end
		local draft = activeSession.getDraft(false)
		local timeLength = playback.getTimeLength(false)
		activeSession.update({
			startTime = math.clamp(p3 or (if draft then draft.startTime else 0), 0, timeLength),
			endTime = math.clamp(p4 or (if draft then draft.endTime else timeLength), 0, timeLength)
		})
		playback.seek(0)
	end, { controller, playback }), useCallback(function(p5)
		-- upvalues: playback (ref)
		playback.seek(p5 * playback.getDuration(false))
	end, { playback }), var21, var18)
	local dragContainerRef = var28.dragContainerRef
	local leftHandleRef = var28.leftHandleRef
	local rightHandleRef = var28.rightHandleRef
	local scrubberDisplayRef = var28.scrubberDisplayRef
	local scrubberRef = var28.scrubberRef
	local segmentRef = var28.segmentRef
	local leftHandlePosition = var28.leftHandlePosition
	local rightHandlePosition = var28.rightHandlePosition
	
	return reactModule.createElement(view, {
		tag = "col align-x-center align-y-bottom gap-large position-bottom-center anchor-bottom-center size-full-0 auto-y",
		LayoutOrder = p0.layoutOrder,
		padding = {
			top = UDim.new(0, var15.Padding.Small),
			bottom = UDim.new(0, math.max(var14.bottom, var15.Padding.Small)),
			left = UDim.new(0, math.max(var14.left, var15.Padding.XLarge)),
			right = UDim.new(0, math.max(var14.right, var15.Padding.XLarge))
		}
	}, {
		Nav = reactModule.createElement(view, {
			LayoutOrder = 1,
			tag = "row flex-x-between align-x-center align-y-center gap-small size-full-0 auto-y"
		}, {
			BackButton = reactModule.createElement(button, {
				LayoutOrder = 1,
				fillBehavior = foundationModule.Enums.FillBehavior.Fit,
				text = var16.GeneralCtaBack,
				variant = foundationModule.Enums.ButtonVariant.Text,
				onActivated = useCallback(function()
					-- upvalues: controller (ref)
					controller.discardActiveTool()
				end, { controller }),
				size = foundationModule.Enums.InputSize.Medium
			}),
			DoneButton = reactModule.createElement(button, {
				LayoutOrder = 2,
				fillBehavior = foundationModule.Enums.FillBehavior.Fit,
				text = var16.GeneralCtaDone,
				variant = foundationModule.Enums.ButtonVariant.Text,
				onActivated = useCallback(function()
					-- upvalues: controller (ref)
					controller.commitActiveTool()
				end, { controller }),
				size = foundationModule.Enums.InputSize.Medium
			})
		}),
		Trimmer = reactModule.createElement(view, {
			LayoutOrder = 2,
			tag = "size-full-1000 padding-x-small",
			ZIndex = 2
		}, {
			PaddedContainer = reactModule.createElement(view, {
				tag = "size-full-full padding-x-medium",
				ZIndex = 2,
				ref = dragContainerRef
			}, {
				TrimmerBar = reactModule.createElement(view, { tag = "size-full" }, {
					TrimTooltip = reactModule.createElement(trimTooltipModule, {
						activeHandle = var24,
						leftHandlePosition = leftHandlePosition,
						rightHandlePosition = rightHandlePosition,
						timeLength = var18
					}),
					LeftHandle = reactModule.createElement(dragHandleModule, {
						anchorPoint = Vector2.new(1, 0.5),
						position = leftHandlePosition:map(function(p6)
							return UDim2.fromScale(p6, 0.5)
						end),
						dragDetectorRef = leftHandleRef
					}),
					RightHandle = reactModule.createElement(dragHandleModule, {
						isFlipped = true,
						anchorPoint = Vector2.new(0, 0.5),
						position = rightHandlePosition:map(function(p7)
							return UDim2.fromScale(p7, 0.5)
						end),
						dragDetectorRef = rightHandleRef
					}),
					Outline = reactModule.createElement(view, {
						tag = "anchor-center-left",
						ZIndex = 2,
						Position = leftHandlePosition:map(function(p8)
							return UDim2.fromScale(p8, 0.5)
						end),
						Size = reactModule.joinBindings({
							leftHandlePosition = leftHandlePosition,
							rightHandlePosition = rightHandlePosition
						}):map(function(p9)
							return UDim2.fromScale(p9.rightHandlePosition - p9.leftHandlePosition, 1)
						end),
						stroke = {
							Color = var15.Color.System.Contrast.Color3,
							Transparency = var15.Color.System.Contrast.Transparency,
							Thickness = var15.Stroke.Thicker
						}
					}, {
						Scrubber = reactModule.createElement(view, {
							tag = "anchor-center-center size-100-1400 radius-circle bg-system-contrast",
							ref = scrubberDisplayRef,
							Visible = not var24 or var24 == dragHandleModule_1.Scrubber,
							Position = useSignalBinding(useMemo(function()
								-- upvalues: signalsModule (copy), playback (ref)
								return signalsModule.createComputed(function(p11)
									-- upvalues: playback (copy)
									local duration = playback.getDuration(p11)
									
									return if duration <= 0 then 0 else math.clamp(playback.getPosition(p11) / duration, 0, 1)
								end)
							end, { playback })):map(function(p10)
								return UDim2.fromScale(p10, 0.5)
							end)
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
						tag = "position-center-left anchor-center-left",
						ZIndex = 0,
						backgroundStyle = var15.Color.Extended.Black.Black_50,
						Size = leftHandlePosition:map(function(p12)
							return UDim2.fromScale(p12, 1)
						end)
					}),
					ShadowBlockRight = reactModule.createElement(view, {
						tag = "position-center-right anchor-center-right",
						ZIndex = 0,
						backgroundStyle = var15.Color.Extended.Black.Black_50,
						Size = rightHandlePosition:map(function(p13)
							return UDim2.fromScale(1 - p13, 1)
						end)
					})
				})
			}),
			Timeline = reactModule.createElement(view, {
				tag = "size-full-full radius-medium bg-surface-100",
				ZIndex = 1,
				stroke = {
					Color = var15.Color.Surface.Surface_100.Color3,
					Transparency = var15.Color.Surface.Surface_100.Transparency,
					Thickness = var15.Stroke.Thicker
				}
			}, {
				TimelineBar = reactModule.createElement(view, {
					tag = "size-full-full padding-x-medium",
					layout = {
						FillDirection = Enum.FillDirection.Horizontal,
						Padding = UDim.new(0, var15.Size.Size_50),
						SortOrder = Enum.SortOrder.LayoutOrder
					}
				}, useMemo(function()
					-- upvalues: var18 (ref), var26 (ref), reactModule (copy), view (copy)
					local t = {}
					
					for i = 1, math.floor(var18) do
						local var36 = var26[i]
						t["frame_" .. i] = reactModule.createElement(view, { tag = "shrink size-full-full bg-system-neutral" }, {
							content = reactModule.createElement("ImageLabel", {
								BackgroundTransparency = 1,
								Size = UDim2.fromScale(1, 1),
								ImageContent = var36 and var36.Image,
								ScaleType = Enum.ScaleType.Crop
							})
						})
					end
					return t
				end, { var18, var26 }))
			})
		}),
		VideoControls = reactModule.createElement(view, {
			LayoutOrder = 3,
			tag = "row flex-x-between align-x-center align-y-center gap-small size-full-0 auto-y"
		}, {
			PlaybackToggle = reactModule.createElement(iconButton, {
				LayoutOrder = 1,
				icon = if var19 then pauseLarge else playLarge,
				onActivated = useCallback(function()
					-- upvalues: playback (ref)
					playback.toggle()
				end, { playback }),
				size = foundationModule.Enums.InputSize.Medium
			}),
			DurationDisplay = reactModule.createElement(text, {
				LayoutOrder = 2,
				tag = "auto-xy text-label-medium content-default",
				Text = useSignalBinding(useMemo(function()
					-- upvalues: signalsModule (copy), playback (ref)
					return signalsModule.createComputed(function(p14)
						-- upvalues: playback (copy)
						return `{string.format("%.1f", math.max(0, playback.getPosition(p14)))} / {string.format("%.1f", playback.getDuration(p14))}`
					end)
				end, { playback }))
			}),
			MuteToggle = reactModule.createElement(iconButton, {
				LayoutOrder = 3,
				icon = if var20 then speakerSlash else speaker,
				onActivated = useCallback(function()
					-- upvalues: playback (ref)
					playback.toggleMute()
				end, { playback }),
				size = foundationModule.Enums.InputSize.Medium
			})
		})
	})
end