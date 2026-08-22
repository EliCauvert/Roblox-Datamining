local achievements = script:FindFirstAncestor("Achievements")
local parent = achievements.Parent
local signalModule = require(parent.Signal)
local achievementModule = require(achievements.Achievement.Achievement)
local loggerModule = require(achievements.Logger)
local httpRequestModule = require(parent.HttpRequest)
local getUserRecentExperiencesModule = require(achievements.Requests.GetUserRecentExperiences)
local dashModule = require(parent.Dash)
local timeRefresherModule = require(achievements.AchievementDataRefresher.TimeRefresher)
local friendCountRefresherModule = require(achievements.AchievementDataRefresher.FriendCountRefresher)
local var9 = httpRequestModule.config({
	requestFunction = function(p0, p1, p2) --[[ line: 19 ]]
		-- upvalues: httpRequestModule (ref)
		return httpRequestModule.requestFunctions.HttpRbxApi(p0, p1, p2)
	end,
	maxRetryCount = if require(parent.SharedFlags).FFlagLuaAppDefaultHttpRetry then game:DefineFastInt("InExpAchievementManagerHttpRetryCount", 4) else nil
})
local var10 = nil
pcall(function() --[[ line: 29 ]]
	-- upvalues: var10 (write)
	var10 = game:GetService("PlatformFriendsService")
end)
local var11 = nil
pcall(function() --[[ line: 34 ]]
	-- upvalues: var11 (write)
	var11 = game:GetService("PlatformCloudStorageService")
end)
local var12 = nil
pcall(function() --[[ line: 39 ]]
	-- upvalues: var12 (write)
	var12 = game:GetService("AchievementService")
end)
local playersService = game:GetService("Players")
local var14 = nil
pcall(function() --[[ line: 47 ]]
	-- upvalues: var14 (write)
	var14 = game:GetService("PlatformService")
end)
local t = {
	startUp = function(p3) --[[ line: 56 ]]
		-- upvalues: signalModule (ref), timeRefresherModule (ref), friendCountRefresherModule (ref), achievementModule (ref)
		local var16, var17 = signalModule.createReadableSignal(0)
		local var18, var19 = signalModule.createReadableSignal(0)
		local var20, var21 = signalModule.createReadableSignal(0)
		local var22, var23 = signalModule.createReadableSignal(0)
		timeRefresherModule:init(var17, 3600)
		friendCountRefresherModule:init(var23, p3.playersService)
		p3.achievementMarathon = achievementModule.newWithRefresher(achievementModule.NAMES.ACHIEVEMENT_MARATHON, var16, timeRefresherModule, p3.achievementService)
		p3.achievementFoursCompany = achievementModule.newWithRefresher(achievementModule.NAMES.ACHIEVEMENT_FOURS_COMPANY, var22, friendCountRefresherModule, p3.achievementService)
		p3.achievementScout = achievementModule.new(achievementModule.NAMES.ACHIEVEMENT_SCOUT, var18, p3.achievementService)
		p3.achievementExplorer = achievementModule.new(achievementModule.NAMES.ACHIEVEMENT_EXPLORER, var18, p3.achievementService)
		p3.achievementTrailblazer = achievementModule.new(achievementModule.NAMES.ACHIEVEMENT_TRAILBLAZER, var18, p3.achievementService)
		p3.achievementStrengthInNumbers = achievementModule.new(achievementModule.NAMES.ACHIEVEMENT_STRENGTH_IN_NUMBERS, var20, p3.achievementService)
		p3:_checkStrengthInNumbers(var21)
		p3:_checkJoinExperienceAchievements(var19)
	end,
	_checkJoinExperienceAchievements = function(p4, p5) --[[ line: 98 ]]
		-- upvalues: dashModule (ref), getUserRecentExperiencesModule (ref), loggerModule (ref)
		if p4.achievementScout.hasAchieved == false or p4.achievementExplorer.hasAchieved == false or p4.achievementTrailblazer.hasAchieved == false then
			if p4.platformCloudStorageService and p4.platformCloudStorageService:IsUserDataAvailable() then
				local data = p4.platformCloudStorageService:GetUserDataAsync("ExperiencesPlayed").data or {}
				
				if #data < 15 and not dashModule.includes(data, game.GameId) then
					table.insert(data, game.GameId)
					p4.platformCloudStorageService:SetUserDataAsync("ExperiencesPlayed", { data = data })
				end
				p5(#data)
				
				return
			else
				getUserRecentExperiencesModule(p4.requestImpl):andThen(function(p7) --[[ line: 116 ]]
					-- upvalues: p5 (ref)
					p5(p7)
				end):catch(function(p6) --[[ line: 118 ]]
					-- upvalues: loggerModule (copy)
					loggerModule:warning(p6)
				end)
			end
		end
	end,
	_checkStrengthInNumbers = function(p8, p9) --[[ line: 125 ]]
		if p8.achievementStrengthInNumbers.hasAchieved == false then
			local localPlayer = p8.playersService.LocalPlayer
			
			if localPlayer and localPlayer.FollowUserId ~= 0 and (localPlayer:IsFriendsWithAsync(localPlayer.FollowUserId) and p8.playersService:GetPlayerByUserId(localPlayer.FollowUserId)) then
				p9(0)
			end
		end
	end
}

function t.new(p10, p11, p12, p13, p14, p15) --[[ line: 140 ]]
	-- upvalues: var9 (ref), var10 (write), var11 (write), var12 (write), playersService (ref), var14 (write), t (ref)
	return setmetatable({
		requestImpl = p10 or var9,
		platformFriendsService = p11 or var10,
		platformCloudStorageService = p12 or var11,
		achievementService = p13 or var12,
		playersService = p14 or playersService,
		platformService = p15 or var14
	}, { __index = t })
end

return t