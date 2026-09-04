local abuseReportMenu = script:FindFirstAncestor("AbuseReportMenu")
local corePackagesService = game:GetService("CorePackages")
local _ = require(abuseReportMenu.Components.Types)
local constantsModule = require(abuseReportMenu.Components.Constants)
local cryoModule = require(corePackagesService.Packages.Cryo)
local analyticsActions = constantsModule.AnalyticsActions
local t = {
	typeofabuseSelection = cryoModule.None,
	reasonSelection = cryoModule.None
}

return function(p1, p2)
	-- upvalues: analyticsActions (ref), constantsModule (ref), cryoModule (ref), t (ref)
	local cloned = table.clone(p1)
	local type = p2.type
	
	if type == analyticsActions.Reset then
		local menuEverShown = cloned.menuEverShown
		cloned = constantsModule.AnalyticsInitialState
		cloned.menuEverShown = menuEverShown
		
		return cloned
	elseif type == analyticsActions.SetMenuOpenedTimestamp then
		cloned.menuEverShown = true
		cloned.menuOpenedUnixTimestampMilliseconds = p2.timestamp
		
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
		cloned.viewportSizeX = p2.viewportSizeX
		cloned.viewportSizeY = p2.viewportSizeY
		cloned.isPortraitMode = p2.viewportSizeX < p2.viewportSizeY
		
		return cloned
	elseif type == analyticsActions.SetMemoryRequirementMet then
		cloned.memoryRequirementMet = p2.memoryRequirementMet
		
		return cloned
	elseif type == analyticsActions.SetSubmissionCompleted then
		cloned.isSubmissionCompleted = true
		
		return cloned
	elseif type == analyticsActions.SetTypeOfAbuseSelection then
		cloned.typeofabuseSelection = p2.selection
		
		return cloned
	elseif type == analyticsActions.SetPreselectedAbuseSelection then
		cloned.preselectedAbuseSelection = p2.selection
		
		return cloned
	elseif type == analyticsActions.SetReasonSelection then
		cloned.reasonSelection = p2.selection
		
		return cloned
	elseif type == analyticsActions.SetCommentAdded then
		cloned.commentAdded = p2.commentAdded
		
		return cloned
	elseif type == analyticsActions.SwitchToExperienceInitialSelections then
		cloned = cryoModule.Dictionary.join(cloned, t, constantsModule.AnalyticsExpeirenceInitialSelections)
		
		return cloned
	elseif type == analyticsActions.SwitchToPersonInitialSelections then
		cloned = cryoModule.Dictionary.join(cloned, t, constantsModule.AnalyticsPersonInitialSelections)
	end
	return cloned
end