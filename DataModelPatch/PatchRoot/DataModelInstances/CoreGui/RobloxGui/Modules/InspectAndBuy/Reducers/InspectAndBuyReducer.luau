local CorePackages = game:GetService("CorePackages")
local Parent = script.Parent
local AvatarPreviewDetailsModule = require(Parent.AvatarPreviewDetails)

return require(CorePackages.Packages.Rodux).combineReducers({
	view = require(Parent.View),
	playerId = require(Parent.PlayerId),
	playerName = require(Parent.PlayerName),
	assets = require(Parent.Assets),
	avatarPreviewDetails = if require(script.Parent.Parent.Flags.FFlagAXEnableFetchAvatarPreview) then AvatarPreviewDetailsModule else nil,
	bundles = require(Parent.Bundles),
	assetBundles = require(Parent.AssetBundles),
	equippedAssets = require(Parent.EquippedAssets),
	detailsInformation = require(Parent.DetailsInformation),
	tryingOnInfo = require(Parent.TryingOnInfo),
	favorites = require(Parent.Favorites),
	locale = require(Parent.Locale),
	visible = require(Parent.Visible),
	itemBeingPurchased = require(Parent.ItemBeingPurchased),
	gamepadEnabled = require(Parent.GamepadEnabled),
	isLoaded = require(Parent.IsLoaded),
	isSubjectToChinaPolicies = require(Parent.IsSubjectToChinaPolicies),
	FetchingStatus = require(CorePackages.Workspace.Packages.Http).Reducers.FetchingStatus,
	storeId = require(Parent.StoreId),
	collectibleResellableInstances = require(Parent.CollectibleResellableInstances),
	creatingExperiences = require(Parent.CreatingExperiences),
	overlay = require(Parent.Overlay)
})