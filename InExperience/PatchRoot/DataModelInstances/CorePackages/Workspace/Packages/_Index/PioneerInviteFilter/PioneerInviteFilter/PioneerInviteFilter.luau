local PioneerInviteFilter = script:FindFirstAncestor("PioneerInviteFilter")
local Parent = PioneerInviteFilter.Parent
local HttpRequestModule = require(Parent.HttpRequest)
local FFlagPioneerHideOtherGameInvites = require(Parent.SharedFlags).FFlagPioneerHideOtherGameInvites
local PioneerUtilsModule = if FFlagPioneerHideOtherGameInvites then require(Parent.PioneerUtils) else nil
local PostResolveShareLinkModule = require(PioneerInviteFilter.Requests.PostResolveShareLink)
local IsPioneerLaunch = if FFlagPioneerHideOtherGameInvites then PioneerUtilsModule.isPioneerLaunch() else false

local function isForCurrentGame(ExperienceInviteData, p1): boolean
	-- upvalues: PioneerUtilsModule (copy)
	local UniverseId = if p1 then p1.universeId else game.GameId
	local PlaceId = if p1 then p1.placeId else game.PlaceId
	local Number: number? = tonumber(ExperienceInviteData.universeId)
	
	if Number == nil or Number <= 0 or UniverseId <= 0 then
		local Number1: number? = tonumber(ExperienceInviteData.placeId)
		
		return Number1 ~= nil and Number1 > 0 and (Number1 == PlaceId or Number1 == PioneerUtilsModule.PioneerInfo.getPioneerRootPlaceId())
	else
		return Number == UniverseId
	end
end

return {
	isActive = function()
		-- upvalues: IsPioneerLaunch (copy)
		return IsPioneerLaunch
	end,
	isForCurrentGame = isForCurrentGame,
	isShareLinkForCurrentGame = function(Text: string, p1)
		-- upvalues: HttpRequestModule (copy), PostResolveShareLinkModule (copy), isForCurrentGame (copy)
		local Match: string? = string.match(Text, "[?&]code=([^&#]+)")
		local Match1: string? = string.match(Text, "[?&]type=([^&#]+)")
		
		if not Match or not Match1 then
			return false
		end
		local Success, Result, Result3 = pcall(function()
			-- upvalues: p1 (copy), HttpRequestModule (upval), PostResolveShareLinkModule (upval), Match (copy), Match1 (copy)
			return PostResolveShareLinkModule(p1 or HttpRequestModule.config({
				maxRetryCount = 0,
				requestFunction = HttpRequestModule.requestFunctions.HttpRbxApi
			}), Match, Match1):await()
		end)
		
		if Success and Result and Result3 and Result3.responseBody then
			local ExperienceInviteData = Result3.responseBody.experienceInviteData or Result3.responseBody.notificationExperienceInviteData
			
			return ExperienceInviteData ~= nil and isForCurrentGame(ExperienceInviteData)
		else
			return false
		end
	end
}