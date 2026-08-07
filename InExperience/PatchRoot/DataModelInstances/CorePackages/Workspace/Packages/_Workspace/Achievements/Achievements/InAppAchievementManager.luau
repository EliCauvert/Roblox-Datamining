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
local var7 = if fFlagUseSignalsForAuthenticationStatus then require(parent.AuthenticationStatus).GetAuthenticationStatusStore else nil
local getXboxLoginConsecutiveDaysModule = require(achievements.Requests.GetXboxLoginConsecutiveDays)
local voteCountRefresherModule = require(achievements.AchievementDataRefresher.VoteCountRefresher)
local fixOneNameManyFacesDisconnectCrash = game:DefineFastFlag("FixOneNameManyFacesDisconnectCrash", false)
local var11 = httpRequestModule.config({
	requestFunction = function(p0, p1, p2) --[[ line: 25 ]]
		-- upvalues: httpRequestModule (ref)
		return httpRequestModule.requestFunctions.HttpRbxApi(p0, p1, p2)
	end,
	maxRetryCount = if require(parent.SharedFlags).FFlagLuaAppDefaultHttpRetry then game:DefineFastInt("InAppAchievementManagerHttpRetryCount", 4) else nil
})
local var12 = nil
pcall(function() --[[ line: 34 ]]
	-- upvalues: var12 (write)
	var12 = game:GetService("PlatformCloudStorageService")
end)
local var13 = nil
pcall(function() --[[ line: 41 ]]
	-- upvalues: var13 (write)
	var13 = game:GetService("AchievementService")
end)
local t = {
	startUp = function(p3) --[[ line: 47 ]]
		task.spawn(function() --[[ line: 48 ]]
			-- upvalues: p3 (ref)
			p3:initAchievements()
		end)
	end,
	initAchievements = function(p4) --[[ line: 53 ]]
		-- upvalues: signalModule (ref), voteCountRefresherModule (ref), achievementModule (ref)
		local var15, var16 = signalModule.createReadableSignal(0)
		local var17, var18 = signalModule.createReadableSignal(0)
		local var19, var20 = signalModule.createReadableSignal(false)
		voteCountRefresherModule:init(var16, p4.store, p4.requestImpl, p4.platformCloudStorageService)
		p4.achievementPollster = achievementModule.newWithRefresher(achievementModule.NAMES.ACHIEVEMENT_POLLSTER, var15, voteCountRefresherModule, p4.achievementService)
		p4.achievement3DayRoll = achievementModule.new(achievementModule.NAMES.ACHIEVEMENT_3_DAY_ROLL, var17, p4.achievementService)
		p4.achievement10DayRoll = achievementModule.new(achievementModule.NAMES.ACHIEVEMENT_10_DAY_ROLL, var17, p4.achievementService)
		p4.achievement20DayRoll = achievementModule.new(achievementModule.NAMES.ACHIEVEMENT_20_DAY_ROLL, var17, p4.achievementService)
		p4.achievementOneNameManyFaces = achievementModule.new(achievementModule.NAMES.ACHIEVEMENT_ONE_NAME_MANY_FACES, var19, p4.achievementService)
		p4:setupAchievements(var18, var20)
	end,
	setupAchievements = function(value, p5, p6) --[[ line: 85 ]]
		-- upvalues: getXboxLoginConsecutiveDaysModule (ref), loggerModule (ref), fixOneNameManyFacesDisconnectCrash (ref)
		if value.achievement3DayRoll.hasAchieved == false or value.achievement10DayRoll.hasAchieved == false or value.achievement20DayRoll.hasAchieved == false then
			getXboxLoginConsecutiveDaysModule(value.requestImpl):andThen(function(p8) --[[ line: 91 ]]
				-- upvalues: loggerModule (copy), p5 (ref)
				if p8.responseBody == nil then
					loggerModule:warning("Response body is empty.")
					
					return
				end
				local count = p8.responseBody.count
				
				if count == nil then
					loggerModule:warning("Day count is missing.")
					
					return
				end
				p5(count)
			end):catch(function(p7) --[[ line: 104 ]]
				-- upvalues: loggerModule (copy)
				loggerModule:warning(p7)
			end)
		end
		if value.achievementOneNameManyFaces.hasAchieved == false then
			value.saveAvatarCompletedConnection = value.avatarEditorService.PromptSaveAvatarCompleted:Connect(function(p9) --[[ line: 111 ]]
				-- upvalues: p6 (ref), fixOneNameManyFacesDisconnectCrash (copy), value (ref)
				if p9 == Enum.AvatarPromptResult.Success then
					p6(true)
					
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
	shutDown = function(p10) --[[ line: 129 ]]
		-- upvalues: voteCountRefresherModule (ref)
		p10.achievementPollster = nil
		p10.achievement3DayRoll = nil
		p10.achievement10DayRoll = nil
		p10.achievement20DayRoll = nil
		voteCountRefresherModule:stop()
		
		if p10.saveAvatarCompletedConnection and p10.saveAvatarCompletedConnection.Connected then
			p10.saveAvatarCompletedConnection:Disconnect()
			p10.saveAvatarCompletedConnection = nil
		end
	end
}

function t.new(p11, p12, p13, p14, p15) --[[ line: 142 ]]
	-- upvalues: var11 (ref), avatarEditorService (ref), var12 (write), var13 (write), t (ref), fFlagUseSignalsForAuthenticationStatus (ref), signalsModule (ref), var7 (ref), loginStatus (ref)
	local tbl = setmetatable({
		store = p11,
		requestImpl = p12 or var11,
		avatarEditorService = p13 or avatarEditorService,
		platformCloudStorageService = p14 or var12,
		achievementService = p15 or var13
	}, { __index = t })
	
	if fFlagUseSignalsForAuthenticationStatus then
		tbl._authStatusInitialized = false
		tbl._lastAuthStatus = nil
		tbl._disposeAuthStatus = signalsModule.createEffect(function(p16) --[[ line: 160 ]]
			-- upvalues: var7 (copy), tbl (ref), loginStatus (copy)
			local status = var7(false).getStatus(p16)
			
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
	p11.changed:connect(function(p17, p18) --[[ line: 177 ]]
		-- upvalues: loginStatus (copy), tbl (ref)
		local var23 = if p17.AuthenticationStatus then p17.AuthenticationStatus.status else loginStatus.UNKNOWN
		
		if var23 ~= (if p18.AuthenticationStatus then p18.AuthenticationStatus.status else loginStatus.UNKNOWN) then
			if var23 == loginStatus.LOGGED_IN then
				tbl:startUp()
				
				return
			elseif var23 == loginStatus.LOGGED_OUT then
				tbl:shutDown()
			end
		end
	end)
	
	return tbl
end

return t