local SocialExperimentsModule = require(script:FindFirstAncestor("ExpChat").Parent.SocialExperiments)
local EnableInExpChatRewriteEngineFeature = game:GetEngineFeature("EnableInExpChatRewrite")
local InExpChatRewriteDeviceNameBlackList = game:DefineFastString("InExpChatRewriteDeviceNameBlackList", "")
local InExpChatRewriteOsVersionBlackList = game:DefineFastString("InExpChatRewriteOsVersionBlackList", "")
local EnableDeviceGateForInExpChatRewrite = game:DefineFastFlag("EnableDeviceGateForInExpChatRewrite", false)

return if EnableInExpChatRewriteEngineFeature and EnableDeviceGateForInExpChatRewrite then not SocialExperimentsModule.GetIsDeviceGated({
	enabled = EnableDeviceGateForInExpChatRewrite,
	featureName = SocialExperimentsModule.DeviceGateFeature.InExpChatRewrite,
	deviceNameBlackListString = InExpChatRewriteDeviceNameBlackList,
	osVersionBlackListString = InExpChatRewriteOsVersionBlackList
}) else EnableInExpChatRewriteEngineFeature