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

local var7 = function() end

local var8 = function(p0, p1, p2, p3)
	-- upvalues: experienceService (ref), fFlagFixCrossExperienceVoiceExecutePrint (ref), loggerModule (ref)
	local ok, status = pcall(function()
		-- upvalues: experienceService (copy), p0 (ref), p1 (ref), p2 (ref), fFlagFixCrossExperienceVoiceExecutePrint (copy), loggerModule (copy), p3 (ref)
		experienceService:ExecuteCrossExperienceCall(p0, p1, function(p4)
			-- upvalues: p2 (copy)
			if p2 then
				p2(p4)
			end
		end, function(p5)
			-- upvalues: fFlagFixCrossExperienceVoiceExecutePrint (copy), loggerModule (copy), p3 (copy)
			if fFlagFixCrossExperienceVoiceExecutePrint then
				loggerModule:warning("Error executing call: {}", p5)
			else
				print("[CrossExperience] Error executing call", p5)
			end
			if p3 then
				p3(p5)
			end
		end)
	end)
	
	if not ok then
		if fFlagFixCrossExperienceVoiceExecutePrint then
			loggerModule:warning("Error executing call pcall: {} {}", p0, status)
		else
			print("[CrossExperience] Error executing call pcall", p0, status)
		end
		if p3 then
			p3("[CrossExperience] Error executing call pcall")
		end
	end
end

local var9 = function(p6, p7, p8, p9)
	-- upvalues: getMemStorageKeyModule (ref), constantsModule (ref), logEvent (ref), eventNamesModule (ref), var8 (ref)
	logEvent(eventNamesModule.NotifyObserver, {
		eventName = p6.NOTIFY,
		clientTimeStamp = os.time(),
		cevJoinAttemptId = getMemStorageKeyModule(constantsModule.CEV_JOIN_ATTEMPT_ID_KEY)
	})
	var8(p6.NOTIFY, p7, p8, p9)
end

local var10 = function(p10, p11)
	-- upvalues: var9 (ref), var7 (ref)
	var9(p10, p11, var7, var7)
end

local var11 = function(p12, p13, p14, _, p15)
	-- upvalues: httpService (ref), logEvent (ref), eventNamesModule (ref), getMemStorageKeyModule (ref), constantsModule (ref), var8 (ref)
	local var13 = httpService:GenerateGUID(false)
	logEvent(eventNamesModule.AddObserver, {
		eventName = p13.ADD_OBSERVER,
		clientTimeStamp = os.time(),
		cevJoinAttemptId = getMemStorageKeyModule(constantsModule.CEV_JOIN_ATTEMPT_ID_KEY)
	})
	var8(p13.ADD_OBSERVER, { observerId = var13, experienceType = p12 }, p14, p15)
	
	return var13
end

local var12 = function(p16, p17, p18, p19, p20)
	-- upvalues: logEvent (ref), eventNamesModule (ref), getMemStorageKeyModule (ref), constantsModule (ref), var8 (ref)
	logEvent(eventNamesModule.RemoveObserver, {
		eventName = p17.REMOVE_OBSERVER,
		clientTimeStamp = os.time(),
		cevJoinAttemptId = getMemStorageKeyModule(constantsModule.CEV_JOIN_ATTEMPT_ID_KEY)
	})
	var8(p17.REMOVE_OBSERVER, { observerId = p18, experienceType = p16 }, p19, p20)
end

return {
	execute = var8,
	notify = var10,
	notifyWithCallbacks = var9,
	addObserver = function(p21, p22, p23)
		-- upvalues: var11 (ref), var7 (ref)
		return var11(p21, p22, p23, var7, var7)
	end,
	addObserverWithCallbacks = var11,
	removeObserver = function(p24, p25, p26)
		-- upvalues: var12 (ref), var7 (ref)
		return var12(p24, p25, p26, var7, var7)
	end,
	removeObserverWithCallbacks = var12
}