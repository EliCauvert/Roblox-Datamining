local IXPServiceWrapper = require(script:FindFirstAncestor("ExpChat").Parent.IxpServiceWrapper).IXPServiceWrapper
local expChatFocusNavigationIxpLayer = game:DefineFastString("ExpChatFocusNavigationIxpLayer", "ExperienceChat.FocusNavigation")

return {
	isTabNavEnabled = game:DefineFastFlag("ExpChatFocusNavigation", false),
	isExposureLoggingEnabled = game:DefineFastFlag("ExpChatFocusNavigationIxpEnabled", false),
	isBackupExposureLoggingEnabled = game:DefineFastFlag("ExpChatFocusNavigationBackupIxpEnabled", false),
	logExposure = function()
		-- upvalues: IXPServiceWrapper (ref), expChatFocusNavigationIxpLayer (ref)
		IXPServiceWrapper:LogFlagLinkedUserLayerExposure(expChatFocusNavigationIxpLayer)
	end
}