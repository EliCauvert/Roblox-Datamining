local sduiSharedContent = script:FindFirstAncestor("SduiSharedContent")
local parent = sduiSharedContent.Parent
local sduiCoreSystemModule = require(parent.SduiCoreSystem)
local sduiErrorType = sduiCoreSystemModule.SduiErrors.SduiErrorType
local sduiParseHelpers = sduiCoreSystemModule.SduiParseHelpers
local sduiSharedUtilitiesModule = require(parent.SduiSharedUtilities)
local getSduiApiStore = sduiSharedUtilitiesModule.getSduiApiStore
local sduiLoadTimer = sduiSharedUtilitiesModule.SduiLoadTimer
local reportPromptDismissModule = require(sduiSharedContent.Actions.reportPromptDismiss)

return function(p0, _, p1) --[[ line: 19 | named "SduiDismissPromptAction" ]]
	-- upvalues: sduiErrorType (ref), getSduiApiStore (ref), reportPromptDismissModule (ref), sduiLoadTimer (ref), sduiParseHelpers (ref)
	local var4 = if p0 then p0.actionParams else nil
	
	if var4 == nil then
		p1.dependencies.logger.reportError(sduiErrorType.InvalidActionParams, { name = "DismissPrompt", message = "Missing actionParams" }, p1.appPage)
		
		return
	end
	assert(var4, "actionParams must exist")
	local promptType = var4.promptType
	
	if typeof(promptType) ~= "string" then
		p1.dependencies.logger.reportError(sduiErrorType.InvalidActionParams, {
			name = "DismissPrompt",
			propName = "promptType",
			message = `Invalid or missing promptType: {promptType}`
		}, p1.appPage)
		
		return
	end
	local promptId = var4.promptId
	
	if promptId == nil or typeof(promptId) == "string" then
		local var5 = getSduiApiStore()
		local var6 = var5.dismissEntry(promptType)
		reportPromptDismissModule(p1.dependencies.networking, promptType, promptId):andThen(function() --[[ line: 71 ]]
			-- upvalues: var6 (ref), var5 (ref), sduiLoadTimer (copy)
			for i, v in var6 do
				var5.refreshFromApi({
					configKey = v,
					loadTimer = sduiLoadTimer.createLoadTimer(v)
				})
			end
		end):catch(function(p2) --[[ line: 79 ]]
			-- upvalues: p1 (ref), sduiErrorType (copy), sduiParseHelpers (copy)
			p1.dependencies.logger.reportError(sduiErrorType.ActionNetworkRequestFailed, {
				name = "DismissPrompt",
				message = "reportPromptDismiss failed: " .. sduiParseHelpers.stringifyValue(p2)
			}, p1.appPage)
		end)
		
		return
	end
	p1.dependencies.logger.reportError(sduiErrorType.InvalidActionParams, {
		name = "DismissPrompt",
		propName = "promptId",
		message = `Invalid promptId: {promptId}`
	}, p1.appPage)
end