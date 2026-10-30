local Achievements = script:FindFirstAncestor("Achievements")
local AvatarEditorService = game:GetService("AvatarEditorService")
local Parent = Achievements.Parent
local SignalModule = require(Parent.Signal)
local SignalsModule = require(Parent.Signals)
local AchievementModule = require(Achievements.Achievement.Achievement)
local LoggerModule = require(Achievements.Logger)
local LoginStatus = require(Parent.RobloxAppEnums).LoginStatus
local HttpRequestModule = require(Parent.HttpRequest)
local FFlagUseSignalsForAuthenticationStatus = require(Parent.SharedFlags).FFlagUseSignalsForAuthenticationStatus
local GetAuthenticationStatusStore = if FFlagUseSignalsForAuthenticationStatus then require(Parent.AuthenticationStatus).GetAuthenticationStatusStore else nil
local GetXboxLoginConsecutiveDaysModule = require(Achievements.Requests.GetXboxLoginConsecutiveDays)
local VoteCountRefresherModule = require(Achievements.AchievementDataRefresher.VoteCountRefresher)
local FFlagGateLoginStreaksByAchievementAvailabilityModule = require(Achievements.Flags.FFlagGateLoginStreaksByAchievementAvailability)
local AchievementServiceIsAchievementAvailableEngineFeature = game:GetEngineFeature("AchievementServiceIsAchievementAvailable")
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
	hasPendingLoginStreakAchievement = function(p1): boolean
		for _, value in {
			p1.achievement3DayRoll,
			p1.achievement10DayRoll,
			p1.achievement20DayRoll
		} do
			if value.hasAchieved == false and p1.achievementService:IsAchievementAvailable(value.achievementName) then
				return true
			end
		end
		return false
	end,
	setupAchievements = function(p2, Callback, Callback1)
		-- upvalues: FFlagGateLoginStreaksByAchievementAvailabilityModule (copy), AchievementServiceIsAchievementAvailableEngineFeature (copy), GetXboxLoginConsecutiveDaysModule (copy), LoggerModule (copy)
		if if FFlagGateLoginStreaksByAchievementAvailabilityModule and AchievementServiceIsAchievementAvailableEngineFeature then p2:hasPendingLoginStreakAchievement() else p2.achievement3DayRoll.hasAchieved == false or (p2.achievement10DayRoll.hasAchieved == false or p2.achievement20DayRoll.hasAchieved == false) then
			GetXboxLoginConsecutiveDaysModule(p2.requestImpl):andThen(function(Result)
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
		if p2.achievementOneNameManyFaces.hasAchieved == false then
			p2.saveAvatarCompletedConnection = p2.avatarEditorService.PromptSaveAvatarCompleted:Connect(function(AvatarPromptResult)
				-- upvalues: Callback1 (copy), p2 (copy)
				if AvatarPromptResult == Enum.AvatarPromptResult.Success then
					Callback1(true)
					p2.saveAvatarCompletedConnection:Disconnect()
					p2.saveAvatarCompletedConnection = nil
				end
			end)
		end
	end,
	shutDown = function(p2)
		-- upvalues: VoteCountRefresherModule (copy)
		p2.achievementPollster = nil
		p2.achievement3DayRoll = nil
		p2.achievement10DayRoll = nil
		p2.achievement20DayRoll = nil
		VoteCountRefresherModule:stop()
		
		if p2.saveAvatarCompletedConnection and p2.saveAvatarCompletedConnection.Connected then
			p2.saveAvatarCompletedConnection:Disconnect()
			p2.saveAvatarCompletedConnection = nil
		end
	end
}

function InAppAchievementManager.new(Store, p2, AchievementService1, p3, p4)
	-- upvalues: ConfigResult (copy), AvatarEditorService (copy), PlatformCloudStorageService (ref), AchievementService (ref), InAppAchievementManager (copy), FFlagUseSignalsForAuthenticationStatus (copy), SignalsModule (copy), GetAuthenticationStatusStore (copy), LoginStatus (copy)
	local self = setmetatable({
		store = Store,
		requestImpl = if p2 then p2 else ConfigResult,
		avatarEditorService = if AchievementService1 then AchievementService1 else AvatarEditorService,
		platformCloudStorageService = p3 or PlatformCloudStorageService,
		achievementService = if p4 then p4 else AchievementService
	}, { __index = InAppAchievementManager })
	
	if FFlagUseSignalsForAuthenticationStatus then
		self._authStatusInitialized = false
		self._lastAuthStatus = nil
		self._disposeAuthStatus = SignalsModule.createEffect(function(p5)
			-- upvalues: GetAuthenticationStatusStore (upval), self (copy), LoginStatus (upval)
			local Status = GetAuthenticationStatusStore(false).getStatus(p5)
			
			if not self._authStatusInitialized then
				self._authStatusInitialized = true
				self._lastAuthStatus = Status
				
				return
			end
			if Status ~= self._lastAuthStatus then
				self._lastAuthStatus = Status
				
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
	else
		Store.changed:connect(function(Value, p5)
			-- upvalues: LoginStatus (upval), self (copy)
			local Status = if Value.AuthenticationStatus then Value.AuthenticationStatus.status else LoginStatus.UNKNOWN
			
			if Status ~= (if p5.AuthenticationStatus then p5.AuthenticationStatus.status else LoginStatus.UNKNOWN) then
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
end

return InAppAchievementManager