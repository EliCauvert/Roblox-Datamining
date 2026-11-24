local UserList = script:FindFirstAncestor("UserList")
local Parent = UserList.Parent
local ReactModule = require(Parent.React)
local LocalizationModule = require(Parent.Localization)
local SocialCommonModule = require(Parent.SocialCommon)
local EnumsModule = require(UserList.Common.Enums)
local _ = require(UserList.Common.Types)
local TextKeysModule = require(UserList.Common.TextKeys)
local EscapeRichTextModule = require(UserList.Common.escapeRichText)
local UseLocalizationFunction = LocalizationModule.Hooks.useLocalization
local GetMutualFriendsTextFunction = SocialCommonModule.Utils.getMutualFriendsText
local ContextInfoTypes = EnumsModule.ContextInfoTypes

local function _(p1): boolean
	return p1 == nil or p1 == ""
end

local config = {
	[ContextInfoTypes.MutualFriends] = function(p1)
		-- upvalues: TextKeysModule (copy)
		return {
			TextKeysModule.MutualFriends,
			numConnections = p1.mutualFriendsCount or 0
		}
	end,
	[ContextInfoTypes.HaveContact] = function(p1)
		-- upvalues: TextKeysModule (copy), EscapeRichTextModule (copy)
		local ContactName = p1.contactName
		local NoContactName: boolean = ContactName == nil or ContactName == ""
		
		return if NoContactName then nil else {
			TextKeysModule.FromContactName,
			contactName = EscapeRichTextModule(p1.contactName)
		}
	end,
	[ContextInfoTypes.FromCI] = function()
		-- upvalues: TextKeysModule (copy)
		return TextKeysModule.FoundFromContactImporter
	end,
	[ContextInfoTypes.FromQR] = function()
		-- upvalues: TextKeysModule (copy)
		return TextKeysModule.FoundThroughQRCode
	end,
	[ContextInfoTypes.FromExperience] = function(p1)
		-- upvalues: TextKeysModule (copy), EscapeRichTextModule (copy)
		local SentFromExperienceName = p1.sentFromExperienceName
		local NoSentFromExperienceName: boolean = SentFromExperienceName == nil or SentFromExperienceName == ""
		
		return if NoSentFromExperienceName then nil else {
			TextKeysModule.SentFromExperience,
			gameName = EscapeRichTextModule(p1.sentFromExperienceName)
		}
	end,
	[ContextInfoTypes.OffNetworkFriendRequest] = function()
		-- upvalues: TextKeysModule (copy)
		return TextKeysModule.ConnectionRequest
	end,
	[ContextInfoTypes.NewFriend] = function()
		-- upvalues: TextKeysModule (copy)
		return TextKeysModule.NewFriend
	end,
	[ContextInfoTypes.SchoolMemberList] = function()
		-- upvalues: TextKeysModule (copy)
		return TextKeysModule.Classmates
	end,
	[ContextInfoTypes.FollowingUser] = function()
		-- upvalues: TextKeysModule (copy)
		return TextKeysModule.YouAreFollowing
	end,
	[ContextInfoTypes.FollowingMe] = function()
		-- upvalues: TextKeysModule (copy)
		return TextKeysModule.FollowsYou
	end
}

return function(p1)
	-- upvalues: config (copy), ContextInfoTypes (copy), UseLocalizationFunction (copy), TextKeysModule (copy), GetMutualFriendsTextFunction (copy), ReactModule (copy)
	local Type = if p1 then p1.type else nil
	local Entry = if Type then config[Type] else nil
	local IsTypeMatch = Type == ContextInfoTypes.MutualFriends
	local MutualFriendsCount = p1 and p1.mutualFriendsCount or 0
	local UseLocalizationResult = UseLocalizationFunction({
		text = if p1 and Entry then Entry(p1) else nil,
		singularMutualFriend = if IsTypeMatch then TextKeysModule.MutualFriend else nil
	})
	local MutualFriendsText = if IsTypeMatch then GetMutualFriendsTextFunction({
		mutualFriendsCount = MutualFriendsCount,
		localized = {
			mutualConnections = UseLocalizationResult.text,
			singularMutualConnection = UseLocalizationResult.singularMutualFriend
		}
	}) else UseLocalizationResult.text
	
	return ReactModule.useMemo(function()
		-- upvalues: MutualFriendsText (copy)
		return if MutualFriendsText == nil or MutualFriendsText == "" then nil else { text = MutualFriendsText }
	end, { MutualFriendsText })
end