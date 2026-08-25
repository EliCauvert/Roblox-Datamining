local coreGuiService = game:GetService("CoreGui")
local corePackagesService = game:GetService("CorePackages")
local _ = game:GetService("Players")
local robloxGui = coreGuiService:WaitForChild("RobloxGui")
local roactModule = require(corePackagesService.Packages.Roact)
local roactRoduxModule = require(corePackagesService.Packages.RoactRodux)
local tModule = require(corePackagesService.Packages.t)
local cryoModule = require(corePackagesService.Packages.Cryo)
local constantsModule = require(script.Parent.Parent.Constants)
local var8 = require(script.Parent.Parent.Logger)(script.Name)
local bubbleChatBillboardModule = require(script.Parent.BubbleChatBillboard)
local getFFlagBubbleVoiceIndicatorSettingModule = require(robloxGui.Modules.Flags.GetFFlagBubbleVoiceIndicatorSetting)
local chatBillboards = roactModule.Component:extend("ChatBillboards")
chatBillboards.validateProps = tModule.strictInterface({
	userMessages = tModule.map(tModule.string, tModule.array(tModule.string)),
	bubbleChatEnabled = tModule.boolean,
	voiceEnabled = tModule.boolean,
	participants = tModule.map(tModule.string, tModule.string)
})

function chatBillboards.getDerivedStateFromProps(p0, p1)
	-- upvalues: cryoModule (ref)
	return {
		userMessages = cryoModule.Dictionary.join(p1.userMessages or {}, p0.userMessages)
	}
end

function chatBillboards.init(p2)
	-- upvalues: var8 (ref), cryoModule (ref)
	var8:debug("Initializing")
	p2:setState({ userMessages = {} })
	
	function p2.onBillboardFadeOut(p3)
		-- upvalues: p2 (ref), cryoModule (copy)
		p2:setState({
			userMessages = cryoModule.Dictionary.join(p2.state.userMessages, { [p3] = cryoModule.None })
		})
	end
end

function chatBillboards.render(p4)
	-- upvalues: constantsModule (ref), var8 (ref), roactModule (ref), bubbleChatBillboardModule (ref)
	if not p4.props.voiceEnabled and not p4.props.bubbleChatEnabled then return end
	local t = {}
	
	for i, v in pairs(p4.state.userMessages) do
		t[i] = false
	end
	for i_1, v_1 in pairs(p4.props.participants) do
		if v_1 ~= constantsModule.VOICE_STATE.HIDDEN then
			t[i_1] = true
		end
	end
	local t_1 = {}
	
	for i_2, v_2 in pairs(t) do
		var8:trace("Rendering billboard for ...{}", string.sub(tostring(i_2), -4))
		t_1["BubbleChat_" .. i_2] = roactModule.createElement(bubbleChatBillboardModule, {
			userId = i_2,
			onFadeOut = p4.onBillboardFadeOut,
			voiceEnabled = p4.props.voiceEnabled and v_2,
			bubbleChatEnabled = p4.props.bubbleChatEnabled
		})
	end
	return roactModule.createElement("ScreenGui", { ResetOnSpawn = false }, t_1)
end

return roactRoduxModule.connect(function(p5)
	-- upvalues: getFFlagBubbleVoiceIndicatorSettingModule (ref)
	local voiceEnabled = p5.components.voiceEnabled
	
	if getFFlagBubbleVoiceIndicatorSettingModule() then
		voiceEnabled = p5.components.voiceEnabled and p5.chatSettings.Voice.ShowIndicator
	end
	return {
		userMessages = p5.userMessages,
		voiceEnabled = voiceEnabled,
		bubbleChatEnabled = p5.components.bubbleChatEnabled,
		participants = p5.voiceState
	}
end)(chatBillboards)