local sduiSharedContent = script:FindFirstAncestor("SduiSharedContent")
local parent = sduiSharedContent.Parent
local sduiCoreSystemModule = require(parent.SduiCoreSystem)
local sduiErrorType = sduiCoreSystemModule.SduiErrors.SduiErrorType
local sduiParseHelpers = sduiCoreSystemModule.SduiParseHelpers
local sduiSharedUtilitiesModule = require(parent.SduiSharedUtilities)
local getSduiApiStore = sduiSharedUtilitiesModule.getSduiApiStore
local sduiLoadTimer = sduiSharedUtilitiesModule.SduiLoadTimer
local reportPromptDismissModule = require(sduiSharedContent.Actions.reportPromptDismiss)

return function(p1, _, p2)
	-- upvalues: sduiErrorType (ref), getSduiApiStore (ref), reportPromptDismissModule (ref), sduiLoadTimer (ref), sduiParseHelpers (ref)
	local var1 = if p1 then p1.actionParams else nil
	
	if var1 == nil then
		p2.dependencies.logger.reportError(sduiErrorType.InvalidActionParams, { name = "DismissPrompt", message = "Missing actionParams" }, p2.appPage)
		
		return
	end
	assert(var1, "actionParams must exist")
	local promptType = var1.promptType
	
	if typeof(promptType) ~= "string" then
		p2.dependencies.logger.reportError(sduiErrorType.InvalidActionParams, {
			name = "DismissPrompt",
			propName = "promptType",
			message = `Invalid or missing promptType: {promptType}`
		}, p2.appPage)
		
		return
	end
	local promptId = var1.promptId
	
	if promptId == nil or typeof(promptId) == "string" then
		local var2 = getSduiApiStore()
		local var3 = var2.dismissEntry(promptType)
		reportPromptDismissModule(p2.dependencies.networking, promptType, promptId):andThen(function()
			-- upvalues: var3 (ref), var2 (ref), sduiLoadTimer (copy)
			for i, v in var3 do
				var2.refreshFromApi({
					configKey = v,
					loadTimer = sduiLoadTimer.createLoadTimer(v)
				})
			end
		end):catch(function(p3)
			-- upvalues: p2 (ref), sduiErrorType (copy), sduiParseHelpers (copy)
			p2.dependencies.logger.reportError(sduiErrorType.ActionNetworkRequestFailed, {
				name = "DismissPrompt",
				message = "reportPromptDismiss failed: " .. sduiParseHelpers.stringifyValue(p3)
			}, p2.appPage)
		end)
		
		return
	end
	p2.dependencies.logger.reportError(sduiErrorType.InvalidActionParams, {
		name = "DismissPrompt",
		propName = "promptId",
		message = `Invalid promptId: {promptId}`
	}, p2.appPage)
end