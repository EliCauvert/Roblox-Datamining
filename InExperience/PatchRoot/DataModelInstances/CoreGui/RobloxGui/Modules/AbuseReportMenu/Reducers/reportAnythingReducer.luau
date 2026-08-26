local abuseReportMenu = script:FindFirstAncestor("AbuseReportMenu")
local _ = require(abuseReportMenu.Components.Types)
local constantsModule = require(abuseReportMenu.Components.Constants)
local reportAnythingActions = constantsModule.ReportAnythingActions

return function(p1, p2)
	-- upvalues: reportAnythingActions (ref), constantsModule (ref)
	local cloned = table.clone(p1)
	local type = p2.type
	
	if type == reportAnythingActions.ClearAll then
		cloned = constantsModule.ReportAnythingInitialState
		
		return cloned
	elseif type == reportAnythingActions.ClearAnnotationFlowProperties then
		cloned.annotationPoints = {}
		cloned.attachCompleted = false
		cloned.annotationPageSeen = false
		cloned.annotationOptionSeen = false
		
		return cloned
	elseif type == reportAnythingActions.SetScreenshotId then
		cloned.screenshotId = p2.screenshotId
		
		return cloned
	elseif type == reportAnythingActions.SetScreenshotContentId then
		cloned.screenshotContentId = p2.screenshotContentId
		
		return cloned
	elseif type == reportAnythingActions.SetAnnotationPoints then
		cloned.annotationPoints = p2.annotationPoints
		cloned.annotationPageSeen = true
		cloned.annotationOptionSeen = true
		
		return cloned
	elseif type == reportAnythingActions.SetIdentificationResults then
		cloned.identificationResults = p2.identificationResults
		
		return cloned
	elseif type == reportAnythingActions.CompleteAttachment then
		cloned.attachCompleted = true
		
		return cloned
	elseif type == reportAnythingActions.SetAnnotationCircleRadius then
		cloned.annotationCircleRadius = p2.radius
		
		return cloned
	elseif type == reportAnythingActions.SetAnnotationAreaDimensions then
		cloned.annotationAreaWidth = p2.width
		cloned.annotationAreaHeight = p2.height
		
		return cloned
	elseif type == reportAnythingActions.SetAnnotationOptionSeen then
		cloned.annotationOptionSeen = true
	end
	return cloned
end