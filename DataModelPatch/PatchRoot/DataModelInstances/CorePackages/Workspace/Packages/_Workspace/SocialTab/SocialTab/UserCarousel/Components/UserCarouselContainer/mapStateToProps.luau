local SocialTab = script:FindFirstAncestor("SocialTab")
local DependenciesModule = require(SocialTab.dependencies)
local Llama = DependenciesModule.llama
local User = DependenciesModule.SocialLibraries.User
local UserModule = require(SocialTab.User)
local LoggerModule = require(SocialTab.Logger)
local GetFFlagDebugSocialTabCarouselEnabledModule = require(SocialTab.Flags.getFFlagDebugSocialTabCarouselEnabled)
local GetFIntDebugSocialTabCarouselFriendsNumberModule = require(SocialTab.Flags.getFIntDebugSocialTabCarouselFriendsNumber)

local function v8(p1, p2)
	-- upvalues: Llama (copy), UserModule (copy), User (copy), LoggerModule (copy)
	local LocalUserId = p1.SocialTab.Friends.byUserId.localUserId or {}
	local Success, Result = xpcall(function()
		-- upvalues: Llama (upval), LocalUserId (copy), UserModule (upval), p1 (copy), p2 (copy), User (upval)
		return Llama.List.sort(Llama.List.map(LocalUserId, UserModule.mapToUsers(p1, p2)), User.sortFriendsByCorrectedPresenceAndRank)
	end, debug.traceback)
	
	if not Success then
		LoggerModule:info((tostring(Result)))
	end
	assert(Success, (tostring(Result)))
	
	return Result
end

local function v9(p1)
	-- upvalues: GetFIntDebugSocialTabCarouselFriendsNumberModule (copy), Llama (copy)
	local FIntDebugSocialTabCarouselFriendsNumberModule = GetFIntDebugSocialTabCarouselFriendsNumberModule()
	
	if FIntDebugSocialTabCarouselFriendsNumberModule == 0 or not p1 then
		return {}
	end
	if #p1 >= FIntDebugSocialTabCarouselFriendsNumberModule then
		return Llama.List.slice(p1, 1, FIntDebugSocialTabCarouselFriendsNumberModule)
	end
	local JoinResult = {}
	while #JoinResult < FIntDebugSocialTabCarouselFriendsNumberModule do
		JoinResult = Llama.List.join(JoinResult, p1)
	end
	return Llama.List.slice(JoinResult, 1, FIntDebugSocialTabCarouselFriendsNumberModule)
end

return function(p2, p3)
	-- upvalues: GetFFlagDebugSocialTabCarouselEnabledModule (copy), v9 (copy), v8 (copy)
	return {
		screenSize = p2.ScreenSize,
		friends = if GetFFlagDebugSocialTabCarouselEnabledModule() then v9((v8(p2, p3))) else v8(p2, p3),
		hasFriendRequests = (p2.SocialTab.Friends.requests.receivedCount or 0) > 0
	}
end