return {
	EditProfileBackgroundPage = require(script.Components.EditProfileBackgroundPage),
	DisplayBackground = require(script.Components.DisplayBackground),
	BackgroundUtils = require(script.Common.BackgroundUtils),
	AvatarModelPrefetch = require(script.Common.AvatarModelPrefetch),
	["jest.config"] = script["jest.config"],
	["jest.mockDataModel.config"] = script["jest.mockDataModel.config"],
	installReducer = require(script.installReducer),
	Analytics = require(script.Analytics)
}