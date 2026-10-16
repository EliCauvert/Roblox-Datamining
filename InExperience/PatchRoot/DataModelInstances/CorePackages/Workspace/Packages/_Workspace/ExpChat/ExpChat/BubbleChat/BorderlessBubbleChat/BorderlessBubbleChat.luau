local ExpChat = script:FindFirstAncestor("ExpChat")
local Parent = ExpChat.Parent
local RoactModule = require(Parent.Roact)
local ReactIsModule = require(Parent.ReactIs)
local OtterModule = require(Parent.Otter)
local RunService = game:GetService("RunService")
local UserGameSettings = UserSettings():GetService("UserGameSettings")
local BubbleChat = script:FindFirstAncestor("BubbleChat")
local GetSpringFromSettingsModule = require(BubbleChat.Helpers.getSpringFromSettings)
local SendBubbleChatRenderedTelemetryModule = require(BubbleChat.Helpers.sendBubbleChatRenderedTelemetry)
local GetBorderlessBubbleChatAnimationModule = require(BubbleChat.Helpers.getBorderlessBubbleChatAnimation)
local GetServerTimeNowMillisModule = require(BubbleChat.Helpers.getServerTimeNowMillis)
local list = {
	require(ExpChat.MessageEffects.MessageEffect).BorderlessBubbleChat
}

local function getScale(p1): number --[[ Line: 23 ]]
	return if p1 then 0.75 else 1
end

local function _(p1: number, p2: number): number --[[ Line: 27 | Named "combineTransparencies" ]]
	return 1 - (1 - p1) * (1 - p2)
end

local BorderlessBubbleChat = RoactModule.Component:extend("BorderlessBubbleChat")
BorderlessBubbleChat.defaultProps = {
	text = "",
	timestamp = 0,
	isDistant = false,
	distanceTransparency = 0
}

function BorderlessBubbleChat.init(p1) --[[ Line: 39 ]]
	-- upvalues: RoactModule (copy), OtterModule (copy)
	p1.animation, p1.updateAnimation = RoactModule.createBinding(p1:getAnimation())
	p1.animationConnection = nil
	p1.transparency, p1.updateTransparency = RoactModule.createBinding(0)
	p1.transparencyMotor = OtterModule.createSingleMotor(0)
	p1.transparencyMotor:onStep(p1.updateTransparency)
	p1.animatedTransparency = RoactModule.joinBindings({ p1.transparency, p1.animation }):map(function(Entry): number --[[ Line: 48 ]]
		return 1 - (1 - Entry[1]) * (1 - Entry[2].transparency)
	end)
	p1.textPosition = p1.animation:map(function(p2): UDim2 --[[ Line: 51 ]]
		return UDim2.new(0.5, 0, 1, p2.yOffset)
	end)
	p1.animationScale = p1.animation:map(function(p2) --[[ Line: 54 ]]
		return p2.scale
	end)
end

function BorderlessBubbleChat.getAnimation(p1) --[[ Line: 60 ]]
	-- upvalues: GetBorderlessBubbleChatAnimationModule (copy), GetServerTimeNowMillisModule (copy), UserGameSettings (copy)
	local BorderlessBubbleChatAnimationModule = GetBorderlessBubbleChatAnimationModule((GetServerTimeNowMillisModule() - p1.props.receivedAtMillis) / 1000)
	
	if UserGameSettings.ReducedMotion then
		BorderlessBubbleChatAnimationModule.scale = 1
		BorderlessBubbleChatAnimationModule.yOffset = 0
	end
	return BorderlessBubbleChatAnimationModule
end

function BorderlessBubbleChat.stopAnimating(p1) --[[ Line: 70 ]]
	if p1.animationConnection then
		p1.animationConnection:Disconnect()
		p1.animationConnection = nil
	end
end

function BorderlessBubbleChat.render(p1) --[[ Line: 77 ]]
	-- upvalues: SendBubbleChatRenderedTelemetryModule (copy), list (copy), ReactIsModule (copy), RoactModule (copy), getScale (copy)
	if p1.props.textChatMessageInstance then
		SendBubbleChatRenderedTelemetryModule(p1.props.textChatMessageInstance, list)
	end
	local DistanceTransparency = p1.props.distanceTransparency
	
	return RoactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		LayoutOrder = p1.props.timestamp,
		AnchorPoint = Vector2.new(0.5, 1),
		Position = UDim2.fromScale(0.5, 1),
		Size = UDim2.fromOffset(48, 48)
	}, {
		Scale = RoactModule.createElement("UIScale", {
			Scale = if ReactIsModule.isBinding(p1.props.isDistant) then p1.props.isDistant:map(getScale) elseif p1.props.isDistant then 0.75 else 1
		}),
		Text = RoactModule.createElement("TextLabel", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			TextSize = 48,
			AutoLocalize = false,
			AnchorPoint = Vector2.new(0.5, 1),
			Position = p1.textPosition,
			AutomaticSize = Enum.AutomaticSize.XY,
			Size = UDim2.fromOffset(0, 0),
			Text = p1.props.text,
			TextTransparency = if ReactIsModule.isBinding(DistanceTransparency) then RoactModule.joinBindings({ p1.animatedTransparency, DistanceTransparency }):map(function(Entry): number --[[ Line: 84 ]]
				return 1 - (1 - Entry[1]) * (1 - Entry[2])
			end) else p1.animatedTransparency:map(function(p2: number): number --[[ Line: 87 ]]
				-- upvalues: DistanceTransparency (copy)
				return 1 - (1 - p2) * (1 - DistanceTransparency)
			end)
		}, {
			AnimationScale = RoactModule.createElement("UIScale", { Scale = p1.animationScale })
		})
	})
end

function BorderlessBubbleChat.reportFadeOut(p1) --[[ Line: 124 ]]
	if p1.props.onFadeOut then
		p1.props.onFadeOut(p1.props.messageId)
	end
end

function BorderlessBubbleChat.fadeOut(p1) --[[ Line: 130 ]]
	-- upvalues: GetSpringFromSettingsModule (copy)
	if p1.isFadingOut then return end
	p1.isFadingOut = true
	
	if p1:getAnimation().isComplete then
		p1:reportFadeOut()
		
		return
	else
		p1.transparencyMotor:onComplete(function() --[[ Line: 142 ]]
			-- upvalues: p1 (copy)
			p1:reportFadeOut()
		end)
		p1.transparencyMotor:setGoal(GetSpringFromSettingsModule(p1.props.chatSettings, "transparency")(1))
	end
end

function BorderlessBubbleChat.didMount(p1) --[[ Line: 150 ]]
	-- upvalues: RunService (copy)
	if not p1.animation:getValue().isComplete then
		p1.animationConnection = RunService.RenderStepped:Connect(function() --[[ Line: 152 ]]
			-- upvalues: p1 (copy)
			local Animation = p1:getAnimation()
			p1.updateAnimation(Animation)
			
			if Animation.isComplete then
				p1:stopAnimating()
			end
		end)
	end
	if p1.props.fadingOut then
		p1:fadeOut()
	end
end

function BorderlessBubbleChat.didUpdate(p1) --[[ Line: 166 ]]
	if p1.props.fadingOut then
		p1:fadeOut()
	end
end

function BorderlessBubbleChat.willUnmount(p1) --[[ Line: 172 ]]
	p1:stopAnimating()
	p1.transparencyMotor:destroy()
end

return BorderlessBubbleChat