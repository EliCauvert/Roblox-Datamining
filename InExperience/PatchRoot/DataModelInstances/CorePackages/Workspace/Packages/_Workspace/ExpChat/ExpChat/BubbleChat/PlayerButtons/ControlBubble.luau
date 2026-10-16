local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local ExpChat = script:FindFirstAncestor("ExpChat")
local Parent = ExpChat.Parent
local ReactModule = require(Parent.React)
local IsTenFootInterfaceFunction = require(Parent.AppCommonLib).isTenFootInterface
local SharedFlagsModule = require(Parent.SharedFlags)
local WithSignalsDataModule = require(script.Parent.withSignalsData)
local UIBloxModule = require(Parent.UIBlox)
local Images = UIBloxModule.App.ImageSet.Images
local ImageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local Image = require(Parent.Foundation).Image
local v1 = 0.6
local _Vector2 = Vector2.new(-1, 0)
local EnableChatMicPerfBinding = game:DefineFastFlag("EnableChatMicPerfBinding", false)
local FFlagExpChatMicBubbleSingleImageModule = require(ExpChat.Flags.FFlagExpChatMicBubbleSingleImage)
local ExpChatMicActivityHeartbeatIncrement = game:DefineFastInt("ExpChatMicActivityHeartbeatIncrement", 3)

if game:DefineFastFlag("EnableDarkerShimmerTransparency", false) then
	v1 = 0.4
end
local GetFFlagExpChatEnableVoiceReverseNudgeModule = require(ExpChat.Flags.GetFFlagExpChatEnableVoiceReverseNudge)
local GetFFlagExpChatUseVoiceParticipantsStoreFunction = SharedFlagsModule.GetFFlagExpChatUseVoiceParticipantsStore
local GetVoiceIndicatorAssetNameModule = require(ExpChat.BubbleChat.Helpers.getVoiceIndicatorAssetName)

local function createTweenShimmeringEffect(UseRefResult) --[[ Line: 53 ]]
	-- upvalues: TweenService (copy)
	return (TweenService:Create(UseRefResult:getValue(), TweenInfo.new(1, Enum.EasingStyle.Circular, Enum.EasingDirection.Out, -1), { Offset = Vector2.new(1, 0) }))
end

local function ControlBubble(Frame) --[[ Line: 61 ]]
	-- upvalues: FFlagExpChatMicBubbleSingleImageModule (copy), ReactModule (copy), GetVoiceIndicatorAssetNameModule (copy), Image (copy), EnableChatMicPerfBinding (copy), ImageSetLabel (copy), RunService (copy), ExpChatMicActivityHeartbeatIncrement (copy), createTweenShimmeringEffect (copy), _Vector2 (copy), GetFFlagExpChatUseVoiceParticipantsStoreFunction (copy), GetFFlagExpChatEnableVoiceReverseNudgeModule (copy), Images (copy), IsTenFootInterfaceFunction (copy), v1 (ref)
	local UseBindingResult2 = nil
	local IconAssetName = nil
	local UseBindingResult = nil
	local Image1 = nil
	
	if FFlagExpChatMicBubbleSingleImageModule then
		UseBindingResult, UseBindingResult2 = ReactModule.useBinding(0)
		IconAssetName = Frame.iconAssetName or GetVoiceIndicatorAssetNameModule(Frame.voiceState, 1, Frame.iconStyle, false)
		Image1 = Image
	elseif EnableChatMicPerfBinding then
		UseBindingResult, UseBindingResult2 = ReactModule.useBinding(0)
		IconAssetName = UseBindingResult:map(function(p1) --[[ Line: 70 ]]
			-- upvalues: Frame (copy), GetVoiceIndicatorAssetNameModule (upval)
			return Frame.iconAssetName or GetVoiceIndicatorAssetNameModule(Frame.voiceState, p1, Frame.iconStyle, false)
		end)
		Image1 = Image
	else
		UseBindingResult, UseBindingResult2 = ReactModule.useState(0)
		Image1 = ImageSetLabel
	end
	local UseRefResult = ReactModule.useRef(0)
	local UseRefResult1 = ReactModule.useRef(nil)
	local UseRefResult2 = ReactModule.useRef(nil)
	UseRefResult1 = ReactModule.useRef(nil)
	UseRefResult2 = ReactModule.useRef(nil)
	ReactModule.useEffect(function() --[[ Line: 88 ]]
		-- upvalues: UseRefResult1 (ref), UseRefResult2 (ref)
		if UseRefResult1.current then
			local UIGradient = UseRefResult1.current:FindFirstChildWhichIsA("UIGradient", true)
			
			if UIGradient then
				UseRefResult2.current = UIGradient
			end
		end
	end, { UseRefResult1 })
	ReactModule.useEffect(function() --[[ Line: 97 ]]
		-- upvalues: Frame (copy), RunService (upval), UseRefResult (copy), ExpChatMicActivityHeartbeatIncrement (upval), UseBindingResult2 (ref), UseRefResult2 (ref), createTweenShimmeringEffect (upval), _Vector2 (upval)
		local Connection = nil
		
		if Frame.voiceState and Frame.voiceState == "Talking" then
			Connection = RunService.PostSimulation:Connect(function() --[[ Line: 100 ]]
				-- upvalues: UseRefResult (upval), ExpChatMicActivityHeartbeatIncrement (upval), UseBindingResult2 (upval)
				UseRefResult.current = ((UseRefResult.current or 0) + 1) % ExpChatMicActivityHeartbeatIncrement
				
				if UseRefResult.current == 0 then
					UseBindingResult2(math.random())
				end
			end)
			
			return function() --[[ Line: 109 ]]
				-- upvalues: Connection (ref)
				if Connection then
					Connection:Disconnect()
					Connection = nil
				end
			end
		elseif Frame.voiceState and Frame.voiceState == "Connecting" and UseRefResult2 then
			local TweenShimmeringEffect = createTweenShimmeringEffect(UseRefResult2)
			TweenShimmeringEffect:Play()
			
			return function() --[[ Line: 119 ]]
				-- upvalues: TweenShimmeringEffect (copy), UseRefResult2 (upval), _Vector2 (upval)
				TweenShimmeringEffect:Cancel()
				
				if UseRefResult2 and UseRefResult2.current then
					UseRefResult2.current.Offset = _Vector2
				end
			end
		else
			return function() --[[ Line: 128 ]]
				-- upvalues: Connection (ref)
				if Connection then
					Connection:Disconnect()
					Connection = nil
				end
			end
		end
	end, { Frame.voiceState })
	local UseResult = nil
	local UseRefResult3 = nil
	
	if GetFFlagExpChatUseVoiceParticipantsStoreFunction() then
		UseRefResult3 = ReactModule.useRef(Frame.voiceState)
		ReactModule.useEffect(function() --[[ Line: 141 ]]
			-- upvalues: UseRefResult3 (ref), Frame (copy)
			UseRefResult3.current = Frame.voiceState
		end, { Frame.voiceState })
		UseResult = ReactModule.useCallback(function(p1) --[[ Line: 145 ]]
			-- upvalues: Frame (copy), UseRefResult3 (ref)
			if Frame.onActivated then
				Frame.onActivated(p1, UseRefResult3.current)
			end
		end, { Frame.onActivated })
	end
	if not EnableChatMicPerfBinding and not FFlagExpChatMicBubbleSingleImageModule then
		IconAssetName = Images[if GetFFlagExpChatEnableVoiceReverseNudgeModule() then Frame.iconAssetName or GetVoiceIndicatorAssetNameModule(Frame.voiceState, UseBindingResult, Frame.iconStyle, Frame.isUserToxic) else Frame.iconAssetName or GetVoiceIndicatorAssetNameModule(Frame.voiceState, UseBindingResult, Frame.iconStyle, false)]
	end
	return ReactModule.createElement("ImageButton", {
		AnchorPoint = Vector2.new(0.5, 1),
		Interactable = not IsTenFootInterfaceFunction() and nil,
		Selectable = not IsTenFootInterfaceFunction() and nil,
		Size = Frame.controlBubbleSize,
		LayoutOrder = Frame.LayoutOrder,
		BorderSizePixel = 0,
		Transparency = 1,
		ZIndex = 2,
		[ReactModule.Event.Activated] = if GetFFlagExpChatUseVoiceParticipantsStoreFunction() then UseResult else Frame.onActivated,
		BackgroundTransparency = 1,
		ref = UseRefResult1
	}, {
		UICorner = ReactModule.createElement("UICorner", { CornerRadius = UDim.new(0, Frame.cornerRadiusOffset) }),
		Contents = ReactModule.createElement("Frame", {
			BorderSizePixel = 0,
			BackgroundTransparency = 1,
			Size = UDim2.fromScale(1, 1)
		}, {
			UICorner = ReactModule.createElement("UICorner", { CornerRadius = UDim.new(0, Frame.cornerRadiusOffset) }),
			Icon = ReactModule.createElement(Image1, {
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				AnchorPoint = Vector2.new(0.5, 0.5),
				Position = UDim2.fromScale(0.5, 0.5),
				Size = Frame.iconSize,
				ImageTransparency = Frame.iconTransparency,
				Image = IconAssetName
			}, {
				ShimmerGradient = ReactModule.createElement("UIGradient", {
					Rotation = -45,
					Color = ColorSequence.new({
						ColorSequenceKeypoint.new(0, Color3.new(v1, v1, v1)),
						ColorSequenceKeypoint.new(0.5, Color3.new(0.8, 0.8, 0.8)),
						ColorSequenceKeypoint.new(1, Color3.new(v1, v1, v1))
					}),
					Enabled = Frame.voiceState == "Connecting",
					Offset = _Vector2
				}),
				ActivityGradient = FFlagExpChatMicBubbleSingleImageModule and ReactModule.createElement("UIGradient", {
					Rotation = 0,
					Color = UseBindingResult:map(function(p1: number): ColorSequence --[[ Line: 213 ]]
						return ColorSequence.new({
							ColorSequenceKeypoint.new(0, Color3.new(1, 1, 1)),
							ColorSequenceKeypoint.new(p1 * 0.5, Color3.new(1, 1, 1)),
							ColorSequenceKeypoint.new(p1 * 0.5 + 0.000001, Color3.new(0, 0, 0)),
							ColorSequenceKeypoint.new(1, Color3.new(0, 0, 0))
						})
					end),
					Transparency = NumberSequence.new(0),
					Enabled = Frame.voiceState ~= "Connecting"
				})
			})
		})
	})
end

return if GetFFlagExpChatUseVoiceParticipantsStoreFunction() then ReactModule.memo(WithSignalsDataModule(ControlBubble)) else ReactModule.memo(ControlBubble)