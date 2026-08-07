local genericAbuseReporting = script:FindFirstAncestor("GenericAbuseReporting")
local parent = genericAbuseReporting.Parent
local reactModule = require(parent.React)
local _ = require(genericAbuseReporting.Bedui.Provider.AbuseReportBeduiTypes)
local fFlagAddThumbnailSelectorReport = require(parent.SharedFlags).FFlagAddThumbnailSelectorReport

return reactModule.createContext({
	custom = if fFlagAddThumbnailSelectorReport then {} else nil,
	formData = {},
	updateForm = function(_, _) --[[ line: 16 ]] end,
	additionalReportTags = if fFlagAddThumbnailSelectorReport then {} else nil,
	updateAdditionalReportTags = if fFlagAddThumbnailSelectorReport then function(_, _) --[[ line: 19 ]] end else nil
})