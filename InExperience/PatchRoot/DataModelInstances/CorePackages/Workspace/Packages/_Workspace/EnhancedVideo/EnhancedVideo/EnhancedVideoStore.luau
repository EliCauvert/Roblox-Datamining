local Parent = script.Parent
local Parent1 = Parent.Parent
local SignalsModule = require(Parent1.Signals)
local TModule = require(Parent1.t)
local EnhancedVideoTelemetryModule = require(Parent.EnhancedVideoTelemetry)
local FFlagLuaAppEnableEnhancedVideoExperienceAssetAndTimelineModule = require(Parent.FFlagLuaAppEnableEnhancedVideoExperienceAssetAndTimeline)
local FlaggedMutedErrorFunction = require(Parent1.Loggers).flaggedMutedError
local CreateSignalFunction = SignalsModule.createSignal
local ServeEnhancedVideoModule = require(Parent.serveEnhancedVideo)
local _ = require(Parent.Types)
local InterfaceResult = TModule.interface({
	adDisclosureText = TModule.string,
	showAdPreferencesUrl = TModule.boolean,
	videoAssetId = TModule.string,
	timelineJson = if FFlagLuaAppEnableEnhancedVideoExperienceAssetAndTimelineModule then TModule.optional(TModule.string) else nil
})

function createEnhancedVideoStore() --[[ Line: 40 ]]
	-- upvalues: CreateSignalFunction (copy), FFlagLuaAppEnableEnhancedVideoExperienceAssetAndTimelineModule (copy), ServeEnhancedVideoModule (copy), InterfaceResult (copy), FlaggedMutedErrorFunction (copy), EnhancedVideoTelemetryModule (copy)
	local Signal, Signal2 = CreateSignalFunction("")
	local Signal1, Signal2_1 = CreateSignalFunction(false)
	local Signal3, Signal2_2 = CreateSignalFunction("")
	local v1 = nil
	local Callback = nil
	
	if FFlagLuaAppEnableEnhancedVideoExperienceAssetAndTimelineModule then
		v1, Callback = CreateSignalFunction("")
	end
	return {
		getAdDisclosureText = Signal,
		getShowAdPreferencesUrl = Signal1,
		getVideoAssetId = Signal3,
		getTimelineJson = if FFlagLuaAppEnableEnhancedVideoExperienceAssetAndTimelineModule then v1 else nil,
		fetchInitialData = if FFlagLuaAppEnableEnhancedVideoExperienceAssetAndTimelineModule then function(p1, p2) --[[ Line: 51 ]]
			-- upvalues: ServeEnhancedVideoModule (upval), InterfaceResult (upval), FlaggedMutedErrorFunction (upval), Signal2 (copy), Signal2_1 (copy), Signal2_2 (copy), Callback (ref), EnhancedVideoTelemetryModule (upval)
			return ServeEnhancedVideoModule(p1, p2):andThen(function(Result) --[[ Line: 53 ]]
				-- upvalues: InterfaceResult (upval), FlaggedMutedErrorFunction (upval), p2 (copy), Signal2 (upval), Signal2_1 (upval), Signal2_2 (upval), Callback (upval)
				local ResponseBody = Result.responseBody
				
				if InterfaceResult(ResponseBody) then
					Signal2(ResponseBody.adDisclosureText)
					Signal2_1(ResponseBody.showAdPreferencesUrl)
					Signal2_2(ResponseBody.videoAssetId)
					local TimelineJson = ResponseBody.timelineJson or ""
					Callback(TimelineJson)
					
					return {
						videoAssetId = ResponseBody.videoAssetId,
						timelineJson = TimelineJson
					}
				else
					FlaggedMutedErrorFunction("EnhancedVideo_InvalidResponseSchema", `Response does not match expected schema for universe {p2}`)
					
					return nil
				end
			end):catch(function(Err) --[[ Line: 72 ]]
				-- upvalues: EnhancedVideoTelemetryModule (upval)
				EnhancedVideoTelemetryModule.logServeEnhancedVideoError((tostring(Err)))
				
				return nil
			end)
		end else function(p3, p4) --[[ Line: 78 ]]
			-- upvalues: ServeEnhancedVideoModule (upval), InterfaceResult (upval), FlaggedMutedErrorFunction (upval), Signal2 (copy), Signal2_1 (copy), Signal2_2 (copy), EnhancedVideoTelemetryModule (upval)
			ServeEnhancedVideoModule(p3, p4):andThen(function(Result) --[[ Line: 80 ]]
				-- upvalues: InterfaceResult (upval), FlaggedMutedErrorFunction (upval), p4 (copy), Signal2 (upval), Signal2_1 (upval), Signal2_2 (upval)
				local ResponseBody = Result.responseBody
				
				if InterfaceResult(ResponseBody) then
					Signal2(ResponseBody.adDisclosureText)
					Signal2_1(ResponseBody.showAdPreferencesUrl)
					Signal2_2(ResponseBody.videoAssetId)
					
					return
				else
					FlaggedMutedErrorFunction("EnhancedVideo_InvalidResponseSchema", `Response does not match expected schema for universe ${p4}`)
				end
			end):catch(function(Err) --[[ Line: 93 ]]
				-- upvalues: EnhancedVideoTelemetryModule (upval)
				EnhancedVideoTelemetryModule.logServeEnhancedVideoError((tostring(Err)))
			end)
		end
	}
end

return SignalsModule.createComputed(createEnhancedVideoStore)