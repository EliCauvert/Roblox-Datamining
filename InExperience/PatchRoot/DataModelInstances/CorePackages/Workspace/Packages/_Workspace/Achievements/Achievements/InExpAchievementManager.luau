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
local var1 = httpRequestModule.config({
	requestFunction = function(p1, p2, p3)
		-- upvalues: httpRequestModule (ref)
		return httpRequestModule.requestFunctions.HttpRbxApi(p1, p2, p3)
	end,
	maxRetryCount = if require(parent.SharedFlags).FFlagLuaAppDefaultHttpRetry then game:DefineFastInt("InExpAchievementManagerHttpRetryCount", 4) else nil
})
local var2 = nil
pcall(function()
	-- upvalues: var2 (write)
	var2 = game:GetService("PlatformFriendsService")
end)
local var3 = nil
pcall(function()
	-- upvalues: var3 (write)
	var3 = game:GetService("PlatformCloudStorageService")
end)
local var4 = nil
pcall(function()
	-- upvalues: var4 (write)
	var4 = game:GetService("AchievementService")
end)
local playersService = game:GetService("Players")
local var5 = nil
pcall(function()
	-- upvalues: var5 (write)
	var5 = game:GetService("PlatformService")
end)
local t = {
	startUp = function(p1)
		-- upvalues: signalModule (ref), timeRefresherModule (ref), friendCountRefresherModule (ref), achievementModule (ref)
		local var6, var7 = signalModule.createReadableSignal(0)
		local var8, var9 = signalModule.createReadableSignal(0)
		local var10, var11 = signalModule.createReadableSignal(0)
		local var12, var13 = signalModule.createReadableSignal(0)
		timeRefresherModule:init(var7, 3600)
		friendCountRefresherModule:init(var13, p1.playersService)
		p1.achievementMarathon = achievementModule.newWithRefresher(achievementModule.NAMES.ACHIEVEMENT_MARATHON, var6, timeRefresherModule, p1.achievementService)
		p1.achievementFoursCompany = achievementModule.newWithRefresher(achievementModule.NAMES.ACHIEVEMENT_FOURS_COMPANY, var12, friendCountRefresherModule, p1.achievementService)
		p1.achievementScout = achievementModule.new(achievementModule.NAMES.ACHIEVEMENT_SCOUT, var8, p1.achievementService)
		p1.achievementExplorer = achievementModule.new(achievementModule.NAMES.ACHIEVEMENT_EXPLORER, var8, p1.achievementService)
		p1.achievementTrailblazer = achievementModule.new(achievementModule.NAMES.ACHIEVEMENT_TRAILBLAZER, var8, p1.achievementService)
		p1.achievementStrengthInNumbers = achievementModule.new(achievementModule.NAMES.ACHIEVEMENT_STRENGTH_IN_NUMBERS, var10, p1.achievementService)
		p1:_checkStrengthInNumbers(var11)
		p1:_checkJoinExperienceAchievements(var9)
	end,
	_checkJoinExperienceAchievements = function(p1, p2)
		-- upvalues: dashModule (ref), getUserRecentExperiencesModule (ref), loggerModule (ref)
		if p1.achievementScout.hasAchieved == false or p1.achievementExplorer.hasAchieved == false or p1.achievementTrailblazer.hasAchieved == false then
			if p1.platformCloudStorageService and p1.platformCloudStorageService:IsUserDataAvailable() then
				local data = p1.platformCloudStorageService:GetUserDataAsync("ExperiencesPlayed").data or {}
				
				if #data < 15 and not dashModule.includes(data, game.GameId) then
					table.insert(data, game.GameId)
					p1.platformCloudStorageService:SetUserDataAsync("ExperiencesPlayed", { data = data })
				end
				p2(#data)
				
				return
			else
				getUserRecentExperiencesModule(p1.requestImpl):andThen(function(p3)
					-- upvalues: p2 (ref)
					p2(p3)
				end):catch(function(p3)
					-- upvalues: loggerModule (copy)
					loggerModule:warning(p3)
				end)
			end
		end
	end,
	_checkStrengthInNumbers = function(p1, p2)
		if p1.achievementStrengthInNumbers.hasAchieved == false then
			local localPlayer = p1.playersService.LocalPlayer
			
			if localPlayer and localPlayer.FollowUserId ~= 0 and (localPlayer:IsFriendsWithAsync(localPlayer.FollowUserId) and p1.playersService:GetPlayerByUserId(localPlayer.FollowUserId)) then
				p2(0)
			end
		end
	end
}

function t.new(p1, p2, p3, p4, p5, p6)
	-- upvalues: var1 (ref), var2 (write), var3 (write), var4 (write), playersService (ref), var5 (write), t (ref)
	return setmetatable({
		requestImpl = p1 or var1,
		platformFriendsService = p2 or var2,
		platformCloudStorageService = p3 or var3,
		achievementService = p4 or var4,
		playersService = p5 or playersService,
		platformService = p6 or var5
	}, { __index = t })
end

return t