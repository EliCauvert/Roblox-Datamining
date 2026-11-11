local AbuseReportMenu = script:FindFirstAncestor("AbuseReportMenu")
local CorePackages = game:GetService("CorePackages")
local _ = require(AbuseReportMenu.Components.Types)
local ConstantsModule = require(AbuseReportMenu.Components.Constants)
local CryoModule = require(CorePackages.Packages.Cryo)
local AnalyticsActions = ConstantsModule.AnalyticsActions
local FFlagInGameMenuAddChatLineReporting = require(CorePackages.Workspace.Packages.SharedFlags).FFlagInGameMenuAddChatLineReporting
local FFlagAddPreselectedAbuseTypeAnalytics = require(CorePackages.Workspace.Packages.SharedFlags).FFlagAddPreselectedAbuseTypeAnalytics
local config = {
	typeofabuseSelection = CryoModule.None,
	reasonSelection = CryoModule.None
}

return function(Tbl, p1)
	-- upvalues: AnalyticsActions (copy), ConstantsModule (copy), FFlagInGameMenuAddChatLineReporting (copy), FFlagAddPreselectedAbuseTypeAnalytics (copy), CryoModule (copy), config (copy)
	local Copy = table.clone(Tbl)
	local Type = p1.type
	
	if Type == AnalyticsActions.Reset then
		local MenuEverShown = Copy.menuEverShown
		Copy = ConstantsModule.AnalyticsInitialState
		Copy.menuEverShown = MenuEverShown
		
		return Copy
	end
	if Type == AnalyticsActions.SetMenuOpenedTimestamp then
		Copy.menuEverShown = true
		Copy.menuOpenedUnixTimestampMilliseconds = p1.timestamp
		
		return Copy
	end
	if Type == AnalyticsActions.IncrementExperiencePersonChanged then
		Copy.experiencePersonChangeCount += 1
		
		return Copy
	end
	if Type == AnalyticsActions.IncrementTypeofabuseChanged then
		Copy.typeofabuseChangeCount += 1
		
		return Copy
	end
	if Type == AnalyticsActions.IncrementPersonChanged then
		Copy.personChangeCount += 1
		
		return Copy
	end
	if Type == AnalyticsActions.IncrementReasonChanged then
		Copy.reasonChangeCount += 1
		
		return Copy
	end
	if Type == AnalyticsActions.IncrementCaptureScene then
		Copy.captureSceneCount += 1
		
		return Copy
	end
	if FFlagInGameMenuAddChatLineReporting and Type == AnalyticsActions.IncrementChatLineChanged then
		Copy.chatLineChangeCount += 1
		
		return Copy
	end
	if Type == AnalyticsActions.SetViewportInformation then
		Copy.viewportSizeX = p1.viewportSizeX
		Copy.viewportSizeY = p1.viewportSizeY
		Copy.isPortraitMode = p1.viewportSizeX < p1.viewportSizeY
		
		return Copy
	end
	if Type == AnalyticsActions.SetMemoryRequirementMet then
		Copy.memoryRequirementMet = p1.memoryRequirementMet
		
		return Copy
	end
	if Type == AnalyticsActions.SetSubmissionCompleted then
		Copy.isSubmissionCompleted = true
		
		return Copy
	end
	if Type == AnalyticsActions.SetTypeOfAbuseSelection then
		Copy.typeofabuseSelection = p1.selection
		
		return Copy
	end
	if FFlagAddPreselectedAbuseTypeAnalytics and Type == AnalyticsActions.SetPreselectedAbuseSelection then
		Copy.preselectedAbuseSelection = p1.selection
		
		return Copy
	end
	if Type == AnalyticsActions.SetReasonSelection then
		Copy.reasonSelection = p1.selection
		
		return Copy
	end
	if Type == AnalyticsActions.SetCommentAdded then
		Copy.commentAdded = p1.commentAdded
		
		return Copy
	end
	if Type == AnalyticsActions.SwitchToExperienceInitialSelections then
		Copy = CryoModule.Dictionary.join(Copy, config, ConstantsModule.AnalyticsExpeirenceInitialSelections)
		
		return Copy
	end
	if Type == AnalyticsActions.SwitchToPersonInitialSelections then
		Copy = CryoModule.Dictionary.join(Copy, config, ConstantsModule.AnalyticsPersonInitialSelections)
	end
	return Copy
end