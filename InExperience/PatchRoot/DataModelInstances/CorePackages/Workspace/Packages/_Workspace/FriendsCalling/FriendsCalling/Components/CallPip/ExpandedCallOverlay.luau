local FriendsCalling = script:FindFirstAncestor("FriendsCalling")
local Parent = FriendsCalling.Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local CallParticipantCardModule = require(FriendsCalling.Components.CallParticipant.CallParticipantCard)
local _ = require(FriendsCalling.Stores.GetFriendsCallingStore)
local PassInputThroughModule = require(FriendsCalling.Utils.passInputThrough)
local FriendsCallingParticipantStatus = Enum.FriendsCallingParticipantStatus
local HeaderBar = FoundationModule.HeaderBar
local Icon = FoundationModule.Icon
local IconButton = FoundationModule.IconButton
local IconName = FoundationModule.Enums.IconName
local IconSize = FoundationModule.Enums.IconSize
local InputSize = FoundationModule.Enums.InputSize
local Text = FoundationModule.Text
local View = FoundationModule.View
local UseTokensFunction = FoundationModule.Hooks.useTokens

local function useElapsedText(ConnectedAt)
	-- upvalues: ReactModule (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(nil)
	ReactModule.useEffect(function()
		-- upvalues: ConnectedAt (copy), UseStateResult2 (copy)
		if ConnectedAt == nil then
			UseStateResult2(nil)
			
			return
		end
		local Flag = true
		
		local function tick()
			-- upvalues: Flag (ref), ConnectedAt (upval), UseStateResult2 (upval), tick (copy)
			if Flag then
				local Largest = math.max(0, (math.floor(os.clock() - ConnectedAt)))
				UseStateResult2(string.format("%02d:%02d", math.floor(Largest / 60), Largest % 60))
				task.delay(1, tick)
				
				return
			end
		end
		
		tick()
		
		return function()
			-- upvalues: Flag (ref)
			Flag = false
		end
	end, { ConnectedAt })
	
	return UseStateResult
end

return function(p1)
	-- upvalues: UseTokensFunction (copy), FriendsCallingParticipantStatus (copy), useElapsedText (copy), ReactModule (copy), View (copy), PassInputThroughModule (copy), HeaderBar (copy), Text (copy), CallParticipantCardModule (copy), IconButton (copy), IconName (copy), InputSize (copy), Icon (copy), IconSize (copy)
	local Participant = p1.participants[1]
	local UseTokensResult = UseTokensFunction()
	local SelfParticipant = p1.selfParticipant
	local IsStatusMatch: boolean = SelfParticipant ~= nil and SelfParticipant.status == FriendsCallingParticipantStatus.Muted
	local IsCallVolumeMatch = p1.callVolume == 0
	local UseElapsedTextResult = useElapsedText(p1.connectedAt)
	local UseStateResult, UseStateResult2 = ReactModule.useState(nil)
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(nil)
	local UseBindingResult, UseBindingResult2 = ReactModule.useBinding(UDim2.fromScale(0, 0))
	ReactModule.useLayoutEffect(function()
		-- upvalues: UseStateResult (copy), UseStateResult1 (copy), UseBindingResult2 (copy)
		if UseStateResult == nil or UseStateResult1 == nil then return end
		local function sync()
			-- upvalues: UseStateResult1 (copy), UseStateResult (copy), UseBindingResult2 (upval)
			local NewAbsolutePosition = UseStateResult1.AbsolutePosition - UseStateResult.AbsolutePosition + UseStateResult1.AbsoluteSize / 2
			UseBindingResult2(UDim2.fromOffset(NewAbsolutePosition.X, NewAbsolutePosition.Y))
		end
		
		local NewAbsolutePosition = UseStateResult1.AbsolutePosition - UseStateResult.AbsolutePosition + UseStateResult1.AbsoluteSize / 2
		UseBindingResult2(UDim2.fromOffset(NewAbsolutePosition.X, NewAbsolutePosition.Y))
		local Connection = UseStateResult1:GetPropertyChangedSignal("AbsolutePosition"):Connect(sync)
		local Connection1 = UseStateResult1:GetPropertyChangedSignal("AbsoluteSize"):Connect(sync)
		
		return function()
			-- upvalues: Connection (copy), Connection1 (copy)
			Connection:Disconnect()
			Connection1:Disconnect()
		end
	end, { UseStateResult, UseStateResult1 })
	
	return ReactModule.createElement(View, {
		ref = UseStateResult2,
		tag = {
			["size-full bg-surface-100"] = true,
			["stroke-standard stroke-default radius-large clip"] = p1.hasRoundedCorners
		}
	}, {
		Stack = ReactModule.createElement(View, {
			tag = "col align-x-center size-full",
			testId = "friends-calling-pip-drag-target",
			padding = { top = UDim.new(0, p1.topPadding) },
			ref = p1.onDragInputTarget
		}, {
			Header = ReactModule.createElement(View, {
				LayoutOrder = 1,
				tag = "size-full-0 auto-y",
				ref = PassInputThroughModule
			}, {
				Bar = ReactModule.createElement(HeaderBar.Root, {
					hasBackground = false,
					testId = "friends-calling-pip-header"
				}, {
					Leading = ReactModule.createElement(HeaderBar.Leading, nil, {
						Spacer = ReactModule.createElement(View, { tag = "size-1000-1000", ref = UseStateResult2_1 })
					}),
					Content = ReactModule.createElement(HeaderBar.Content, nil, {
						Titles = ReactModule.createElement(View, { tag = "col align-x-center auto-xy" }, {
							Title = ReactModule.createElement(Text, {
								LayoutOrder = 1,
								tag = "auto-xy text-title-large content-emphasis",
								testId = "friends-calling-pip-title",
								Text = if Participant == nil then if p1.isRinging then "Ringing" else "" else Participant.name
							}),
							Timer = if UseElapsedTextResult == nil then nil else ReactModule.createElement(Text, {
								LayoutOrder = 2,
								tag = "auto-xy text-body-medium content-default",
								testId = "friends-calling-pip-timer",
								Text = UseElapsedTextResult
							})
						})
					}),
					Trailing = ReactModule.createElement(HeaderBar.Trailing, nil, {
						Spacer = ReactModule.createElement(View, { tag = "size-1000-1000" })
					})
				})
			}),
			Body = ReactModule.createElement(View, {
				LayoutOrder = 2,
				tag = "fill size-full-0 padding-x-xlarge padding-bottom-xxlarge",
				ref = PassInputThroughModule
			}, {
				PlayerCard = if Participant == nil then nil else ReactModule.createElement(CallParticipantCardModule, {
					testId = "friends-calling-pip-player-card",
					userId = Participant.userId,
					name = Participant.name,
					statusText = Participant.statusText,
					isMuted = Participant.isMuted,
					isSpeaking = Participant.isSpeaking,
					isDimmed = Participant.isDimmed,
					showStatusAnimation = Participant.showStatusAnimation
				})
			}),
			Actions = ReactModule.createElement(View, {
				LayoutOrder = 3,
				tag = "auto-xy padding-x-xlarge padding-bottom-xlarge"
			}, {
				Pill = ReactModule.createElement(View, {
					tag = "row align-y-center gap-medium auto-xy padding-medium radius-circle bg-over-media-0"
				}, {
					Message = ReactModule.createElement(IconButton, {
						LayoutOrder = 1,
						isCircular = true,
						testId = "friends-calling-pip-message",
						icon = IconName.SpeechBubbleAlignCenter,
						onActivated = p1.onOpenChat,
						size = InputSize.Large
					}),
					Speaker = ReactModule.createElement(IconButton, {
						LayoutOrder = 2,
						isCircular = true,
						testId = "friends-calling-pip-speaker",
						icon = if IsCallVolumeMatch then IconName.SpeakerSlash else IconName.Speaker,
						onActivated = function()
							-- upvalues: p1 (copy), IsCallVolumeMatch (copy)
							p1.onToggleConversationAudio(not IsCallVolumeMatch)
						end,
						size = InputSize.Large
					}),
					Microphone = ReactModule.createElement(IconButton, {
						LayoutOrder = 3,
						isCircular = true,
						testId = "friends-calling-pip-microphone",
						icon = if IsStatusMatch then IconName.MicrophoneSlash else IconName.Microphone,
						onActivated = function()
							-- upvalues: p1 (copy), IsStatusMatch (copy)
							p1.onToggleMicrophone(not IsStatusMatch)
						end,
						size = InputSize.Large
					}),
					EndCall = ReactModule.createElement(View, {
						LayoutOrder = 4,
						tag = "align-x-center align-y-center size-1200-1200 radius-circle bg-system-alert",
						testId = "friends-calling-pip-end-call",
						onActivated = p1.onEndCall
					}, {
						Icon = ReactModule.createElement(Icon, {
							name = IconName.X,
							ref = PassInputThroughModule,
							size = IconSize.Medium,
							style = UseTokensResult.Color.Extended.White.White_100
						})
					})
				})
			})
		}),
		Collapse = ReactModule.createElement(IconButton, {
			ZIndex = 2,
			AnchorPoint = Vector2.new(0.5, 0.5),
			Position = UseBindingResult,
			icon = IconName.TwoArrowsToCenter,
			onActivated = p1.onCollapse
		})
	})
end