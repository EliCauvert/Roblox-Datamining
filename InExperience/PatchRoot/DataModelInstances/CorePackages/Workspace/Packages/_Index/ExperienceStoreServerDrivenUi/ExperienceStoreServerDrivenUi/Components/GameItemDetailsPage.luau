local ExperienceStoreServerDrivenUi = script:FindFirstAncestor("ExperienceStoreServerDrivenUi")
local Parent = ExperienceStoreServerDrivenUi.Parent
local FoundationModule = require(Parent.Foundation)
local _ = require(Parent.Navigation)
local ReactModule = require(Parent.React)
local SduiSharedUtilitiesModule = require(Parent.SduiSharedUtilities)
local CompositionTags = require(Parent.AppComposition).CompositionTags
local FFlagSduiPageEntryUseSharedHooks = require(Parent.SharedFlags).FFlagSduiPageEntryUseSharedHooks
local FFlagSduiToggleGamePassVote = require(Parent.SharedFlags).FFlagSduiToggleGamePassVote
local SduiLoadTimer = SduiSharedUtilitiesModule.SduiLoadTimer
local GetSduiPageEntrySnackbarStoreFunction = SduiSharedUtilitiesModule.getSduiPageEntrySnackbarStore
local SduiPageEntryPoint = SduiSharedUtilitiesModule.SduiPageEntryPoint
local SduiFeatureEntryPoint = SduiSharedUtilitiesModule.SduiFeatureEntryPoint
local FetchGameItemDetailsPageIfNeededModule = require(ExperienceStoreServerDrivenUi.Api.fetchGameItemDetailsPageIfNeeded)
local GetGameItemDetailsPageKeyModule = require(ExperienceStoreServerDrivenUi.Utils.getGameItemDetailsPageKey)
local RefreshStoreForGameItemModule = require(ExperienceStoreServerDrivenUi.Utils.refreshStoreForGameItem)
local _ = require(ExperienceStoreServerDrivenUi.Utils.GameItemType)

local function _(p1, p2)
	return p1[p2] or p1.navigation and p1.navigation.getParam(p2)
end

return ReactModule.memo(function(p1)
	-- upvalues: GetGameItemDetailsPageKeyModule (copy), ReactModule (copy), SduiLoadTimer (copy), FFlagSduiToggleGamePassVote (copy), GetSduiPageEntrySnackbarStoreFunction (copy), FetchGameItemDetailsPageIfNeededModule (copy), RefreshStoreForGameItemModule (copy), FoundationModule (copy), CompositionTags (copy), SduiPageEntryPoint (copy), FFlagSduiPageEntryUseSharedHooks (copy), SduiFeatureEntryPoint (copy)
	local ItemType = p1.itemType or p1.navigation and p1.navigation.getParam("itemType")
	local ItemId = p1.itemId or p1.navigation and p1.navigation.getParam("itemId")
	local UniverseId = p1.universeId or p1.navigation and p1.navigation.getParam("universeId")
	local GameItemDetailsPageKeyModule = if ItemType and ItemId then GetGameItemDetailsPageKeyModule(ItemType, ItemId) else ""
	local PageTimer = p1.pageTimer or p1.navigation and p1.navigation.getParam("pageTimer")
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: PageTimer (copy), SduiLoadTimer (upval)
		return PageTimer or SduiLoadTimer.createLoadTimer("GameItemDetails")
	end, { GameItemDetailsPageKeyModule, PageTimer })
	
	if FFlagSduiToggleGamePassVote then
		ReactModule.useLayoutEffect(function()
			-- upvalues: GameItemDetailsPageKeyModule (copy), GetSduiPageEntrySnackbarStoreFunction (upval)
			if GameItemDetailsPageKeyModule ~= "" then
				GetSduiPageEntrySnackbarStoreFunction().hide(GameItemDetailsPageKeyModule)
			end
		end, { GameItemDetailsPageKeyModule })
	end
	ReactModule.useEffect(function()
		-- upvalues: ItemType (copy), ItemId (copy), UniverseId (copy), FetchGameItemDetailsPageIfNeededModule (upval), UseMemoResult (copy)
		if ItemType and ItemId and UniverseId then
			FetchGameItemDetailsPageIfNeededModule({
				itemType = ItemType,
				itemId = ItemId,
				universeId = UniverseId
			}, UseMemoResult)
		end
	end, { ItemType, ItemId, UniverseId, UseMemoResult })
	ReactModule.useEffect(function()
		-- upvalues: ItemType (copy), ItemId (copy), UniverseId (copy), RefreshStoreForGameItemModule (upval)
		return function()
			-- upvalues: ItemType (upval), ItemId (upval), UniverseId (upval), RefreshStoreForGameItemModule (upval)
			if ItemType and ItemId and UniverseId then
				RefreshStoreForGameItemModule({
					itemType = ItemType,
					itemId = ItemId,
					universeId = UniverseId
				})
			end
		end
	end, { ItemType, ItemId, UniverseId })
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: ItemType (copy), ItemId (copy), UniverseId (copy), SduiLoadTimer (upval), FetchGameItemDetailsPageIfNeededModule (upval)
		if ItemType and ItemId and UniverseId then
			local GameItemDetails = SduiLoadTimer.createLoadTimer("GameItemDetails")
			GameItemDetails.start("refresh")
			FetchGameItemDetailsPageIfNeededModule({
				itemType = ItemType,
				itemId = ItemId,
				universeId = UniverseId
			}, GameItemDetails, true):finally(function()
				-- upvalues: GameItemDetails (copy)
				GameItemDetails.logRefreshComplete()
			end)
		end
	end, { ItemType, ItemId, UniverseId })
	
	return if ItemType == nil or ItemId == nil or UniverseId == nil then nil else ReactModule.createElement(FoundationModule.View, {
		tag = `col align-x-center size-full bg-surface-0 {CompositionTags.Layout.Detail}`
	}, {
		Page = ReactModule.createElement(FoundationModule.View, { tag = "fill size-full-0", LayoutOrder = 1 }, {
			EntryPoint = ReactModule.createElement(SduiPageEntryPoint, {
				appPage = "GameItemDetails",
				includeNavigationHeaderBar = true,
				navButtonType = "close",
				snackbarPortalLayoutOrder = 2147483647,
				configKey = GameItemDetailsPageKeyModule,
				identifier = if FFlagSduiPageEntryUseSharedHooks then "game_item_details_feed" else `{GameItemDetailsPageKeyModule}_game_item_details_feed`,
				pageTimer = UseMemoResult,
				refresh = UseResult,
				contentTag = CompositionTags.ContentRegion.Body,
				layoutTag = CompositionTags.Layout.Detail
			})
		}),
		ActionBar = ReactModule.createElement(FoundationModule.View, {
			LayoutOrder = 2,
			tag = `size-full-0 auto-y {CompositionTags.ContentRegion.Body}`
		}, {
			EntryPoint = ReactModule.createElement(SduiFeatureEntryPoint, {
				appPage = "GameItemDetails",
				identifier = "game_item_details_action_bar",
				shouldDisplayError = false,
				shouldDisplayLoading = false,
				configKey = GameItemDetailsPageKeyModule
			})
		})
	})
end)