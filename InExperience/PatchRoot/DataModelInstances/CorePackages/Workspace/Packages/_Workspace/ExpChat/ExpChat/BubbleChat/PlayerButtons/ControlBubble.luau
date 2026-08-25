local runService = game:GetService("RunService")
local tweenService = game:GetService("TweenService")
local guiService = game:GetService("GuiService")
local expChat = script:FindFirstAncestor("ExpChat")
local parent = expChat.Parent
local reactModule = require(parent.React)
local sharedFlagsModule = require(parent.SharedFlags)
local withSignalsDataModule = require(script.Parent.withSignalsData)
local UIBloxModule = require(parent.UIBlox)
local images = UIBloxModule.App.ImageSet.Images
local imageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local image = require(parent.Foundation).Image
local var8 = 0.6
local vector2 = Vector2.new(-1, 0)
local enableChatMicPerfBinding = game:DefineFastFlag("EnableChatMicPerfBinding", false)
local fFlagExpChatMicBubbleSingleImageModule = require(expChat.Flags.FFlagExpChatMicBubbleSingleImage)
local expChatMicActivityHeartbeatIncrement = game:DefineFastInt("ExpChatMicActivityHeartbeatIncrement", 3)

if game:DefineFastFlag("EnableDarkerShimmerTransparency", false) then
	var8 = 0.4
end
local getFFlagExpChatEnableVoiceReverseNudgeModule = require(expChat.Flags.GetFFlagExpChatEnableVoiceReverseNudge)
local getFFlagExpChatUseVoiceParticipantsStore = sharedFlagsModule.GetFFlagExpChatUseVoiceParticipantsStore
local getVoiceIndicatorAssetNameModule = require(expChat.BubbleChat.Helpers.getVoiceIndicatorAssetName)

local function createTweenShimmeringEffect(p0)
	-- upvalues: tweenService (ref)
	return tweenService:Create(p0:getValue(), TweenInfo.new(1, Enum.EasingStyle.Circular, Enum.EasingDirection.Out, -1), { Offset = Vector2.new(1, 0) })
end

local function ControlBubble(p1)
	-- upvalues: fFlagExpChatMicBubbleSingleImageModule (ref), reactModule (ref), getVoiceIndicatorAssetNameModule (ref), image (ref), enableChatMicPerfBinding (ref), imageSetLabel (ref), runService (ref), expChatMicActivityHeartbeatIncrement (ref), createTweenShimmeringEffect (ref), vector2 (ref), getFFlagExpChatUseVoiceParticipantsStore (ref), getFFlagExpChatEnableVoiceReverseNudgeModule (ref), images (ref), guiService (ref), var8 (write)
	local var20, var21, var22
	local _ = nil
	local _ = nil
	local var17 = nil
	local _ = nil
	
	if fFlagExpChatMicBubbleSingleImageModule then
		local var18, var19 = reactModule.useBinding(0)
		var20 = var18
		var21 = var19
		var17 = p1.iconAssetName or getVoiceIndicatorAssetNameModule(p1.voiceState, 1, p1.iconStyle, false)
		var22 = image
	elseif enableChatMicPerfBinding then
		local var23, var24 = reactModule.useBinding(0)
		var20 = var23
		var21 = var24
		var17 = var20:map(function(p2)
			-- upvalues: p1 (ref), getVoiceIndicatorAssetNameModule (copy)
			return p1.iconAssetName or getVoiceIndicatorAssetNameModule(p1.voiceState, p2, p1.iconStyle, false)
		end)
		var22 = image
	else
		local var25, var26 = reactModule.useState(0)
		var20 = var25
		var21 = var26
		var22 = imageSetLabel
	end
	local var27 = reactModule.useRef(0)
	local _ = reactModule.useRef(nil)
	local _ = reactModule.useRef(nil)
	local var28 = reactModule.useRef(nil)
	local var29 = reactModule.useRef(nil)
	reactModule.useEffect(function()
		-- upvalues: var28 (write), var29 (write)
		if var28.current then
			local UIGradient = var28.current:FindFirstChildWhichIsA("UIGradient", true)
			
			if UIGradient then
				var29.current = UIGradient
			end
		end
	end, { var28 })
	reactModule.useEffect(function()
		-- upvalues: p1 (ref), runService (copy), var27 (ref), expChatMicActivityHeartbeatIncrement (copy), var21 (write), var29 (write), createTweenShimmeringEffect (copy), vector2 (copy)
		local postSimulationConnection = nil
		
		if p1.voiceState and p1.voiceState == "Talking" then
			postSimulationConnection = runService.PostSimulation:Connect(function()
				-- upvalues: var27 (copy), expChatMicActivityHeartbeatIncrement (copy), var21 (copy)
				var27.current = ((var27.current or 0) + 1) % expChatMicActivityHeartbeatIncrement
				
				if var27.current == 0 then
					var21(math.random())
				end
			end)
			
			return function()
				-- upvalues: postSimulationConnection (write)
				if postSimulationConnection then
					postSimulationConnection:Disconnect()
					postSimulationConnection = nil
				end
			end
		elseif p1.voiceState and p1.voiceState == "Connecting" and var29 then
			local var35 = createTweenShimmeringEffect(var29)
			var35:Play()
			
			return function()
				-- upvalues: var35 (ref), var29 (copy), vector2 (copy)
				var35:Cancel()
				
				if var29 and var29.current then
					var29.current.Offset = vector2
				end
			end
		end
		return function()
			-- upvalues: postSimulationConnection (write)
			if postSimulationConnection then
				postSimulationConnection:Disconnect()
				postSimulationConnection = nil
			end
		end
	end, { p1.voiceState })
	local var30 = nil
	local _ = nil
	
	if getFFlagExpChatUseVoiceParticipantsStore() then
		local var31 = reactModule.useRef(p1.voiceState)
		reactModule.useEffect(function()
			-- upvalues: var31 (write), p1 (ref)
			var31.current = p1.voiceState
		end, { p1.voiceState })
		var30 = reactModule.useCallback(function(p3)
			-- upvalues: p1 (ref), var31 (write)
			if p1.onActivated then
				p1.onActivated(p3, var31.current)
			end
		end, { p1.onActivated })
	end
	if not enableChatMicPerfBinding and not fFlagExpChatMicBubbleSingleImageModule then
		local var32 = p1.iconAssetName or getVoiceIndicatorAssetNameModule(p1.voiceState, var20, p1.iconStyle, false)
		
		if getFFlagExpChatEnableVoiceReverseNudgeModule() then
			var32 = p1.iconAssetName or getVoiceIndicatorAssetNameModule(p1.voiceState, var20, p1.iconStyle, p1.isUserToxic)
		end
		var17 = images[var32]
	end
	return reactModule.createElement("ImageButton", {
		AnchorPoint = Vector2.new(0.5, 1),
		Interactable = if guiService:IsTenFootInterface() then false else nil,
		Selectable = if guiService:IsTenFootInterface() then false else nil,
		Size = p1.controlBubbleSize,
		LayoutOrder = p1.LayoutOrder,
		BorderSizePixel = 0,
		Transparency = 1,
		ZIndex = 2,
		[reactModule.Event.Activated] = if getFFlagExpChatUseVoiceParticipantsStore() then var30 else p1.onActivated,
		BackgroundTransparency = 1,
		ref = var28
	}, {
		UICorner = reactModule.createElement("UICorner", { CornerRadius = UDim.new(0, p1.cornerRadiusOffset) }),
		Contents = reactModule.createElement("Frame", {
			BorderSizePixel = 0,
			BackgroundTransparency = 1,
			Size = UDim2.fromScale(1, 1)
		}, {
			UICorner = reactModule.createElement("UICorner", { CornerRadius = UDim.new(0, p1.cornerRadiusOffset) }),
			Icon = reactModule.createElement(var22, {
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				AnchorPoint = Vector2.new(0.5, 0.5),
				Position = UDim2.fromScale(0.5, 0.5),
				Size = p1.iconSize,
				ImageTransparency = p1.iconTransparency,
				Image = var17
			}, {
				ShimmerGradient = reactModule.createElement("UIGradient", {
					Rotation = -45,
					Color = ColorSequence.new({
						ColorSequenceKeypoint.new(0, Color3.new(var8, var8, var8)),
						ColorSequenceKeypoint.new(0.5, Color3.new(0.8, 0.8, 0.8)),
						ColorSequenceKeypoint.new(1, Color3.new(var8, var8, var8))
					}),
					Enabled = p1.voiceState == "Connecting",
					Offset = vector2
				}),
				ActivityGradient = fFlagExpChatMicBubbleSingleImageModule and reactModule.createElement("UIGradient", {
					Rotation = 0,
					Color = var20:map(function(p4)
						return ColorSequence.new({
							ColorSequenceKeypoint.new(0, Color3.new(1, 1, 1)),
							ColorSequenceKeypoint.new(p4 * 0.5, Color3.new(1, 1, 1)),
							ColorSequenceKeypoint.new(p4 * 0.5 + 0.000001, Color3.new(0, 0, 0)),
							ColorSequenceKeypoint.new(1, Color3.new(0, 0, 0))
						})
					end),
					Transparency = NumberSequence.new(0),
					Enabled = p1.voiceState ~= "Connecting"
				})
			})
		})
	})
end

return if getFFlagExpChatUseVoiceParticipantsStore() then reactModule.memo(withSignalsDataModule(ControlBubble)) else reactModule.memo(ControlBubble)