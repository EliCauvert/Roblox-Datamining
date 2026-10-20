local PromptsServerDrivenUi = script:FindFirstAncestor("PromptsServerDrivenUi")
local Parent = PromptsServerDrivenUi.Parent
local SduiCoreSystemModule = require(Parent.SduiCoreSystem)
local SduiErrorType = SduiCoreSystemModule.SduiErrors.SduiErrorType
local SduiParseHelpers = SduiCoreSystemModule.SduiParseHelpers
local SduiSharedUtilitiesModule = require(Parent.SduiSharedUtilities)
local GetSduiApiStoreFunction = SduiSharedUtilitiesModule.getSduiApiStore
local SduiLoadTimer = SduiSharedUtilitiesModule.SduiLoadTimer
local ReportPromptDismissFunction = require(Parent.SduiSharedContent).reportPromptDismiss
local FFlagSduiDismissPromptPageScope = require(Parent.SharedFlags).FFlagSduiDismissPromptPageScope
local SetPromptDismissedInPageScopeModule = require(PromptsServerDrivenUi.Actions.setPromptDismissedInPageScope)

return function(p1, _, p2)
	-- upvalues: SduiErrorType (copy), GetSduiApiStoreFunction (copy), FFlagSduiDismissPromptPageScope (copy), SetPromptDismissedInPageScopeModule (copy), ReportPromptDismissFunction (copy), SduiLoadTimer (copy), SduiParseHelpers (copy)
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
	
	if PromptId ~= nil and typeof(PromptId) ~= "string" then
		p2.dependencies.logger.reportError(SduiErrorType.InvalidActionParams, {
			name = "DismissPrompt",
			propName = "promptId",
			message = `Invalid promptId: {PromptId}`
		}, p2.appPage)
		
		return
	end
	local SduiApiStore = GetSduiApiStoreFunction()
	local DismissEntryResult = SduiApiStore.dismissEntry(PromptType)
	
	if FFlagSduiDismissPromptPageScope then
		local ConfigKey = p2.configKey
		
		if typeof(ConfigKey) == "string" and ConfigKey ~= "" then
			SetPromptDismissedInPageScopeModule(ConfigKey, PromptType)
		elseif #DismissEntryResult == 0 then
			p2.dependencies.logger.reportError(SduiErrorType.InvalidActionParams, {
				name = "DismissPrompt",
				message = "Missing sduiContext.configKey for page-scope dismiss"
			}, p2.appPage)
		end
	end
	ReportPromptDismissFunction(p2.dependencies.networking, PromptType, PromptId):andThen(function()
		-- upvalues: DismissEntryResult (copy), SduiApiStore (copy), SduiLoadTimer (upval)
		for _, ConfigKey in DismissEntryResult do
			SduiApiStore.refreshFromApi({
				configKey = ConfigKey,
				loadTimer = SduiLoadTimer.createLoadTimer(ConfigKey)
			})
		end
	end):catch(function(Err)
		-- upvalues: p2 (copy), SduiErrorType (upval), SduiParseHelpers (upval)
		p2.dependencies.logger.reportError(SduiErrorType.ActionNetworkRequestFailed, {
			name = "DismissPrompt",
			message = "reportPromptDismiss failed: " .. SduiParseHelpers.stringifyValue(Err)
		}, p2.appPage)
	end)
end