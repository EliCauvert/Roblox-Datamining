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

local function getViewerRelationshipFromProfileResponse(p0) --[[ line: 19 ]]
	-- upvalues: getDeepValueModule (ref), enumsModule (ref)
	return getDeepValueModule(p0, `responseBody.components.{enumsModule.Components.UserProfileHeader}.viewerRelationship`)
end

local function getContextualInformationFromProfileResponse(p1) --[[ line: 23 ]]
	-- upvalues: getDeepValueModule (ref), enumsModule (ref)
	return getDeepValueModule(p1, `responseBody.components.{enumsModule.Components.UserProfileHeader}.contextualInformation`)
end

local function _(p2) --[[ line: 27 | named "getTrustedFriendStatusString" ]]
	return if p2 then p2.trustedFriendStatus or nil else nil
end

local _ = function(p3) --[[ line: 35 | named "mapFriendshipStatusToAnalyticsFriendStatus" ]]
	-- upvalues: t (ref)
	return t[p3]
end

return {
	getViewerRelationshipFromProfileResponse = getViewerRelationshipFromProfileResponse,
	getContextualInformationFromProfileResponse = getContextualInformationFromProfileResponse,
	mapViewerRelationshipAndContextToAnalyticsFriendStatus = function(p4, p5) --[[ line: 39 ]]
		-- upvalues: enumsModule (ref), friendStatusModule (ref), t (ref)
		local var7 = if p4 then p4.friendshipStatus else "Invalid"
		
		return if p5 and p5.context == enumsModule.ContextualTypes.AccountDeleted and var7 == "Friends" then friendStatusModule.Ineligible else t[var7]
	end,
	isViewerTrustedFriendsFromViewerRelationship = function(_) --[[ line: 53 ]]
-- FATAL: Failed to generate AST for `isViewerTrustedFriendsFromViewerRelationship` function:
runtime : [KeyError] :11990: 31
Traceback:
	runtime : [lunaux]:11990 function decompile_function
	runtime : [lunaux]:1933 function normalize_cfg
	runtime : [lunaux]:1320 function match_weird_patterns
	end
}