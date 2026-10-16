local CrossExperience = script:FindFirstAncestor("CrossExperience")
local ExperienceService = game:GetService("ExperienceService")
local HttpService = game:GetService("HttpService")
local LogEventFunction = require(CrossExperience.Analytics.CrossExperienceAnalytics).logEvent
local ConstantsModule = require(CrossExperience.Constants)
local GetMemStorageKeyModule = require(CrossExperience.Utils.getMemStorageKey)
local EventNamesModule = require(CrossExperience.Analytics.EventNames)
local LoggerModule = require(CrossExperience.Logger)
local _ = require(CrossExperience.Types)
local FFlagFixCrossExperienceVoiceExecutePrint = require(CrossExperience.dependencies).SharedFlags.FFlagFixCrossExperienceVoiceExecutePrint

local function v9() --[[ Line: 21 ]] end

local function Execute(ADDOBSERVER, p1, Callback1, Callback: (any) -> ()) --[[ Line: 23 ]]
	-- upvalues: ExperienceService (copy), FFlagFixCrossExperienceVoiceExecutePrint (copy), LoggerModule (copy)
	local Success, Result = pcall(function() --[[ Line: 24 ]]
		-- upvalues: ExperienceService (upval), ADDOBSERVER (copy), p1 (copy), Callback1 (copy), FFlagFixCrossExperienceVoiceExecutePrint (upval), LoggerModule (upval), Callback (copy)
		ExperienceService:ExecuteCrossExperienceCall(ADDOBSERVER, p1, function(p2) --[[ Line: 25 ]]
			-- upvalues: Callback1 (upval)
			if Callback1 then
				Callback1(p2)
			end
		end, function(p2) --[[ Line: 29 ]]
			-- upvalues: FFlagFixCrossExperienceVoiceExecutePrint (upval), LoggerModule (upval), Callback (upval)
			if FFlagFixCrossExperienceVoiceExecutePrint then
				LoggerModule:warning("Error executing call: {}", p2)
			else
				print("[CrossExperience] Error executing call", p2)
			end
			if Callback then
				Callback(p2)
			end
		end)
	end)
	
	if not Success then
		if FFlagFixCrossExperienceVoiceExecutePrint then
			LoggerModule:warning("Error executing call pcall: {} {}", ADDOBSERVER, Result)
		else
			print("[CrossExperience] Error executing call pcall", ADDOBSERVER, Result)
		end
		if Callback then
			Callback("[CrossExperience] Error executing call pcall")
		end
	end
end

local function NotifyWithCallbacks(p1, p2, p3, p4) --[[ Line: 54 ]]
	-- upvalues: GetMemStorageKeyModule (copy), ConstantsModule (copy), LogEventFunction (copy), EventNamesModule (copy), Execute (copy)
	LogEventFunction(EventNamesModule.NotifyObserver, {
		eventName = p1.NOTIFY,
		clientTimeStamp = os.time(),
		cevJoinAttemptId = GetMemStorageKeyModule(ConstantsModule.CEV_JOIN_ATTEMPT_ID_KEY)
	})
	Execute(p1.NOTIFY, p2, p3, p4)
end

local function AddObserverWithCallbacks(ExperienceType, p1, p2, _, p3) --[[ Line: 74 ]]
	-- upvalues: HttpService (copy), LogEventFunction (copy), EventNamesModule (copy), GetMemStorageKeyModule (copy), ConstantsModule (copy), Execute (copy)
	local Guid = HttpService:GenerateGUID(false)
	LogEventFunction(EventNamesModule.AddObserver, {
		eventName = p1.ADD_OBSERVER,
		clientTimeStamp = os.time(),
		cevJoinAttemptId = GetMemStorageKeyModule(ConstantsModule.CEV_JOIN_ATTEMPT_ID_KEY)
	})
	Execute(p1.ADD_OBSERVER, { observerId = Guid, experienceType = ExperienceType }, p2, p3)
	
	return Guid
end

local function RemoveObserverWithCallbacks(ExperienceType, p1, ObserverId, p2, p3) --[[ Line: 99 ]]
	-- upvalues: LogEventFunction (copy), EventNamesModule (copy), GetMemStorageKeyModule (copy), ConstantsModule (copy), Execute (copy)
	LogEventFunction(EventNamesModule.RemoveObserver, {
		eventName = p1.REMOVE_OBSERVER,
		clientTimeStamp = os.time(),
		cevJoinAttemptId = GetMemStorageKeyModule(ConstantsModule.CEV_JOIN_ATTEMPT_ID_KEY)
	})
	Execute(p1.REMOVE_OBSERVER, { observerId = ObserverId, experienceType = ExperienceType }, p2, p3)
end

return {
	execute = Execute,
	notify = function(p1, p2) --[[ Line: 70 ]]
		-- upvalues: NotifyWithCallbacks (copy), v9 (copy)
		NotifyWithCallbacks(p1, p2, v9, v9)
	end,
	notifyWithCallbacks = NotifyWithCallbacks,
	addObserver = function(ExperienceType, p1, p2) --[[ Line: 95 ]]
		-- upvalues: AddObserverWithCallbacks (copy), v9 (copy)
		return (AddObserverWithCallbacks(ExperienceType, p1, p2, v9, v9))
	end,
	addObserverWithCallbacks = AddObserverWithCallbacks,
	removeObserver = function(ExperienceType, p1, ObserverId) --[[ Line: 117 ]]
		-- upvalues: RemoveObserverWithCallbacks (copy), v9 (copy)
		return RemoveObserverWithCallbacks(ExperienceType, p1, ObserverId, v9, v9)
	end,
	removeObserverWithCallbacks = RemoveObserverWithCallbacks
}