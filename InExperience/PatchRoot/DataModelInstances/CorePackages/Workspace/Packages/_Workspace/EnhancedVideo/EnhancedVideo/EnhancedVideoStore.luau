local parent = script.Parent
local parent_1 = parent.Parent
local signalsModule = require(parent_1.Signals)
local tModule = require(parent_1.t)
local loggersModule = require(parent_1.Loggers)
local enhancedVideoTelemetryModule = require(parent.EnhancedVideoTelemetry)
local fFlagLuaAppEnableEnhancedVideoExperienceAssetAndTimelineModule = require(parent.FFlagLuaAppEnableEnhancedVideoExperienceAssetAndTimeline)
local flaggedMutedError = loggersModule.flaggedMutedError
local createSignal = signalsModule.createSignal
local serveEnhancedVideoModule = require(parent.serveEnhancedVideo)
local _ = require(parent.Types)
local var1 = tModule.interface({
	adDisclosureText = tModule.string,
	showAdPreferencesUrl = tModule.boolean,
	videoAssetId = tModule.string,
	timelineJson = if fFlagLuaAppEnableEnhancedVideoExperienceAssetAndTimelineModule then tModule.optional(tModule.string) else nil
})

function createEnhancedVideoStore()
	-- upvalues: createSignal (ref), fFlagLuaAppEnableEnhancedVideoExperienceAssetAndTimelineModule (ref), serveEnhancedVideoModule (ref), var1 (ref), flaggedMutedError (ref), enhancedVideoTelemetryModule (ref)
	local var2, var3 = createSignal("")
	local var4, var5 = createSignal(false)
	local var6, var7 = createSignal("")
	local var8 = nil
	local var9 = nil
	
	if fFlagLuaAppEnableEnhancedVideoExperienceAssetAndTimelineModule then
		local var10, var11 = createSignal("")
		var8 = var10
		var9 = var11
	end
	return {
		getAdDisclosureText = var2,
		getShowAdPreferencesUrl = var4,
		getVideoAssetId = var6,
		getTimelineJson = if fFlagLuaAppEnableEnhancedVideoExperienceAssetAndTimelineModule then var8 else nil,
		fetchInitialData = if fFlagLuaAppEnableEnhancedVideoExperienceAssetAndTimelineModule then function(p1, p2)
			-- upvalues: serveEnhancedVideoModule (copy), var1 (copy), flaggedMutedError (copy), var3 (ref), var5 (ref), var7 (ref), var9 (write), enhancedVideoTelemetryModule (copy)
			return serveEnhancedVideoModule(p1, p2):andThen(function(p3)
				-- upvalues: var1 (copy), flaggedMutedError (copy), p2 (ref), var3 (copy), var5 (copy), var7 (copy), var9 (copy)
				local responseBody = p3.responseBody
				
				if var1(responseBody) then
					var3(responseBody.adDisclosureText)
					var5(responseBody.showAdPreferencesUrl)
					var7(responseBody.videoAssetId)
					local timelineJson = responseBody.timelineJson or ""
					var9(timelineJson)
					
					return {
						videoAssetId = responseBody.videoAssetId,
						timelineJson = timelineJson
					}
				end
				flaggedMutedError("EnhancedVideo_InvalidResponseSchema", `Response does not match expected schema for universe {p2}`)
				
				return nil
			end):catch(function(p4)
				-- upvalues: enhancedVideoTelemetryModule (copy)
				enhancedVideoTelemetryModule.logServeEnhancedVideoError(tostring(p4))
				
				return nil
			end)
		end else function(p3, p4)
			-- upvalues: serveEnhancedVideoModule (copy), var1 (copy), flaggedMutedError (copy), var3 (ref), var5 (ref), var7 (ref), enhancedVideoTelemetryModule (copy)
			serveEnhancedVideoModule(p3, p4):andThen(function(p5)
				-- upvalues: var1 (copy), flaggedMutedError (copy), p4 (ref), var3 (copy), var5 (copy), var7 (copy)
				local responseBody = p5.responseBody
				
				if var1(responseBody) then
					var3(responseBody.adDisclosureText)
					var5(responseBody.showAdPreferencesUrl)
					var7(responseBody.videoAssetId)
					
					return
				end
				flaggedMutedError("EnhancedVideo_InvalidResponseSchema", `Response does not match expected schema for universe ${p4}`)
			end):catch(function(p6)
				-- upvalues: enhancedVideoTelemetryModule (copy)
				enhancedVideoTelemetryModule.logServeEnhancedVideoError(tostring(p6))
			end)
		end
	}
end

return signalsModule.createComputed(createEnhancedVideoStore)