local coreGuiService = game:GetService("CoreGui")
local corePackagesService = game:GetService("CorePackages")
local _ = game:GetService("Players")
local robloxGui = coreGuiService:WaitForChild("RobloxGui")
local roactModule = require(corePackagesService.Packages.Roact)
local roactRoduxModule = require(corePackagesService.Packages.RoactRodux)
local tModule = require(corePackagesService.Packages.t)
local cryoModule = require(corePackagesService.Packages.Cryo)
local constantsModule = require(script.Parent.Parent.Constants)
local var1 = require(script.Parent.Parent.Logger)(script.Name)
local bubbleChatBillboardModule = require(script.Parent.BubbleChatBillboard)
local getFFlagBubbleVoiceIndicatorSettingModule = require(robloxGui.Modules.Flags.GetFFlagBubbleVoiceIndicatorSetting)
local chatBillboards = roactModule.Component:extend("ChatBillboards")
chatBillboards.validateProps = tModule.strictInterface({
	userMessages = tModule.map(tModule.string, tModule.array(tModule.string)),
	bubbleChatEnabled = tModule.boolean,
	voiceEnabled = tModule.boolean,
	participants = tModule.map(tModule.string, tModule.string)
})

function chatBillboards.getDerivedStateFromProps(p1, p2)
	-- upvalues: cryoModule (ref)
	return {
		userMessages = cryoModule.Dictionary.join(p2.userMessages or {}, p1.userMessages)
	}
end

function chatBillboards.init(p1)
	-- upvalues: var1 (ref), cryoModule (ref)
	var1:debug("Initializing")
	p1:setState({ userMessages = {} })
	
	function p2.onBillboardFadeOut(p2)
		-- upvalues: p1 (ref), cryoModule (copy)
		p1:setState({
			userMessages = cryoModule.Dictionary.join(p1.state.userMessages, { [p2] = cryoModule.None })
		})
	end
end

function chatBillboards.render(p1)
	-- upvalues: constantsModule (ref), var1 (ref), roactModule (ref), bubbleChatBillboardModule (ref)
	if not p1.props.voiceEnabled and not p1.props.bubbleChatEnabled then return end
	local t = {}
	
	for i, v in pairs(p1.state.userMessages) do
		t[i] = false
	end
	for i_1, v_1 in pairs(p1.props.participants) do
		if v_1 ~= constantsModule.VOICE_STATE.HIDDEN then
			t[i_1] = true
		end
	end
	local t_1 = {}
	
	for i_2, v_2 in pairs(t) do
		var1:trace("Rendering billboard for ...{}", string.sub(tostring(i_2), -4))
		t_1["BubbleChat_" .. i_2] = roactModule.createElement(bubbleChatBillboardModule, {
			userId = i_2,
			onFadeOut = p1.onBillboardFadeOut,
			voiceEnabled = p1.props.voiceEnabled and v_2,
			bubbleChatEnabled = p1.props.bubbleChatEnabled
		})
	end
	return roactModule.createElement("ScreenGui", { ResetOnSpawn = false }, t_1)
end

return roactRoduxModule.connect(function(p2)
	-- upvalues: getFFlagBubbleVoiceIndicatorSettingModule (ref)
	local voiceEnabled = p2.components.voiceEnabled
	
	if getFFlagBubbleVoiceIndicatorSettingModule() then
		voiceEnabled = p2.components.voiceEnabled and p2.chatSettings.Voice.ShowIndicator
	end
	return {
		userMessages = p2.userMessages,
		voiceEnabled = voiceEnabled,
		bubbleChatEnabled = p2.components.bubbleChatEnabled,
		participants = p2.voiceState
	}
end)(chatBillboards)