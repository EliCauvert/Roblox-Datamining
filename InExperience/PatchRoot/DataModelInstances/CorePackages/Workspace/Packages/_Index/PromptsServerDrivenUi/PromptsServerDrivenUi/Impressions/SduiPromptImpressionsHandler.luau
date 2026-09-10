local parent = script:FindFirstAncestor("PromptsServerDrivenUi").Parent
local sduiErrorType = require(parent.SduiCoreSystem).SduiErrors.SduiErrorType
local serverTriggeredModalImpressionsModule = require(parent.ServerTriggeredModalImpressions)
local postPromptImpression = serverTriggeredModalImpressionsModule.postPromptImpression
local sendModalImpressionEvent = serverTriggeredModalImpressionsModule.sendModalImpressionEvent
local t = {}

return function(p1, p2, p3, _, _)
	-- upvalues: t (ref), sduiErrorType (ref), postPromptImpression (ref), sendModalImpressionEvent (ref)
	p3 = p3 or t
	
	if #p2 == 0 or #p3 == 0 then
		p1.dependencies.logger.reportError(sduiErrorType.FailedToLogPromptImpressions, {
			name = "SduiPromptImpressionsHandler",
			message = `No entries to log: impressionIndexes={#p2}, itemAnalyticsDatas={#p3}`
		}, p1.appPage)
		
		return
	end
	for i, v in p2 do
		local var1 = p3[v] or t
		
		if typeof(var1.promptType) ~= "string" then
			p1.dependencies.logger.reportError(sduiErrorType.FailedToLogPromptImpressions, {
				name = "SduiPromptImpressionsHandler",
				message = `Missing promptType at index {v}`
			}, p1.appPage)
		elseif typeof(var1.promptId) == "string" then
			postPromptImpression(p1.dependencies.networking, var1.promptType, var1.promptId):catch(function()
				-- upvalues: p1 (ref), sduiErrorType (copy), var1 (ref)
				p1.dependencies.logger.reportError(sduiErrorType.FailedToLogPromptImpressions, {
					name = "SduiPromptImpressionsHandler",
					message = `Failed to POST prompt impression for {var1.promptType}`
				}, p1.appPage)
			end)
			sendModalImpressionEvent(var1.promptId, var1.promptType)
		else
			p1.dependencies.logger.reportError(sduiErrorType.FailedToLogPromptImpressions, {
				name = "SduiPromptImpressionsHandler",
				message = `Missing promptId at index {v}`
			}, p1.appPage)
		end
	end
end