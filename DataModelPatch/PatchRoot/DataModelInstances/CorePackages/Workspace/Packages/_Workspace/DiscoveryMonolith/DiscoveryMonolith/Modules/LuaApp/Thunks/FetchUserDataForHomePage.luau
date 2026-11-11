local DiscoveryMonolith = script:FindFirstAncestor("DiscoveryMonolith")
local Parent = DiscoveryMonolith.Parent
local AvatarThumbnailRequests = require(Parent.UserLib).Utils.AvatarThumbnailRequests
local PreloadUsersThumbnailFunction = require(Parent.UserLib).Thunks.PreloadUsersThumbnail
local FetchFriendsCarouselFunction = require(Parent.FriendsCarousel).FetchFriendsCarousel
local Modules = DiscoveryMonolith.Modules
local FetchAdditionalFriendsInfoModule = require(Modules.LuaApp.Thunks.FetchAdditionalFriendsInfo)
local LegacyUpdateUsersModule = require(Modules.LuaApp.Thunks.LegacyUpdateUsers)
local RemoveFetchFriendsCarouselAtStartup = game:DefineFastFlag("RemoveFetchFriendsCarouselAtStartup", false)
local NewResult = require(Parent.Loggers).Logger:new(script.Name)

local function fetchUserDataForHomePage(p1, p2, p3)
	-- upvalues: RemoveFetchFriendsCarouselAtStartup (copy), FetchFriendsCarouselFunction (copy), LegacyUpdateUsersModule (copy), FetchAdditionalFriendsInfoModule (copy), NewResult (copy), PreloadUsersThumbnailFunction (copy), AvatarThumbnailRequests (copy)
	if not RemoveFetchFriendsCarouselAtStartup then
		p3:dispatch(FetchFriendsCarouselFunction()):andThen(function(Result)
			-- upvalues: p3 (copy), LegacyUpdateUsersModule (upval), FetchAdditionalFriendsInfoModule (upval), p1 (copy)
			p3:dispatch(LegacyUpdateUsersModule(Result))
			p3:dispatch(FetchAdditionalFriendsInfoModule(p1, Result))
			
			return Result
		end):catch(function(Err)
			-- upvalues: NewResult (upval)
			NewResult:error(`Error fetching friends sort: {Err}`)
		end)
	end
	p3:dispatch(PreloadUsersThumbnailFunction({ p2 }, AvatarThumbnailRequests.HOME_HEADER_USER))
	p3:dispatch(PreloadUsersThumbnailFunction({ p2 }, AvatarThumbnailRequests.CUSTOMIZE_BUTTON))
end

return function(p1, p2)
	-- upvalues: fetchUserDataForHomePage (copy)
	return function(p3)
		-- upvalues: fetchUserDataForHomePage (upval), p1 (copy), p2 (copy)
		return fetchUserDataForHomePage(p1, p2, p3)
	end
end