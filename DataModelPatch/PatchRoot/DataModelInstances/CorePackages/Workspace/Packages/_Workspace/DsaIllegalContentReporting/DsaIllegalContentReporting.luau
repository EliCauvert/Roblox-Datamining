return {
	isShowEUDSAIllegalContentReportingLink = require(script.Utility.isShowEUDSAIllegalContentReportingLink),
	isSelectedDataDSAIllegalContent = require(script.Utility.isSelectedDataDSAIllegalContent),
	isInDSAFeaturesOverrideList = require(script.Utility.isInDSAFeaturesOverrideList),
	DSAReportLink = require(script.Components.DSAReportLink),
	Constants = require(script.Utility.Constants),
	OSAReportLink = require(script.Components.OSAReportLink),
	isShowUKOSAIllegalContentReportingLink = require(script.Utility.isShowUKOSAIllegalContentReportingLink),
	GenericReportLink = require(script.Components.GenericReportLink),
	isShowGenericIllegalContentReportingLink = require(script.Utility.isShowGenericIllegalContentReportingLink),
	TakeItDownReportLink = require(script.Components.TakeItDownReportLink),
	getTakeItDownReportLinkVisibility = require(script.Utility.getTakeItDownReportLinkVisibility),
	["jest.config"] = script["jest.config"]
}