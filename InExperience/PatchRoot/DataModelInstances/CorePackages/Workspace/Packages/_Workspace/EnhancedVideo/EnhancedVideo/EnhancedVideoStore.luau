local Parent = script.Parent
local Parent1 = Parent.Parent
local SignalsModule = require(Parent1.Signals)
local TModule = require(Parent1.t)
local LoggersModule = require(Parent1.Loggers)
local EnhancedVideoTelemetryModule = require(Parent.EnhancedVideoTelemetry)
local FlaggedMutedErrorFunction = LoggersModule.flaggedMutedError
local CreateSignalFunction = SignalsModule.createSignal
local ServeEnhancedVideoModule = require(Parent.serveEnhancedVideo)
local _ = require(Parent.Types)
local InterfaceResult = TModule.interface({
	adDisclosureText = TModule.string,
	showAdPreferencesUrl = TModule.boolean,
	videoAssetId = TModule.string,
	timelineJson = TModule.optional(TModule.string)
})

function createEnhancedVideoStore()
	-- upvalues: CreateSignalFunction (copy), ServeEnhancedVideoModule (copy), InterfaceResult (copy), FlaggedMutedErrorFunction (copy), EnhancedVideoTelemetryModule (copy)
	local Signal, Signal2 = CreateSignalFunction("")
	local Signal1, Signal2_1 = CreateSignalFunction(false)
	local Signal3, Signal2_2 = CreateSignalFunction("")
	local Signal4, Signal2_3 = CreateSignalFunction("")
	
	return {
		getAdDisclosureText = Signal,
		getShowAdPreferencesUrl = Signal1,
		getVideoAssetId = Signal3,
		getTimelineJson = Signal4,
		fetchInitialData = function(p1, p2)
			-- upvalues: ServeEnhancedVideoModule (upval), InterfaceResult (upval), FlaggedMutedErrorFunction (upval), Signal2 (copy), Signal2_1 (copy), Signal2_2 (copy), Signal2_3 (copy), EnhancedVideoTelemetryModule (upval)
			return ServeEnhancedVideoModule(p1, p2):andThen(function(Result)
				-- upvalues: InterfaceResult (upval), FlaggedMutedErrorFunction (upval), p2 (copy), Signal2 (upval), Signal2_1 (upval), Signal2_2 (upval), Signal2_3 (upval)
				local ResponseBody = Result.responseBody
				
				if InterfaceResult(ResponseBody) then
					Signal2(ResponseBody.adDisclosureText)
					Signal2_1(ResponseBody.showAdPreferencesUrl)
					Signal2_2(ResponseBody.videoAssetId)
					local TimelineJson = ResponseBody.timelineJson or ""
					Signal2_3(TimelineJson)
					
					return {
						videoAssetId = ResponseBody.videoAssetId,
						timelineJson = TimelineJson
					}
				else
					FlaggedMutedErrorFunction("EnhancedVideo_InvalidResponseSchema", `Response does not match expected schema for universe {p2}`)
					
					return nil
				end
			end):catch(function(Err)
				-- upvalues: EnhancedVideoTelemetryModule (upval)
				EnhancedVideoTelemetryModule.logServeEnhancedVideoError((tostring(Err)))
				
				return nil
			end)
		end
	}
end

return SignalsModule.createComputed(createEnhancedVideoStore)