local GenericAbuseReporting = script:FindFirstAncestor("GenericAbuseReporting")
local Parent = GenericAbuseReporting.Parent
local _ = require(GenericAbuseReporting.Bedui.Provider.AbuseReportBeduiTypes)
local FFlagAddThumbnailSelectorReport = require(Parent.SharedFlags).FFlagAddThumbnailSelectorReport

return require(Parent.React).createContext({
	custom = if FFlagAddThumbnailSelectorReport then {} else nil,
	formData = {},
	updateForm = function(_, _) end,
	additionalReportTags = if FFlagAddThumbnailSelectorReport then {} else nil,
	updateAdditionalReportTags = if FFlagAddThumbnailSelectorReport then function(_, _) end else nil
})