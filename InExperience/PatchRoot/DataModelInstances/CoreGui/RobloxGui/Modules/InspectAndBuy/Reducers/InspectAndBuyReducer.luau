local corePackagesService = game:GetService("CorePackages")
local parent = script.Parent

return require(corePackagesService.Packages.Rodux).combineReducers({
	view = require(parent.View),
	playerId = require(parent.PlayerId),
	playerName = require(parent.PlayerName),
	assets = require(parent.Assets),
	avatarPreviewDetails = if require(script.Parent.Parent.Flags.FFlagAXEnableFetchAvatarPreview) then require(parent.AvatarPreviewDetails) else nil,
	bundles = require(parent.Bundles),
	assetBundles = require(parent.AssetBundles),
	equippedAssets = require(parent.EquippedAssets),
	detailsInformation = require(parent.DetailsInformation),
	tryingOnInfo = require(parent.TryingOnInfo),
	favorites = require(parent.Favorites),
	locale = require(parent.Locale),
	visible = require(parent.Visible),
	itemBeingPurchased = require(parent.ItemBeingPurchased),
	gamepadEnabled = require(parent.GamepadEnabled),
	isLoaded = require(parent.IsLoaded),
	isSubjectToChinaPolicies = require(parent.IsSubjectToChinaPolicies),
	FetchingStatus = require(corePackagesService.Workspace.Packages.Http).Reducers.FetchingStatus,
	storeId = require(parent.StoreId),
	collectibleResellableInstances = require(parent.CollectibleResellableInstances),
	creatingExperiences = require(parent.CreatingExperiences),
	overlay = require(parent.Overlay)
})