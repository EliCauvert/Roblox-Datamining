local BuildExperience = script:FindFirstAncestor("BuildExperience")
local CreatorAgentChatModule = require(BuildExperience.Parent.DataHydration.CreatorAgentChat)
local FFlagBuildExperienceManageDevProductModule = require(BuildExperience.Flags.FFlagBuildExperienceManageDevProduct)
local StudioAskUserTool = CreatorAgentChatModule.StudioAskUserTool
local StudioManageDevProductTool = CreatorAgentChatModule.StudioManageDevProductTool
local StudioProposePlanTool = CreatorAgentChatModule.StudioProposePlanTool

local function isWaitingOnDevProductApproval(p1, Tbl): boolean --[[ Line: 15 ]]
	-- upvalues: StudioManageDevProductTool (copy)
	local Copy = table.clone(Tbl)
	while true do
		local ManageDevProductRequestInTurnState, ManageDevProductRequestInTurnState2 = StudioManageDevProductTool.findManageDevProductRequestInTurnState(p1, Copy)
		if ManageDevProductRequestInTurnState == nil then
			return false
		end
		local ParseManageDevProductInputResult = StudioManageDevProductTool.parseManageDevProductInput(ManageDevProductRequestInTurnState2)
		
		if ParseManageDevProductInputResult ~= nil and StudioManageDevProductTool.getActionKind(ParseManageDevProductInputResult.action) == "mutation" then
			return true
		end
		Copy[ManageDevProductRequestInTurnState] = true
	end
end

return function(p2, p3) --[[ Line: 33 | Named "isWaitingOnUserInput" ]]
	-- upvalues: StudioAskUserTool (copy), StudioProposePlanTool (copy), FFlagBuildExperienceManageDevProductModule (copy), isWaitingOnDevProductApproval (copy)
	local _, QuestionsInTurnState2 = StudioAskUserTool.findQuestionsInTurnState(p2, p3)
	
	if QuestionsInTurnState2 == nil then
		local _, PlanInTurnState2 = StudioProposePlanTool.findPlanInTurnState(p2, p3)
		
		return PlanInTurnState2 ~= nil or FFlagBuildExperienceManageDevProductModule and isWaitingOnDevProductApproval(p2, p3)
	else
		return true
	end
end