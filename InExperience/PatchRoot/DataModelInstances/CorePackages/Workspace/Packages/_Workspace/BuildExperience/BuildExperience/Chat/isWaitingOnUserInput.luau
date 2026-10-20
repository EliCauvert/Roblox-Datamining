local BuildExperience = script:FindFirstAncestor("BuildExperience")
local Parent = BuildExperience.Parent
local CreatorAgentChatModule = require(Parent.DataHydration.CreatorAgentChat)
local FFlagBuildExperienceManageDevProductModule = require(BuildExperience.Flags.FFlagBuildExperienceManageDevProduct)
local FFlagBuildExperienceManageGamePass = require(Parent.SharedFlags).FFlagBuildExperienceManageGamePass
local StudioAskUserTool = CreatorAgentChatModule.StudioAskUserTool
local StudioManageDevProductTool = CreatorAgentChatModule.StudioManageDevProductTool
local StudioManageGamePassTool = CreatorAgentChatModule.StudioManageGamePassTool
local StudioProposePlanTool = CreatorAgentChatModule.StudioProposePlanTool

local function isWaitingOnMonetizationApproval(p1, Tbl, Callback2, Callback, Callback1): boolean
	local Copy = table.clone(Tbl)
	while true do
		local CallbackResult, CallbackResult2 = Callback2(p1, Copy)
		if CallbackResult == nil then
			return false
		end
		local CallbackResult1 = Callback(CallbackResult2)
		
		if CallbackResult1 ~= nil and Callback1(CallbackResult1.action) == "mutation" then
			return true
		end
		Copy[CallbackResult] = true
	end
end

local function _(p2, p3)
	-- upvalues: isWaitingOnMonetizationApproval (copy), StudioManageDevProductTool (copy)
	return isWaitingOnMonetizationApproval(p2, p3, StudioManageDevProductTool.findManageDevProductRequestInTurnState, StudioManageDevProductTool.parseManageDevProductInput, StudioManageDevProductTool.getActionKind)
end

local _ = function(p2, p3)
	-- upvalues: isWaitingOnMonetizationApproval (copy), StudioManageGamePassTool (copy)
	return isWaitingOnMonetizationApproval(p2, p3, StudioManageGamePassTool.findRequestInTurnState, StudioManageGamePassTool.parseInput, StudioManageGamePassTool.getActionKind)
end

return function(p2, p3)
	-- upvalues: StudioAskUserTool (copy), StudioProposePlanTool (copy), FFlagBuildExperienceManageDevProductModule (copy), isWaitingOnMonetizationApproval (copy), StudioManageDevProductTool (copy), FFlagBuildExperienceManageGamePass (copy), StudioManageGamePassTool (copy)
	local _, QuestionsInTurnState2 = StudioAskUserTool.findQuestionsInTurnState(p2, p3)
	
	if QuestionsInTurnState2 == nil then
		local _, PlanInTurnState2 = StudioProposePlanTool.findPlanInTurnState(p2, p3)
		
		return PlanInTurnState2 ~= nil or (if FFlagBuildExperienceManageDevProductModule and isWaitingOnMonetizationApproval(p2, p3, StudioManageDevProductTool.findManageDevProductRequestInTurnState, StudioManageDevProductTool.parseManageDevProductInput, StudioManageDevProductTool.getActionKind) then true else FFlagBuildExperienceManageGamePass and (FFlagBuildExperienceManageDevProductModule and isWaitingOnMonetizationApproval(p2, p3, StudioManageGamePassTool.findRequestInTurnState, StudioManageGamePassTool.parseInput, StudioManageGamePassTool.getActionKind)))
	else
		return true
	end
end