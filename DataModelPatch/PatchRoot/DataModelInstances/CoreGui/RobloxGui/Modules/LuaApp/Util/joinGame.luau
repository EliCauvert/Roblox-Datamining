local CorePackages = game:GetService("CorePackages")
local _ = require(CorePackages.Workspace.Packages.ExperienceService)
local GameParams = require(CorePackages.Workspace.Packages.ExperienceService).GameParams
local ExperienceService = require(CorePackages.Workspace.Packages.ExperienceService).ExperienceService

local function _(p1, p2, p3)
	-- upvalues: ExperienceService (copy)
	ExperienceService:LaunchExperience(p1, p2, p3)
end

return {
	ByUser = function(_, p1, p2, p3)
		-- upvalues: GameParams (copy), ExperienceService (copy)
		local FromUserIdResult = GameParams.fromUserId(p1.id)
		assert(FromUserIdResult.userId ~= nil, "Joining a game by user should always be done by user id")
		ExperienceService:LaunchExperience(FromUserIdResult, p2, p3)
	end,
	ByUserAndPlaceId = function(_, p1, p2, p3, p4)
		-- upvalues: GameParams (copy), ExperienceService (copy)
		local FromUserIdResult = GameParams.fromUserId(p1.id, p2)
		assert(FromUserIdResult.userId ~= nil, "Joining a game by user and placeId should always contain a user id param")
		assert(FromUserIdResult.placeId ~= nil, "Joining a game by user and placeId should always contain a place id param")
		ExperienceService:LaunchExperience(FromUserIdResult, p3, p4)
	end,
	ByGame = function(_, p1, p2, p3)
		-- upvalues: GameParams (copy), ExperienceService (copy)
		ExperienceService:LaunchExperience(GameParams.fromPlaceId(p1), p2, p3)
	end
}