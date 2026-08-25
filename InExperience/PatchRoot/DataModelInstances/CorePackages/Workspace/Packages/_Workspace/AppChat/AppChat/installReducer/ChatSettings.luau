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

local function checkRetrievals(p0)
	-- upvalues: cryoModule (ref), retrievalStatus (ref)
	return if p0.accountChatRetrieved and p0.thirdPartyPrivacySettingsRetrieved then cryoModule.Dictionary.union(p0, {
		chatEnabled = p0.accountChatEnabled and p0.thirdPartyPrivacySettingsEnabled,
		retrievalStatus = retrievalStatus.Done
	}) else p0
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
	[thirdPartyChatSettingsLoadedModule.name] = function(value, p3)
		-- upvalues: checkRetrievals (ref), cryoModule (ref)
		return checkRetrievals(cryoModule.Dictionary.union(value, {
			thirdPartyPrivacySettingsRetrieved = p3.status ~= Enum.ChatRestrictionStatus.Unknown,
			thirdPartyPrivacySettingsEnabled = p3.status == Enum.ChatRestrictionStatus.NotRestricted
		}))
	end,
	[appChatNetworkingModule.rodux.GetMetadata.Succeeded.name] = function(p4, p5)
		-- upvalues: handleGetMetadataSucceeded (ref)
		return handleGetMetadataSucceeded(p4, p5)
	end,
	Debug_GroupChatEnabledToggled = function(p6, _)
		-- upvalues: cryoModule (ref)
		return cryoModule.Dictionary.union(p6, { groupChatEnabled = not p6.groupChatEnabled })
	end
})