local socialExperimentsModule = require(script:FindFirstAncestor("ExpChat").Parent.SocialExperiments)
local enableInExpChatRewriteEngineFeature = game:GetEngineFeature("EnableInExpChatRewrite")
local enableDeviceGateForInExpChatRewrite = game:DefineFastFlag("EnableDeviceGateForInExpChatRewrite", false)

return if enableInExpChatRewriteEngineFeature and enableDeviceGateForInExpChatRewrite then not socialExperimentsModule.GetIsDeviceGated({
	enabled = enableDeviceGateForInExpChatRewrite,
	featureName = socialExperimentsModule.DeviceGateFeature.InExpChatRewrite,
	deviceNameBlackListString = game:DefineFastString("InExpChatRewriteDeviceNameBlackList", ""),
	osVersionBlackListString = game:DefineFastString("InExpChatRewriteOsVersionBlackList", "")
}) else enableInExpChatRewriteEngineFeature