local AbuseReportMenu = script:FindFirstAncestor("AbuseReportMenu")
local _ = require(AbuseReportMenu.Components.Types)
local ConstantsModule = require(AbuseReportMenu.Components.Constants)
local ReportAnythingActions = ConstantsModule.ReportAnythingActions

return function(Tbl, p1)
	-- upvalues: ReportAnythingActions (copy), ConstantsModule (copy)
	local Copy = table.clone(Tbl)
	local Type = p1.type
	
	if Type == ReportAnythingActions.ClearAll then
		Copy = ConstantsModule.ReportAnythingInitialState
		
		return Copy
	end
	if Type == ReportAnythingActions.ClearAnnotationFlowProperties then
		Copy.annotationPoints = {}
		Copy.attachCompleted = false
		Copy.annotationPageSeen = false
		Copy.annotationOptionSeen = false
		
		return Copy
	end
	if Type == ReportAnythingActions.SetScreenshotId then
		Copy.screenshotId = p1.screenshotId
		
		return Copy
	end
	if Type == ReportAnythingActions.SetScreenshotContentId then
		Copy.screenshotContentId = p1.screenshotContentId
		
		return Copy
	end
	if Type == ReportAnythingActions.SetAnnotationPoints then
		Copy.annotationPoints = p1.annotationPoints
		Copy.annotationPageSeen = true
		Copy.annotationOptionSeen = true
		
		return Copy
	end
	if Type == ReportAnythingActions.SetIdentificationResults then
		Copy.identificationResults = p1.identificationResults
		
		return Copy
	end
	if Type == ReportAnythingActions.CompleteAttachment then
		Copy.attachCompleted = true
		
		return Copy
	end
	if Type == ReportAnythingActions.SetAnnotationCircleRadius then
		Copy.annotationCircleRadius = p1.radius
		
		return Copy
	end
	if Type == ReportAnythingActions.SetAnnotationAreaDimensions then
		Copy.annotationAreaWidth = p1.width
		Copy.annotationAreaHeight = p1.height
		
		return Copy
	end
	if Type == ReportAnythingActions.SetAnnotationOptionSeen then
		Copy.annotationOptionSeen = true
	end
	return Copy
end