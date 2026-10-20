local Parent = script:FindFirstAncestor("PromptsServerDrivenUi").Parent
local SduiErrorType = require(Parent.SduiCoreSystem).SduiErrors.SduiErrorType
local ServerTriggeredModalImpressionsModule = require(Parent.ServerTriggeredModalImpressions)
local PostPromptImpressionFunction = ServerTriggeredModalImpressionsModule.postPromptImpression
local SendModalImpressionEventFunction = ServerTriggeredModalImpressionsModule.sendModalImpressionEvent
local t = {}

return function(p1, List, p2, _, _)
	-- upvalues: t (copy), SduiErrorType (copy), PostPromptImpressionFunction (copy), SendModalImpressionEventFunction (copy)
	local P2 = p2 or t
	
	if #List == 0 or #P2 == 0 then
		p1.dependencies.logger.reportError(SduiErrorType.FailedToLogPromptImpressions, {
			name = "SduiPromptImpressionsHandler",
			message = `No entries to log: impressionIndexes={#List}, itemAnalyticsDatas={#P2}`
		}, p1.appPage)
		
		return
	end
	for _, value in List do
		local Entry = P2[value] or t
		
		if typeof(Entry.promptType) ~= "string" then
			p1.dependencies.logger.reportError(SduiErrorType.FailedToLogPromptImpressions, {
				name = "SduiPromptImpressionsHandler",
				message = `Missing promptType at index {value}`
			}, p1.appPage)
			continue
		end
		if typeof(Entry.promptId) == "string" then
			PostPromptImpressionFunction(p1.dependencies.networking, Entry.promptType, Entry.promptId):catch(function()
				-- upvalues: p1 (copy), SduiErrorType (upval), Entry (copy)
				p1.dependencies.logger.reportError(SduiErrorType.FailedToLogPromptImpressions, {
					name = "SduiPromptImpressionsHandler",
					message = `Failed to POST prompt impression for {Entry.promptType}`
				}, p1.appPage)
			end)
			SendModalImpressionEventFunction(Entry.promptId, Entry.promptType)
		else
			p1.dependencies.logger.reportError(SduiErrorType.FailedToLogPromptImpressions, {
				name = "SduiPromptImpressionsHandler",
				message = `Missing promptId at index {value}`
			}, p1.appPage)
		end
	end
end