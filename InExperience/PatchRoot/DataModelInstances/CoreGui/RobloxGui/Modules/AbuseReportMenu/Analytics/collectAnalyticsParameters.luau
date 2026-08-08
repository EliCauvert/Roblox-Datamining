local abuseReportMenu = script:FindFirstAncestor("AbuseReportMenu")
local _ = require(abuseReportMenu.Components.Types)
local corePackagesService = game:GetService("CorePackages")
local cryoModule = require(corePackagesService.Packages.Cryo)
local constantsModule = require(abuseReportMenu.Components.Constants)
local _ = require(abuseReportMenu.ReportAnything.Utility.ReportAnythingAnalytics)
local abuseReportBuilderModule = require(abuseReportMenu.ReportAnything.Utility.AbuseReportBuilder)
local fFlagAddPreselectedAbuseTypeAnalytics = require(corePackagesService.Workspace.Packages.SharedFlags).FFlagAddPreselectedAbuseTypeAnalytics

local var5 = function(p0, p1, p2) --[[ line: 15 ]]
	-- upvalues: abuseReportBuilderModule (ref), fFlagAddPreselectedAbuseTypeAnalytics (ref), cryoModule (ref)
	local var6 = if p0.menuOpenedUnixTimestampMilliseconds > 0 then math.floor(math.floor(workspace:GetServerTimeNow() * 1000) - p0.menuOpenedUnixTimestampMilliseconds) else 0
	local var7, _ = abuseReportBuilderModule.interpretAnnotations(p1)
	
	return cryoModule.Dictionary.join({
		placeId = game.PlaceId,
		isPortraitMode = p0.isPortraitMode,
		viewportSizeX = p0.viewportSizeX,
		viewportSizeY = p0.viewportSizeY,
		timeSpentMs = var6,
		experiencePersonChangeCount = p0.experiencePersonChangeCount,
		typeofabuseChangeCount = p0.typeofabuseChangeCount,
		personChangeCount = p0.personChangeCount,
		reasonChangeCount = p0.reasonChangeCount,
		captureSceneCount = p0.captureSceneCount,
		reasonSelection = p0.reasonSelection,
		commentAdded = p0.commentAdded,
		experiencePersonSelection = p0.experiencePersonSelection,
		annotationFinalCount = #p1.annotationPoints,
		avatarFinalCount = #var7,
		interactionType = if p0.isSubmissionCompleted then 1 else 2,
		typeofabuseSelection = p0.typeofabuseSelection,
		memoryRequirementMet = p0.memoryRequirementMet,
		preselectedAbuseSelection = if fFlagAddPreselectedAbuseTypeAnalytics then p0.preselectedAbuseSelection else nil
	}, p2)
end

return {
	forPersonReport = function(p3, p4, p5) --[[ line: 64 ]]
		-- upvalues: var5 (ref), constantsModule (ref)
		local var8 = var5(p3, p4, p5)
		local var9 = nil
		local chat = constantsModule.AnalyticsAbuseMethods.Chat
		
		for i, v in pairs(constantsModule.AbuseMethodToAnalyticsMapping) do
			if i == p3.typeofabuseSelection then
				var9 = v
				chat = v
			end
		end
		var8.typeofabuseSelection = var9
		var8.inferredTypeofabuseSelection = chat
		
		return var8
	end,
	forExperienceReport = function(p6, p7, p8) --[[ line: 86 ]]
		-- upvalues: var5 (ref), constantsModule (ref)
		local var10 = var5(p6, p7, p8)
		var10.typeofabuseSelection = constantsModule.AnalyticsAbuseMethods.Game
		var10.inferredTypeofabuseSelection = constantsModule.AnalyticsAbuseMethods.Game
		
		return var10
	end
}