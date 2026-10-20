local SocialTabState = script:FindFirstAncestor("SocialTabState")
local DependenciesModule = require(SocialTabState.dependencies)
local NetworkingChat = DependenciesModule.NetworkingChat
local GetUsersFromConversationsModule = require(SocialTabState.utils.getUsersFromConversations)
local GetFFlagSocialTabReplaceRefreshConversationsFunction = require(SocialTabState.Parent.SharedFlags).getFFlagSocialTabReplaceRefreshConversations
local Llama = DependenciesModule.llama
local RoduxUsers = DependenciesModule.RoduxUsers

local function userUpdatedFromUser(User)
	-- upvalues: RoduxUsers (copy)
	return RoduxUsers.Actions.UserUpdated({
		id = User.id,
		username = User.name,
		displayName = User.displayName,
		friendRank = User.friendRank,
		hasVerifiedBadge = User.hasVerifiedBadge
	})
end

local config = {
	AddUser = function(p1)
		-- upvalues: userUpdatedFromUser (copy)
		return { userUpdatedFromUser(p1.user) }
	end,
	AddUsers = function(p1)
		-- upvalues: Llama (copy), userUpdatedFromUser (copy)
		return Llama.Dictionary.values(Llama.Dictionary.map(p1.users, userUpdatedFromUser))
	end,
	[GetFFlagSocialTabReplaceRefreshConversationsFunction() and NetworkingChat.GetUserConversations.Succeeded.name or ""] = GetFFlagSocialTabReplaceRefreshConversationsFunction() and GetUsersFromConversationsModule or nil
}
local InstallReducerResult = RoduxUsers.installReducer()

return function(p1, p2)
	-- upvalues: config (copy), GetFFlagSocialTabReplaceRefreshConversationsFunction (copy), Llama (copy), InstallReducerResult (copy)
	local P3 = p1 or { byUserId = {} }
	local list = { p2 }
	local Entry = config[p2.type]
	
	if Entry then
		list = if GetFFlagSocialTabReplaceRefreshConversationsFunction() then Entry(p2, P3) else Entry(p2)
	end
	return Llama.List.reduce(list, InstallReducerResult, P3)
end