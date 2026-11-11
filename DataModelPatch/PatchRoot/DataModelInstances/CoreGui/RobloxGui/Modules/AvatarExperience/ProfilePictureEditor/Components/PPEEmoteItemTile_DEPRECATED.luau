local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CorePackages = game:GetService("CorePackages")
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local RoactGamepadModule = require(CorePackages.Packages.RoactGamepad)
local WithNavigationFunction = require(CorePackages.Packages.RoactNavigation).withNavigation
local WithAvatarRouteModule = require(Modules.AvatarExperience.Common.Components.RoactNavigation.withAvatarRoute)
local AvatarScreen = require(CorePackages.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen
local RoactModule = require(CorePackages.Packages.Roact)
local TModule = require(CorePackages.Packages.t)
local _ = require(Modules.AvatarExperience.Common.AvatarExperienceState)
local ItemDataModule = require(Modules.AvatarExperience.Common.Selectors.ItemData)
local ConstantsModule = require(Modules.AvatarExperience.Common.Constants)
local CatalogUtilsModule = require(Modules.AvatarExperience.Catalog.CatalogUtils)
local Focusable = RoactGamepadModule.Focusable
local ItemTile = require(CorePackages.Packages.UIBlox).Tile.ItemTile
local SetEmoteAssetIdModule = require(Modules.AvatarExperience.ProfilePictureEditor.Thunks.SetEmoteAssetId)
local ConstantsModule1 = require(Modules.LuaApp.Constants)
local LogOnOverlayClosedFunction = require(CorePackages.Workspace.Packages.AvatarExperienceNavigation).Debug.logOnOverlayClosed
local ItemTileDetailButtonModule = require(Modules.AvatarExperience.Common.Components.ItemTileDetailButton)
local NavigateWithLockFunction = require(CorePackages.Workspace.Packages.AvatarExperienceNavigation).Thunks.NavigateWithLock
local OpenItemDetailsModule = require(Modules.AvatarExperience.Common.Thunks.OpenItemDetails)
local AnalyticsModule = require(Modules.AvatarExperience.Catalog.Services.Analytics)
local RoactServices = require(CorePackages.Workspace.Packages.RoactServices).RoactServices
local WasLastInputGamepadFunction = require(CorePackages.Workspace.Packages.RoactUtils).wasLastInputGamepad
local WithLastInputGroupModule = require(Modules.AvatarExperience.Common.Components.withLastInputGroup)
local WithAdaptiveScrollingFunction = require(CorePackages.Workspace.Packages.AvatarExperienceCommon).Hooks.withAdaptiveScrolling
local UserLibModule = require(CorePackages.Workspace.Packages.UserLib)
local Constants = UserLibModule.Utils.Constants
local GetRbxthumbWithTypeSizeAndOptionsFunction = UserLibModule.Utils.getRbxthumbWithTypeSizeAndOptions
local PPEEmoteItemTile = RoactModule.PureComponent:extend("PPEEmoteItemTile")
PPEEmoteItemTile.validateProps = TModule.strictInterface({
	itemId = TModule.optional(TModule.string),
	titleFontStyle = TModule.optional(TModule.table),
	isSelected = TModule.boolean,
	itemDetailsPeekViewRefs = TModule.table,
	resultsListRef = TModule.table,
	navigation = TModule.table,
	avatarRoute = TModule.table,
	adaptiveScrolling = TModule.optional(TModule.table),
	itemData = TModule.optional(TModule.table),
	emoteAssetId = TModule.optional(TModule.string),
	name = TModule.optional(TModule.string),
	thumbnail = TModule.optional(TModule.string),
	avatarType = TModule.string,
	lastInputGroup = TModule.string,
	setEmoteAssetId = TModule.callback,
	navigateWithLock = TModule.callback,
	openItemDetails = TModule.callback,
	catalogAnalytics = TModule.table
})

function PPEEmoteItemTile.init(p1)
	-- upvalues: RoactModule (copy), CatalogUtilsModule (copy), ConstantsModule (copy), AvatarScreen (copy), WasLastInputGamepadFunction (copy), LogOnOverlayClosedFunction (copy)
	p1.tileRef = RoactModule.createRef()
	
	function p1.activateMoreButton()
		-- upvalues: CatalogUtilsModule (upval), p1 (copy), ConstantsModule (upval)
		p1.props.openItemDetails({
			mountAsFullView = true,
			closePreviousItemDetails = true,
			itemId = p1.props.itemId,
			itemType = ConstantsModule.ItemType.Asset,
			itemSubType = CatalogUtilsModule.GetItemSubType(p1.props.itemType, p1.props.itemData),
			priceInRobux = if p1.props.itemData then p1.props.itemData.priceInRobux else nil,
			catalogAnalytics = p1.props.catalogAnalytics,
			avatarRoute = p1.props.avatarRoute,
			navigation = p1.props.navigation,
			itemDetailsPeekViewRefs = p1.props.itemDetailsPeekViewRefs,
			resultsListRef = p1.props.resultsListRef
		})
	end
	
	function p1.toggleAdaptiveScrollingSelectedItem(p2)
		-- upvalues: p1 (copy)
		local AdaptiveScrolling = p1.props.adaptiveScrolling
		
		if not AdaptiveScrolling then return end
		if p2 then
			AdaptiveScrolling.setSelectedItemInstance(nil)
			
			return
		end
		if p1.tileRef.current then
			AdaptiveScrolling.setSelectedItemInstance(p1.tileRef.current)
		end
	end
	
	function p1.toggleSelectEmote()
		-- upvalues: p1 (copy), ConstantsModule (upval), AvatarScreen (upval), WasLastInputGamepadFunction (upval), LogOnOverlayClosedFunction (upval)
		local ItemId = p1.props.itemId
		local Navigation = p1.props.navigation
		
		if ItemId == p1.props.emoteAssetId then
			p1.props.setEmoteAssetId(nil, Navigation)
			p1.toggleAdaptiveScrollingSelectedItem(true)
			
			return
		end
		if p1.props.avatarType == ConstantsModule.AvatarType.R6 then
			p1.props.navigation.navigate(AvatarScreen.R15UpgradePrompt, {
				bodyTextKey = "Feature.Avatar.Label.PPEEmoteR15Warning",
				onSwitchSelected = function()
					-- upvalues: p1 (upval), ItemId (copy), Navigation (copy)
					p1.props.setEmoteAssetId(ItemId, Navigation)
					p1.toggleAdaptiveScrollingSelectedItem(false)
				end,
				onOverlayClosed = function()
					-- upvalues: WasLastInputGamepadFunction (upval), LogOnOverlayClosedFunction (upval)
					LogOnOverlayClosedFunction("EmotesScrollView", (WasLastInputGamepadFunction()))
				end
			})
			
			return
		else
			p1.props.setEmoteAssetId(ItemId, Navigation)
			p1.toggleAdaptiveScrollingSelectedItem(false)
		end
	end
end

function PPEEmoteItemTile.shouldProvideControlsToViewItemDetails(p1): boolean
	return if p1.props.itemId and p1.props.isSelected then true else false
end

function PPEEmoteItemTile.renderMoreButton(p1)
	-- upvalues: ConstantsModule1 (copy), RoactModule (copy), ItemTileDetailButtonModule (copy)
	return if p1:shouldProvideControlsToViewItemDetails() then if p1.props.lastInputGroup == ConstantsModule1.InputType.Gamepad then nil else RoactModule.createElement(ItemTileDetailButtonModule, { activateButton = p1.activateMoreButton }) else nil
end

function PPEEmoteItemTile.render(p1)
	-- upvalues: ConstantsModule (copy), RoactGamepadModule (copy), RoactModule (copy), Focusable (copy), ItemTile (copy)
	return RoactModule.createElement(Focusable[ItemTile], {
		isSelected = p1.props.isSelected,
		onActivated = p1.toggleSelectEmote,
		thumbnail = p1.props.thumbnail,
		titleTextLineCount = ConstantsModule.ItemTileTitleMaxLines,
		titleFontStyle = p1.props.titleFontStyle,
		name = p1.props.name,
		inputBindings = {
			ToggleSelect = RoactGamepadModule.Input.onBegin(Enum.KeyCode.ButtonA, p1.toggleSelectEmote),
			MoreDetails = if p1:shouldProvideControlsToViewItemDetails() then RoactGamepadModule.Input.onBegin(Enum.KeyCode.ButtonX, p1.activateMoreButton, { key = "CommonUI.Features.Label.More" }) else nil
		},
		renderTileInset = function()
			-- upvalues: p1 (copy)
			return p1:renderMoreButton()
		end,
		[RoactModule.Ref] = p1.tileRef
	})
end

return (RoactServices.connect({ catalogAnalytics = AnalyticsModule })((WithAdaptiveScrollingFunction((WithAvatarRouteModule((WithNavigationFunction(RoactRoduxModule.connect(function(p1, p2)
	-- upvalues: ItemDataModule (copy), ConstantsModule (copy), GetRbxthumbWithTypeSizeAndOptionsFunction (copy), Constants (copy)
	local EmoteAssetId = p1.AvatarExperience.ProfilePictureEditor.ProfilePictureParams.emoteAssetId
	local AvatarType = p1.AvatarExperience.AvatarEditor.Character.AvatarType
	local ItemId = p2.itemId
	local ItemData = nil
	local Name = nil
	local Thumbnail = nil
	
	if ItemId then
		ItemData = ItemDataModule(p1.AvatarExperience.Common, ItemId, ConstantsModule.ItemType.Asset)
		Name = ItemData and ItemData.name or nil
		Thumbnail = GetRbxthumbWithTypeSizeAndOptionsFunction(ItemId, Constants.RbxthumbTypes.Asset, 150)
	end
	return {
		itemData = ItemData,
		emoteAssetId = EmoteAssetId,
		name = Name,
		thumbnail = Thumbnail,
		avatarType = AvatarType
	}
end, function(Callback)
	-- upvalues: SetEmoteAssetIdModule (copy), NavigateWithLockFunction (copy), OpenItemDetailsModule (copy)
	return {
		setEmoteAssetId = function(p1, p2)
			-- upvalues: Callback (copy), SetEmoteAssetIdModule (upval)
			return Callback(SetEmoteAssetIdModule(p1, p2))
		end,
		navigateWithLock = function(p1)
			-- upvalues: Callback (copy), NavigateWithLockFunction (upval)
			Callback(NavigateWithLockFunction(p1))
		end,
		openItemDetails = function(p1)
			-- upvalues: Callback (copy), OpenItemDetailsModule (upval)
			Callback(OpenItemDetailsModule(p1))
		end
	}
end)((WithLastInputGroupModule(PPEEmoteItemTile))), nil))))))))