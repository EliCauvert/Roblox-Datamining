local abuseReportMenu = script:FindFirstAncestor("AbuseReportMenu")
local _ = require(abuseReportMenu.Components.Types)
local constantsModule = require(abuseReportMenu.Components.Constants)
local reportAnythingActions = constantsModule.ReportAnythingActions

return function(p0, p1) --[[ line: 7 | named "reportAnythingReducer" ]]
	-- upvalues: reportAnythingActions (ref), constantsModule (ref)
	local cloned = table.clone(p0)
	local type = p1.type
	
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
		cloned.screenshotId = p1.screenshotId
		
		return cloned
	elseif type == reportAnythingActions.SetScreenshotContentId then
		cloned.screenshotContentId = p1.screenshotContentId
		
		return cloned
	elseif type == reportAnythingActions.SetAnnotationPoints then
		cloned.annotationPoints = p1.annotationPoints
		cloned.annotationPageSeen = true
		cloned.annotationOptionSeen = true
		
		return cloned
	elseif type == reportAnythingActions.SetIdentificationResults then
		cloned.identificationResults = p1.identificationResults
		
		return cloned
	elseif type == reportAnythingActions.CompleteAttachment then
		cloned.attachCompleted = true
		
		return cloned
	elseif type == reportAnythingActions.SetAnnotationCircleRadius then
		cloned.annotationCircleRadius = p1.radius
		
		return cloned
	elseif type == reportAnythingActions.SetAnnotationAreaDimensions then
		cloned.annotationAreaWidth = p1.width
		cloned.annotationAreaHeight = p1.height
		
		return cloned
	elseif type == reportAnythingActions.SetAnnotationOptionSeen then
		cloned.annotationOptionSeen = true
	end
	return cloned
end