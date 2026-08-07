local eventNamesModule = require(script.Parent.EventNames)
local enums = require(script:FindFirstAncestor("FriendRequestNicknames").Parent.SocialLuaAnalytics).Analytics.Enums
local contexts = enums.Contexts
local eventTypes = enums.EventTypes

local var1 = function(p0) --[[ line: 10 ]]
	return p0
end

return {
	[eventNamesModule.SetNicknameModalOpened] = {
		context = contexts.SetNicknameModal,
		eventType = eventTypes.PageLoad,
		formatRulesForAdditionalInfo = {
			friendshipOriginSourceType = var1,
			previousNicknames = var1
		}
	},
	[eventNamesModule.SetNicknameSkipClicked] = {
		context = contexts.SetNicknameModal,
		additionalInfo = { btn = eventNamesModule.SetNicknameSkipClicked },
		eventType = eventTypes.ButtonClick,
		formatRulesForAdditionalInfo = {
			friendshipOriginSourceType = var1,
			previousNicknames = var1
		}
	},
	[eventNamesModule.SetNicknameAddNameClicked] = {
		context = contexts.SetNicknameModal,
		eventType = eventTypes.ButtonClick,
		additionalInfo = { btn = eventNamesModule.SetNicknameAddNameClicked },
		formatRulesForAdditionalInfo = {
			friendshipOriginSourceType = var1,
			previousNicknames = var1,
			submittedNickname = var1
		}
	}
}