local BuildExperience = script:FindFirstAncestor("BuildExperience")
local Parent = BuildExperience.Parent
local CreatorAgentChatModule = require(Parent.DataHydration.CreatorAgentChat)
local SharedFlagsModule = require(Parent.SharedFlags)
local FFlagBuildExperienceManageDevProductModule = require(BuildExperience.Flags.FFlagBuildExperienceManageDevProduct)
local FFlagBuildExperienceManageDevProductModule1 = SharedFlagsModule.FFlagBuildExperienceManageMonetizationTool and FFlagBuildExperienceManageDevProductModule
local List = {}
local ToolsByKind = {}
local LocalToolDefinition = nil

if FFlagBuildExperienceManageDevProductModule1 then
	local StudioManageMonetizationTool = CreatorAgentChatModule.StudioManageMonetizationTool
	local config = {
		developerProduct = true,
		gamePass = SharedFlagsModule.FFlagBuildExperienceManageGamePass,
		subscription = SharedFlagsModule.FFlagBuildExperienceManageSubscription
	}
	
	for _, kIND in StudioManageMonetizationTool.KINDS do
		if config[kIND] then
			table.insert(List, kIND)
			ToolsByKind[kIND] = StudioManageMonetizationTool.forKind(kIND, config)
		end
	end
	LocalToolDefinition = StudioManageMonetizationTool.createLocalToolDefinition(List)
end
return {
	isEnabled = FFlagBuildExperienceManageDevProductModule1,
	toolsByKind = ToolsByKind,
	localToolDefinition = LocalToolDefinition
}