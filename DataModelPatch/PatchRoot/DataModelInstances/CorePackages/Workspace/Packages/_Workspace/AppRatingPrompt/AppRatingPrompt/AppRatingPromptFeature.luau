local AppStorageService = game:GetService("AppStorageService")
local HttpService = game:GetService("HttpService")
local RunService = game:GetService("RunService")
local DependenciesModule = require(script.Parent.dependencies)
local CallOnceFunction = DependenciesModule.AppCommonLib.callOnce
local Tutils = DependenciesModule.tutils
local Logger = DependenciesModule.Loggers.Logger
local Cryo = DependenciesModule.Cryo
local AppRatingPromptFeatureModule = {}
local SharedFlags = DependenciesModule.SharedFlags
local FFlagEnableAppRatingPromptLua = SharedFlags.FFlagEnableAppRatingPromptLua
local FFlagEnableAndroidAppRatingPromptLua = SharedFlags.FFlagEnableAndroidAppRatingPromptLua
game:DefineFastInt("RatingPromptMinNumFriends", 1)
game:DefineFastInt("RatingPromptMinDaysSinceFirstUse", 1)
game:DefineFastInt("RatingPromptMinNumLaunches", 10)
game:DefineFastInt("RatingPromptMinNumGamesPlayed", 1)
game:DefineFastInt("RatingPromptMinGameDurationSec", 600)
game:DefineFastInt("RatingPromptMinNumLaunchesSinceLastPrompt", 0)
game:DefineFastInt("RatingPromptMinNumDaysSinceLastPrompt", 1)
game:DefineFastFlag("RatingPromptCheckVersionRated", false)
AppRatingPromptFeatureModule.CurrentRatingPromptStats = {}

function AppRatingPromptFeatureModule.GetAppRatingPromptEnabled()
	-- upvalues: FFlagEnableAppRatingPromptLua (copy), FFlagEnableAndroidAppRatingPromptLua (copy)
	return if FFlagEnableAppRatingPromptLua then game:GetEngineFeature("AppRatingPromptEnabled") and game:GetService("AppRatingPromptService"):isAppRatingPromptAvailable() else FFlagEnableAndroidAppRatingPromptLua and (game:GetEngineFeature("AppRatingPromptEnabled") and game:GetService("AppRatingPromptService"):isAppRatingPromptAvailable())
end

function AppRatingPromptFeatureModule.GetAppRatingPromptService()
	-- upvalues: FFlagEnableAppRatingPromptLua (copy), FFlagEnableAndroidAppRatingPromptLua (copy)
	return (FFlagEnableAppRatingPromptLua or FFlagEnableAndroidAppRatingPromptLua) and (game:GetEngineFeature("AppRatingPromptEnabled") and game:GetService("AppRatingPromptService")) or nil
end

function AppRatingPromptFeatureModule.RatingPromptMinNumFriends()
	return game:GetFastInt("RatingPromptMinNumFriends")
end

function AppRatingPromptFeatureModule.RatingPromptMinDaysSinceFirstUse()
	return game:GetFastInt("RatingPromptMinDaysSinceFirstUse")
end

function AppRatingPromptFeatureModule.RatingPromptMinNumLaunches()
	return game:GetFastInt("RatingPromptMinNumLaunches")
end

function AppRatingPromptFeatureModule.RatingPromptMinNumGamesPlayed()
	return game:GetFastInt("RatingPromptMinNumGamesPlayed")
end

function AppRatingPromptFeatureModule.RatingPromptMinGameDurationSec()
	return game:GetFastInt("RatingPromptMinGameDurationSec")
end

function AppRatingPromptFeatureModule.RatingPromptMinNumLaunchesSinceLastPrompt()
	return game:GetFastInt("RatingPromptMinNumLaunchesSinceLastPrompt")
end

function AppRatingPromptFeatureModule.RatingPromptMinNumDaysSinceLastPrompt()
	return game:GetFastInt("RatingPromptMinNumDaysSinceLastPrompt")
end

function AppRatingPromptFeatureModule.RatingPromptCheckVersionRated()
	return game:GetFastFlag("RatingPromptCheckVersionRated")
end

AppRatingPromptFeatureModule.kAppRatingPromptStorageKey = "AppRatingPromptStats"
AppRatingPromptFeatureModule.kFirstUseDay = "firstUseDay"
AppRatingPromptFeatureModule.kNumLaunches = "numLaunches"
AppRatingPromptFeatureModule.kNumGamesPlayed = "numGamesPlayed"
AppRatingPromptFeatureModule.kLastTriggerTimestamp = "lastTriggerTimestamp"
AppRatingPromptFeatureModule.kLaunchesSinceLastPrompt = "launchesSinceLastPrompt"
AppRatingPromptFeatureModule.kSavedVersion = "savedVersion"
AppRatingPromptFeatureModule.kVersionAlreadyRated = "versionAlreadyRated"
AppRatingPromptFeatureModule.kPassedFriendsCheck = "passedFriendsCheck"
AppRatingPromptFeatureModule.defaultStatValues = {
	[AppRatingPromptFeatureModule.kFirstUseDay] = DateTime.now().UnixTimestamp,
	[AppRatingPromptFeatureModule.kNumLaunches] = 0,
	[AppRatingPromptFeatureModule.kNumGamesPlayed] = 0,
	[AppRatingPromptFeatureModule.kLastTriggerTimestamp] = -1,
	[AppRatingPromptFeatureModule.kLaunchesSinceLastPrompt] = 0,
	[AppRatingPromptFeatureModule.kSavedVersion] = "0",
	[AppRatingPromptFeatureModule.kVersionAlreadyRated] = false,
	[AppRatingPromptFeatureModule.kPassedFriendsCheck] = false
}

function AppRatingPromptFeatureModule.GetAppRatingPromptStats()
	-- upvalues: AppRatingPromptFeatureModule (copy), AppStorageService (copy), HttpService (copy), Logger (copy), Tutils (copy), Cryo (copy)
	if not game:GetEngineFeature("AppRatingPromptEnabled") then
		return {}
	end
	if next(AppRatingPromptFeatureModule.CurrentRatingPromptStats) == nil then
		local Item = AppStorageService:GetItem(AppRatingPromptFeatureModule.kAppRatingPromptStorageKey)
		local Success, Result = pcall(function()
			-- upvalues: HttpService (upval), Item (copy)
			return HttpService:JSONDecode(Item)
		end)
		local t = {}
		
		if Success and type(Result) == "table" then
			t = Result
		else
			Logger:warning("Error reading AppRatingPrompt stats, reinitializing to default values")
		end
		local FieldCountResult = Tutils.fieldCount(t)
		local JoinResult = Cryo.Dictionary.join(AppRatingPromptFeatureModule.defaultStatValues, t)
		
		for i, _ in pairs(AppRatingPromptFeatureModule.defaultStatValues) do
			if type(JoinResult[i]) ~= type(AppRatingPromptFeatureModule.defaultStatValues[i]) then
				JoinResult[i] = AppRatingPromptFeatureModule.defaultStatValues[i]
				Logger:warning(i .. " is of incorrect type, resetting to default value")
			end
		end
		AppRatingPromptFeatureModule.CurrentRatingPromptStats = JoinResult
		
		if Tutils.fieldCount(AppRatingPromptFeatureModule.CurrentRatingPromptStats) ~= FieldCountResult then
			AppStorageService:SetItem(AppRatingPromptFeatureModule.kAppRatingPromptStorageKey, (HttpService:JSONEncode(AppRatingPromptFeatureModule.CurrentRatingPromptStats)))
			AppStorageService:Flush()
		end
	end
	return AppRatingPromptFeatureModule.CurrentRatingPromptStats
end

function AppRatingPromptFeatureModule.SetAppRatingPromptStat(List)
	-- upvalues: AppRatingPromptFeatureModule (copy), Logger (copy), HttpService (copy), AppStorageService (copy)
	if next(List) == nil then return end
	if game:GetEngineFeature("AppRatingPromptEnabled") then
		local AppRatingPromptStats = AppRatingPromptFeatureModule.GetAppRatingPromptStats()
		local Flag = false
		
		for i, _ in pairs(List) do
			if AppRatingPromptStats[i] == nil then
				Logger:warning("SetAppRatingPromptStat: key not found in stats: " .. i)
			else
				AppRatingPromptStats[i] = List[i]
				Flag = true
			end
		end
		if Flag then
			AppRatingPromptFeatureModule.CurrentRatingPromptStats = AppRatingPromptStats
			AppStorageService:SetItem(AppRatingPromptFeatureModule.kAppRatingPromptStorageKey, (HttpService:JSONEncode(AppRatingPromptFeatureModule.CurrentRatingPromptStats)))
			AppStorageService:Flush()
		end
	end
end

function AppRatingPromptFeatureModule.IncrementValues(List)
	-- upvalues: AppRatingPromptFeatureModule (copy), Logger (copy), HttpService (copy), AppStorageService (copy)
	if next(List) == nil then return end
	if game:GetEngineFeature("AppRatingPromptEnabled") then
		local AppRatingPromptStats = AppRatingPromptFeatureModule.GetAppRatingPromptStats()
		local Flag = false
		
		for _, value in pairs(List) do
			if AppRatingPromptStats[value] == nil or type(AppRatingPromptStats[value]) ~= "number" then
				Logger:warning("IncrementValues: key not found in stats: " .. value)
			else
				AppRatingPromptStats[value] += 1
				Flag = true
			end
		end
		if Flag then
			AppRatingPromptFeatureModule.CurrentRatingPromptStats = AppRatingPromptStats
			AppStorageService:SetItem(AppRatingPromptFeatureModule.kAppRatingPromptStorageKey, (HttpService:JSONEncode(AppRatingPromptFeatureModule.CurrentRatingPromptStats)))
			AppStorageService:Flush()
		end
	end
end

function AppRatingPromptFeatureModule.PromptTriggered()
	-- upvalues: AppRatingPromptFeatureModule (copy)
	AppRatingPromptFeatureModule.SetAppRatingPromptStat({
		[AppRatingPromptFeatureModule.kLastTriggerTimestamp] = DateTime.now().UnixTimestamp,
		[AppRatingPromptFeatureModule.kLaunchesSinceLastPrompt] = 0,
		[AppRatingPromptFeatureModule.kVersionAlreadyRated] = true
	})
end

function AppRatingPromptFeatureModule.onLaunchHelper()
	-- upvalues: AppRatingPromptFeatureModule (copy), Cryo (copy), RunService (copy), HttpService (copy), AppStorageService (copy)
	if game:GetEngineFeature("AppRatingPromptEnabled") then
		local JoinResult = Cryo.Dictionary.join(AppRatingPromptFeatureModule.defaultStatValues, (AppRatingPromptFeatureModule.GetAppRatingPromptStats()))
		local RobloxVersion = RunService:GetRobloxVersion()
		
		if JoinResult[AppRatingPromptFeatureModule.kSavedVersion] ~= RobloxVersion then
			JoinResult[AppRatingPromptFeatureModule.kSavedVersion] = RobloxVersion
			JoinResult[AppRatingPromptFeatureModule.kVersionAlreadyRated] = false
			JoinResult[AppRatingPromptFeatureModule.kNumLaunches] = 0
			JoinResult[AppRatingPromptFeatureModule.kPassedFriendsCheck] = false
		end
		JoinResult[AppRatingPromptFeatureModule.kNumLaunches] += 1
		JoinResult[AppRatingPromptFeatureModule.kLaunchesSinceLastPrompt] += 1
		AppRatingPromptFeatureModule.CurrentRatingPromptStats = JoinResult
		AppStorageService:SetItem(AppRatingPromptFeatureModule.kAppRatingPromptStorageKey, (HttpService:JSONEncode(AppRatingPromptFeatureModule.CurrentRatingPromptStats)))
		AppStorageService:Flush()
	end
end

function AppRatingPromptFeatureModule.onLaunch()
	-- upvalues: CallOnceFunction (copy), AppRatingPromptFeatureModule (copy)
	CallOnceFunction("AppRatingPromptOnLaunch", function()
		-- upvalues: AppRatingPromptFeatureModule (upval)
		if AppRatingPromptFeatureModule.GetAppRatingPromptEnabled() then
			AppRatingPromptFeatureModule.onLaunchHelper()
		end
	end)
end

return AppRatingPromptFeatureModule