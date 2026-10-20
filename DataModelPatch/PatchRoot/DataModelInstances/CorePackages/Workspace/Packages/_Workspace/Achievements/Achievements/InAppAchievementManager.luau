local Achievements = script:FindFirstAncestor("Achievements")
local AvatarEditorService = game:GetService("AvatarEditorService")
local Parent = Achievements.Parent
local SignalModule = require(Parent.Signal)
local AchievementModule = require(Achievements.Achievement.Achievement)
local LoggerModule = require(Achievements.Logger)
local LoginStatus = require(Parent.RobloxAppEnums).LoginStatus
local HttpRequestModule = require(Parent.HttpRequest)
local GetXboxLoginConsecutiveDaysModule = require(Achievements.Requests.GetXboxLoginConsecutiveDays)
local VoteCountRefresherModule = require(Achievements.AchievementDataRefresher.VoteCountRefresher)
local FixOneNameManyFacesDisconnectCrash = game:DefineFastFlag("FixOneNameManyFacesDisconnectCrash", false)
local ConfigResult = HttpRequestModule.config({
	requestFunction = function(p1, p2, p3)
		-- upvalues: HttpRequestModule (copy)
		return HttpRequestModule.requestFunctions.HttpRbxApi(p1, p2, p3)
	end,
	maxRetryCount = if require(Parent.SharedFlags).FFlagLuaAppDefaultHttpRetry then game:DefineFastInt("InAppAchievementManagerHttpRetryCount", 4) else nil
})
local PlatformCloudStorageService = nil
pcall(function()
	-- upvalues: PlatformCloudStorageService (ref)
	PlatformCloudStorageService = game:GetService("PlatformCloudStorageService")
end)
local AchievementService = nil
pcall(function()
	-- upvalues: AchievementService (ref)
	AchievementService = game:GetService("AchievementService")
end)
local InAppAchievementManager = {
	startUp = function(p1)
		task.spawn(function()
			-- upvalues: p1 (copy)
			p1:initAchievements()
		end)
	end,
	initAchievements = function(p1)
		-- upvalues: SignalModule (copy), VoteCountRefresherModule (copy), AchievementModule (copy)
		local ReadableSignal, ReadableSignal2 = SignalModule.createReadableSignal(0)
		local ReadableSignal1, ReadableSignal2_1 = SignalModule.createReadableSignal(0)
		local ReadableSignal3, ReadableSignal2_2 = SignalModule.createReadableSignal(false)
		VoteCountRefresherModule:init(ReadableSignal2, p1.store, p1.requestImpl, p1.platformCloudStorageService)
		p1.achievementPollster = AchievementModule.newWithRefresher(AchievementModule.NAMES.ACHIEVEMENT_POLLSTER, ReadableSignal, VoteCountRefresherModule, p1.achievementService)
		p1.achievement3DayRoll = AchievementModule.new(AchievementModule.NAMES.ACHIEVEMENT_3_DAY_ROLL, ReadableSignal1, p1.achievementService)
		p1.achievement10DayRoll = AchievementModule.new(AchievementModule.NAMES.ACHIEVEMENT_10_DAY_ROLL, ReadableSignal1, p1.achievementService)
		p1.achievement20DayRoll = AchievementModule.new(AchievementModule.NAMES.ACHIEVEMENT_20_DAY_ROLL, ReadableSignal1, p1.achievementService)
		p1.achievementOneNameManyFaces = AchievementModule.new(AchievementModule.NAMES.ACHIEVEMENT_ONE_NAME_MANY_FACES, ReadableSignal3, p1.achievementService)
		p1:setupAchievements(ReadableSignal2_1, ReadableSignal2_2)
	end,
	setupAchievements = function(p1, Callback, Callback1)
		-- upvalues: GetXboxLoginConsecutiveDaysModule (copy), LoggerModule (copy), FixOneNameManyFacesDisconnectCrash (copy)
		if p1.achievement3DayRoll.hasAchieved == false or p1.achievement10DayRoll.hasAchieved == false or p1.achievement20DayRoll.hasAchieved == false then
			GetXboxLoginConsecutiveDaysModule(p1.requestImpl):andThen(function(Result)
				-- upvalues: LoggerModule (upval), Callback (copy)
				if Result.responseBody == nil then
					LoggerModule:warning("Response body is empty.")
					
					return
				end
				local Count = Result.responseBody.count
				
				if Count == nil then
					LoggerModule:warning("Day count is missing.")
					
					return
				else
					Callback(Count)
				end
			end):catch(function(Err)
				-- upvalues: LoggerModule (upval)
				LoggerModule:warning(Err)
			end)
		end
		if p1.achievementOneNameManyFaces.hasAchieved == false then
			p1.saveAvatarCompletedConnection = p1.avatarEditorService.PromptSaveAvatarCompleted:Connect(function(AvatarPromptResult)
				-- upvalues: Callback1 (copy), FixOneNameManyFacesDisconnectCrash (upval), p1 (copy)
				if AvatarPromptResult == Enum.AvatarPromptResult.Success then
					Callback1(true)
					
					if FixOneNameManyFacesDisconnectCrash then
						if p1.saveAvatarCompletedConnection and p1.saveAvatarCompletedConnection.Connected then
							p1.saveAvatarCompletedConnection:Disconnect()
						end
						p1.saveAvatarCompletedConnection = nil
						
						return
					else
						p1.saveAvatarCompletedConnection:Disconnect()
						p1.saveAvatarCompletedConnection = nil
					end
				end
			end)
		end
	end,
	shutDown = function(p1)
		-- upvalues: VoteCountRefresherModule (copy)
		p1.achievementPollster = nil
		p1.achievement3DayRoll = nil
		p1.achievement10DayRoll = nil
		p1.achievement20DayRoll = nil
		VoteCountRefresherModule:stop()
		
		if p1.saveAvatarCompletedConnection and p1.saveAvatarCompletedConnection.Connected then
			p1.saveAvatarCompletedConnection:Disconnect()
			p1.saveAvatarCompletedConnection = nil
		end
	end
}

function InAppAchievementManager.new(Store, p1, AchievementService1, p2, p3)
	-- upvalues: ConfigResult (copy), AvatarEditorService (copy), PlatformCloudStorageService (ref), AchievementService (ref), InAppAchievementManager (copy), LoginStatus (copy)
	local self = setmetatable({
		store = Store,
		requestImpl = if p1 then p1 else ConfigResult,
		avatarEditorService = if AchievementService1 then AchievementService1 else AvatarEditorService,
		platformCloudStorageService = p2 or PlatformCloudStorageService,
		achievementService = if p3 then p3 else AchievementService
	}, { __index = InAppAchievementManager })
	Store.changed:connect(function(Value, p4)
		-- upvalues: LoginStatus (upval), self (copy)
		local Status = if Value.AuthenticationStatus then Value.AuthenticationStatus.status else LoginStatus.UNKNOWN
		
		if Status ~= (if p4.AuthenticationStatus then p4.AuthenticationStatus.status else LoginStatus.UNKNOWN) then
			if Status == LoginStatus.LOGGED_IN then
				self:startUp()
				
				return
			end
			if Status == LoginStatus.LOGGED_OUT then
				self:shutDown()
			end
		end
	end)
	
	return self
end

return InAppAchievementManager