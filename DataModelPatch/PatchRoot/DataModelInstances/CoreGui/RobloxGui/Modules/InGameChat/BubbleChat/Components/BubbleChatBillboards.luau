local CorePackages = game:GetService("CorePackages")
local _ = game:GetService("Players")
local RoactModule = require(CorePackages.Packages.Roact)
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local TModule = require(CorePackages.Packages.t)
local CryoModule = require(CorePackages.Packages.Cryo)
local ConstantsModule = require(script.Parent.Parent.Constants)
local v1 = require(script.Parent.Parent.Logger)(script.Name)
local BubbleChatBillboardModule = require(script.Parent.BubbleChatBillboard)
local GetFFlagBubbleVoiceIndicatorSettingModule = require(game:GetService("CoreGui"):WaitForChild("RobloxGui").Modules.Flags.GetFFlagBubbleVoiceIndicatorSetting)
local ChatBillboards = RoactModule.Component:extend("ChatBillboards")
ChatBillboards.validateProps = TModule.strictInterface({
	userMessages = TModule.map(TModule.string, TModule.array(TModule.string)),
	bubbleChatEnabled = TModule.boolean,
	voiceEnabled = TModule.boolean,
	participants = TModule.map(TModule.string, TModule.string)
})

function ChatBillboards.getDerivedStateFromProps(p1, p2)
	-- upvalues: CryoModule (copy)
	return {
		userMessages = CryoModule.Dictionary.join(p2.userMessages or {}, p1.userMessages)
	}
end

function ChatBillboards.init(p1)
	-- upvalues: v1 (copy), CryoModule (copy)
	v1:debug("Initializing")
	p1:setState({ userMessages = {} })
	
	function p1.onBillboardFadeOut(p2)
		-- upvalues: p1 (copy), CryoModule (upval)
		p1:setState({
			userMessages = CryoModule.Dictionary.join(p1.state.userMessages, { [p2] = CryoModule.None })
		})
	end
end

function ChatBillboards.render(p1)
	-- upvalues: ConstantsModule (copy), v1 (copy), RoactModule (copy), BubbleChatBillboardModule (copy)
	if not p1.props.voiceEnabled and not p1.props.bubbleChatEnabled then return end
	local t = {}
	
	for i, _ in pairs(p1.state.userMessages) do
		t[i] = false
	end
	for i1, participant in pairs(p1.props.participants) do
		if participant ~= ConstantsModule.VOICE_STATE.HIDDEN then
			t[i1] = true
		end
	end
	local Elements = {}
	
	for UserId, value in pairs(t) do
		v1:trace("Rendering billboard for ...{}", (string.sub(tostring(UserId), -4)))
		Elements["BubbleChat_" .. UserId] = RoactModule.createElement(BubbleChatBillboardModule, {
			userId = UserId,
			onFadeOut = p1.onBillboardFadeOut,
			voiceEnabled = p1.props.voiceEnabled and value,
			bubbleChatEnabled = p1.props.bubbleChatEnabled
		})
	end
	return RoactModule.createElement("ScreenGui", { ResetOnSpawn = false }, Elements)
end

return RoactRoduxModule.connect(function(p2)
	-- upvalues: GetFFlagBubbleVoiceIndicatorSettingModule (copy)
	return {
		userMessages = p2.userMessages,
		voiceEnabled = if GetFFlagBubbleVoiceIndicatorSettingModule() then p2.components.voiceEnabled and p2.chatSettings.Voice.ShowIndicator else p2.components.voiceEnabled,
		bubbleChatEnabled = p2.components.bubbleChatEnabled,
		participants = p2.voiceState
	}
end)(ChatBillboards)