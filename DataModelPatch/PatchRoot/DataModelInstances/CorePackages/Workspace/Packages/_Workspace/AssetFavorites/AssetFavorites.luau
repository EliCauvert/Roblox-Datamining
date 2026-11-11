return {
	DeleteFavoriteForAsset = require(script.Requests.DeleteFavoriteForAsset),
	GetFavoriteForAsset = require(script.Requests.GetFavoriteForAsset),
	PostFavoriteForAsset = require(script.Requests.PostFavoriteForAsset),
	useAssetFavoriting = require(script.Hooks.useAssetFavoriting),
	useLocalUserId = require(script.Hooks.useLocalUserId),
	["jest.config"] = script["jest.config"]
}