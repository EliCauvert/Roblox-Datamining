local profilePlatform = script:FindFirstAncestor("ProfilePlatform")
local _ = require(profilePlatform.Common.Types)
local getDeepValueModule = require(profilePlatform.Utils.getDeepValue)
local enumsModule = require(profilePlatform.Common.Enums)
local friendStatusModule = require(profilePlatform.Analytics.FriendStatus)
local t = {
	Friends = friendStatusModule.Friends,
	Self = friendStatusModule.Self,
	RequestSent = friendStatusModule.RequestSent,
	RequestReceived = friendStatusModule.RequestReceived,
	None = friendStatusModule.NotFriends,
	Invalid = friendStatusModule.Unknown,
	Ineligible = friendStatusModule.Ineligible,
	_ = friendStatusModule.Unknown
}

local function getViewerRelationshipFromProfileResponse(p1)
	-- upvalues: getDeepValueModule (ref), enumsModule (ref)
	return getDeepValueModule(p1, `responseBody.components.{enumsModule.Components.UserProfileHeader}.viewerRelationship`)
end

local function getContextualInformationFromProfileResponse(p1)
	-- upvalues: getDeepValueModule (ref), enumsModule (ref)
	return getDeepValueModule(p1, `responseBody.components.{enumsModule.Components.UserProfileHeader}.contextualInformation`)
end

local function _(p1)
	return if p1 then p1.trustedFriendStatus or nil else nil
end

local _ = function(p1)
	-- upvalues: t (ref)
	return t[p1]
end

return {
	getViewerRelationshipFromProfileResponse = getViewerRelationshipFromProfileResponse,
	getContextualInformationFromProfileResponse = getContextualInformationFromProfileResponse,
	mapViewerRelationshipAndContextToAnalyticsFriendStatus = function(p1, p2)
		-- upvalues: enumsModule (ref), friendStatusModule (ref), t (ref)
		local var1 = if p1 then p1.friendshipStatus else "Invalid"
		
		return if p2 and p2.context == enumsModule.ContextualTypes.AccountDeleted and var1 == "Friends" then friendStatusModule.Ineligible else t[var1]
	end,
	isViewerTrustedFriendsFromViewerRelationship = function(_)
-- FATAL: Failed to generate AST for `isViewerTrustedFriendsFromViewerRelationship` function:
runtime : [KeyError] :11990: 29
Traceback:
	runtime : [lunaux]:11990 function decompile_function
	runtime : [lunaux]:1933 function normalize_cfg
	runtime : [lunaux]:1320 function match_weird_patterns
	end
}