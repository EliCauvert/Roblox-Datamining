local crossExperience = script:FindFirstAncestor("CrossExperience")
local experienceService = game:GetService("ExperienceService")
local httpService = game:GetService("HttpService")
local logEvent = require(crossExperience.Analytics.CrossExperienceAnalytics).logEvent
local constantsModule = require(crossExperience.Constants)
local getMemStorageKeyModule = require(crossExperience.Utils.getMemStorageKey)
local eventNamesModule = require(crossExperience.Analytics.EventNames)
local loggerModule = require(crossExperience.Logger)
local _ = require(crossExperience.Types)
local fFlagFixCrossExperienceVoiceExecutePrint = require(crossExperience.dependencies).SharedFlags.FFlagFixCrossExperienceVoiceExecutePrint

local var1 = function() end

local var2 = function(p1, p2, p3, p4)
	-- upvalues: experienceService (ref), fFlagFixCrossExperienceVoiceExecutePrint (ref), loggerModule (ref)
	local ok, status = pcall(function()
		-- upvalues: experienceService (copy), p1 (ref), p2 (ref), p3 (ref), fFlagFixCrossExperienceVoiceExecutePrint (copy), loggerModule (copy), p4 (ref)
		experienceService:ExecuteCrossExperienceCall(p1, p2, function(p5)
			-- upvalues: p3 (copy)
			if p3 then
				p3(p5)
			end
		end, function(p5)
			-- upvalues: fFlagFixCrossExperienceVoiceExecutePrint (copy), loggerModule (copy), p4 (copy)
			if fFlagFixCrossExperienceVoiceExecutePrint then
				loggerModule:warning("Error executing call: {}", p5)
			else
				print("[CrossExperience] Error executing call", p5)
			end
			if p4 then
				p4(p5)
			end
		end)
	end)
	
	if not ok then
		if fFlagFixCrossExperienceVoiceExecutePrint then
			loggerModule:warning("Error executing call pcall: {} {}", p1, status)
		else
			print("[CrossExperience] Error executing call pcall", p1, status)
		end
		if p4 then
			p4("[CrossExperience] Error executing call pcall")
		end
	end
end

local var3 = function(p1, p2, p3, p4)
	-- upvalues: getMemStorageKeyModule (ref), constantsModule (ref), logEvent (ref), eventNamesModule (ref), var2 (ref)
	logEvent(eventNamesModule.NotifyObserver, {
		eventName = p1.NOTIFY,
		clientTimeStamp = os.time(),
		cevJoinAttemptId = getMemStorageKeyModule(constantsModule.CEV_JOIN_ATTEMPT_ID_KEY)
	})
	var2(p1.NOTIFY, p2, p3, p4)
end

local var4 = function(p1, p2)
	-- upvalues: var3 (ref), var1 (ref)
	var3(p1, p2, var1, var1)
end

local var5 = function(p1, p2, p3, _, p4)
	-- upvalues: httpService (ref), logEvent (ref), eventNamesModule (ref), getMemStorageKeyModule (ref), constantsModule (ref), var2 (ref)
	local var6 = httpService:GenerateGUID(false)
	logEvent(eventNamesModule.AddObserver, {
		eventName = p2.ADD_OBSERVER,
		clientTimeStamp = os.time(),
		cevJoinAttemptId = getMemStorageKeyModule(constantsModule.CEV_JOIN_ATTEMPT_ID_KEY)
	})
	var2(p2.ADD_OBSERVER, { observerId = var6, experienceType = p1 }, p3, p4)
	
	return var6
end

local var6 = function(p1, p2, p3, p4, p5)
	-- upvalues: logEvent (ref), eventNamesModule (ref), getMemStorageKeyModule (ref), constantsModule (ref), var2 (ref)
	logEvent(eventNamesModule.RemoveObserver, {
		eventName = p2.REMOVE_OBSERVER,
		clientTimeStamp = os.time(),
		cevJoinAttemptId = getMemStorageKeyModule(constantsModule.CEV_JOIN_ATTEMPT_ID_KEY)
	})
	var2(p2.REMOVE_OBSERVER, { observerId = p3, experienceType = p1 }, p4, p5)
end

return {
	execute = var2,
	notify = var4,
	notifyWithCallbacks = var3,
	addObserver = function(p1, p2, p3)
		-- upvalues: var5 (ref), var1 (ref)
		return var5(p1, p2, p3, var1, var1)
	end,
	addObserverWithCallbacks = var5,
	removeObserver = function(p1, p2, p3)
		-- upvalues: var6 (ref), var1 (ref)
		return var6(p1, p2, p3, var1, var1)
	end,
	removeObserverWithCallbacks = var6
}