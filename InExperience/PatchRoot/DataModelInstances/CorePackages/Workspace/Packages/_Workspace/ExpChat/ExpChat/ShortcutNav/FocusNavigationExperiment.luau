local IXPServiceWrapper = require(script:FindFirstAncestor("ExpChat").Parent.IxpServiceWrapper).IXPServiceWrapper
local ExpChatFocusNavigationIxpLayer = game:DefineFastString("ExpChatFocusNavigationIxpLayer", "ExperienceChat.FocusNavigation")

return {
	isTabNavEnabled = game:DefineFastFlag("ExpChatFocusNavigation", false),
	isExposureLoggingEnabled = game:DefineFastFlag("ExpChatFocusNavigationIxpEnabled", false),
	isBackupExposureLoggingEnabled = game:DefineFastFlag("ExpChatFocusNavigationBackupIxpEnabled", false),
	logExposure = function() --[[ Line: 27 ]]
		-- upvalues: IXPServiceWrapper (copy), ExpChatFocusNavigationIxpLayer (copy)
		IXPServiceWrapper:LogFlagLinkedUserLayerExposure(ExpChatFocusNavigationIxpLayer)
	end
}