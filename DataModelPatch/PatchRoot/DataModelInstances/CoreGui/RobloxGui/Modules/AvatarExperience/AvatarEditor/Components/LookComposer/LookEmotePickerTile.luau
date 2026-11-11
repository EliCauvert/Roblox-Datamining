local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CorePackages = game:GetService("CorePackages")
local ReactModule = require(CorePackages.Packages.React)
local UseSelectorFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector
local UseDispatchFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch
local CryoModule = require(CorePackages.Packages.Cryo)
local ItemTile = require(CorePackages.Packages.UIBlox).Tile.ItemTile
local UserLibModule = require(CorePackages.Workspace.Packages.UserLib)
local Constants = UserLibModule.Utils.Constants
local GetRbxthumbWithTypeSizeAndOptionsFunction = UserLibModule.Utils.getRbxthumbWithTypeSizeAndOptions
local Focusable = require(CorePackages.Packages.RoactGamepad).Focusable
local CatalogItemCard = require(CorePackages.Workspace.Packages.AvatarExperienceCommon).Components.CatalogItemCard.CatalogItemCard
local ItemCardThumbnail = require(CorePackages.Workspace.Packages.AvatarExperienceUIKit).ItemCardComponents.ItemCardThumbnail
local ConstantsModule = require(Modules.AvatarExperience.Common.Constants)
local UpdateLookDetailsModule = require(Modules.AvatarExperience.Common.Actions.UpdateLookDetails)
local SelectItemInfoModule = require(Modules.AvatarExperience.Common.Selectors.selectItemInfo)
local FFlagAXMigrateAXToGlobalAutofocus = require(CorePackages.Workspace.Packages.SharedFlags).FFlagAXMigrateAXToGlobalAutofocus

return function(p1)
	-- upvalues: GetRbxthumbWithTypeSizeAndOptionsFunction (copy), Constants (copy), UseSelectorFunction (copy), SelectItemInfoModule (copy), ConstantsModule (copy), UseDispatchFunction (copy), ReactModule (copy), CryoModule (copy), UpdateLookDetailsModule (copy), FFlagAXMigrateAXToGlobalAutofocus (copy), CatalogItemCard (copy), ItemCardThumbnail (copy), Focusable (copy), ItemTile (copy)
	local RbxthumbWithTypeSizeAndOptions = GetRbxthumbWithTypeSizeAndOptionsFunction(p1.itemId, Constants.RbxthumbTypes.Asset, 150)
	local UseSelectorResult = UseSelectorFunction(function(p2)
		-- upvalues: SelectItemInfoModule (upval), p1 (copy), ConstantsModule (upval)
		local SelectItemInfoModuleResult = SelectItemInfoModule(p2.AvatarExperience, p1.itemId, ConstantsModule.ItemType.Asset)
		
		return if SelectItemInfoModuleResult then SelectItemInfoModuleResult.name else nil
	end)
	local UseSelectorResult1 = UseSelectorFunction(function(p2)
		-- upvalues: ConstantsModule (upval)
		return p2.AvatarExperience.AvatarScene.Looks[ConstantsModule.DraftLookId]
	end)
	local UseDispatchResult = UseDispatchFunction()
	local IsEmoteAssetIdMatch: boolean = UseSelectorResult1 and UseSelectorResult1.displayProperties.emoteAssetId == p1.itemId
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: UseSelectorResult1 (copy), CryoModule (upval), IsEmoteAssetIdMatch (copy), p1 (copy), UseDispatchResult (copy), UpdateLookDetailsModule (upval), ConstantsModule (upval)
		UseDispatchResult(UpdateLookDetailsModule(ConstantsModule.DraftLookId, {
			displayProperties = CryoModule.Dictionary.join(UseSelectorResult1.displayProperties, {
				emoteAssetId = if IsEmoteAssetIdMatch then CryoModule.None else p1.itemId
			})
		}))
	end, {
		UseSelectorResult1,
		UseDispatchResult,
		p1.itemId,
		IsEmoteAssetIdMatch
	})
	
	return if FFlagAXMigrateAXToGlobalAutofocus then ReactModule.createElement(CatalogItemCard, {
		onActivated = UseResult,
		presentationSlot = if RbxthumbWithTypeSizeAndOptions then ReactModule.createElement(ItemCardThumbnail, { url = RbxthumbWithTypeSizeAndOptions }) else nil,
		title = UseSelectorResult,
		Size = UDim2.fromScale(1, 0),
		AutomaticSize = Enum.AutomaticSize.Y,
		isSelected = IsEmoteAssetIdMatch
	}) else ReactModule.createElement(Focusable[ItemTile], {
		thumbnail = RbxthumbWithTypeSizeAndOptions,
		name = UseSelectorResult,
		isSelected = IsEmoteAssetIdMatch,
		onActivated = UseResult
	})
end