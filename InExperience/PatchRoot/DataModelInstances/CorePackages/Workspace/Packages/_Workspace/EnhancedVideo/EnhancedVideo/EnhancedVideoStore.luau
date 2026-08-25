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
local var6 = tModule.interface({
	adDisclosureText = tModule.string,
	showAdPreferencesUrl = tModule.boolean,
	videoAssetId = tModule.string,
	timelineJson = if fFlagLuaAppEnableEnhancedVideoExperienceAssetAndTimelineModule then tModule.optional(tModule.string) else nil
})

function createEnhancedVideoStore()
	-- upvalues: createSignal (ref), fFlagLuaAppEnableEnhancedVideoExperienceAssetAndTimelineModule (ref), serveEnhancedVideoModule (ref), var6 (ref), flaggedMutedError (ref), enhancedVideoTelemetryModule (ref)
	local var7, var8 = createSignal("")
	local var9, var10 = createSignal(false)
	local var11, var12 = createSignal("")
	local var13 = nil
	local var14 = nil
	
	if fFlagLuaAppEnableEnhancedVideoExperienceAssetAndTimelineModule then
		local var15, var16 = createSignal("")
		var13 = var15
		var14 = var16
	end
	return {
		getAdDisclosureText = var7,
		getShowAdPreferencesUrl = var9,
		getVideoAssetId = var11,
		getTimelineJson = if fFlagLuaAppEnableEnhancedVideoExperienceAssetAndTimelineModule then var13 else nil,
		fetchInitialData = if fFlagLuaAppEnableEnhancedVideoExperienceAssetAndTimelineModule then function(p4, p5)
			-- upvalues: serveEnhancedVideoModule (copy), var6 (copy), flaggedMutedError (copy), var8 (ref), var10 (ref), var12 (ref), var14 (write), enhancedVideoTelemetryModule (copy)
			return serveEnhancedVideoModule(p4, p5):andThen(function(p7)
				-- upvalues: var6 (copy), flaggedMutedError (copy), p5 (ref), var8 (copy), var10 (copy), var12 (copy), var14 (copy)
				local responseBody = p7.responseBody
				
				if var6(responseBody) then
					var8(responseBody.adDisclosureText)
					var10(responseBody.showAdPreferencesUrl)
					var12(responseBody.videoAssetId)
					local timelineJson = responseBody.timelineJson or ""
					var14(timelineJson)
					
					return {
						videoAssetId = responseBody.videoAssetId,
						timelineJson = timelineJson
					}
				end
				flaggedMutedError("EnhancedVideo_InvalidResponseSchema", `Response does not match expected schema for universe {p5}`)
				
				return nil
			end):catch(function(p6)
				-- upvalues: enhancedVideoTelemetryModule (copy)
				enhancedVideoTelemetryModule.logServeEnhancedVideoError(tostring(p6))
				
				return nil
			end)
		end else function(p0, p1)
			-- upvalues: serveEnhancedVideoModule (copy), var6 (copy), flaggedMutedError (copy), var8 (ref), var10 (ref), var12 (ref), enhancedVideoTelemetryModule (copy)
			serveEnhancedVideoModule(p0, p1):andThen(function(p3)
				-- upvalues: var6 (copy), flaggedMutedError (copy), p1 (ref), var8 (copy), var10 (copy), var12 (copy)
				local responseBody = p3.responseBody
				
				if var6(responseBody) then
					var8(responseBody.adDisclosureText)
					var10(responseBody.showAdPreferencesUrl)
					var12(responseBody.videoAssetId)
					
					return
				end
				flaggedMutedError("EnhancedVideo_InvalidResponseSchema", `Response does not match expected schema for universe ${p1}`)
			end):catch(function(p2)
				-- upvalues: enhancedVideoTelemetryModule (copy)
				enhancedVideoTelemetryModule.logServeEnhancedVideoError(tostring(p2))
			end)
		end
	}
end

return signalsModule.createComputed(createEnhancedVideoStore)