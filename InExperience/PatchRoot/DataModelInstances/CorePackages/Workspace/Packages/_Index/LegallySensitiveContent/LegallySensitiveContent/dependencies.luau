local parent = script.Parent.Parent

return {
	Localization = require(parent.Localization),
	Promise = require(parent.Promise),
	UrlBuilder = require(parent.UrlBuilder).UrlBuilder,
	UrlBase = require(parent.UrlBuilder).UrlBase,
	Fetch = require(parent.Fetch),
	Base64 = require(parent.AuthCommon).Utils.Base64
}