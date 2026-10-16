local AbuseReportMenu = script:FindFirstAncestor("AbuseReportMenu")
local _ = require(AbuseReportMenu.Components.Types)
local CryoModule = require(game:GetService("CorePackages").Packages.Cryo)
local ConstantsModule = require(AbuseReportMenu.Components.Constants)
local _ = require(AbuseReportMenu.ReportAnything.Utility.ReportAnythingAnalytics)
local AbuseReportBuilderModule = require(AbuseReportMenu.ReportAnything.Utility.AbuseReportBuilder)

local function v6(p1, p2, p3) --[[ Line: 12 ]]
	-- upvalues: AbuseReportBuilderModule (copy), CryoModule (copy)
	local Floored = math.floor(workspace:GetServerTimeNow() * 1000)
	local Floored1: number = if p1.menuOpenedUnixTimestampMilliseconds > 0 then math.floor(Floored - p1.menuOpenedUnixTimestampMilliseconds) else 0
	local InterpretAnnotationsResult, _ = AbuseReportBuilderModule.interpretAnnotations(p2)
	
	return (CryoModule.Dictionary.join({
		placeId = game.PlaceId,
		isPortraitMode = p1.isPortraitMode,
		viewportSizeX = p1.viewportSizeX,
		viewportSizeY = p1.viewportSizeY,
		timeSpentMs = Floored1,
		experiencePersonChangeCount = p1.experiencePersonChangeCount,
		typeofabuseChangeCount = p1.typeofabuseChangeCount,
		personChangeCount = p1.personChangeCount,
		reasonChangeCount = p1.reasonChangeCount,
		captureSceneCount = p1.captureSceneCount,
		reasonSelection = p1.reasonSelection,
		commentAdded = p1.commentAdded,
		experiencePersonSelection = p1.experiencePersonSelection,
		annotationFinalCount = #p2.annotationPoints,
		avatarFinalCount = #InterpretAnnotationsResult,
		interactionType = if p1.isSubmissionCompleted then 1 else 2,
		typeofabuseSelection = p1.typeofabuseSelection,
		memoryRequirementMet = p1.memoryRequirementMet,
		preselectedAbuseSelection = p1.preselectedAbuseSelection
	}, p3))
end

return {
	forPersonReport = function(p1, p2, p3) --[[ Line: 59 ]]
		-- upvalues: v6 (copy), ConstantsModule (copy)
		local v1 = v6(p1, p2, p3)
		local TypeofabuseSelection = nil
		local Chat = ConstantsModule.AnalyticsAbuseMethods.Chat
		
		for i, value in pairs(ConstantsModule.AbuseMethodToAnalyticsMapping) do
			if i == p1.typeofabuseSelection then
				TypeofabuseSelection = value
				Chat = value
			end
		end
		v1.typeofabuseSelection = TypeofabuseSelection
		v1.inferredTypeofabuseSelection = Chat
		
		return v1
	end,
	forExperienceReport = function(p4, p5, p6) --[[ Line: 81 ]]
		-- upvalues: v6 (copy), ConstantsModule (copy)
		local v2 = v6(p4, p5, p6)
		v2.typeofabuseSelection = ConstantsModule.AnalyticsAbuseMethods.Game
		v2.inferredTypeofabuseSelection = ConstantsModule.AnalyticsAbuseMethods.Game
		
		return v2
	end
}