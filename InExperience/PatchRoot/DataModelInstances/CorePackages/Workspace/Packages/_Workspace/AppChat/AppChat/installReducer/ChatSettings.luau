local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local appChatNetworkingModule = require(parent.AppChatNetworking)
local cryoModule = require(parent.Cryo)
local roduxModule = require(parent.Rodux)
local retrievalStatus = require(parent.Http).Enum.RetrievalStatus
local thirdPartyChatSettingsLoadedModule = require(appChat.Actions.ThirdPartyChatSettingsLoaded)
local t = {
	accountChatRetrieved = false,
	accountChatEnabled = false,
	chatEnabled = false,
	groupChatEnabled = false,
	privacySettingsEnabled = false,
	globalRulesEnabled = false,
	thirdPartyPrivacySettingsRetrieved = false,
	thirdPartyPrivacySettingsEnabled = false,
	retrievalStatus = retrievalStatus.NotStarted
}

local function checkRetrievals(p1)
	-- upvalues: cryoModule (ref), retrievalStatus (ref)
	return if p1.accountChatRetrieved and p1.thirdPartyPrivacySettingsRetrieved then cryoModule.Dictionary.union(p1, {
		chatEnabled = p1.accountChatEnabled and p1.thirdPartyPrivacySettingsEnabled,
		retrievalStatus = retrievalStatus.Done
	}) else p1
end

local function handleGetMetadataSucceeded(p1, p2)
	-- upvalues: checkRetrievals (ref), cryoModule (ref)
	local responseBody = p2.responseBody
	
	return checkRetrievals(cryoModule.Dictionary.union(p1, {
		accountChatRetrieved = true,
		chatUserMessagesEnabled = responseBody.isChatUserMessagesEnabled,
		accountChatEnabled = responseBody.isChatEnabled,
		groupChatEnabled = responseBody.isChatEnabled and responseBody.isGroupChatEnabledByPrivacySetting == "enabled",
		privacySettingsEnabled = responseBody.isChatEnabledByPrivacySetting == "enabled",
		globalRulesEnabled = responseBody.isChatEnabledByGlobalRules == "enabled"
	}))
end

return roduxModule.createReducer(t, {
	[thirdPartyChatSettingsLoadedModule.name] = function(value, p1)
		-- upvalues: checkRetrievals (ref), cryoModule (ref)
		return checkRetrievals(cryoModule.Dictionary.union(value, {
			thirdPartyPrivacySettingsRetrieved = p1.status ~= Enum.ChatRestrictionStatus.Unknown,
			thirdPartyPrivacySettingsEnabled = p1.status == Enum.ChatRestrictionStatus.NotRestricted
		}))
	end,
	[appChatNetworkingModule.rodux.GetMetadata.Succeeded.name] = function(p1, p2)
		-- upvalues: handleGetMetadataSucceeded (ref)
		return handleGetMetadataSucceeded(p1, p2)
	end,
	Debug_GroupChatEnabledToggled = function(p1, _)
		-- upvalues: cryoModule (ref)
		return cryoModule.Dictionary.union(p1, { groupChatEnabled = not p1.groupChatEnabled })
	end
})