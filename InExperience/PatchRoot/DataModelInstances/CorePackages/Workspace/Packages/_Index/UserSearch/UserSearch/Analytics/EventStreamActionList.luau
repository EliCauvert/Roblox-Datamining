local parent = script:FindFirstAncestor("UserSearch").Parent
local localizationService = game:GetService("LocalizationService")
local enums = require(parent.SocialLuaAnalytics).Analytics.Enums
local contexts = enums.Contexts
local eventTypes = enums.EventTypes
local eventNamesModule = require(script.Parent.EventNames)
local btnValuesModule = require(script.Parent.BtnValues)
local fFlagLuaAppSearchPeopleUnifiedSchemaFields = require(parent.SharedFlags).FFlagLuaAppSearchPeopleUnifiedSchemaFields

local function concatToString(p1)
	return if p1 then table.concat(p1, ",") else ""
end

local function acceptAnyValue(p1)
	return p1
end

return {
	[eventNamesModule.PlayerTileImpressions] = {
		context = contexts.PlayerSearch,
		eventType = eventTypes.PlayerTileImpressions,
		formatRulesForAdditionalInfo = {
			tilePos = concatToString,
			playerId = concatToString,
			playerName = concatToString,
			rowInSort = concatToString
		}
	},
	[eventNamesModule.NavigateToAddFriendsBtn] = {
		context = contexts.PlayerSearch,
		eventType = eventTypes.ButtonClick,
		additionalInfo = { btn = btnValuesModule.NavigateToAddFriends }
	},
	[eventNamesModule.PlayerFriendRequest] = {
		context = contexts.PlayerSearch,
		eventType = eventTypes.PlayerFriendAdd,
		formatRulesForAdditionalInfo = {
			playerId = acceptAnyValue,
			tilePos = acceptAnyValue,
			contextualInfoType = acceptAnyValue,
			rowInSort = acceptAnyValue,
			positionInRow = if fFlagLuaAppSearchPeopleUnifiedSchemaFields then acceptAnyValue else nil,
			feedRowNumber = if fFlagLuaAppSearchPeopleUnifiedSchemaFields then acceptAnyValue else nil,
			interactionUuid = if fFlagLuaAppSearchPeopleUnifiedSchemaFields then acceptAnyValue else nil,
			pageContext = if fFlagLuaAppSearchPeopleUnifiedSchemaFields then acceptAnyValue else nil
		},
		additionalInfo = {
			locale = localizationService.RobloxLocaleId,
			contentType = if fFlagLuaAppSearchPeopleUnifiedSchemaFields then "User" else nil,
			actionType = if fFlagLuaAppSearchPeopleUnifiedSchemaFields then "RequestFriendship" else nil
		}
	},
	[eventNamesModule.PlayerFriendAccept] = {
		context = contexts.PlayerSearch,
		eventType = eventTypes.PlayerFriendAccept,
		formatRulesForAdditionalInfo = {
			playerId = acceptAnyValue,
			tilePos = acceptAnyValue,
			contextualInfoType = acceptAnyValue,
			rowInSort = acceptAnyValue,
			positionInRow = if fFlagLuaAppSearchPeopleUnifiedSchemaFields then acceptAnyValue else nil,
			feedRowNumber = if fFlagLuaAppSearchPeopleUnifiedSchemaFields then acceptAnyValue else nil,
			interactionUuid = if fFlagLuaAppSearchPeopleUnifiedSchemaFields then acceptAnyValue else nil,
			pageContext = if fFlagLuaAppSearchPeopleUnifiedSchemaFields then acceptAnyValue else nil
		},
		additionalInfo = {
			locale = localizationService.RobloxLocaleId,
			contentType = if fFlagLuaAppSearchPeopleUnifiedSchemaFields then "User" else nil,
			actionType = if fFlagLuaAppSearchPeopleUnifiedSchemaFields then "AcceptFriendship" else nil
		}
	},
	[eventNamesModule.PlayerTileClick] = {
		context = contexts.PlayerSearch,
		eventType = eventTypes.PlayerTileClick,
		formatRulesForAdditionalInfo = {
			playerId = acceptAnyValue,
			tilePos = acceptAnyValue,
			contextualInfoType = acceptAnyValue,
			rowInSort = acceptAnyValue,
			positionInRow = if fFlagLuaAppSearchPeopleUnifiedSchemaFields then acceptAnyValue else nil,
			feedRowNumber = if fFlagLuaAppSearchPeopleUnifiedSchemaFields then acceptAnyValue else nil,
			interactionUuid = if fFlagLuaAppSearchPeopleUnifiedSchemaFields then acceptAnyValue else nil,
			pageContext = if fFlagLuaAppSearchPeopleUnifiedSchemaFields then acceptAnyValue else nil
		},
		additionalInfo = {
			locale = localizationService.RobloxLocaleId,
			contentType = if fFlagLuaAppSearchPeopleUnifiedSchemaFields then "User" else nil,
			actionType = if fFlagLuaAppSearchPeopleUnifiedSchemaFields then "OpenProfile" else nil
		}
	},
	[eventNamesModule.UserSearchLoadingTime] = {
		context = contexts.PlayerSearch,
		eventType = eventTypes.LoadingTime,
		formatRulesForAdditionalInfo = {
			status = acceptAnyValue,
			loadingTime = acceptAnyValue,
			loadingThreshold = acceptAnyValue,
			nextPage = acceptAnyValue
		},
		additionalInfo = {
			fetch = "userSearch",
			locale = localizationService.RobloxLocaleId
		}
	},
	[eventNamesModule.UserSearchLoaded] = {
		context = contexts.PlayerSearch,
		eventType = eventTypes.PageLoad,
		formatRulesForAdditionalInfo = { status = acceptAnyValue, nextPage = acceptAnyValue },
		additionalInfo = { locale = localizationService.RobloxLocaleId }
	},
	[eventNamesModule.UserSearchBarOpen] = {
		context = contexts.PlayerSearch,
		eventType = eventTypes.Search,
		formatRulesForAdditionalInfo = { kwd = acceptAnyValue, currentPage = acceptAnyValue },
		additionalInfo = {
			act = "open",
			locale = localizationService.RobloxLocaleId
		}
	},
	[eventNamesModule.UserSearchBarCancel] = {
		context = contexts.PlayerSearch,
		eventType = eventTypes.Search,
		formatRulesForAdditionalInfo = { kwd = acceptAnyValue, currentPage = acceptAnyValue },
		additionalInfo = {
			act = "cancel",
			locale = localizationService.RobloxLocaleId
		}
	},
	[eventNamesModule.UserSearchBarSubmit] = {
		context = contexts.PlayerSearch,
		eventType = eventTypes.Search,
		formatRulesForAdditionalInfo = { kwd = acceptAnyValue, currentPage = acceptAnyValue },
		additionalInfo = {
			act = "search",
			locale = localizationService.RobloxLocaleId
		}
	}
}