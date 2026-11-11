local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CorePackages = game:GetService("CorePackages")
local RoactModule = require(Modules.Common.Roact)
local ConstantsModule = require(Modules.LuaApp.Constants)
local GetAutoFetchingStatusModule = require(Modules.LuaApp.Thunks.Search.getAutoFetchingStatus)
local FetchDataWithErrorToastsModule = require(Modules.LuaApp.Thunks.FetchDataWithErrorToasts)
local RetrievalStatus = require(CorePackages.Workspace.Packages.Http).Enum.RetrievalStatus
local FormFactor = require(CorePackages.Workspace.Packages.FormFactor).Enums.FormFactor
local DashModule = require(CorePackages.Packages.Dash)
local RemoveTextSearchResultsFunction = require(CorePackages.Workspace.Packages.DiscoveryMonolith).Modules.LuaApp.Actions.RemoveTextSearchResults
local DiscoveryTypesModule = require(CorePackages.Workspace.Packages.DiscoveryTypes)
local UserSearchResultsPageLayerExposureModule = require(script.Parent.UserSearchResultsPageLayerExposure)
local PlayerSearchPageModule = require(script.Parent.PlayerSearchPage)
local ApiFetchPlayerSearchModule = require(script.Parent.Parent.Thunks.ApiFetchPlayerSearch)
local RemoveUsersSearchResultsModule = require(script.Parent.Parent.Actions.RemoveUsersSearchResults)

local function _(Text): boolean
	-- upvalues: ConstantsModule (copy)
	return ConstantsModule.PLAYER_SEARCH_MIN_KEYWORD_UTF8_LEN <= utf8.len(Text)
end

return require(Modules.Common.RoactRodux).connect(function(p1, p2)
	-- upvalues: ConstantsModule (copy), DiscoveryTypesModule (copy), RetrievalStatus (copy), ApiFetchPlayerSearchModule (copy), GetAutoFetchingStatusModule (copy), FormFactor (copy)
	local SearchKeyword = p2.searchParameters.searchKeyword or ""
	local Inverted = not (ConstantsModule.PLAYER_SEARCH_MIN_KEYWORD_UTF8_LEN <= utf8.len(SearchKeyword))
	local HotlineSearchText = nil
	local TextSearchResultEntry = p1.TextSearchResults[p2.searchUuid] and p1.TextSearchResults[p2.searchUuid][DiscoveryTypesModule.SearchTextTopicIds.HotlineSearchText]
	
	if TextSearchResultEntry then
		HotlineSearchText = TextSearchResultEntry.text
	end
	return {
		screenSize = p1.ScreenSize,
		usersSearchResult = p1.UsersSearchResults[SearchKeyword],
		searchWordLengthNotSupported = Inverted,
		playerSearchStatus = Inverted and RetrievalStatus.Done or ApiFetchPlayerSearchModule.GetFetchingStatus(p1, SearchKeyword),
		autoTabSearchStatus = Inverted and RetrievalStatus.Done or GetAutoFetchingStatusModule(p1, SearchKeyword),
		wideMode = p1.FormFactor == FormFactor.WIDE,
		hotlineSearchText = HotlineSearchText
	}
end, function(Callback)
	-- upvalues: FetchDataWithErrorToastsModule (copy), ApiFetchPlayerSearchModule (copy), RemoveUsersSearchResultsModule (copy), RemoveTextSearchResultsFunction (copy)
	return {
		fetchPlayerSearch = function(p1, ...)
			-- upvalues: Callback (copy), FetchDataWithErrorToastsModule (upval), ApiFetchPlayerSearchModule (upval)
			return Callback(FetchDataWithErrorToastsModule(ApiFetchPlayerSearchModule.Fetch(p1, ...)))
		end,
		removeUserSearchResults = function(p1)
			-- upvalues: Callback (copy), RemoveUsersSearchResultsModule (upval)
			return Callback(RemoveUsersSearchResultsModule(p1))
		end,
		removeTextSearchResults = function(p1)
			-- upvalues: Callback (copy), RemoveTextSearchResultsFunction (upval)
			return Callback(RemoveTextSearchResultsFunction(p1))
		end
	}
end)(function(p1)
	-- upvalues: RoactModule (copy), UserSearchResultsPageLayerExposureModule (copy), PlayerSearchPageModule (copy), DashModule (copy)
	return RoactModule.createElement(UserSearchResultsPageLayerExposureModule, {
		renderChild = function(p2)
			-- upvalues: RoactModule (upval), PlayerSearchPageModule (upval), DashModule (upval), p1 (copy)
			return RoactModule.createElement(PlayerSearchPageModule, DashModule.join(p2 or {}, p1 or {}))
		end
	})
end)