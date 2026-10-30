local PromptsServerDrivenUi = script:FindFirstAncestor("PromptsServerDrivenUi")
local SduiCoreSystemModule = require(PromptsServerDrivenUi.Parent.SduiCoreSystem)
local SduiErrorType = SduiCoreSystemModule.SduiErrors.SduiErrorType
local SduiParseHelpers = SduiCoreSystemModule.SduiParseHelpers
local IncrementMilestoneCountModule = require(PromptsServerDrivenUi.Actions.incrementMilestoneCount)

return function(p1, _, p2)
	-- upvalues: SduiErrorType (copy), IncrementMilestoneCountModule (copy), SduiParseHelpers (copy)
	local ActionParams = p1 and p1.actionParams or nil
	
	if ActionParams == nil then
		p2.dependencies.logger.reportError(SduiErrorType.InvalidActionParams, {
			name = "IncrementMilestoneCount",
			message = "Missing actionParams"
		}, p2.appPage)
		
		return
	end
	local MilestoneId = ActionParams.milestoneId
	
	if typeof(MilestoneId) == "string" and MilestoneId ~= "" then
		IncrementMilestoneCountModule(p2.dependencies.networking, MilestoneId):catch(function(Err)
			-- upvalues: p2 (copy), SduiErrorType (upval), SduiParseHelpers (upval)
			p2.dependencies.logger.reportError(SduiErrorType.ActionNetworkRequestFailed, {
				name = "IncrementMilestoneCount",
				message = "incrementMilestoneCount failed: " .. SduiParseHelpers.stringifyValue(Err)
			}, p2.appPage)
		end)
		
		return
	else
		p2.dependencies.logger.reportError(SduiErrorType.InvalidActionParams, {
			name = "IncrementMilestoneCount",
			propName = "milestoneId",
			message = `Invalid or missing milestoneId: {MilestoneId}`
		}, p2.appPage)
	end
end