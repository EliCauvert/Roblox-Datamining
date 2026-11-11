local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local ReactModule = require(CorePackages.Packages.React)
local RoactRodux = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux
local UseSelectorFunction = RoactRodux.useSelector
local UseDispatchFunction = RoactRodux.useDispatch
local UseRoactServiceModule = require(Modules.LuaApp.Hooks.useRoactService)
local UseLocalizationModule = require(Modules.LuaApp.Hooks.useLocalization)
local RoactNetworkingModule = require(Modules.LuaApp.Services.RoactNetworking)
local RoactLocalizationModule = require(Modules.LuaApp.Services.RoactLocalization)
local AnalyticsModule = require(Modules.AvatarExperience.Catalog.Services.Analytics)
local NumberLocalization = require(CorePackages.Workspace.Packages.Localization).NumberLocalization
local ItemType = require(Modules.AvatarExperience.Common.Constants).ItemType
local _ = require(Modules.AvatarExperience.Common.AvatarExperienceState)
local GetAssetFavoriteModule = require(Modules.AvatarExperience.Catalog.Thunks.GetAssetFavorite)
local SetAssetFavoriteModule = require(Modules.AvatarExperience.Catalog.Thunks.SetAssetFavorite)
local GetBundleFavoriteModule = require(Modules.AvatarExperience.Catalog.Thunks.GetBundleFavorite)
local SetBundleFavoriteModule = require(Modules.AvatarExperience.Catalog.Thunks.SetBundleFavorite)
local SetLookFavoriteModule = require(Modules.AvatarExperience.Catalog.Thunks.SetLookFavorite)
local SetNetworkingErrorToastModule = require(Modules.LuaApp.Thunks.SetNetworkingErrorToast)
local _ = require(script.Parent.FavoritePillView)

local function _(p1, Asset, p2)
	-- upvalues: ItemType (copy)
	if Asset == ItemType.Asset then
		return p1.AvatarExperience.Catalog.AssetFavorites[p2]
	elseif Asset == ItemType.Bundle then
		return p1.AvatarExperience.Catalog.BundleFavorites[p2]
	elseif Asset == ItemType.Look then
		local Look = p1.AvatarExperience.AvatarScene.Looks[p2]
		
		return if Look == nil then nil else Look.isFavorited
	else
		return nil
	end
end

return function(Frame)
	-- upvalues: UseDispatchFunction (copy), UseRoactServiceModule (copy), RoactNetworkingModule (copy), RoactLocalizationModule (copy), AnalyticsModule (copy), UseLocalizationModule (copy), UseSelectorFunction (copy), ItemType (copy), ReactModule (copy), GetAssetFavoriteModule (copy), GetBundleFavoriteModule (copy), SetAssetFavoriteModule (copy), SetBundleFavoriteModule (copy), SetLookFavoriteModule (copy), SetNetworkingErrorToastModule (copy), NumberLocalization (copy)
	local Kind = Frame.kind
	local ItemId = Frame.itemId
	local LookType = Frame.lookType
	local FavoritesCount = Frame.favoritesCount
	local UseDispatchResult = UseDispatchFunction()
	local UseRoactServiceModuleResult = UseRoactServiceModule(RoactNetworkingModule)
	local UseRoactServiceModuleResult1 = UseRoactServiceModule(RoactLocalizationModule)
	local UseRoactServiceModuleResult2 = UseRoactServiceModule(AnalyticsModule)
	local UseLocalizationModuleResult = UseLocalizationModule({ favoritesLabel = "Feature.Catalog.Label.Favorites" })
	local UseSelectorResult = UseSelectorFunction(function(p1)
		-- upvalues: Kind (copy), ItemId (copy), ItemType (upval)
		if Kind == ItemType.Asset then
			return p1.AvatarExperience.Catalog.AssetFavorites[ItemId]
		elseif Kind == ItemType.Bundle then
			return p1.AvatarExperience.Catalog.BundleFavorites[ItemId]
		elseif Kind == ItemType.Look then
			local Look = p1.AvatarExperience.AvatarScene.Looks[ItemId]
			
			return if Look == nil then nil else Look.isFavorited
		else
			return nil
		end
	end)
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(false)
	local UseStateResult3 = if UseStateResult then UseStateResult1 else UseSelectorResult
	ReactModule.useEffect(function()
		-- upvalues: UseSelectorResult (copy), Kind (copy), ItemType (upval), UseDispatchResult (copy), GetAssetFavoriteModule (upval), ItemId (copy), GetBundleFavoriteModule (upval)
		if UseSelectorResult ~= nil then return end
		if Kind == ItemType.Asset then
			UseDispatchResult(GetAssetFavoriteModule(ItemId))
			
			return
		end
		if Kind == ItemType.Bundle then
			UseDispatchResult(GetBundleFavoriteModule(ItemId))
		end
	end, { UseDispatchResult, UseSelectorResult, ItemId, Kind })
	local UseStateResult4, UseStateResult2_2 = ReactModule.useState(nil)
	ReactModule.useEffect(function()
		-- upvalues: UseSelectorResult (copy), FavoritesCount (copy), UseStateResult2_2 (copy)
		if UseSelectorResult ~= nil and FavoritesCount ~= nil then
			UseStateResult2_2(function(p1)
				-- upvalues: FavoritesCount (upval), UseSelectorResult (upval)
				return if p1 == nil or p1.count ~= FavoritesCount then { favorited = UseSelectorResult, count = FavoritesCount } else p1
			end)
			
			return
		end
	end, { UseSelectorResult, FavoritesCount })
	
	return {
		favoritesCount = if UseStateResult4 == nil or UseStateResult3 == nil then FavoritesCount else UseStateResult4.count + (if UseStateResult3 == UseStateResult4.favorited then 0 elseif UseStateResult3 then 1 else -1),
		isFavorited = UseStateResult3,
		isDisabled = UseStateResult or UseStateResult3 == nil,
		onActivated = ReactModule.useCallback(function()
			-- upvalues: UseStateResult (copy), UseSelectorResult (copy), UseStateResult2 (copy), UseStateResult2_1 (copy), Kind (copy), ItemType (upval), LookType (copy), UseRoactServiceModuleResult2 (copy), ItemId (copy), UseDispatchResult (copy), SetAssetFavoriteModule (upval), SetBundleFavoriteModule (upval), SetLookFavoriteModule (upval), UseRoactServiceModuleResult (copy), SetNetworkingErrorToastModule (upval)
			if UseStateResult or UseSelectorResult == nil then return end
			local NoUseSelectorResult = not UseSelectorResult
			UseStateResult2(true)
			UseStateResult2_1(NoUseSelectorResult)
			
			local function _()
				-- upvalues: UseStateResult2 (upval)
				UseStateResult2(false)
			end
			
			UseRoactServiceModuleResult2.clickFavoriteItemButton(ItemId, Kind == ItemType.Look and LookType or Kind, NoUseSelectorResult)
			local Promise = nil
			
			if Kind == ItemType.Asset then
				Promise = UseDispatchResult(SetAssetFavoriteModule(ItemId, NoUseSelectorResult))
			elseif Kind == ItemType.Bundle then
				Promise = UseDispatchResult(SetBundleFavoriteModule(ItemId, NoUseSelectorResult))
			elseif Kind == ItemType.Look then
				Promise = UseDispatchResult(SetLookFavoriteModule(UseRoactServiceModuleResult, ItemId, NoUseSelectorResult, LookType))
			end
			if Promise == nil then
				UseStateResult2(false)
				
				return
			else
				Promise:andThen(function()
					-- upvalues: UseStateResult2 (upval)
					UseStateResult2(false)
				end, function()
					-- upvalues: UseStateResult2 (upval), Kind (upval), ItemType (upval), UseDispatchResult (upval), SetNetworkingErrorToastModule (upval)
					UseStateResult2(false)
					
					if Kind == ItemType.Look then
						UseDispatchResult(SetNetworkingErrorToastModule({ HttpError = Enum.HttpError.OK }))
					end
				end)
			end
		end, {
			UseStateResult, UseSelectorResult, Kind, ItemId, LookType, UseDispatchResult,
			UseRoactServiceModuleResult, UseRoactServiceModuleResult2
		}),
		favoritesLabel = UseLocalizationModuleResult.favoritesLabel,
		formatCount = ReactModule.useCallback(function(p1)
			-- upvalues: NumberLocalization (upval), UseRoactServiceModuleResult1 (copy)
			return NumberLocalization.abbreviate(p1, UseRoactServiceModuleResult1:GetLocale())
		end, { UseRoactServiceModuleResult1 }),
		LayoutOrder = Frame.LayoutOrder,
		testId = Frame.testId
	}
end