local achievements = script:FindFirstAncestor("Achievements")
local avatarEditorService = game:GetService("AvatarEditorService")
local parent = achievements.Parent
local signalModule = require(parent.Signal)
local achievementModule = require(achievements.Achievement.Achievement)
local loggerModule = require(achievements.Logger)
local loginStatus = require(parent.RobloxAppEnums).LoginStatus
local httpRequestModule = require(parent.HttpRequest)
local getXboxLoginConsecutiveDaysModule = require(achievements.Requests.GetXboxLoginConsecutiveDays)
local voteCountRefresherModule = require(achievements.AchievementDataRefresher.VoteCountRefresher)
local fixOneNameManyFacesDisconnectCrash = game:DefineFastFlag("FixOneNameManyFacesDisconnectCrash", false)
local var9 = httpRequestModule.config({
	requestFunction = function(p0, p1, p2) --[[ line: 17 ]]
		-- upvalues: httpRequestModule (ref)
		return httpRequestModule.requestFunctions.HttpRbxApi(p0, p1, p2)
	end,
	maxRetryCount = if require(parent.SharedFlags).FFlagLuaAppDefaultHttpRetry then game:DefineFastInt("InAppAchievementManagerHttpRetryCount", 4) else nil
})
local var10 = nil
pcall(function() --[[ line: 26 ]]
	-- upvalues: var10 (write)
	var10 = game:GetService("PlatformCloudStorageService")
end)
local var11 = nil
pcall(function() --[[ line: 33 ]]
	-- upvalues: var11 (write)
	var11 = game:GetService("AchievementService")
end)
local t = {
	startUp = function(p3) --[[ line: 39 ]]
		task.spawn(function() --[[ line: 40 ]]
			-- upvalues: p3 (ref)
			p3:initAchievements()
		end)
	end,
	initAchievements = function(p4) --[[ line: 45 ]]
		-- upvalues: signalModule (ref), voteCountRefresherModule (ref), achievementModule (ref)
		local var13, var14 = signalModule.createReadableSignal(0)
		local var15, var16 = signalModule.createReadableSignal(0)
		local var17, var18 = signalModule.createReadableSignal(false)
		voteCountRefresherModule:init(var14, p4.store, p4.requestImpl, p4.platformCloudStorageService)
		p4.achievementPollster = achievementModule.newWithRefresher(achievementModule.NAMES.ACHIEVEMENT_POLLSTER, var13, voteCountRefresherModule, p4.achievementService)
		p4.achievement3DayRoll = achievementModule.new(achievementModule.NAMES.ACHIEVEMENT_3_DAY_ROLL, var15, p4.achievementService)
		p4.achievement10DayRoll = achievementModule.new(achievementModule.NAMES.ACHIEVEMENT_10_DAY_ROLL, var15, p4.achievementService)
		p4.achievement20DayRoll = achievementModule.new(achievementModule.NAMES.ACHIEVEMENT_20_DAY_ROLL, var15, p4.achievementService)
		p4.achievementOneNameManyFaces = achievementModule.new(achievementModule.NAMES.ACHIEVEMENT_ONE_NAME_MANY_FACES, var17, p4.achievementService)
		p4:setupAchievements(var16, var18)
	end,
	setupAchievements = function(value, p5, p6) --[[ line: 77 ]]
		-- upvalues: getXboxLoginConsecutiveDaysModule (ref), loggerModule (ref), fixOneNameManyFacesDisconnectCrash (ref)
		if value.achievement3DayRoll.hasAchieved == false or value.achievement10DayRoll.hasAchieved == false or value.achievement20DayRoll.hasAchieved == false then
			getXboxLoginConsecutiveDaysModule(value.requestImpl):andThen(function(p8) --[[ line: 83 ]]
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
			end):catch(function(p7) --[[ line: 96 ]]
				-- upvalues: loggerModule (copy)
				loggerModule:warning(p7)
			end)
		end
		if value.achievementOneNameManyFaces.hasAchieved == false then
			value.saveAvatarCompletedConnection = value.avatarEditorService.PromptSaveAvatarCompleted:Connect(function(p9) --[[ line: 103 ]]
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
	shutDown = function(p10) --[[ line: 121 ]]
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

function t.new(p11, p12, p13, p14, p15) --[[ line: 134 ]]
	-- upvalues: var9 (ref), avatarEditorService (ref), var10 (write), var11 (write), t (ref), loginStatus (ref)
	local tbl = setmetatable({
		store = p11,
		requestImpl = p12 or var9,
		avatarEditorService = p13 or avatarEditorService,
		platformCloudStorageService = p14 or var10,
		achievementService = p15 or var11
	}, { __index = t })
	p11.changed:connect(function(p16, p17) --[[ line: 149 ]]
		-- upvalues: loginStatus (copy), tbl (ref)
		local var20 = if p16.AuthenticationStatus then p16.AuthenticationStatus.status else loginStatus.UNKNOWN
		
		if var20 ~= (if p17.AuthenticationStatus then p17.AuthenticationStatus.status else loginStatus.UNKNOWN) then
			if var20 == loginStatus.LOGGED_IN then
				tbl:startUp()
				
				return
			elseif var20 == loginStatus.LOGGED_OUT then
				tbl:shutDown()
			end
		end
	end)
	
	return tbl
end

return t