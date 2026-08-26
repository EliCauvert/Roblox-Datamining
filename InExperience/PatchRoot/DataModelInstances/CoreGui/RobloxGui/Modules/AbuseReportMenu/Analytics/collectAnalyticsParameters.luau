local abuseReportMenu = script:FindFirstAncestor("AbuseReportMenu")
local _ = require(abuseReportMenu.Components.Types)
local corePackagesService = game:GetService("CorePackages")
local cryoModule = require(corePackagesService.Packages.Cryo)
local constantsModule = require(abuseReportMenu.Components.Constants)
local _ = require(abuseReportMenu.ReportAnything.Utility.ReportAnythingAnalytics)
local abuseReportBuilderModule = require(abuseReportMenu.ReportAnything.Utility.AbuseReportBuilder)
local fFlagAddPreselectedAbuseTypeAnalytics = require(corePackagesService.Workspace.Packages.SharedFlags).FFlagAddPreselectedAbuseTypeAnalytics

local var1 = function(p1, p2, p3)
	-- upvalues: abuseReportBuilderModule (ref), fFlagAddPreselectedAbuseTypeAnalytics (ref), cryoModule (ref)
	local var2 = if p1.menuOpenedUnixTimestampMilliseconds > 0 then math.floor(math.floor(workspace:GetServerTimeNow() * 1000) - p1.menuOpenedUnixTimestampMilliseconds) else 0
	local var3, _ = abuseReportBuilderModule.interpretAnnotations(p2)
	
	return cryoModule.Dictionary.join({
		placeId = game.PlaceId,
		isPortraitMode = p1.isPortraitMode,
		viewportSizeX = p1.viewportSizeX,
		viewportSizeY = p1.viewportSizeY,
		timeSpentMs = var2,
		experiencePersonChangeCount = p1.experiencePersonChangeCount,
		typeofabuseChangeCount = p1.typeofabuseChangeCount,
		personChangeCount = p1.personChangeCount,
		reasonChangeCount = p1.reasonChangeCount,
		captureSceneCount = p1.captureSceneCount,
		reasonSelection = p1.reasonSelection,
		commentAdded = p1.commentAdded,
		experiencePersonSelection = p1.experiencePersonSelection,
		annotationFinalCount = #p2.annotationPoints,
		avatarFinalCount = #var3,
		interactionType = if p1.isSubmissionCompleted then 1 else 2,
		typeofabuseSelection = p1.typeofabuseSelection,
		memoryRequirementMet = p1.memoryRequirementMet,
		preselectedAbuseSelection = if fFlagAddPreselectedAbuseTypeAnalytics then p1.preselectedAbuseSelection else nil
	}, p3)
end

return {
	forPersonReport = function(p1, p2, p3)
		-- upvalues: var1 (ref), constantsModule (ref)
		local var2 = var1(p1, p2, p3)
		local var3 = nil
		local chat = constantsModule.AnalyticsAbuseMethods.Chat
		
		for i, v in pairs(constantsModule.AbuseMethodToAnalyticsMapping) do
			if i == p1.typeofabuseSelection then
				var3 = v
				chat = v
			end
		end
		var2.typeofabuseSelection = var3
		var2.inferredTypeofabuseSelection = chat
		
		return var2
	end,
	forExperienceReport = function(p4, p5, p6)
		-- upvalues: var1 (ref), constantsModule (ref)
		local var4 = var1(p4, p5, p6)
		var4.typeofabuseSelection = constantsModule.AnalyticsAbuseMethods.Game
		var4.inferredTypeofabuseSelection = constantsModule.AnalyticsAbuseMethods.Game
		
		return var4
	end
}