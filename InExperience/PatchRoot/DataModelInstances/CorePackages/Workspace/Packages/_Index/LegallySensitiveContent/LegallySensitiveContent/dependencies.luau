local Parent = script.Parent.Parent

return {
	Localization = require(Parent.Localization),
	Promise = require(Parent.Promise),
	UrlBuilder = require(Parent.UrlBuilder).UrlBuilder,
	UrlBase = require(Parent.UrlBuilder).UrlBase,
	Fetch = require(Parent.Fetch),
	Base64 = require(Parent.AuthCommon).Utils.Base64
}