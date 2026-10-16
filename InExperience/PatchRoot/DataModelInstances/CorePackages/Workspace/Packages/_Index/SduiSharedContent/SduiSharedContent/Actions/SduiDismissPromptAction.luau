local SduiSharedContent = script:FindFirstAncestor("SduiSharedContent")
local Parent = SduiSharedContent.Parent
local SduiCoreSystemModule = require(Parent.SduiCoreSystem)
local SduiErrorType = SduiCoreSystemModule.SduiErrors.SduiErrorType
local SduiParseHelpers = SduiCoreSystemModule.SduiParseHelpers
local SduiSharedUtilitiesModule = require(Parent.SduiSharedUtilities)
local GetSduiApiStoreFunction = SduiSharedUtilitiesModule.getSduiApiStore
local SduiLoadTimer = SduiSharedUtilitiesModule.SduiLoadTimer
local ReportPromptDismissModule = require(SduiSharedContent.Actions.reportPromptDismiss)

return function(p1, _, p2) --[[ Line: 21 | Named "SduiDismissPromptAction" ]]
	-- upvalues: SduiErrorType (copy), GetSduiApiStoreFunction (copy), ReportPromptDismissModule (copy), SduiLoadTimer (copy), SduiParseHelpers (copy)
	local ActionParams = p1 and p1.actionParams or nil
	
	if ActionParams == nil then
		p2.dependencies.logger.reportError(SduiErrorType.InvalidActionParams, { name = "DismissPrompt", message = "Missing actionParams" }, p2.appPage)
		
		return
	end
	assert(ActionParams, "actionParams must exist")
	local PromptType = ActionParams.promptType
	
	if typeof(PromptType) ~= "string" then
		p2.dependencies.logger.reportError(SduiErrorType.InvalidActionParams, {
			name = "DismissPrompt",
			propName = "promptType",
			message = `Invalid or missing promptType: {PromptType}`
		}, p2.appPage)
		
		return
	end
	local PromptId = ActionParams.promptId
	
	if PromptId == nil or typeof(PromptId) == "string" then
		local SduiApiStore = GetSduiApiStoreFunction()
		local DismissEntryResult = SduiApiStore.dismissEntry(PromptType)
		ReportPromptDismissModule(p2.dependencies.networking, PromptType, PromptId):andThen(function() --[[ Line: 73 ]]
			-- upvalues: DismissEntryResult (copy), SduiApiStore (copy), SduiLoadTimer (upval)
			for _, ConfigKey in DismissEntryResult do
				SduiApiStore.refreshFromApi({
					configKey = ConfigKey,
					loadTimer = SduiLoadTimer.createLoadTimer(ConfigKey)
				})
			end
		end):catch(function(Err) --[[ Line: 81 ]]
			-- upvalues: p2 (copy), SduiErrorType (upval), SduiParseHelpers (upval)
			p2.dependencies.logger.reportError(SduiErrorType.ActionNetworkRequestFailed, {
				name = "DismissPrompt",
				message = "reportPromptDismiss failed: " .. SduiParseHelpers.stringifyValue(Err)
			}, p2.appPage)
		end)
		
		return
	else
		p2.dependencies.logger.reportError(SduiErrorType.InvalidActionParams, {
			name = "DismissPrompt",
			propName = "promptId",
			message = `Invalid promptId: {PromptId}`
		}, p2.appPage)
	end
end