local achievements = script:FindFirstAncestor("Achievements")
local avatarEditorService = game:GetService("AvatarEditorService")
local parent = achievements.Parent
local signalModule = require(parent.Signal)
local signalsModule = require(parent.Signals)
local achievementModule = require(achievements.Achievement.Achievement)
local loggerModule = require(achievements.Logger)
local loginStatus = require(parent.RobloxAppEnums).LoginStatus
local httpRequestModule = require(parent.HttpRequest)
local fFlagUseSignalsForAuthenticationStatus = require(parent.SharedFlags).FFlagUseSignalsForAuthenticationStatus
local var1 = if fFlagUseSignalsForAuthenticationStatus then require(parent.AuthenticationStatus).GetAuthenticationStatusStore else nil
local getXboxLoginConsecutiveDaysModule = require(achievements.Requests.GetXboxLoginConsecutiveDays)
local voteCountRefresherModule = require(achievements.AchievementDataRefresher.VoteCountRefresher)
local fixOneNameManyFacesDisconnectCrash = game:DefineFastFlag("FixOneNameManyFacesDisconnectCrash", false)
local var2 = httpRequestModule.config({
	requestFunction = function(p1, p2, p3)
		-- upvalues: httpRequestModule (ref)
		return httpRequestModule.requestFunctions.HttpRbxApi(p1, p2, p3)
	end,
	maxRetryCount = if require(parent.SharedFlags).FFlagLuaAppDefaultHttpRetry then game:DefineFastInt("InAppAchievementManagerHttpRetryCount", 4) else nil
})
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
local t = {
	startUp = function(p1)
		task.spawn(function()
			-- upvalues: p1 (ref)
			p1:initAchievements()
		end)
	end,
	initAchievements = function(p1)
		-- upvalues: signalModule (ref), voteCountRefresherModule (ref), achievementModule (ref)
		local var5, var6 = signalModule.createReadableSignal(0)
		local var7, var8 = signalModule.createReadableSignal(0)
		local var9, var10 = signalModule.createReadableSignal(false)
		voteCountRefresherModule:init(var6, p1.store, p1.requestImpl, p1.platformCloudStorageService)
		p1.achievementPollster = achievementModule.newWithRefresher(achievementModule.NAMES.ACHIEVEMENT_POLLSTER, var5, voteCountRefresherModule, p1.achievementService)
		p1.achievement3DayRoll = achievementModule.new(achievementModule.NAMES.ACHIEVEMENT_3_DAY_ROLL, var7, p1.achievementService)
		p1.achievement10DayRoll = achievementModule.new(achievementModule.NAMES.ACHIEVEMENT_10_DAY_ROLL, var7, p1.achievementService)
		p1.achievement20DayRoll = achievementModule.new(achievementModule.NAMES.ACHIEVEMENT_20_DAY_ROLL, var7, p1.achievementService)
		p1.achievementOneNameManyFaces = achievementModule.new(achievementModule.NAMES.ACHIEVEMENT_ONE_NAME_MANY_FACES, var9, p1.achievementService)
		p1:setupAchievements(var8, var10)
	end,
	setupAchievements = function(value, p1, p2)
		-- upvalues: getXboxLoginConsecutiveDaysModule (ref), loggerModule (ref), fixOneNameManyFacesDisconnectCrash (ref)
		if value.achievement3DayRoll.hasAchieved == false or value.achievement10DayRoll.hasAchieved == false or value.achievement20DayRoll.hasAchieved == false then
			getXboxLoginConsecutiveDaysModule(value.requestImpl):andThen(function(p3)
				-- upvalues: loggerModule (copy), p1 (ref)
				if p3.responseBody == nil then
					loggerModule:warning("Response body is empty.")
					
					return
				end
				local count = p3.responseBody.count
				
				if count == nil then
					loggerModule:warning("Day count is missing.")
					
					return
				end
				p1(count)
			end):catch(function(p3)
				-- upvalues: loggerModule (copy)
				loggerModule:warning(p3)
			end)
		end
		if value.achievementOneNameManyFaces.hasAchieved == false then
			value.saveAvatarCompletedConnection = value.avatarEditorService.PromptSaveAvatarCompleted:Connect(function(p3)
				-- upvalues: p2 (ref), fixOneNameManyFacesDisconnectCrash (copy), value (ref)
				if p3 == Enum.AvatarPromptResult.Success then
					p2(true)
					
					if fixOneNameManyFacesDisconnectCrash then
						if value.saveAvatarCompletedConnection and value.saveAvatarCompletedConnection.Connected then
							value.saveAvatarCompletedConnection:Disconnect()
						end
						value.saveAvatarCompletedConnection = nil
						
						return
					else
						value.saveAvatarCompletedConnection:Disconnect()
						value.saveAvatarCompletedConnection = nil
					end
				end
			end)
		end
	end,
	shutDown = function(p1)
		-- upvalues: voteCountRefresherModule (ref)
		p1.achievementPollster = nil
		p1.achievement3DayRoll = nil
		p1.achievement10DayRoll = nil
		p1.achievement20DayRoll = nil
		voteCountRefresherModule:stop()
		
		if p1.saveAvatarCompletedConnection and p1.saveAvatarCompletedConnection.Connected then
			p1.saveAvatarCompletedConnection:Disconnect()
			p1.saveAvatarCompletedConnection = nil
		end
	end
}

function t.new(p1, p2, p3, p4, p5)
	-- upvalues: var2 (ref), avatarEditorService (ref), var3 (write), var4 (write), t (ref), fFlagUseSignalsForAuthenticationStatus (ref), signalsModule (ref), var1 (ref), loginStatus (ref)
	local tbl = setmetatable({
		store = p1,
		requestImpl = p2 or var2,
		avatarEditorService = p3 or avatarEditorService,
		platformCloudStorageService = p4 or var3,
		achievementService = p5 or var4
	}, { __index = t })
	
	if fFlagUseSignalsForAuthenticationStatus then
		tbl._authStatusInitialized = false
		tbl._lastAuthStatus = nil
		tbl._disposeAuthStatus = signalsModule.createEffect(function(p6)
			-- upvalues: var1 (copy), tbl (ref), loginStatus (copy)
			local status = var1(false).getStatus(p6)
			
			if not tbl._authStatusInitialized then
				tbl._authStatusInitialized = true
				tbl._lastAuthStatus = status
				
				return
			elseif status ~= tbl._lastAuthStatus then
				tbl._lastAuthStatus = status
				
				if status == loginStatus.LOGGED_IN then
					tbl:startUp()
					
					return
				elseif status == loginStatus.LOGGED_OUT then
					tbl:shutDown()
				end
			end
		end)
		
		return tbl
	end
	p1.changed:connect(function(p6, p7)
		-- upvalues: loginStatus (copy), tbl (ref)
		local var5 = if p6.AuthenticationStatus then p6.AuthenticationStatus.status else loginStatus.UNKNOWN
		
		if var5 ~= (if p7.AuthenticationStatus then p7.AuthenticationStatus.status else loginStatus.UNKNOWN) then
			if var5 == loginStatus.LOGGED_IN then
				tbl:startUp()
				
				return
			elseif var5 == loginStatus.LOGGED_OUT then
				tbl:shutDown()
			end
		end
	end)
	
	return tbl
end

return t