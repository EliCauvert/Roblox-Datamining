local PromptsServerDrivenUi = script:FindFirstAncestor("PromptsServerDrivenUi")
local SduiCoreSystemModule = require(PromptsServerDrivenUi.Parent.SduiCoreSystem)
local SduiErrorType = SduiCoreSystemModule.SduiErrors.SduiErrorType
local SduiParseHelpers = SduiCoreSystemModule.SduiParseHelpers
local SetMilestoneCountModule = require(PromptsServerDrivenUi.Actions.setMilestoneCount)

return function(p1, _, p2)
	-- upvalues: SduiErrorType (copy), SetMilestoneCountModule (copy), SduiParseHelpers (copy)
	local ActionParams = p1 and p1.actionParams or nil
	
	if ActionParams == nil then
		p2.dependencies.logger.reportError(SduiErrorType.InvalidActionParams, {
			name = "SetMilestoneCount",
			message = "Missing actionParams"
		}, p2.appPage)
		
		return
	end
	local MilestoneId = ActionParams.milestoneId
	
	if typeof(MilestoneId) ~= "string" or MilestoneId == "" then
		p2.dependencies.logger.reportError(SduiErrorType.InvalidActionParams, {
			name = "SetMilestoneCount",
			propName = "milestoneId",
			message = `Invalid or missing milestoneId: {MilestoneId}`
		}, p2.appPage)
		
		return
	end
	local Count: number = ActionParams.count
	
	if typeof(Count) == "number" and Count >= 0 and Count <= 2147483647 and Count == math.floor(Count) then
		SetMilestoneCountModule(p2.dependencies.networking, MilestoneId, Count):catch(function(Err)
			-- upvalues: p2 (copy), SduiErrorType (upval), SduiParseHelpers (upval)
			p2.dependencies.logger.reportError(SduiErrorType.ActionNetworkRequestFailed, {
				name = "SetMilestoneCount",
				message = "setMilestoneCount failed: " .. SduiParseHelpers.stringifyValue(Err)
			}, p2.appPage)
		end)
		
		return
	else
		p2.dependencies.logger.reportError(SduiErrorType.InvalidActionParams, {
			name = "SetMilestoneCount",
			propName = "count",
			message = `Invalid or missing count: {Count}`
		}, p2.appPage)
	end
end