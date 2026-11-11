local Modules = game:GetService("CoreGui").RobloxGui.Modules

return require(game:GetService("CorePackages").Packages.Rodux).combineReducers({
	WidgetInfo = require(Modules.AvatarExperience.Common.Reducers.WidgetInfo),
	SearchPageWidgetInfo = require(Modules.AvatarExperience.Common.Reducers.SearchPageWidgetInfo),
	ContextWidgetInfo = require(Modules.AvatarExperience.Common.Reducers.ContextWidgetInfo),
	HydratedWidgetData = require(Modules.AvatarExperience.Common.Reducers.HydratedWidgetData)
})