local corePackagesService = game:GetService("CorePackages")
local roactModule = require(corePackagesService.Packages.Roact)
local tModule = require(corePackagesService.Packages.t)
local inGameMenuPolicyModule = require(script.Parent.Parent.Parent.InGameMenu.InGameMenuPolicy)
local voiceChatPromptFrameModule = require(script.Parent.VoiceChatPromptFrame)
local voiceChatPrompt = roactModule.PureComponent:extend("VoiceChatPrompt")
voiceChatPrompt.validateProps = tModule.strictInterface({
	promptSignal = tModule.optional(tModule.RBXScriptSignal),
	errorText = tModule.optional(tModule.string),
	bannedUntil = tModule.optional(tModule.string),
	onContinueFunc = tModule.optional(tModule.callback),
	onPrimaryActivated = tModule.optional(tModule.callback),
	onSecondaryActivated = tModule.optional(tModule.callback),
	onReadyForSignal = tModule.optional(tModule.callback),
	Analytics = tModule.optional(tModule.table),
	VoiceChatServiceManager = tModule.optional(tModule.table),
	policyMapper = tModule.optional(tModule.callback),
	settingsAppAvailable = tModule.optional(tModule.boolean)
})

function voiceChatPrompt.render(p1)
	-- upvalues: roactModule (ref), inGameMenuPolicyModule (ref), voiceChatPromptFrameModule (ref)
	return roactModule.createElement("ScreenGui", {
		AutoLocalize = false,
		DisplayOrder = 9,
		IgnoreGuiInset = true,
		OnTopOfCoreBlur = true,
		ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	}, {
		PolicyProvider = roactModule.createElement(inGameMenuPolicyModule.Provider, {
			policy = { p1.props.policyMapper or inGameMenuPolicyModule.Mapper }
		}, {
			Content = roactModule.createElement(voiceChatPromptFrameModule, p1.props)
		})
	})
end

return voiceChatPrompt