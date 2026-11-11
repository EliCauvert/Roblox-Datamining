local CorePackages = game:GetService("CorePackages")
local NotificationService = game:GetService("NotificationService")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CryoModule = require(CorePackages.Packages.Cryo)
local RoactModule = require(CorePackages.Packages.Roact)
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local PerformFetch = require(CorePackages.Workspace.Packages.Http).PerformFetch
local RoactServices = require(CorePackages.Workspace.Packages.RoactServices).RoactServices
local RoactNetworkingModule = require(Modules.LuaApp.Services.RoactNetworking)
local UtilsModule = require(Modules.AvatarExperience.Common.Utils)
local ConstantsModule = require(Modules.AvatarExperience.Common.Constants)
local DeepLinkUtilsModule = require(Modules.AvatarExperience.Common.DeepLinkUtils)
local FetchDataWithErrorToastsModule = require(Modules.LuaApp.Thunks.FetchDataWithErrorToasts)
local SetSearchParametersModule = require(Modules.LuaApp.Actions.SetSearchParameters)
local _ = require(Modules.AvatarExperience.Common.AvatarExperienceState)
local PageButtonModule = require(Modules.AvatarExperience.Common.Components.Landing.PageButton)
local RetrievalStatusModule = require(Modules.LuaApp.Enum.RetrievalStatus)
local WithLocalizationFunction = require(CorePackages.Workspace.Packages.Localization).withLocalization
local TModule = require(CorePackages.Packages.t)
local FetchCatalogSearchWithSponsoredItemsModule = require(Modules.AvatarExperience.Catalog.Thunks.FetchCatalogSearchWithSponsoredItems)
local UserLibModule = require(CorePackages.Workspace.Packages.UserLib)
local Constants = UserLibModule.Utils.Constants
local GetRbxthumbWithTypeSizeAndOptionsFunction = UserLibModule.Utils.getRbxthumbWithTypeSizeAndOptions
local _ = require(Modules.AvatarExperience.Catalog.SearchTypes)
local _ = require(CorePackages.Packages.LuauPolyfill)
local Asset = Constants.RbxthumbTypes.Asset
local BundleThumbnail = Constants.RbxthumbTypes.BundleThumbnail
local IconsMenuShopLarge = require(CorePackages.Packages.UIBlox).App.ImageSet.Images["icons/menu/shop_large"]
local GetFFlagAXDisableCatalogFetchOnDeepLinkForConsoleModule = require(Modules.AvatarExperience.Flags.GetFFlagAXDisableCatalogFetchOnDeepLinkForConsole)
local CatalogPageButton = RoactModule.PureComponent:extend("CatalogPageButton")
local AvatarExperienceFlagsModule = require(CorePackages.Workspace.Packages.AvatarExperienceFlags)
local FFlagAXMigrateAllTabToSduiDev = AvatarExperienceFlagsModule.FFlagAXMigrateAllTabToSduiDev
local FFlagAXFixCatalogPageButtonSduiCrash = AvatarExperienceFlagsModule.FFlagAXFixCatalogPageButtonSduiCrash
local GetCatalogCategoriesStoreModule = require(Modules.AvatarExperience.Catalog.Stores.GetCatalogCategoriesStore)
CatalogPageButton.validateProps = TModule.strictInterface({
	transparencyModifier = TModule.number,
	NextSelectionLeft = TModule.optional(TModule.table),
	NextSelectionRight = TModule.optional(TModule.table),
	NextSelectionUp = TModule.optional(TModule.table),
	NextSelectionDown = TModule.optional(TModule.table),
	onActivated = TModule.callback,
	networking = TModule.callback,
	forwardRef = TModule.optional(TModule.table),
	catalogItem = TModule.optional(TModule.table),
	dataStatus = TModule.string,
	externalNavigationRequest = if GetFFlagAXDisableCatalogFetchOnDeepLinkForConsoleModule() then TModule.optional(TModule.table) else nil,
	setSearchParameters = TModule.callback,
	fetchCatalogData = TModule.callback
})
CatalogPageButton.defaultProps = { transparencyModifier = 0 }
local _Vector2 = Vector2.new(0, 0)

function CatalogPageButton.init(p1)
	-- upvalues: NotificationService (copy), FFlagAXFixCatalogPageButtonSduiCrash (copy), UtilsModule (copy), FFlagAXMigrateAllTabToSduiDev (copy), ConstantsModule (copy), GetCatalogCategoriesStoreModule (copy)
	p1.state = { style = string.lower(NotificationService.SelectedTheme) }
	
	function p1.fetchInitialCatalogItems()
		-- upvalues: p1 (copy), FFlagAXFixCatalogPageButtonSduiCrash (upval), UtilsModule (upval), FFlagAXMigrateAllTabToSduiDev (upval), ConstantsModule (upval), GetCatalogCategoriesStoreModule (upval)
		local Networking = p1.props.networking
		
		if not FFlagAXFixCatalogPageButtonSduiCrash then
			local _ = UtilsModule.getCatalogCategoryInfo(1, 0)
		end
		local Categories = nil
		if FFlagAXMigrateAllTabToSduiDev then
			local DefaultCatalogCategoryId = ConstantsModule.DefaultCatalogCategoryId
			Categories = GetCatalogCategoriesStoreModule.getCatalogCategoriesStore().getCategoriesMap(false)[DefaultCatalogCategoryId] or UtilsModule.getCatalogCategoryInfoById(DefaultCatalogCategoryId, nil)
		else
			Categories = UtilsModule.getCatalogCategoryInfoById(ConstantsModule.DefaultCatalogCategoryId, nil)
		end
		local config = {
			searchUuid = Categories.SearchUuid,
			categoryInfo = Categories
		}
		p1.props.setSearchParameters(config.searchUuid, config)
		
		return p1.props.fetchCatalogData(Networking, config)
	end
end

function CatalogPageButton.render(p1)
	-- upvalues: ConstantsModule (copy), GetRbxthumbWithTypeSizeAndOptionsFunction (copy), BundleThumbnail (copy), Asset (copy), WithLocalizationFunction (copy), RoactModule (copy), PageButtonModule (copy), _Vector2 (copy), IconsMenuShopLarge (copy)
	local CatalogItem = p1.props.catalogItem
	local TransparencyModifier = p1.props.transparencyModifier
	local NextSelectionLeft = p1.props.NextSelectionLeft
	local NextSelectionRight = p1.props.NextSelectionRight
	local NextSelectionUp = p1.props.NextSelectionUp
	local NextSelectionDown = p1.props.NextSelectionDown
	local CatalogPng: string = if p1.state.style == "dark" then "rbxasset://textures/AvatarEditorImages/Catalog.png" else "rbxasset://textures/AvatarEditorImages/Catalog_LightTheme.png"
	local ThumbnailImage = nil
	local ThumbnailSize = 420
	
	if CatalogItem then
		if CatalogItem.type == ConstantsModule.ItemType.Bundle then
			ThumbnailImage = GetRbxthumbWithTypeSizeAndOptionsFunction(CatalogItem.id, BundleThumbnail, 420)
			ThumbnailSize = 420
		else
			ThumbnailImage = GetRbxthumbWithTypeSizeAndOptionsFunction(CatalogItem.id, Asset, 420)
			ThumbnailSize = 420
		end
	end
	local ForwardRef = p1.props.forwardRef
	
	return WithLocalizationFunction({ catalogText = "Feature.Avatar.Action.Marketplace" })(function(p2)
		-- upvalues: RoactModule (upval), PageButtonModule (upval), CatalogPng (ref), ThumbnailImage (ref), ThumbnailSize (ref), _Vector2 (upval), IconsMenuShopLarge (upval), TransparencyModifier (copy), NextSelectionLeft (copy), NextSelectionRight (copy), NextSelectionUp (copy), NextSelectionDown (copy), ForwardRef (copy), p1 (copy)
		return RoactModule.createElement(PageButtonModule, {
			Size = UDim2.new(1, 0, 1, 0),
			backgroundImage = CatalogPng,
			thumbnailImage = ThumbnailImage,
			thumbnailSize = ThumbnailSize,
			thumbnailScaleOffset = _Vector2,
			icon = IconsMenuShopLarge,
			text = p2.catalogText,
			transparencyModifier = TransparencyModifier,
			NextSelectionLeft = NextSelectionLeft,
			NextSelectionRight = NextSelectionRight,
			NextSelectionUp = NextSelectionUp,
			NextSelectionDown = NextSelectionDown,
			[RoactModule.Ref] = ForwardRef,
			onActivated = p1.props.onActivated
		})
	end)
end

function CatalogPageButton.checkFetchSortData(p1)
	-- upvalues: GetFFlagAXDisableCatalogFetchOnDeepLinkForConsoleModule (copy), DeepLinkUtilsModule (copy), RetrievalStatusModule (copy)
	if GetFFlagAXDisableCatalogFetchOnDeepLinkForConsoleModule() and DeepLinkUtilsModule.catalogDeepLinkExists(p1.props.externalNavigationRequest) then return end
	local IsDataStatusMatch = p1.props.dataStatus == RetrievalStatusModule.NotStarted
	
	if p1.props.catalogItem == nil and IsDataStatusMatch then
		p1.fetchInitialCatalogItems()
	end
end

function CatalogPageButton.didUpdate(p1)
	p1:checkFetchSortData()
end

function CatalogPageButton.didMount(p1)
	-- upvalues: NotificationService (copy)
	p1.themeChangedConn = NotificationService:GetPropertyChangedSignal("SelectedTheme"):Connect(function()
		-- upvalues: p1 (copy), NotificationService (upval)
		p1:setState({ style = string.lower(NotificationService.SelectedTheme) })
	end)
	p1:checkFetchSortData()
end

function CatalogPageButton.willUnmount(p1)
	if p1.themeChangedConn then
		p1.themeChangedConn:Disconnect()
		p1.themeChangedConn = nil
	end
end

local v1 = RoactRoduxModule.connect(function(p1)
	-- upvalues: FFlagAXMigrateAllTabToSduiDev (copy), ConstantsModule (copy), GetCatalogCategoriesStoreModule (copy), UtilsModule (copy), PerformFetch (copy), GetFFlagAXDisableCatalogFetchOnDeepLinkForConsoleModule (copy)
	local Categories = nil
	if FFlagAXMigrateAllTabToSduiDev then
		local DefaultCatalogCategoryId = ConstantsModule.DefaultCatalogCategoryId
		Categories = GetCatalogCategoriesStoreModule.getCatalogCategoriesStore().getCategoriesMap(false)[DefaultCatalogCategoryId] or UtilsModule.getCatalogCategoryInfoById(DefaultCatalogCategoryId, nil)
	else
		Categories = UtilsModule.getCatalogCategoryInfo(1, 0)
	end
	local SearchUuid = Categories.SearchUuid
	assert(SearchUuid ~= nil, "searchUuid is not nil. Silence type checker")
	local SearchesInCatalogEntry = p1.Search.SearchesInCatalog[SearchUuid] or {}
	local ExternalNavigationRequest = if GetFFlagAXDisableCatalogFetchOnDeepLinkForConsoleModule() then p1.AvatarExperience.ExternalNavigationRequest else {}
	
	return {
		catalogItem = (SearchesInCatalogEntry and SearchesInCatalogEntry.items or {})[1],
		dataStatus = PerformFetch.GetStatus(p1, (UtilsModule.getSearchKey(p1, SearchUuid))),
		externalNavigationRequest = if GetFFlagAXDisableCatalogFetchOnDeepLinkForConsoleModule() then ExternalNavigationRequest else nil
	}
end, function(Callback)
	-- upvalues: FetchDataWithErrorToastsModule (copy), FetchCatalogSearchWithSponsoredItemsModule (copy), SetSearchParametersModule (copy)
	return {
		fetchCatalogData = function(p1, p2)
			-- upvalues: Callback (copy), FetchDataWithErrorToastsModule (upval), FetchCatalogSearchWithSponsoredItemsModule (upval)
			return Callback(FetchDataWithErrorToastsModule(FetchCatalogSearchWithSponsoredItemsModule(p1, p2)))
		end,
		setSearchParameters = function(p1, p2)
			-- upvalues: Callback (copy), SetSearchParametersModule (upval)
			return Callback(SetSearchParametersModule(p1, p2))
		end
	}
end)((RoactServices.connect({ networking = RoactNetworkingModule })(CatalogPageButton)))

return RoactModule.forwardRef(function(p1, ForwardRef)
	-- upvalues: RoactModule (copy), v1 (ref), CryoModule (copy)
	return RoactModule.createElement(v1, CryoModule.Dictionary.join(p1, { forwardRef = ForwardRef }))
end)