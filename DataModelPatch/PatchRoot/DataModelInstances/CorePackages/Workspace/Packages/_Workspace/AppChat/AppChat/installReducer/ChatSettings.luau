local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local CryoModule = require(Parent.Cryo)
local RetrievalStatus = require(Parent.Http).Enum.RetrievalStatus

local function checkRetrievals(UnionResult)
	-- upvalues: CryoModule (copy), RetrievalStatus (copy)
	return if UnionResult.accountChatRetrieved and UnionResult.thirdPartyPrivacySettingsRetrieved then CryoModule.Dictionary.union(UnionResult, {
		chatEnabled = UnionResult.accountChatEnabled and UnionResult.thirdPartyPrivacySettingsEnabled,
		retrievalStatus = RetrievalStatus.Done
	}) else UnionResult
end

local function handleGetMetadataSucceeded(p1, p2)
	-- upvalues: checkRetrievals (copy), CryoModule (copy)
	local ResponseBody = p2.responseBody
	
	return checkRetrievals(CryoModule.Dictionary.union(p1, {
		accountChatRetrieved = true,
		chatUserMessagesEnabled = ResponseBody.isChatUserMessagesEnabled,
		accountChatEnabled = ResponseBody.isChatEnabled,
		groupChatEnabled = ResponseBody.isChatEnabled and ResponseBody.isGroupChatEnabledByPrivacySetting == "enabled",
		privacySettingsEnabled = ResponseBody.isChatEnabledByPrivacySetting == "enabled",
		globalRulesEnabled = ResponseBody.isChatEnabledByGlobalRules == "enabled"
	}))
end

return require(Parent.Rodux).createReducer({
	accountChatRetrieved = false,
	accountChatEnabled = false,
	chatEnabled = false,
	groupChatEnabled = false,
	privacySettingsEnabled = false,
	globalRulesEnabled = false,
	thirdPartyPrivacySettingsRetrieved = false,
	thirdPartyPrivacySettingsEnabled = false,
	retrievalStatus = RetrievalStatus.NotStarted
}, {
	[require(AppChat.Actions.ThirdPartyChatSettingsLoaded).name] = function(p1, p2)
		-- upvalues: checkRetrievals (copy), CryoModule (copy)
		return checkRetrievals(CryoModule.Dictionary.union(p1, {
			thirdPartyPrivacySettingsRetrieved = p2.status ~= Enum.ChatRestrictionStatus.Unknown,
			thirdPartyPrivacySettingsEnabled = p2.status == Enum.ChatRestrictionStatus.NotRestricted
		}))
	end,
	[require(Parent.AppChatNetworking).rodux.GetMetadata.Succeeded.name] = function(p1, p2)
		-- upvalues: handleGetMetadataSucceeded (copy)
		return handleGetMetadataSucceeded(p1, p2)
	end,
	Debug_GroupChatEnabledToggled = function(p1, _)
		-- upvalues: CryoModule (copy)
		return CryoModule.Dictionary.union(p1, { groupChatEnabled = not p1.groupChatEnabled })
	end
})