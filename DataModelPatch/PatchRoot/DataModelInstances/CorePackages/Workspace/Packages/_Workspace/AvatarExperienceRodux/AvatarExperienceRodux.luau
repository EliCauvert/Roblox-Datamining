local _ = require(script.Types.RoduxTypes)
local _ = require(script.Types.AssetMetadata)
local _ = require(script.Types.AssetInfo)
local _ = require(script.Types.OutfitTryOn)
local _ = require(script.Types.BodyColors)
local _ = require(script.Types.HydratedWidgetData)

return {
	Actions = {
		AddAnalyticsMetadata = require(script.Actions.AddAnalyticsMetadata),
		AvatarExperienceLoaded = require(script.Actions.AvatarExperienceLoaded),
		ClearTryOns = require(script.Actions.ClearTryOns),
		PlayingSwimAnimation = require(script.Actions.PlayingSwimAnimation),
		ReceivedBundleInfoForTryOn = require(script.Actions.ReceivedBundleInfoForTryOn),
		RemoveFromTryOn = require(script.Actions.RemoveFromTryOn),
		RemoveLookItemsFromTryOn = require(script.Actions.RemoveLookItemsFromTryOn),
		RemoveUnselectedItemsFromTryOn = require(script.Actions.RemoveUnselectedItemsFromTryOn),
		SetAvatarSceneRoute = require(script.Actions.SetAvatarSceneRoute),
		SetEquippedInTryOnManager = require(script.Actions.SetEquippedInTryOnManager),
		SetItemDetailsPeekViewState = require(script.Actions.SetItemDetailsPeekViewState),
		SetItemTryOnPeekViewState = require(script.Actions.SetItemTryOnPeekViewState),
		SetOrderForTryOns = require(script.Actions.SetOrderForTryOns),
		SetOutfitTryOns = require(script.Actions.SetOutfitTryOns),
		SetSelectedTimedOption = require(script.Actions.SetSelectedTimedOption),
		SetTryOnManagerPeekViewState = require(script.Actions.SetTryOnManagerPeekViewState),
		SetCurrentCharacter = require(script.Actions.SetCurrentCharacter),
		SetLookDetailsPeekViewSelectedTab = require(script.Actions.SetLookDetailsPeekViewSelectedTab),
		AddSaveDelay = require(script.Actions.AddSaveDelay),
		RemoveSaveDelay = require(script.Actions.RemoveSaveDelay),
		SetCameraButtonStatus = require(script.Actions.SetCameraButtonStatus),
		SetCameraButtonErrorOccurred = require(script.Actions.SetCameraButtonErrorOccurred),
		ApplyProfileConfiguration = require(script.Actions.ApplyProfileConfiguration),
		ToggleTryOn = require(script.Actions.ToggleTryOn),
		TryOnColorUpdated = require(script.Actions.TryOnColorUpdated),
		TryOnLooksOutfit = require(script.Actions.TryOnLooksOutfit)
	},
	Reducers = {
		CurrentCharacter = require(script.Reducers.CurrentCharacter),
		AnalyticsMetadata = require(script.Reducers.AnalyticsMetadata),
		AvatarExperienceLoaded = require(script.Reducers.AvatarExperienceLoaded),
		AvatarRoute = require(script.Reducers.AvatarRoute),
		ItemDetailsPeekView = require(script.Reducers.ItemDetailsPeekView),
		PlayingSwimAnimation = require(script.Reducers.PlayingSwimAnimation),
		ShouldDelaySaveManager = require(script.Reducers.ShouldDelaySaveManager),
		CameraButton = require(script.Reducers.CameraButton),
		ProfileConfiguration = require(script.Reducers.ProfileConfiguration)
	},
	Constants = require(script.Constants),
	Utils = { ReducerUtils = require(script.Utils.ReducerUtils) },
	["jest.config"] = script["jest.config"]
}