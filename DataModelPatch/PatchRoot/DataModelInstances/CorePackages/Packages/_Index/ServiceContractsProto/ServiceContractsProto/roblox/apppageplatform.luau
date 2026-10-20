local _ = require(script.Parent.Parent.proto)

return {
	badges = require(script.badges.v1beta1),
	charts = require(script.charts.v1beta1),
	devstore = require(script.devstore.v1beta1),
	experiencedetails = require(script.experiencedetails.v1beta1),
	experienceevents = require(script.experienceevents.v1beta1),
	home = require(script.home.v1beta1),
	marketplacecatalog = require(script.marketplacecatalog.v1beta1),
	prompts = require(script.prompts.v1beta1),
	search = require(script.search.v1beta1),
	shared = require(script.shared.v1beta1),
	spotlightcollection = require(script.spotlightcollection.v1beta1)
}