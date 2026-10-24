local CorePackages = game:GetService("CorePackages")
local RoactModule = require(CorePackages.Packages.Roact)
local TModule = require(CorePackages.Packages.t)
local InGameMenuPolicyModule = require(script.Parent.Parent.Parent.InGameMenu.InGameMenuPolicy)
local VoiceChatPromptFrameModule = require(script.Parent.VoiceChatPromptFrame)
local VoiceChatPrompt = RoactModule.PureComponent:extend("VoiceChatPrompt")
VoiceChatPrompt.validateProps = TModule.strictInterface({
	promptSignal = TModule.optional(TModule.RBXScriptSignal),
	errorText = TModule.optional(TModule.string),
	bannedUntil = TModule.optional(if require(script.Parent.Parent.Parent.VoiceChat.Flags.FFlagVoiceChatBanDurationUseServerTime) then TModule.interface({
		minutes = TModule.number,
		absoluteSeconds = TModule.number
	}) else TModule.string),
	onContinueFunc = TModule.optional(TModule.callback),
	onPrimaryActivated = TModule.optional(TModule.callback),
	onSecondaryActivated = TModule.optional(TModule.callback),
	onReadyForSignal = TModule.optional(TModule.callback),
	Analytics = TModule.optional(TModule.table),
	VoiceChatServiceManager = TModule.optional(TModule.table),
	policyMapper = TModule.optional(TModule.callback),
	settingsAppAvailable = TModule.optional(TModule.boolean)
})

function VoiceChatPrompt.render(p1)
	-- upvalues: RoactModule (copy), InGameMenuPolicyModule (copy), VoiceChatPromptFrameModule (copy)
	return RoactModule.createElement("ScreenGui", {
		AutoLocalize = false,
		DisplayOrder = 9,
		IgnoreGuiInset = true,
		OnTopOfCoreBlur = true,
		ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	}, {
		PolicyProvider = RoactModule.createElement(InGameMenuPolicyModule.Provider, {
			policy = { p1.props.policyMapper or InGameMenuPolicyModule.Mapper }
		}, {
			Content = RoactModule.createElement(VoiceChatPromptFrameModule, p1.props)
		})
	})
end

return VoiceChatPrompt