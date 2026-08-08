local abuseReportMenu = script:FindFirstAncestor("AbuseReportMenu")
local corePackagesService = game:GetService("CorePackages")
local _ = require(abuseReportMenu.Components.Types)
local constantsModule = require(abuseReportMenu.Components.Constants)
local cryoModule = require(corePackagesService.Packages.Cryo)
local analyticsActions = constantsModule.AnalyticsActions
local fFlagAddPreselectedAbuseTypeAnalytics = require(corePackagesService.Workspace.Packages.SharedFlags).FFlagAddPreselectedAbuseTypeAnalytics
local t = {
	typeofabuseSelection = cryoModule.None,
	reasonSelection = cryoModule.None
}

return function(p0, p1) --[[ line: 18 | named "analyticsReducer" ]]
	-- upvalues: analyticsActions (ref), constantsModule (ref), fFlagAddPreselectedAbuseTypeAnalytics (ref), cryoModule (ref), t (ref)
	local cloned = table.clone(p0)
	local type = p1.type
	
	if type == analyticsActions.Reset then
		local menuEverShown = cloned.menuEverShown
		cloned = constantsModule.AnalyticsInitialState
		cloned.menuEverShown = menuEverShown
		
		return cloned
	elseif type == analyticsActions.SetMenuOpenedTimestamp then
		cloned.menuEverShown = true
		cloned.menuOpenedUnixTimestampMilliseconds = p1.timestamp
		
		return cloned
	elseif type == analyticsActions.IncrementExperiencePersonChanged then
		cloned.experiencePersonChangeCount += 1
		
		return cloned
	elseif type == analyticsActions.IncrementTypeofabuseChanged then
		cloned.typeofabuseChangeCount += 1
		
		return cloned
	elseif type == analyticsActions.IncrementPersonChanged then
		cloned.personChangeCount += 1
		
		return cloned
	elseif type == analyticsActions.IncrementReasonChanged then
		cloned.reasonChangeCount += 1
		
		return cloned
	elseif type == analyticsActions.IncrementCaptureScene then
		cloned.captureSceneCount += 1
		
		return cloned
	elseif type == analyticsActions.SetViewportInformation then
		cloned.viewportSizeX = p1.viewportSizeX
		cloned.viewportSizeY = p1.viewportSizeY
		cloned.isPortraitMode = p1.viewportSizeX < p1.viewportSizeY
		
		return cloned
	elseif type == analyticsActions.SetMemoryRequirementMet then
		cloned.memoryRequirementMet = p1.memoryRequirementMet
		
		return cloned
	elseif type == analyticsActions.SetSubmissionCompleted then
		cloned.isSubmissionCompleted = true
		
		return cloned
	elseif type == analyticsActions.SetTypeOfAbuseSelection then
		cloned.typeofabuseSelection = p1.selection
		
		return cloned
	elseif fFlagAddPreselectedAbuseTypeAnalytics and type == analyticsActions.SetPreselectedAbuseSelection then
		cloned.preselectedAbuseSelection = p1.selection
		
		return cloned
	elseif type == analyticsActions.SetReasonSelection then
		cloned.reasonSelection = p1.selection
		
		return cloned
	elseif type == analyticsActions.SetCommentAdded then
		cloned.commentAdded = p1.commentAdded
		
		return cloned
	elseif type == analyticsActions.SwitchToExperienceInitialSelections then
		cloned = cryoModule.Dictionary.join(cloned, t, constantsModule.AnalyticsExpeirenceInitialSelections)
		
		return cloned
	elseif type == analyticsActions.SwitchToPersonInitialSelections then
		cloned = cryoModule.Dictionary.join(cloned, t, constantsModule.AnalyticsPersonInitialSelections)
	end
	return cloned
end