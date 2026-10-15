local expChat = script:FindFirstAncestor("ExpChat")
local parent = expChat.Parent
local roactModule = require(parent.Roact)
local reactIsModule = require(parent.ReactIs)
local otterModule = require(parent.Otter)
local messageEffectModule = require(expChat.MessageEffects.MessageEffect)
local runService = game:GetService("RunService")
local userGameSettingsService = UserSettings():GetService("UserGameSettings")
local bubbleChat = script:FindFirstAncestor("BubbleChat")
local getSpringFromSettingsModule = require(bubbleChat.Helpers.getSpringFromSettings)
local sendBubbleChatRenderedTelemetryModule = require(bubbleChat.Helpers.sendBubbleChatRenderedTelemetry)
local getBorderlessBubbleChatAnimationModule = require(bubbleChat.Helpers.getBorderlessBubbleChatAnimation)
local getServerTimeNowMillisModule = require(bubbleChat.Helpers.getServerTimeNowMillis)
local list = { messageEffectModule.BorderlessBubbleChat }

local function getScale(p1)
	return if p1 then 0.75 else 1
end

local function _(p1, p2)
	return 1 - (1 - p1) * (1 - p2)
end

local borderlessBubbleChat = roactModule.Component:extend("BorderlessBubbleChat")
borderlessBubbleChat.defaultProps = {
	text = "",
	timestamp = 0,
	isDistant = false,
	distanceTransparency = 0
}

function borderlessBubbleChat.init(p1)
	-- upvalues: roactModule (ref), otterModule (ref)
	local var1, var2 = roactModule.createBinding(p1:getAnimation())
	p1.animation = var1
	p1.updateAnimation = var2
	p1.animationConnection = nil
	local var3, var4 = roactModule.createBinding(0)
	p1.transparency = var3
	p1.updateTransparency = var4
	p1.transparencyMotor = otterModule.createSingleMotor(0)
	p1.transparencyMotor:onStep(p1.updateTransparency)
	p1.animatedTransparency = roactModule.joinBindings({ p1.transparency, p1.animation }):map(function(p2)
		return 1 - (1 - p2[1]) * (1 - p2[2].transparency)
	end)
	p1.textPosition = p1.animation:map(function(p2)
		return UDim2.new(0.5, 0, 1, p2.yOffset)
	end)
	p1.animationScale = p1.animation:map(function(p2)
		return p2.scale
	end)
end

function borderlessBubbleChat.getAnimation(p1)
	-- upvalues: getBorderlessBubbleChatAnimationModule (ref), getServerTimeNowMillisModule (ref), userGameSettingsService (ref)
	local var1 = getBorderlessBubbleChatAnimationModule((getServerTimeNowMillisModule() - p1.props.receivedAtMillis) / 1000)
	
	if userGameSettingsService.ReducedMotion then
		var1.scale = 1
		var1.yOffset = 0
	end
	return var1
end

function borderlessBubbleChat.stopAnimating(p1)
	if p1.animationConnection then
		p1.animationConnection:Disconnect()
		p1.animationConnection = nil
	end
end

function borderlessBubbleChat.render(p1)
	-- upvalues: sendBubbleChatRenderedTelemetryModule (ref), list (ref), reactIsModule (ref), roactModule (ref), getScale (ref)
	if p1.props.textChatMessageInstance then
		sendBubbleChatRenderedTelemetryModule(p1.props.textChatMessageInstance, list)
	end
	local distanceTransparency = p1.props.distanceTransparency
	
	return roactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		LayoutOrder = p1.props.timestamp,
		AnchorPoint = Vector2.new(0.5, 1),
		Position = UDim2.fromScale(0.5, 1),
		Size = UDim2.fromOffset(48, 48)
	}, {
		Scale = roactModule.createElement("UIScale", {
			Scale = if reactIsModule.isBinding(p1.props.isDistant) then p1.props.isDistant:map(getScale) elseif p1.props.isDistant then 0.75 else 1
		}),
		Text = roactModule.createElement("TextLabel", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			TextSize = 48,
			AutoLocalize = false,
			AnchorPoint = Vector2.new(0.5, 1),
			Position = p1.textPosition,
			AutomaticSize = Enum.AutomaticSize.XY,
			Size = UDim2.fromOffset(0, 0),
			Text = p1.props.text,
			TextTransparency = if reactIsModule.isBinding(distanceTransparency) then roactModule.joinBindings({ p1.animatedTransparency, distanceTransparency }):map(function(p2)
				return 1 - (1 - p2[1]) * (1 - p2[2])
			end) else p1.animatedTransparency:map(function(p2)
				-- upvalues: distanceTransparency (ref)
				return 1 - (1 - p2) * (1 - distanceTransparency)
			end)
		}, {
			AnimationScale = roactModule.createElement("UIScale", { Scale = p1.animationScale })
		})
	})
end

function borderlessBubbleChat.reportFadeOut(p1)
	if p1.props.onFadeOut then
		p1.props.onFadeOut(p1.props.messageId)
	end
end

function borderlessBubbleChat.fadeOut(p1)
	-- upvalues: getSpringFromSettingsModule (ref)
	if p1.isFadingOut then return end
	p1.isFadingOut = true
	
	if p1:getAnimation().isComplete then
		p1:reportFadeOut()
		
		return
	end
	p1.transparencyMotor:onComplete(function()
		-- upvalues: p1 (ref)
		p1:reportFadeOut()
	end)
	p1.transparencyMotor:setGoal(getSpringFromSettingsModule(p1.props.chatSettings, "transparency")(1))
end

function borderlessBubbleChat.didMount(p1)
	-- upvalues: runService (ref)
	if not p1.animation:getValue().isComplete then
		p1.animationConnection = runService.RenderStepped:Connect(function()
			-- upvalues: p1 (ref)
			local animation = p1:getAnimation()
			p1.updateAnimation(animation)
			
			if animation.isComplete then
				p1:stopAnimating()
			end
		end)
	end
	if p1.props.fadingOut then
		p1:fadeOut()
	end
end

function borderlessBubbleChat.didUpdate(p1)
	if p1.props.fadingOut then
		p1:fadeOut()
	end
end

function borderlessBubbleChat.willUnmount(p1)
	p1:stopAnimating()
	p1.transparencyMotor:destroy()
end

return borderlessBubbleChat