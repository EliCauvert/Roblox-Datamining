local BuildExperience = script:FindFirstAncestor("BuildExperience")
local Parent = BuildExperience.Parent
local CreatorAgentChatModule = require(Parent.DataHydration.CreatorAgentChat)
local SharedFlagsModule = require(Parent.SharedFlags)
local FFlagBuildExperienceManageDevProductModule = require(BuildExperience.Flags.FFlagBuildExperienceManageDevProduct)
local FFlagBuildExperienceManageGamePass = SharedFlagsModule.FFlagBuildExperienceManageGamePass
local FFlagBuildExperienceManageSubscription = SharedFlagsModule.FFlagBuildExperienceManageSubscription
local UnifiedMonetizationToolModule = require(script.Parent.unifiedMonetizationTool)
local StudioAskUserTool = CreatorAgentChatModule.StudioAskUserTool
local StudioManageDevProductTool = CreatorAgentChatModule.StudioManageDevProductTool
local StudioManageGamePassTool = CreatorAgentChatModule.StudioManageGamePassTool
local StudioManageSubscriptionTool = CreatorAgentChatModule.StudioManageSubscriptionTool
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

local _ = function(p2, p3)
	-- upvalues: isWaitingOnMonetizationApproval (copy), StudioManageSubscriptionTool (copy)
	return isWaitingOnMonetizationApproval(p2, p3, StudioManageSubscriptionTool.findRequestInTurnState, StudioManageSubscriptionTool.parseInput, StudioManageSubscriptionTool.getActionKind)
end

local function isWaitingOnUnifiedApproval(p2, p3): boolean
	-- upvalues: UnifiedMonetizationToolModule (copy), isWaitingOnMonetizationApproval (copy)
	for _, value in UnifiedMonetizationToolModule.toolsByKind do
		if isWaitingOnMonetizationApproval(p2, p3, value.findRequestInTurnState, value.parseInput, value.getActionKind) then
			return true
		end
	end
	return false
end

return function(p4, p5)
	-- upvalues: StudioAskUserTool (copy), StudioProposePlanTool (copy), UnifiedMonetizationToolModule (copy), isWaitingOnUnifiedApproval (copy), FFlagBuildExperienceManageDevProductModule (copy), isWaitingOnMonetizationApproval (copy), StudioManageDevProductTool (copy), FFlagBuildExperienceManageGamePass (copy), StudioManageGamePassTool (copy), FFlagBuildExperienceManageSubscription (copy), StudioManageSubscriptionTool (copy)
	local _, QuestionsInTurnState2 = StudioAskUserTool.findQuestionsInTurnState(p4, p5)
	
	if QuestionsInTurnState2 == nil then
		local _, PlanInTurnState2 = StudioProposePlanTool.findPlanInTurnState(p4, p5)
		
		return PlanInTurnState2 ~= nil or (if UnifiedMonetizationToolModule.isEnabled then isWaitingOnUnifiedApproval(p4, p5) elseif FFlagBuildExperienceManageDevProductModule and isWaitingOnMonetizationApproval(p4, p5, StudioManageDevProductTool.findManageDevProductRequestInTurnState, StudioManageDevProductTool.parseManageDevProductInput, StudioManageDevProductTool.getActionKind) then true elseif FFlagBuildExperienceManageGamePass and FFlagBuildExperienceManageDevProductModule and isWaitingOnMonetizationApproval(p4, p5, StudioManageGamePassTool.findRequestInTurnState, StudioManageGamePassTool.parseInput, StudioManageGamePassTool.getActionKind) then true else FFlagBuildExperienceManageSubscription and (FFlagBuildExperienceManageDevProductModule and isWaitingOnMonetizationApproval(p4, p5, StudioManageSubscriptionTool.findRequestInTurnState, StudioManageSubscriptionTool.parseInput, StudioManageSubscriptionTool.getActionKind)))
	else
		return true
	end
end