local serverTriggeredModals = script:FindFirstAncestor("ServerTriggeredModals")
local parent = serverTriggeredModals.Parent
local localUserIdStore = require(parent.LocalUserIdStore).LocalUserIdStore
local loggerModule = require(serverTriggeredModals.Logger)
local reportPromptImpressionModule = require(serverTriggeredModals.reportPromptImpression)
local sendModalImpressionEvent = require(parent.ServerTriggeredModalImpressions).sendModalImpressionEvent

return {
	handlePromptsResponse = function(p1)
		-- upvalues: localUserIdStore (ref), parent (ref), reportPromptImpressionModule (ref), loggerModule (ref), sendModalImpressionEvent (ref)
		if type(p1) ~= "table" or type(p1.custom_prompts) ~= "table" then return end
		local currentUserId = localUserIdStore.getCurrentUserId(false)
		
		if currentUserId == "" then return end
		if p1.custom_prompts.SplitPaneEducationalTour == nil then return end
		local splitPaneEducationalTourStore = require(parent.SplitPane).getSplitPaneEducationalTourStore(false)
		
		if splitPaneEducationalTourStore.hasHandledCustomPromptForUser(currentUserId) then
			return
		end
		splitPaneEducationalTourStore.setHasHandledCustomPromptForUser(currentUserId, true)
		splitPaneEducationalTourStore.setPendingUserId(currentUserId)
		splitPaneEducationalTourStore.setOnTourVisible(function()
			-- upvalues: reportPromptImpressionModule (copy), loggerModule (copy), sendModalImpressionEvent (copy)
			reportPromptImpressionModule("SplitPaneEducationalTour", "SplitPaneEducationalTour"):catch(function()
				-- upvalues: loggerModule (copy)
				loggerModule:warning("Failed to report split-pane educational prompt impression")
			end)
			sendModalImpressionEvent("SplitPaneEducationalTour", "SplitPaneEducationalTour")
		end)
		splitPaneEducationalTourStore.setIsOpen(true)
	end
}