local ServerTriggeredModals = script:FindFirstAncestor("ServerTriggeredModals")
local Parent = ServerTriggeredModals.Parent
local LocalUserIdStore = require(Parent.LocalUserIdStore).LocalUserIdStore
local LoggerModule = require(ServerTriggeredModals.Logger)
local ReportPromptImpressionModule = require(ServerTriggeredModals.reportPromptImpression)
local SendModalImpressionEventFunction = require(Parent.ServerTriggeredModalImpressions).sendModalImpressionEvent

return {
	handlePromptsResponse = function(p1)
		-- upvalues: LocalUserIdStore (copy), Parent (copy), ReportPromptImpressionModule (copy), LoggerModule (copy), SendModalImpressionEventFunction (copy)
		if type(p1) ~= "table" or type(p1.custom_prompts) ~= "table" then return end
		local CurrentUserId = LocalUserIdStore.getCurrentUserId(false)
		
		if CurrentUserId == "" then return end
		if p1.custom_prompts.SplitPaneEducationalTour == nil then return end
		local SplitPaneEducationalTourStore = require(Parent.SplitPane).getSplitPaneEducationalTourStore(false)
		
		if not SplitPaneEducationalTourStore.hasHandledCustomPromptForUser(CurrentUserId) then
			SplitPaneEducationalTourStore.setHasHandledCustomPromptForUser(CurrentUserId, true)
			SplitPaneEducationalTourStore.setPendingUserId(CurrentUserId)
			SplitPaneEducationalTourStore.setOnTourVisible(function()
				-- upvalues: ReportPromptImpressionModule (upval), LoggerModule (upval), SendModalImpressionEventFunction (upval)
				ReportPromptImpressionModule("SplitPaneEducationalTour", "SplitPaneEducationalTour"):catch(function()
					-- upvalues: LoggerModule (upval)
					LoggerModule:warning("Failed to report split-pane educational prompt impression")
				end)
				SendModalImpressionEventFunction("SplitPaneEducationalTour", "SplitPaneEducationalTour")
			end)
			SplitPaneEducationalTourStore.setIsOpen(true)
			
			return
		end
	end
}