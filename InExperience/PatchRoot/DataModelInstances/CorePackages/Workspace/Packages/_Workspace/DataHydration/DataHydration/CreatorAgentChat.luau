local SharedFlagsModule = require(script:FindFirstAncestor("DataHydration").Parent.SharedFlags)
local TypesModule = require(script.types)
local FFlagBuildExperienceManageSubscription = SharedFlagsModule.FFlagBuildExperienceManageSubscription

return {
	FFlagBuildAgentAdCampaignCard = require(script.FFlagBuildAgentAdCampaignCard),
	getCreatorAgentChatStore = require(script.getCreatorAgentChatStore),
	createCreatorAgentChatStore = require(script.createCreatorAgentChatStore),
	createMockStore = require(script.createMockStore),
	TurnStateReducer = require(script.turnState),
	PublishToolUtils = require(script.publishToolUtils),
	ResumeNotification = require(script.ResumeNotification),
	StudioAskUserTool = require(script.StudioAskUserTool),
	StudioProposePlanTool = require(script.StudioProposePlanTool),
	SubagentTasks = require(script.SubagentTasks),
	SubagentTaskStatus = TypesModule.SubagentTaskStatus,
	SubagentTaskCategory = TypesModule.SubagentTaskCategory,
	RequestFailureKind = TypesModule.RequestFailureKind,
	StudioClientLogsTool = require(script.StudioClientLogsTool),
	StudioClientDataModelTools = require(script.StudioClientDataModelTools),
	StudioManageDevProductTool = require(script.StudioManageDevProductTool),
	StudioManageGamePassTool = if SharedFlagsModule.FFlagBuildExperienceManageGamePass then require(script.StudioManageGamePassTool) else nil,
	StudioManageSubscriptionTool = if FFlagBuildExperienceManageSubscription then require(script.StudioManageSubscriptionTool) else nil,
	ClientToolItems = require(script.ClientToolItems),
	decodeAdCampaignEligibilityResult = require(script.decodeAdCampaignEligibilityResult),
	classifyAdCampaignFailure = require(script.classifyAdCampaignFailure),
	debug = require(script.debug),
	experimentOverride = require(script.experimentOverride),
	PreviewSpecs = require(script.PreviewSpecs),
	ErrorCodes = require(script.Acp.AcpProtocol).ErrorCodes,
	resolveCreatorAgentAcp = require(script.Env.resolveAcpUrl).resolveCreatorAgentAcp
}