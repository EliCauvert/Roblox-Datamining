local buildExperience = script:FindFirstAncestor("BuildExperience")
local creatorAgentChatModule = require(buildExperience.Parent.DataHydration.CreatorAgentChat)
local fFlagBuildExperienceManageDevProductModule = require(buildExperience.Flags.FFlagBuildExperienceManageDevProduct)
local studioAskUserTool = creatorAgentChatModule.StudioAskUserTool
local studioManageDevProductTool = creatorAgentChatModule.StudioManageDevProductTool
local studioProposePlanTool = creatorAgentChatModule.StudioProposePlanTool

local function isWaitingOnDevProductApproval(p1, p2)
	-- upvalues: studioManageDevProductTool (ref)
	local cloned = table.clone(p2)
	while true do
		local var1, var2 = studioManageDevProductTool.findManageDevProductRequestInTurnState(p1, cloned)
		if var1 ~= nil then
			local var3 = studioManageDevProductTool.parseManageDevProductInput(var2)
			
			if var3 == nil or studioManageDevProductTool.getActionKind(var3.action) ~= "mutation" then
				cloned[var1] = true
				continue
			end
			return true
		end
		return false
	end
end

return function(p3, p4)
	-- upvalues: studioAskUserTool (ref), studioProposePlanTool (ref), fFlagBuildExperienceManageDevProductModule (ref), isWaitingOnDevProductApproval (ref)
	local _, var4 = studioAskUserTool.findQuestionsInTurnState(p3, p4)
	
	if var4 ~= nil then
		return true
	end
	local _, var5 = studioProposePlanTool.findPlanInTurnState(p3, p4)
	
	return if var5 == nil then fFlagBuildExperienceManageDevProductModule and isWaitingOnDevProductApproval(p3, p4) else true
end