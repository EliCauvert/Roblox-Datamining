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
local var1 = 0.6
local vector2 = Vector2.new(-1, 0)
local enableChatMicPerfBinding = game:DefineFastFlag("EnableChatMicPerfBinding", false)
local fFlagExpChatMicBubbleSingleImageModule = require(expChat.Flags.FFlagExpChatMicBubbleSingleImage)
local expChatMicActivityHeartbeatIncrement = game:DefineFastInt("ExpChatMicActivityHeartbeatIncrement", 3)

if game:DefineFastFlag("EnableDarkerShimmerTransparency", false) then
	var1 = 0.4
end
local getFFlagExpChatEnableVoiceReverseNudgeModule = require(expChat.Flags.GetFFlagExpChatEnableVoiceReverseNudge)
local getFFlagExpChatUseVoiceParticipantsStore = sharedFlagsModule.GetFFlagExpChatUseVoiceParticipantsStore
local getVoiceIndicatorAssetNameModule = require(expChat.BubbleChat.Helpers.getVoiceIndicatorAssetName)

local function createTweenShimmeringEffect(p1)
	-- upvalues: tweenService (ref)
	return tweenService:Create(p1:getValue(), TweenInfo.new(1, Enum.EasingStyle.Circular, Enum.EasingDirection.Out, -1), { Offset = Vector2.new(1, 0) })
end

local function ControlBubble(p1)
	-- upvalues: fFlagExpChatMicBubbleSingleImageModule (ref), reactModule (ref), getVoiceIndicatorAssetNameModule (ref), image (ref), enableChatMicPerfBinding (ref), imageSetLabel (ref), runService (ref), expChatMicActivityHeartbeatIncrement (ref), createTweenShimmeringEffect (ref), vector2 (ref), getFFlagExpChatUseVoiceParticipantsStore (ref), getFFlagExpChatEnableVoiceReverseNudgeModule (ref), images (ref), guiService (ref), var1 (write)
	local var2, var3, var4
	local _ = nil
	local _ = nil
	local var5 = nil
	local _ = nil
	
	if fFlagExpChatMicBubbleSingleImageModule then
		local var6, var7 = reactModule.useBinding(0)
		var2 = var6
		var3 = var7
		var5 = p1.iconAssetName or getVoiceIndicatorAssetNameModule(p1.voiceState, 1, p1.iconStyle, false)
		var4 = image
	elseif enableChatMicPerfBinding then
		local var8, var9 = reactModule.useBinding(0)
		var2 = var8
		var3 = var9
		var5 = var2:map(function(p2)
			-- upvalues: p1 (ref), getVoiceIndicatorAssetNameModule (copy)
			return p1.iconAssetName or getVoiceIndicatorAssetNameModule(p1.voiceState, p2, p1.iconStyle, false)
		end)
		var4 = image
	else
		local var10, var11 = reactModule.useState(0)
		var2 = var10
		var3 = var11
		var4 = imageSetLabel
	end
	local var12 = reactModule.useRef(0)
	local _ = reactModule.useRef(nil)
	local _ = reactModule.useRef(nil)
	local var13 = reactModule.useRef(nil)
	local var14 = reactModule.useRef(nil)
	reactModule.useEffect(function()
		-- upvalues: var13 (write), var14 (write)
		if var13.current then
			local UIGradient = var13.current:FindFirstChildWhichIsA("UIGradient", true)
			
			if UIGradient then
				var14.current = UIGradient
			end
		end
	end, { var13 })
	reactModule.useEffect(function()
		-- upvalues: p1 (ref), runService (copy), var12 (ref), expChatMicActivityHeartbeatIncrement (copy), var3 (write), var14 (write), createTweenShimmeringEffect (copy), vector2 (copy)
		local postSimulationConnection = nil
		
		if p1.voiceState and p1.voiceState == "Talking" then
			postSimulationConnection = runService.PostSimulation:Connect(function()
				-- upvalues: var12 (copy), expChatMicActivityHeartbeatIncrement (copy), var3 (copy)
				var12.current = ((var12.current or 0) + 1) % expChatMicActivityHeartbeatIncrement
				
				if var12.current == 0 then
					var3(math.random())
				end
			end)
			
			return function()
				-- upvalues: postSimulationConnection (write)
				if postSimulationConnection then
					postSimulationConnection:Disconnect()
					postSimulationConnection = nil
				end
			end
		elseif p1.voiceState and p1.voiceState == "Connecting" and var14 then
			local var15 = createTweenShimmeringEffect(var14)
			var15:Play()
			
			return function()
				-- upvalues: var15 (ref), var14 (copy), vector2 (copy)
				var15:Cancel()
				
				if var14 and var14.current then
					var14.current.Offset = vector2
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
	local var15 = nil
	local _ = nil
	
	if getFFlagExpChatUseVoiceParticipantsStore() then
		local var16 = reactModule.useRef(p1.voiceState)
		reactModule.useEffect(function()
			-- upvalues: var16 (write), p1 (ref)
			var16.current = p1.voiceState
		end, { p1.voiceState })
		var15 = reactModule.useCallback(function(p2)
			-- upvalues: p1 (ref), var16 (write)
			if p1.onActivated then
				p1.onActivated(p2, var16.current)
			end
		end, { p1.onActivated })
	end
	if not enableChatMicPerfBinding and not fFlagExpChatMicBubbleSingleImageModule then
		local var17 = p1.iconAssetName or getVoiceIndicatorAssetNameModule(p1.voiceState, var2, p1.iconStyle, false)
		
		if getFFlagExpChatEnableVoiceReverseNudgeModule() then
			var17 = p1.iconAssetName or getVoiceIndicatorAssetNameModule(p1.voiceState, var2, p1.iconStyle, p1.isUserToxic)
		end
		var5 = images[var17]
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
		[reactModule.Event.Activated] = if getFFlagExpChatUseVoiceParticipantsStore() then var15 else p1.onActivated,
		BackgroundTransparency = 1,
		ref = var13
	}, {
		UICorner = reactModule.createElement("UICorner", { CornerRadius = UDim.new(0, p1.cornerRadiusOffset) }),
		Contents = reactModule.createElement("Frame", {
			BorderSizePixel = 0,
			BackgroundTransparency = 1,
			Size = UDim2.fromScale(1, 1)
		}, {
			UICorner = reactModule.createElement("UICorner", { CornerRadius = UDim.new(0, p1.cornerRadiusOffset) }),
			Icon = reactModule.createElement(var4, {
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				AnchorPoint = Vector2.new(0.5, 0.5),
				Position = UDim2.fromScale(0.5, 0.5),
				Size = p1.iconSize,
				ImageTransparency = p1.iconTransparency,
				Image = var5
			}, {
				ShimmerGradient = reactModule.createElement("UIGradient", {
					Rotation = -45,
					Color = ColorSequence.new({
						ColorSequenceKeypoint.new(0, Color3.new(var1, var1, var1)),
						ColorSequenceKeypoint.new(0.5, Color3.new(0.8, 0.8, 0.8)),
						ColorSequenceKeypoint.new(1, Color3.new(var1, var1, var1))
					}),
					Enabled = p1.voiceState == "Connecting",
					Offset = vector2
				}),
				ActivityGradient = fFlagExpChatMicBubbleSingleImageModule and reactModule.createElement("UIGradient", {
					Rotation = 0,
					Color = var2:map(function(p2)
						return ColorSequence.new({
							ColorSequenceKeypoint.new(0, Color3.new(1, 1, 1)),
							ColorSequenceKeypoint.new(p2 * 0.5, Color3.new(1, 1, 1)),
							ColorSequenceKeypoint.new(p2 * 0.5 + 0.000001, Color3.new(0, 0, 0)),
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