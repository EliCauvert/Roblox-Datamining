local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CorePackages = game:GetService("CorePackages")
local RoactModule = require(CorePackages.Packages.Roact)
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local RoactServices = require(CorePackages.Workspace.Packages.RoactServices).RoactServices
local RoactNetworkingModule = require(Modules.LuaApp.Services.RoactNetworking)
local WithLocalizationFunction = require(CorePackages.Workspace.Packages.Localization).withLocalization
local RetrievalStatus = require(CorePackages.Workspace.Packages.Http).Enum.RetrievalStatus
local PerformFetch = require(CorePackages.Workspace.Packages.Http).PerformFetch
local CatalogConstantsModule = require(Modules.AvatarExperience.Catalog.CatalogConstants)
local WithOverlayFocusHandlingModule = require(Modules.AvatarExperience.Common.Components.withOverlayFocusHandling)
local UtilsModule = require(Modules.AvatarExperience.Common.Utils)
local WithMappedNavigationParamsModule = require(Modules.AvatarExperience.Common.Components.RoactNavigation.withMappedNavigationParams)
local NavigationUtilsModule = require(Modules.AvatarExperience.Common.Components.RoactNavigation.NavigationUtils)
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local InteractiveAlert = UIBloxModule.App.Dialog.Alert.InteractiveAlert
local ButtonType = UIBloxModule.App.Button.Enum.ButtonType
local RemoveCurrentlySellingAssetModule = require(Modules.AvatarExperience.Catalog.Thunks.RemoveCurrentlySellingAsset)
local UpdateCollectibleInstanceResaleStateModule = require(Modules.AvatarExperience.Catalog.Thunks.UpdateCollectibleInstanceResaleState)
local RemoveCurrentlySellingItemPrompt = RoactModule.PureComponent:extend("RemoveCurrentlySellingItemPrompt")

function RemoveCurrentlySellingItemPrompt.init(p1)
	-- upvalues: RetrievalStatus (copy), NavigationUtilsModule (copy)
	function p1.removeSoldItem()
		-- upvalues: p1 (copy), RetrievalStatus (upval)
		if p1.props.fetchingState == RetrievalStatus.Fetching then return end
		local ItemId = p1.props.itemId
		local CollectibleItemId = p1.props.collectibleItemId
		local UserAssetId = p1.props.userAssetId
		local Networking = p1.props.networking
		local LocalUserId = p1.props.localUserId
		
		if CollectibleItemId then
			p1.props.removeCurrentlySellingCollectible(Networking, CollectibleItemId, UserAssetId)
			
			return
		else
			p1.props.removeCurrentlySellingAsset(Networking, ItemId, UserAssetId, LocalUserId)
		end
	end
	
	function p1.closePrompt()
		-- upvalues: NavigationUtilsModule (upval), p1 (copy)
		NavigationUtilsModule.closeOverlay(p1.props.navigation)
	end
end

function RemoveCurrentlySellingItemPrompt.willUpdate(p1, p2, _)
	-- upvalues: UtilsModule (copy)
	if UtilsModule.isFetchingDoneOrFailed(p1.props.fetchingState, p2.fetchingState) then
		p1.closePrompt()
	end
end

function RemoveCurrentlySellingItemPrompt.renderAlertLocalized(p1, p2)
	-- upvalues: RoactModule (copy), InteractiveAlert (copy), ButtonType (copy), RetrievalStatus (copy)
	return RoactModule.createElement(InteractiveAlert, {
		title = p2.titleText,
		bodyText = p2.messageText,
		buttonStackInfo = {
			buttons = {
				{
					isDefaultChild = true,
					props = { onActivated = p1.closePrompt, text = p2.cancelButtonText }
				},
				{
					buttonType = ButtonType.PrimarySystem,
					props = {
						isLoading = p1.props.fetchingState == RetrievalStatus.Fetching,
						onActivated = p1.removeSoldItem,
						text = p2.confirmButtonText
					}
				}
			}
		},
		screenSize = p1.props.screenSize,
		defaultChildRef = p1.props.defaultChildRef
	})
end

function RemoveCurrentlySellingItemPrompt.render(p1)
	-- upvalues: WithLocalizationFunction (copy)
	return WithLocalizationFunction({
		titleText = "Feature.Catalog.Heading.TakeOffSale",
		messageText = "Feature.Catalog.Label.TakeOffResaleConfirmation",
		confirmButtonText = "Feature.Catalog.Heading.TakeOffSale",
		cancelButtonText = "Feature.Catalog.Action.Cancel"
	})(function(p2)
		-- upvalues: p1 (copy)
		return p1:renderAlertLocalized(p2)
	end)
end

return (WithMappedNavigationParamsModule((WithOverlayFocusHandlingModule((RoactServices.connect({ networking = RoactNetworkingModule })((RoactRoduxModule.connect(function(p1, p2)
	-- upvalues: CatalogConstantsModule (copy), PerformFetch (copy)
	return {
		localUserId = p1.LocalUserId,
		fetchingState = PerformFetch.GetStatus(p1, (if p2.collectibleItemId then CatalogConstantsModule.UpdateCollectibleInstanceResaleStateKey else CatalogConstantsModule.RemoveCurrentlySellingAssetKey) .. tostring(p2.userAssetId)),
		screenSize = p1.ScreenSize
	}
end, function(Callback)
	-- upvalues: RemoveCurrentlySellingAssetModule (copy), UpdateCollectibleInstanceResaleStateModule (copy)
	return {
		removeCurrentlySellingAsset = function(p1, p2, p3, p4)
			-- upvalues: Callback (copy), RemoveCurrentlySellingAssetModule (upval)
			return Callback(RemoveCurrentlySellingAssetModule(p1, p2, p3, p4))
		end,
		removeCurrentlySellingCollectible = function(p1, p2, p3)
			-- upvalues: Callback (copy), UpdateCollectibleInstanceResaleStateModule (upval)
			return Callback(UpdateCollectibleInstanceResaleStateModule(p1, p2, p3, false, nil))
		end
	}
end)(RemoveCurrentlySellingItemPrompt))))))))