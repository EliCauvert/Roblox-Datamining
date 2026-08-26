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

return function(p1)
	-- upvalues: useDeviceInsets (ref), useTokens (ref), useCreationFlowStringsModule (ref), useSignalState (ref), useMemo (ref), signalsModule (ref), useRef (ref), useState (ref), useEffect (ref), getCaptureVideoContentModule (ref), sampleVideoFramesModule (ref), useCallback (ref), useTrimDragControllerModule (ref), useSignalBinding (ref), reactModule (ref), view (ref), button (ref), foundationModule (ref), trimTooltipModule (ref), dragHandleModule (ref), dragHandleModule_1 (ref), iconButton (ref), pauseLarge (ref), playLarge (ref), text (ref), speakerSlash (ref), speaker (ref)
	local controller = p1.controller
	local playback = controller.preview.playback
	local var1 = useDeviceInsets()
	local var2 = useTokens()
	local var3 = useCreationFlowStringsModule()
	local var4 = useSignalState(controller.getSelectedCapture)
	local var5 = useSignalState(playback.getTimeLength)
	local var6 = useSignalState(playback.getIsPlaying)
	local var7 = useSignalState(playback.getIsMuted)
	local var8 = useSignalState(useMemo(function()
		-- upvalues: signalsModule (copy), controller (ref)
		return signalsModule.createComputed(function(p2)
			-- upvalues: controller (copy)
			local activeSession = controller.getActiveSession(p2)
			
			return if activeSession == nil then nil else activeSession.getDraft(p2)
		end)
	end, { controller }))
	local var9 = useRef(false)
	local var10 = useRef(false)
	local var11, var12 = useState(nil)
	local var13, var14 = useState({})
	useEffect(function()
		-- upvalues: var4 (ref), var5 (ref), getCaptureVideoContentModule (copy), sampleVideoFramesModule (copy), var14 (ref)
		if var4 == nil or var5 <= 0 then return end
		local var15 = getCaptureVideoContentModule(var4)
		
		if var15 == nil and typeof(var4) ~= "table" then
			local ok, status = pcall(Content.fromObject, var4)
			
			if ok then
				var15 = status
			end
		end
		if var15 ~= nil then
			sampleVideoFramesModule(var15, var5, var14)
		end
	end, { var4, var5 })
	local var15 = useTrimDragControllerModule(true, useCallback(function()
		-- upvalues: var9 (ref), playback (ref), var10 (ref), var12 (ref)
		if var9.current then
			playback.play()
		end
		if not var10.current then
			playback.setMuted(false)
		end
		var9.current = false
		var10.current = false
		var12(nil)
	end, { playback }), useCallback(function(p2)
		-- upvalues: var9 (ref), playback (ref), var10 (ref), var12 (ref)
		var9.current = playback.getIsPlaying(false)
		var10.current = playback.getIsMuted(false)
		playback.setMuted(true)
		playback.pause()
		var12(p2)
	end, { playback }), useCallback(function(p2, p3)
		-- upvalues: controller (ref), playback (ref)
		local activeSession = controller.getActiveSession(false)
		
		if activeSession == nil then
			return
		end
		local draft = activeSession.getDraft(false)
		local timeLength = playback.getTimeLength(false)
		activeSession.update({
			startTime = math.clamp(p2 or (if draft then draft.startTime else 0), 0, timeLength),
			endTime = math.clamp(p3 or (if draft then draft.endTime else timeLength), 0, timeLength)
		})
		playback.seek(0)
	end, { controller, playback }), useCallback(function(p2)
		-- upvalues: playback (ref)
		playback.seek(p2 * playback.getDuration(false))
	end, { playback }), var8, var5)
	local dragContainerRef = var15.dragContainerRef
	local leftHandleRef = var15.leftHandleRef
	local rightHandleRef = var15.rightHandleRef
	local scrubberDisplayRef = var15.scrubberDisplayRef
	local scrubberRef = var15.scrubberRef
	local segmentRef = var15.segmentRef
	local leftHandlePosition = var15.leftHandlePosition
	local rightHandlePosition = var15.rightHandlePosition
	
	return reactModule.createElement(view, {
		tag = "col align-x-center align-y-bottom gap-large position-bottom-center anchor-bottom-center size-full-0 auto-y",
		LayoutOrder = p1.layoutOrder,
		padding = {
			top = UDim.new(0, var2.Padding.Small),
			bottom = UDim.new(0, math.max(var1.bottom, var2.Padding.Small)),
			left = UDim.new(0, math.max(var1.left, var2.Padding.XLarge)),
			right = UDim.new(0, math.max(var1.right, var2.Padding.XLarge))
		}
	}, {
		Nav = reactModule.createElement(view, {
			LayoutOrder = 1,
			tag = "row flex-x-between align-x-center align-y-center gap-small size-full-0 auto-y"
		}, {
			BackButton = reactModule.createElement(button, {
				LayoutOrder = 1,
				fillBehavior = foundationModule.Enums.FillBehavior.Fit,
				text = var3.GeneralCtaBack,
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
				text = var3.GeneralCtaDone,
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
						activeHandle = var11,
						leftHandlePosition = leftHandlePosition,
						rightHandlePosition = rightHandlePosition,
						timeLength = var5
					}),
					LeftHandle = reactModule.createElement(dragHandleModule, {
						anchorPoint = Vector2.new(1, 0.5),
						position = leftHandlePosition:map(function(p2)
							return UDim2.fromScale(p2, 0.5)
						end),
						dragDetectorRef = leftHandleRef
					}),
					RightHandle = reactModule.createElement(dragHandleModule, {
						isFlipped = true,
						anchorPoint = Vector2.new(0, 0.5),
						position = rightHandlePosition:map(function(p2)
							return UDim2.fromScale(p2, 0.5)
						end),
						dragDetectorRef = rightHandleRef
					}),
					Outline = reactModule.createElement(view, {
						tag = "anchor-center-left",
						ZIndex = 2,
						Position = leftHandlePosition:map(function(p2)
							return UDim2.fromScale(p2, 0.5)
						end),
						Size = reactModule.joinBindings({
							leftHandlePosition = leftHandlePosition,
							rightHandlePosition = rightHandlePosition
						}):map(function(p2)
							return UDim2.fromScale(p2.rightHandlePosition - p2.leftHandlePosition, 1)
						end),
						stroke = {
							Color = var2.Color.System.Contrast.Color3,
							Transparency = var2.Color.System.Contrast.Transparency,
							Thickness = var2.Stroke.Thicker
						}
					}, {
						Scrubber = reactModule.createElement(view, {
							tag = "anchor-center-center size-100-1400 radius-circle bg-system-contrast",
							ref = scrubberDisplayRef,
							Visible = not var11 or var11 == dragHandleModule_1.Scrubber,
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
						backgroundStyle = var2.Color.Extended.Black.Black_50,
						Size = leftHandlePosition:map(function(p2)
							return UDim2.fromScale(p2, 1)
						end)
					}),
					ShadowBlockRight = reactModule.createElement(view, {
						tag = "position-center-right anchor-center-right",
						ZIndex = 0,
						backgroundStyle = var2.Color.Extended.Black.Black_50,
						Size = rightHandlePosition:map(function(p2)
							return UDim2.fromScale(1 - p2, 1)
						end)
					})
				})
			}),
			Timeline = reactModule.createElement(view, {
				tag = "size-full-full radius-medium bg-surface-100",
				ZIndex = 1,
				stroke = {
					Color = var2.Color.Surface.Surface_100.Color3,
					Transparency = var2.Color.Surface.Surface_100.Transparency,
					Thickness = var2.Stroke.Thicker
				}
			}, {
				TimelineBar = reactModule.createElement(view, {
					tag = "size-full-full padding-x-medium",
					layout = {
						FillDirection = Enum.FillDirection.Horizontal,
						Padding = UDim.new(0, var2.Size.Size_50),
						SortOrder = Enum.SortOrder.LayoutOrder
					}
				}, useMemo(function()
					-- upvalues: var5 (ref), var13 (ref), reactModule (copy), view (copy)
					local t = {}
					
					for i = 1, math.floor(var5) do
						local var16 = var13[i]
						t["frame_" .. i] = reactModule.createElement(view, { tag = "shrink size-full-full bg-system-neutral" }, {
							content = reactModule.createElement("ImageLabel", {
								BackgroundTransparency = 1,
								Size = UDim2.fromScale(1, 1),
								ImageContent = var16 and var16.Image,
								ScaleType = Enum.ScaleType.Crop
							})
						})
					end
					return t
				end, { var5, var13 }))
			})
		}),
		VideoControls = reactModule.createElement(view, {
			LayoutOrder = 3,
			tag = "row flex-x-between align-x-center align-y-center gap-small size-full-0 auto-y"
		}, {
			PlaybackToggle = reactModule.createElement(iconButton, {
				LayoutOrder = 1,
				icon = if var6 then pauseLarge else playLarge,
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
					return signalsModule.createComputed(function(p2)
						-- upvalues: playback (copy)
						return `{string.format("%.1f", math.max(0, playback.getPosition(p2)))} / {string.format("%.1f", playback.getDuration(p2))}`
					end)
				end, { playback }))
			}),
			MuteToggle = reactModule.createElement(iconButton, {
				LayoutOrder = 3,
				icon = if var7 then speakerSlash else speaker,
				onActivated = useCallback(function()
					-- upvalues: playback (ref)
					playback.toggleMute()
				end, { playback }),
				size = foundationModule.Enums.InputSize.Medium
			})
		})
	})
end