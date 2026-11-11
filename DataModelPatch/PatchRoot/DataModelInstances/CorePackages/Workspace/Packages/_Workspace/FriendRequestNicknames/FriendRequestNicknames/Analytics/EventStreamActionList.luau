local EventNamesModule = require(script.Parent.EventNames)
local Enums = require(script:FindFirstAncestor("FriendRequestNicknames").Parent.SocialLuaAnalytics).Analytics.Enums
local Contexts = Enums.Contexts
local EventTypes = Enums.EventTypes

local function FriendshipOriginSourceType(p1)
	return p1
end

return {
	[EventNamesModule.SetNicknameModalOpened] = {
		context = Contexts.SetNicknameModal,
		eventType = EventTypes.PageLoad,
		formatRulesForAdditionalInfo = {
			friendshipOriginSourceType = FriendshipOriginSourceType,
			previousNicknames = FriendshipOriginSourceType
		}
	},
	[EventNamesModule.SetNicknameSkipClicked] = {
		context = Contexts.SetNicknameModal,
		additionalInfo = { btn = EventNamesModule.SetNicknameSkipClicked },
		eventType = EventTypes.ButtonClick,
		formatRulesForAdditionalInfo = {
			friendshipOriginSourceType = FriendshipOriginSourceType,
			previousNicknames = FriendshipOriginSourceType
		}
	},
	[EventNamesModule.SetNicknameAddNameClicked] = {
		context = Contexts.SetNicknameModal,
		eventType = EventTypes.ButtonClick,
		additionalInfo = { btn = EventNamesModule.SetNicknameAddNameClicked },
		formatRulesForAdditionalInfo = {
			friendshipOriginSourceType = FriendshipOriginSourceType,
			previousNicknames = FriendshipOriginSourceType,
			submittedNickname = FriendshipOriginSourceType
		}
	}
}