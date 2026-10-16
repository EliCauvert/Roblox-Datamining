local Parent = script:FindFirstAncestor("UserSearch").Parent
local LocalizationService = game:GetService("LocalizationService")
local Enums = require(Parent.SocialLuaAnalytics).Analytics.Enums
local Contexts = Enums.Contexts
local EventTypes = Enums.EventTypes
local EventNamesModule = require(script.Parent.EventNames)
local FFlagLuaAppSearchPeopleUnifiedSchemaFields = require(Parent.SharedFlags).FFlagLuaAppSearchPeopleUnifiedSchemaFields

local function concatToString(List): string --[[ Line: 17 ]]
	return if List then table.concat(List, ",") else ""
end

local function acceptAnyValue(p1) --[[ Line: 21 ]]
	return p1
end

return {
	[EventNamesModule.PlayerTileImpressions] = {
		context = Contexts.PlayerSearch,
		eventType = EventTypes.PlayerTileImpressions,
		formatRulesForAdditionalInfo = {
			tilePos = concatToString,
			playerId = concatToString,
			playerName = concatToString,
			rowInSort = concatToString
		}
	},
	[EventNamesModule.NavigateToAddFriendsBtn] = {
		context = Contexts.PlayerSearch,
		eventType = EventTypes.ButtonClick,
		additionalInfo = {
			btn = require(script.Parent.BtnValues).NavigateToAddFriends
		}
	},
	[EventNamesModule.PlayerFriendRequest] = {
		context = Contexts.PlayerSearch,
		eventType = EventTypes.PlayerFriendAdd,
		formatRulesForAdditionalInfo = {
			playerId = acceptAnyValue,
			tilePos = acceptAnyValue,
			contextualInfoType = acceptAnyValue,
			rowInSort = acceptAnyValue,
			positionInRow = if FFlagLuaAppSearchPeopleUnifiedSchemaFields then acceptAnyValue else nil,
			feedRowNumber = if FFlagLuaAppSearchPeopleUnifiedSchemaFields then acceptAnyValue else nil,
			interactionUuid = if FFlagLuaAppSearchPeopleUnifiedSchemaFields then acceptAnyValue else nil,
			pageContext = if FFlagLuaAppSearchPeopleUnifiedSchemaFields then acceptAnyValue else nil
		},
		additionalInfo = {
			locale = LocalizationService.RobloxLocaleId,
			contentType = if FFlagLuaAppSearchPeopleUnifiedSchemaFields then "User" else nil,
			actionType = if FFlagLuaAppSearchPeopleUnifiedSchemaFields then "RequestFriendship" else nil
		}
	},
	[EventNamesModule.PlayerFriendAccept] = {
		context = Contexts.PlayerSearch,
		eventType = EventTypes.PlayerFriendAccept,
		formatRulesForAdditionalInfo = {
			playerId = acceptAnyValue,
			tilePos = acceptAnyValue,
			contextualInfoType = acceptAnyValue,
			rowInSort = acceptAnyValue,
			positionInRow = if FFlagLuaAppSearchPeopleUnifiedSchemaFields then acceptAnyValue else nil,
			feedRowNumber = if FFlagLuaAppSearchPeopleUnifiedSchemaFields then acceptAnyValue else nil,
			interactionUuid = if FFlagLuaAppSearchPeopleUnifiedSchemaFields then acceptAnyValue else nil,
			pageContext = if FFlagLuaAppSearchPeopleUnifiedSchemaFields then acceptAnyValue else nil
		},
		additionalInfo = {
			locale = LocalizationService.RobloxLocaleId,
			contentType = if FFlagLuaAppSearchPeopleUnifiedSchemaFields then "User" else nil,
			actionType = if FFlagLuaAppSearchPeopleUnifiedSchemaFields then "AcceptFriendship" else nil
		}
	},
	[EventNamesModule.PlayerTileClick] = {
		context = Contexts.PlayerSearch,
		eventType = EventTypes.PlayerTileClick,
		formatRulesForAdditionalInfo = {
			playerId = acceptAnyValue,
			tilePos = acceptAnyValue,
			contextualInfoType = acceptAnyValue,
			rowInSort = acceptAnyValue,
			positionInRow = if FFlagLuaAppSearchPeopleUnifiedSchemaFields then acceptAnyValue else nil,
			feedRowNumber = if FFlagLuaAppSearchPeopleUnifiedSchemaFields then acceptAnyValue else nil,
			interactionUuid = if FFlagLuaAppSearchPeopleUnifiedSchemaFields then acceptAnyValue else nil,
			pageContext = if FFlagLuaAppSearchPeopleUnifiedSchemaFields then acceptAnyValue else nil
		},
		additionalInfo = {
			locale = LocalizationService.RobloxLocaleId,
			contentType = if FFlagLuaAppSearchPeopleUnifiedSchemaFields then "User" else nil,
			actionType = if FFlagLuaAppSearchPeopleUnifiedSchemaFields then "OpenProfile" else nil
		}
	},
	[EventNamesModule.UserSearchLoadingTime] = {
		context = Contexts.PlayerSearch,
		eventType = EventTypes.LoadingTime,
		formatRulesForAdditionalInfo = {
			status = acceptAnyValue,
			loadingTime = acceptAnyValue,
			loadingThreshold = acceptAnyValue,
			nextPage = acceptAnyValue
		},
		additionalInfo = {
			fetch = "userSearch",
			locale = LocalizationService.RobloxLocaleId
		}
	},
	[EventNamesModule.UserSearchLoaded] = {
		context = Contexts.PlayerSearch,
		eventType = EventTypes.PageLoad,
		formatRulesForAdditionalInfo = { status = acceptAnyValue, nextPage = acceptAnyValue },
		additionalInfo = { locale = LocalizationService.RobloxLocaleId }
	},
	[EventNamesModule.UserSearchBarOpen] = {
		context = Contexts.PlayerSearch,
		eventType = EventTypes.Search,
		formatRulesForAdditionalInfo = { kwd = acceptAnyValue, currentPage = acceptAnyValue },
		additionalInfo = {
			act = "open",
			locale = LocalizationService.RobloxLocaleId
		}
	},
	[EventNamesModule.UserSearchBarCancel] = {
		context = Contexts.PlayerSearch,
		eventType = EventTypes.Search,
		formatRulesForAdditionalInfo = { kwd = acceptAnyValue, currentPage = acceptAnyValue },
		additionalInfo = {
			act = "cancel",
			locale = LocalizationService.RobloxLocaleId
		}
	},
	[EventNamesModule.UserSearchBarSubmit] = {
		context = Contexts.PlayerSearch,
		eventType = EventTypes.Search,
		formatRulesForAdditionalInfo = { kwd = acceptAnyValue, currentPage = acceptAnyValue },
		additionalInfo = {
			act = "search",
			locale = LocalizationService.RobloxLocaleId
		}
	}
}