local MomentsCreation = script:FindFirstAncestor("MomentsCreation")
local Parent = MomentsCreation.Parent
local BuilderIconsModule = require(Parent.BuilderIcons)
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local SignalsModule = require(Parent.Signals)
local SignalsReactModule = require(Parent.SignalsReact)
local Button = FoundationModule.Button
local IconButton = FoundationModule.IconButton
local Text = FoundationModule.Text
local View = FoundationModule.View
local PlayLarge = BuilderIconsModule.Icon.PlayLarge
local PauseLarge = BuilderIconsModule.Icon.PauseLarge
local Speaker = BuilderIconsModule.Icon.Speaker
local SpeakerSlash = BuilderIconsModule.Icon.SpeakerSlash
local UseCallbackFunction = ReactModule.useCallback
local UseEffectFunction = ReactModule.useEffect
local UseMemoFunction = ReactModule.useMemo
local UseRefFunction = ReactModule.useRef
local UseStateFunction = ReactModule.useState
local UseDeviceInsetsFunction = require(Parent.MomentsCommon).Hooks.useDeviceInsets
local UseTokensFunction = FoundationModule.Hooks.useTokens
local UseSignalStateFunction = SignalsReactModule.useSignalState
local UseSignalBindingFunction = SignalsReactModule.useSignalBinding
local DragHandleModule = require(MomentsCreation.Components.DragHandle)
local TrimTooltipModule = require(MomentsCreation.Components.TrimTooltip)
local UseTrimDragControllerModule = require(MomentsCreation.Hooks.useTrimDragController)
local GetCaptureVideoContentModule = require(MomentsCreation.Capture.getCaptureVideoContent)
local SampleVideoFramesModule = require(MomentsCreation.Capture.sampleVideoFrames)
local DragHandleModule1 = require(MomentsCreation.Enums.DragHandle)
local UseCreationFlowStringsModule = require(MomentsCreation.Hooks.useCreationFlowStrings)
local _ = require(MomentsCreation.Types.CreationFlowTypes)

return function(p1)
	-- upvalues: UseDeviceInsetsFunction (copy), UseTokensFunction (copy), UseCreationFlowStringsModule (copy), UseSignalStateFunction (copy), UseMemoFunction (copy), SignalsModule (copy), UseRefFunction (copy), UseStateFunction (copy), UseEffectFunction (copy), GetCaptureVideoContentModule (copy), SampleVideoFramesModule (copy), UseCallbackFunction (copy), UseTrimDragControllerModule (copy), UseSignalBindingFunction (copy), ReactModule (copy), View (copy), Button (copy), FoundationModule (copy), TrimTooltipModule (copy), DragHandleModule (copy), DragHandleModule1 (copy), IconButton (copy), PauseLarge (copy), PlayLarge (copy), Text (copy), SpeakerSlash (copy), Speaker (copy)
	local Controller = p1.controller
	local Playback = Controller.preview.playback
	local UseDeviceInsetsResult = UseDeviceInsetsFunction()
	local UseTokensResult = UseTokensFunction()
	local UseCreationFlowStringsModuleResult = UseCreationFlowStringsModule()
	local UseSignalStateResult = UseSignalStateFunction(Controller.getSelectedCapture)
	local UseSignalStateResult1 = UseSignalStateFunction(Playback.getTimeLength)
	local UseSignalStateResult2 = UseSignalStateFunction(Playback.getIsPlaying)
	local UseSignalStateResult3 = UseSignalStateFunction(Playback.getIsMuted)
	local UseSignalStateResult4 = UseSignalStateFunction((UseMemoFunction(function()
		-- upvalues: SignalsModule (upval), Controller (copy)
		return SignalsModule.createComputed(function(p2)
			-- upvalues: Controller (upval)
			local ActiveSession = Controller.getActiveSession(p2)
			
			return if ActiveSession == nil then nil else ActiveSession.getDraft(p2)
		end)
	end, { Controller })))
	local UseRefResult = UseRefFunction(false)
	local UseRefResult1 = UseRefFunction(false)
	local UseStateResult, UseStateResult2 = UseStateFunction(nil)
	local UseStateResult1, UseStateResult2_1 = UseStateFunction({})
	UseEffectFunction(function()
		-- upvalues: UseSignalStateResult (copy), UseSignalStateResult1 (copy), GetCaptureVideoContentModule (upval), SampleVideoFramesModule (upval), UseStateResult2_1 (copy)
		if UseSignalStateResult == nil or UseSignalStateResult1 <= 0 then return end
		local CaptureVideoContentModule = GetCaptureVideoContentModule(UseSignalStateResult)
		
		if CaptureVideoContentModule == nil and typeof(UseSignalStateResult) ~= "table" then
			local Success, Result = pcall(Content.fromObject, UseSignalStateResult)
			
			if Success then
				CaptureVideoContentModule = Result
			end
		end
		if CaptureVideoContentModule ~= nil then
			SampleVideoFramesModule(CaptureVideoContentModule, UseSignalStateResult1, UseStateResult2_1)
		end
	end, { UseSignalStateResult, UseSignalStateResult1 })
	local UseTrimDragControllerModuleResult = UseTrimDragControllerModule(true, UseCallbackFunction(function()
		-- upvalues: UseRefResult (copy), Playback (copy), UseRefResult1 (copy), UseStateResult2 (copy)
		if UseRefResult.current then
			Playback.play()
		end
		if not UseRefResult1.current then
			Playback.setMuted(false)
		end
		UseRefResult.current = false
		UseRefResult1.current = false
		UseStateResult2(nil)
	end, { Playback }), UseCallbackFunction(function(p2)
		-- upvalues: UseRefResult (copy), Playback (copy), UseRefResult1 (copy), UseStateResult2 (copy)
		UseRefResult.current = Playback.getIsPlaying(false)
		UseRefResult1.current = Playback.getIsMuted(false)
		Playback.setMuted(true)
		Playback.pause()
		UseStateResult2(p2)
	end, { Playback }), UseCallbackFunction(function(p2, p3)
		-- upvalues: Controller (copy), Playback (copy)
		local ActiveSession = Controller.getActiveSession(false)
		
		if ActiveSession ~= nil then
			local Draft = ActiveSession.getDraft(false)
			local TimeLength: number = Playback.getTimeLength(false)
			ActiveSession.update({
				startTime = math.clamp(p2 or (Draft and Draft.startTime or 0), 0, TimeLength),
				endTime = math.clamp(p3 or (Draft and Draft.endTime or TimeLength), 0, TimeLength)
			})
			Playback.seek(0)
			
			return
		end
	end, { Controller, Playback }), UseCallbackFunction(function(p2)
		-- upvalues: Playback (copy)
		Playback.seek(p2 * Playback.getDuration(false))
	end, { Playback }), UseSignalStateResult4, UseSignalStateResult1)
	local LeftHandlePosition = UseTrimDragControllerModuleResult.leftHandlePosition
	local RightHandlePosition = UseTrimDragControllerModuleResult.rightHandlePosition
	
	return ReactModule.createElement(View, {
		tag = "col align-x-center align-y-bottom gap-large position-bottom-center anchor-bottom-center size-full-0 auto-y",
		LayoutOrder = p1.layoutOrder,
		padding = {
			top = UDim.new(0, UseTokensResult.Padding.Small),
			bottom = UDim.new(0, (math.max(UseDeviceInsetsResult.bottom, UseTokensResult.Padding.Small))),
			left = UDim.new(0, (math.max(UseDeviceInsetsResult.left, UseTokensResult.Padding.XLarge))),
			right = UDim.new(0, (math.max(UseDeviceInsetsResult.right, UseTokensResult.Padding.XLarge)))
		}
	}, {
		Nav = ReactModule.createElement(View, {
			LayoutOrder = 1,
			tag = "row flex-x-between align-x-center align-y-center gap-small size-full-0 auto-y"
		}, {
			BackButton = ReactModule.createElement(Button, {
				LayoutOrder = 1,
				fillBehavior = FoundationModule.Enums.FillBehavior.Fit,
				text = UseCreationFlowStringsModuleResult.GeneralCtaBack,
				variant = FoundationModule.Enums.ButtonVariant.Text,
				onActivated = UseCallbackFunction(function()
					-- upvalues: Controller (copy)
					Controller.discardActiveTool()
				end, { Controller }),
				size = FoundationModule.Enums.InputSize.Medium
			}),
			DoneButton = ReactModule.createElement(Button, {
				LayoutOrder = 2,
				fillBehavior = FoundationModule.Enums.FillBehavior.Fit,
				text = UseCreationFlowStringsModuleResult.GeneralCtaDone,
				variant = FoundationModule.Enums.ButtonVariant.Text,
				onActivated = UseCallbackFunction(function()
					-- upvalues: Controller (copy)
					Controller.commitActiveTool()
				end, { Controller }),
				size = FoundationModule.Enums.InputSize.Medium
			})
		}),
		Trimmer = ReactModule.createElement(View, {
			LayoutOrder = 2,
			tag = "size-full-1000 padding-x-small",
			ZIndex = 2
		}, {
			PaddedContainer = ReactModule.createElement(View, {
				tag = "size-full-full padding-x-medium",
				ZIndex = 2,
				ref = UseTrimDragControllerModuleResult.dragContainerRef
			}, {
				TrimmerBar = ReactModule.createElement(View, { tag = "size-full" }, {
					TrimTooltip = ReactModule.createElement(TrimTooltipModule, {
						activeHandle = UseStateResult,
						leftHandlePosition = LeftHandlePosition,
						rightHandlePosition = RightHandlePosition,
						timeLength = UseSignalStateResult1
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
						end),
						stroke = {
							Color = UseTokensResult.Color.System.Contrast.Color3,
							Transparency = UseTokensResult.Color.System.Contrast.Transparency,
							Thickness = UseTokensResult.Stroke.Thicker
						}
					}, {
						Scrubber = ReactModule.createElement(View, {
							tag = "anchor-center-center size-100-1400 radius-circle bg-system-contrast",
							ref = UseTrimDragControllerModuleResult.scrubberDisplayRef,
							Visible = not UseStateResult or UseStateResult == DragHandleModule1.Scrubber,
							Position = UseSignalBindingFunction((UseMemoFunction(function()
								-- upvalues: SignalsModule (upval), Playback (copy)
								return SignalsModule.createComputed(function(p2): number
									-- upvalues: Playback (upval)
									local Duration: number = Playback.getDuration(p2)
									
									return if Duration <= 0 then 0 else math.clamp(Playback.getPosition(p2) / Duration, 0, 1)
								end)
							end, { Playback }))):map(function(XScale): UDim2
								return UDim2.fromScale(XScale, 0.5)
							end)
						}, {
							DragDetector = ReactModule.createElement("UIDragDetector", {
								DragStyle = Enum.UIDragDetectorDragStyle.TranslateLine,
								ref = UseTrimDragControllerModuleResult.scrubberRef,
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
						tag = "position-center-left anchor-center-left",
						ZIndex = 0,
						backgroundStyle = UseTokensResult.Color.Extended.Black.Black_50,
						Size = LeftHandlePosition:map(function(XScale): UDim2
							return UDim2.fromScale(XScale, 1)
						end)
					}),
					ShadowBlockRight = ReactModule.createElement(View, {
						tag = "position-center-right anchor-center-right",
						ZIndex = 0,
						backgroundStyle = UseTokensResult.Color.Extended.Black.Black_50,
						Size = RightHandlePosition:map(function(p2: number): UDim2
							return UDim2.fromScale(1 - p2, 1)
						end)
					})
				})
			}),
			Timeline = ReactModule.createElement(View, {
				tag = "size-full-full radius-medium bg-surface-100",
				ZIndex = 1,
				stroke = {
					Color = UseTokensResult.Color.Surface.Surface_100.Color3,
					Transparency = UseTokensResult.Color.Surface.Surface_100.Transparency,
					Thickness = UseTokensResult.Stroke.Thicker
				}
			}, {
				TimelineBar = ReactModule.createElement(View, {
					tag = "size-full-full padding-x-medium",
					layout = {
						FillDirection = Enum.FillDirection.Horizontal,
						Padding = UDim.new(0, UseTokensResult.Size.Size_50),
						SortOrder = Enum.SortOrder.LayoutOrder
					}
				}, (UseMemoFunction(function()
					-- upvalues: UseSignalStateResult1 (copy), UseStateResult1 (copy), ReactModule (upval), View (upval)
					local Elements = {}
					
					for i = 1, math.floor(UseSignalStateResult1) do
						local UseStateResultEntry = UseStateResult1[i]
						Elements["frame_" .. i] = ReactModule.createElement(View, { tag = "shrink size-full-full bg-system-neutral" }, {
							content = ReactModule.createElement("ImageLabel", {
								BackgroundTransparency = 1,
								Size = UDim2.fromScale(1, 1),
								ImageContent = UseStateResultEntry and UseStateResultEntry.Image,
								ScaleType = Enum.ScaleType.Crop
							})
						})
					end
					return Elements
				end, { UseSignalStateResult1, UseStateResult1 })))
			})
		}),
		VideoControls = ReactModule.createElement(View, {
			LayoutOrder = 3,
			tag = "row flex-x-between align-x-center align-y-center gap-small size-full-0 auto-y"
		}, {
			PlaybackToggle = ReactModule.createElement(IconButton, {
				LayoutOrder = 1,
				icon = if UseSignalStateResult2 then PauseLarge else PlayLarge,
				onActivated = UseCallbackFunction(function()
					-- upvalues: Playback (copy)
					Playback.toggle()
				end, { Playback }),
				size = FoundationModule.Enums.InputSize.Medium
			}),
			DurationDisplay = ReactModule.createElement(Text, {
				LayoutOrder = 2,
				tag = "auto-xy text-label-medium content-default",
				Text = UseSignalBindingFunction((UseMemoFunction(function()
					-- upvalues: SignalsModule (upval), Playback (copy)
					return SignalsModule.createComputed(function(p2): string
						-- upvalues: Playback (upval)
						return `{string.format("%.1f", (math.max(0, Playback.getPosition(p2))))} / {string.format("%.1f", Playback.getDuration(p2))}`
					end)
				end, { Playback })))
			}),
			MuteToggle = ReactModule.createElement(IconButton, {
				LayoutOrder = 3,
				icon = if UseSignalStateResult3 then SpeakerSlash else Speaker,
				onActivated = UseCallbackFunction(function()
					-- upvalues: Playback (copy)
					Playback.toggleMute()
				end, { Playback }),
				size = FoundationModule.Enums.InputSize.Medium
			})
		})
	})
end