local Achievements = script:FindFirstAncestor("Achievements")
local Parent = Achievements.Parent
local SignalModule = require(Parent.Signal)
local AchievementModule = require(Achievements.Achievement.Achievement)
local LoggerModule = require(Achievements.Logger)
local HttpRequestModule = require(Parent.HttpRequest)
local GetUserRecentExperiencesModule = require(Achievements.Requests.GetUserRecentExperiences)
local DashModule = require(Parent.Dash)
local TimeRefresherModule = require(Achievements.AchievementDataRefresher.TimeRefresher)
local FriendCountRefresherModule = require(Achievements.AchievementDataRefresher.FriendCountRefresher)
local ConfigResult = HttpRequestModule.config({
	requestFunction = function(p1, p2, p3) --[[ Line: 19 ]]
		-- upvalues: HttpRequestModule (copy)
		return HttpRequestModule.requestFunctions.HttpRbxApi(p1, p2, p3)
	end,
	maxRetryCount = if require(Parent.SharedFlags).FFlagLuaAppDefaultHttpRetry then game:DefineFastInt("InExpAchievementManagerHttpRetryCount", 4) else nil
})
local PlatformFriendsService = nil
pcall(function() --[[ Line: 29 ]]
	-- upvalues: PlatformFriendsService (ref)
	PlatformFriendsService = game:GetService("PlatformFriendsService")
end)
local PlatformCloudStorageService = nil
pcall(function() --[[ Line: 34 ]]
	-- upvalues: PlatformCloudStorageService (ref)
	PlatformCloudStorageService = game:GetService("PlatformCloudStorageService")
end)
local AchievementService = nil
pcall(function() --[[ Line: 39 ]]
	-- upvalues: AchievementService (ref)
	AchievementService = game:GetService("AchievementService")
end)
local Players = game:GetService("Players")
local PlatformService = nil
pcall(function() --[[ Line: 47 ]]
	-- upvalues: PlatformService (ref)
	PlatformService = game:GetService("PlatformService")
end)
local InExpAchievementManager = {
	startUp = function(p1) --[[ Line: 56 ]]
		-- upvalues: SignalModule (copy), TimeRefresherModule (copy), FriendCountRefresherModule (copy), AchievementModule (copy)
		local ReadableSignal, ReadableSignal2 = SignalModule.createReadableSignal(0)
		local ReadableSignal1, ReadableSignal2_1 = SignalModule.createReadableSignal(0)
		local ReadableSignal3, ReadableSignal2_2 = SignalModule.createReadableSignal(0)
		local ReadableSignal4, ReadableSignal2_3 = SignalModule.createReadableSignal(0)
		TimeRefresherModule:init(ReadableSignal2, 3600)
		FriendCountRefresherModule:init(ReadableSignal2_3, p1.playersService)
		p1.achievementMarathon = AchievementModule.newWithRefresher(AchievementModule.NAMES.ACHIEVEMENT_MARATHON, ReadableSignal, TimeRefresherModule, p1.achievementService)
		p1.achievementFoursCompany = AchievementModule.newWithRefresher(AchievementModule.NAMES.ACHIEVEMENT_FOURS_COMPANY, ReadableSignal4, FriendCountRefresherModule, p1.achievementService)
		p1.achievementScout = AchievementModule.new(AchievementModule.NAMES.ACHIEVEMENT_SCOUT, ReadableSignal1, p1.achievementService)
		p1.achievementExplorer = AchievementModule.new(AchievementModule.NAMES.ACHIEVEMENT_EXPLORER, ReadableSignal1, p1.achievementService)
		p1.achievementTrailblazer = AchievementModule.new(AchievementModule.NAMES.ACHIEVEMENT_TRAILBLAZER, ReadableSignal1, p1.achievementService)
		p1.achievementStrengthInNumbers = AchievementModule.new(AchievementModule.NAMES.ACHIEVEMENT_STRENGTH_IN_NUMBERS, ReadableSignal3, p1.achievementService)
		p1:_checkStrengthInNumbers(ReadableSignal2_2)
		p1:_checkJoinExperienceAchievements(ReadableSignal2_1)
	end,
	_checkJoinExperienceAchievements = function(p1, Callback: (any) -> ()) --[[ Line: 98 ]]
		-- upvalues: DashModule (copy), GetUserRecentExperiencesModule (copy), LoggerModule (copy)
		if p1.achievementScout.hasAchieved == false or p1.achievementExplorer.hasAchieved == false or p1.achievementTrailblazer.hasAchieved == false then
			if p1.platformCloudStorageService and p1.platformCloudStorageService:IsUserDataAvailable() then
				local Data = p1.platformCloudStorageService:GetUserDataAsync("ExperiencesPlayed").data or {}
				
				if #Data < 15 and not DashModule.includes(Data, game.GameId) then
					table.insert(Data, game.GameId)
					p1.platformCloudStorageService:SetUserDataAsync("ExperiencesPlayed", { data = Data })
				end
				Callback(#Data)
				
				return
			else
				GetUserRecentExperiencesModule(p1.requestImpl):andThen(function(Result) --[[ Line: 116 ]]
					-- upvalues: Callback (copy)
					Callback(Result)
				end):catch(function(Err) --[[ Line: 118 ]]
					-- upvalues: LoggerModule (upval)
					LoggerModule:warning(Err)
				end)
			end
		end
	end,
	_checkStrengthInNumbers = function(p1, Callback: (any) -> ()) --[[ Line: 125 ]]
		if p1.achievementStrengthInNumbers.hasAchieved == false then
			local LocalPlayer = p1.playersService.LocalPlayer
			
			if LocalPlayer and LocalPlayer.FollowUserId ~= 0 and LocalPlayer:IsFriendsWithAsync(LocalPlayer.FollowUserId) and p1.playersService:GetPlayerByUserId(LocalPlayer.FollowUserId) then
				Callback(0)
			end
		end
	end
}

function InExpAchievementManager.new(ACHIEVEMENTEXPLORER, p1, AchievementService1, p2, p3, p4) --[[ Line: 140 ]]
	-- upvalues: ConfigResult (copy), PlatformFriendsService (ref), PlatformCloudStorageService (ref), AchievementService (ref), Players (copy), PlatformService (ref), InExpAchievementManager (copy)
	return (setmetatable({
		requestImpl = if ACHIEVEMENTEXPLORER then ACHIEVEMENTEXPLORER else ConfigResult,
		platformFriendsService = p1 or PlatformFriendsService,
		platformCloudStorageService = AchievementService1 or PlatformCloudStorageService,
		achievementService = if p2 then p2 else AchievementService,
		playersService = if p3 then p3 else Players,
		platformService = if p4 then p4 else PlatformService
	}, { __index = InExpAchievementManager }))
end

return InExpAchievementManager