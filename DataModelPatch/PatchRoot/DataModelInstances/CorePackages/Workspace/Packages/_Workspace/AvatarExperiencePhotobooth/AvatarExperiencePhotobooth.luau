return {
	["jest.config"] = script["jest.config"],
	Context = {
		PhotoboothContext = require(script.Context.PhotoboothContext),
		usePhotoboothContext = require(script.Context.usePhotoboothContext),
		PhotoboothContextProvider = require(script.Context.PhotoboothContextProvider)
	},
	Stores = {
		createPhotoboothStore = require(script.Stores.createPhotoboothStore)
	},
	Enums = {
		PhotoboothCategories = require(script.Enums.PhotoboothCategories),
		PhotoboothScenes = require(script.Enums.PhotoboothScenes)
	},
	PhotoboothStoreBridge = require(script.PhotoboothStoreBridge)
}