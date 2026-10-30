local AvatarWorkshop = script:FindFirstAncestor("AvatarWorkshop")
local Parent = AvatarWorkshop.Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local _ = require(AvatarWorkshop.Constants.InventoryPagesData)
local GetInventoryPageStoreModule = require(AvatarWorkshop.Stores.Getters.getInventoryPageStore)
local GetUiStateStoreModule = require(AvatarWorkshop.Stores.Getters.getUiStateStore)
local _ = require(script.Parent.InventoryGridTypes)
local UseTokensFunction = FoundationModule.Hooks.useTokens
local UseSignalStateFunction = require(Parent.SignalsReact).useSignalState
local GetRbxThumbFunction = FoundationModule.Utility.getRbxThumb
local ThumbnailSize = FoundationModule.Enums.ThumbnailSize
local ThumbnailType = FoundationModule.Enums.ThumbnailType

return function(p1)
	-- upvalues: UseTokensFunction (copy), GetInventoryPageStoreModule (copy), UseSignalStateFunction (copy), GetUiStateStoreModule (copy), ReactModule (copy), GetRbxThumbFunction (copy), ThumbnailType (copy), ThumbnailSize (copy)
	local PageData = p1.pageData
	local UseTokensResult = UseTokensFunction()
	local InventoryPageStoreModule = GetInventoryPageStoreModule(PageData)
	local UseSignalStateResult = UseSignalStateFunction(GetUiStateStoreModule)
	local UseSignalStateResult1 = UseSignalStateFunction(InventoryPageStoreModule.getEntries)
	local UseSignalStateResult2 = UseSignalStateFunction(InventoryPageStoreModule.getIsFetching)
	local UseSignalStateResult3 = UseSignalStateFunction(InventoryPageStoreModule.getDidInitialFetch)
	local UseSignalStateResult4 = UseSignalStateFunction(InventoryPageStoreModule.getHasFetchError)
	local UseSignalStateResult5 = UseSignalStateFunction(InventoryPageStoreModule.getLastPageReached)
	local UseSignalStateResult6 = UseSignalStateFunction(UseSignalStateResult.getLastMeasuredGridWidth)
	local FetchNextPageFunction = InventoryPageStoreModule.fetchNextPage
	local UseStateResult, UseStateResult2 = ReactModule.useState(nil)
	local UseResult = ReactModule.useCallback(function(p2)
		-- upvalues: UseStateResult2 (copy)
		UseStateResult2(function(p3)
			-- upvalues: p2 (copy)
			return if p3 == p2 then nil else p2
		end)
	end, {})
	local v1 = #UseSignalStateResult1 > 0
	ReactModule.useEffect(function()
		-- upvalues: v1 (copy), UseSignalStateResult2 (copy), UseSignalStateResult4 (copy), UseSignalStateResult5 (copy), FetchNextPageFunction (copy)
		if not v1 and not UseSignalStateResult2 and not UseSignalStateResult4 and not UseSignalStateResult5 then
			FetchNextPageFunction()
		end
	end, {
		v1,
		UseSignalStateResult2,
		UseSignalStateResult4,
		UseSignalStateResult5,
		FetchNextPageFunction
	})
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: UseSignalStateResult1 (copy), GetRbxThumbFunction (upval), ThumbnailType (upval), ThumbnailSize (upval), UseStateResult (copy), UseResult (copy)
		local Buffer = table.create(#UseSignalStateResult1)
		
		for _, value in UseSignalStateResult1 do
			local ItemId = value.itemId
			table.insert(Buffer, {
				id = ItemId,
				image = if value.itemType == "Outfit" then GetRbxThumbFunction(ThumbnailType.Outfit, ItemId, ThumbnailSize.Medium) else GetRbxThumbFunction(ThumbnailType.Asset, ItemId, ThumbnailSize.Medium),
				isSelected = UseStateResult == ItemId,
				onActivated = function()
					-- upvalues: UseResult (upval), ItemId (copy)
					UseResult(ItemId)
				end
			})
		end
		return Buffer
	end, { UseSignalStateResult1, UseStateResult, UseResult })
	local v2 = #UseMemoResult > 0
	
	return {
		fallbackNumColumns = 5,
		minColumns = 3,
		items = UseMemoResult,
		isLoadingInitialPage = UseSignalStateResult2 and not v2,
		isLoadingNextPage = UseSignalStateResult2 and v2,
		isEmpty = UseSignalStateResult3 and (UseSignalStateResult5 and (not UseSignalStateResult2 and (not UseSignalStateResult4 and not v2))),
		hasFetchError = UseSignalStateResult4 and not v2,
		hasNextPageError = UseSignalStateResult4 and v2,
		minItemWidth = UseTokensResult.Size.Size_2000,
		lastMeasuredGridWidth = UseSignalStateResult6,
		onGridWidthChanged = UseSignalStateResult.setLastMeasuredGridWidth,
		rowGap = UseTokensResult.Gap.Medium,
		columnGap = UseTokensResult.Gap.Medium,
		contentPaddingY = UseTokensResult.Padding.Large,
		onEndReached = if UseSignalStateResult4 then nil else FetchNextPageFunction,
		onRetry = FetchNextPageFunction
	}
end