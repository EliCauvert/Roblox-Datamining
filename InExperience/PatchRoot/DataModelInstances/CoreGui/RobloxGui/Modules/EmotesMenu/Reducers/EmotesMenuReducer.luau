local parent = script.Parent

return require(game:GetService("CorePackages").Packages.Rodux).combineReducers({
	displayOptions = require(parent.DisplayOptions),
	emotesPage = require(parent.EmotesPage),
	emotesWheel = require(parent.EmotesWheel),
	layout = require(parent.Layout),
	locale = require(parent.Locale)
})