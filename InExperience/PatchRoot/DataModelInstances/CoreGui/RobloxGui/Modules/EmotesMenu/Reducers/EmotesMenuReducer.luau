local Parent = script.Parent

return (require(game:GetService("CorePackages").Packages.Rodux).combineReducers({
	displayOptions = require(Parent.DisplayOptions),
	emotesPage = require(Parent.EmotesPage),
	emotesWheel = require(Parent.EmotesWheel),
	layout = require(Parent.Layout),
	locale = require(Parent.Locale)
}))