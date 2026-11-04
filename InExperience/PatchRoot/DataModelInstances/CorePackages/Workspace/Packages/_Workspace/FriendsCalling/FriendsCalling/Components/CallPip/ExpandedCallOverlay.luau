local FriendsCalling = script:FindFirstAncestor("FriendsCalling")
local Parent = FriendsCalling.Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local CallParticipantCardModule = require(FriendsCalling.Components.CallParticipant.CallParticipantCard)
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
	-- upvalues: UseTokensFunction (copy), useElapsedText (copy), ReactModule (copy), View (copy), HeaderBar (copy), IconName (copy), Text (copy), CallParticipantCardModule (copy), IconButton (copy), InputSize (copy), Icon (copy), IconSize (copy)
	local UseTokensResult = UseTokensFunction()
	local UseElapsedTextResult = useElapsedText(p1.connectedAt)
	
	return ReactModule.createElement(View, {
		padding = { top = UDim.new(0, p1.topPadding) },
		tag = {
			["col size-full bg-surface-100"] = true,
			["stroke-standard stroke-default radius-large clip"] = p1.hasRoundedCorners
		}
	}, {
		Header = ReactModule.createElement(View, {
			LayoutOrder = 1,
			tag = "size-full-0 auto-y",
			testId = "friends-calling-pip-drag-target",
			ref = p1.onDragInputTarget
		}, {
			Bar = ReactModule.createElement(HeaderBar.Root, { hasBackground = false }, {
				Leading = ReactModule.createElement(HeaderBar.Leading, nil, {
					Actions = ReactModule.createElement(HeaderBar.Actions, {
						actions = {
							{
								id = "collapse",
								icon = IconName.TwoArrowsToCenter,
								onActivated = p1.onCollapse
							}
						}
					})
				}),
				Content = ReactModule.createElement(HeaderBar.Content, nil, {
					Titles = ReactModule.createElement(View, { tag = "col align-x-center auto-xy" }, {
						Title = ReactModule.createElement(Text, {
							LayoutOrder = 1,
							tag = "auto-xy text-title-large content-emphasis",
							testId = "friends-calling-pip-title",
							Text = p1.participant.name
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
			tag = "fill size-full-0 padding-x-xlarge padding-bottom-xxlarge"
		}, {
			PlayerCard = ReactModule.createElement(CallParticipantCardModule, {
				testId = "friends-calling-pip-player-card",
				userId = p1.participant.userId,
				name = p1.participant.name,
				statusText = p1.participant.statusText,
				isMuted = p1.participant.isMuted,
				isSpeaking = p1.participant.isSpeaking,
				isDimmed = p1.participant.isDimmed,
				showStatusAnimation = p1.participant.showStatusAnimation
			})
		}),
		Actions = ReactModule.createElement(View, {
			LayoutOrder = 3,
			tag = "align-x-center size-full-0 auto-y padding-x-xlarge padding-bottom-xlarge"
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
				Headphones = ReactModule.createElement(IconButton, {
					LayoutOrder = 2,
					isCircular = true,
					testId = "friends-calling-pip-headphones",
					icon = IconName.Headphones,
					onActivated = p1.onToggleConversationAudio,
					size = InputSize.Large
				}),
				Microphone = ReactModule.createElement(IconButton, {
					LayoutOrder = 3,
					isCircular = true,
					testId = "friends-calling-pip-microphone",
					icon = if p1.isMicrophoneMuted then IconName.MicrophoneSlash else IconName.Microphone,
					onActivated = p1.onToggleMicrophone,
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
						size = IconSize.Medium,
						style = UseTokensResult.Color.Extended.White.White_100
					})
				})
			})
		})
	})
end