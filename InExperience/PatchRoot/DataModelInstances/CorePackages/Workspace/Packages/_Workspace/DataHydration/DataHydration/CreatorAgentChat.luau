local SharedFlagsModule = require(script:FindFirstAncestor("DataHydration").Parent.SharedFlags)
local TypesModule = require(script.types)
local FFlagBuildExperienceManageSubscription = SharedFlagsModule.FFlagBuildExperienceManageSubscription
local FFlagBuildExperienceManageMonetizationTool = SharedFlagsModule.FFlagBuildExperienceManageMonetizationTool

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
	StudioManageMonetizationTool = if FFlagBuildExperienceManageMonetizationTool then require(script.StudioManageMonetizationTool) else nil,
	ClientToolItems = require(script.ClientToolItems),
	decodeAdCampaignEligibilityResult = require(script.decodeAdCampaignEligibilityResult),
	classifyAdCampaignFailure = require(script.classifyAdCampaignFailure),
	requestBuildSuggestions = require(script.BuildSuggestions.requestBuildSuggestions),
	debug = require(script.debug),
	experimentOverride = require(script.experimentOverride),
	captureSendConfiguration = require(script.sendConfiguration).capture,
	PreviewSpecs = require(script.PreviewSpecs),
	ErrorCodes = require(script.Acp.AcpProtocol).ErrorCodes,
	resolveCreatorAgentAcp = require(script.Env.resolveAcpUrl).resolveCreatorAgentAcp
}