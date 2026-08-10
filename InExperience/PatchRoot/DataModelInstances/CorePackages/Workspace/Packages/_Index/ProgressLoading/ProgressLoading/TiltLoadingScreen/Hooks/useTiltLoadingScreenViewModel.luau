local tiltLoadingScreen = script:FindFirstAncestor("TiltLoadingScreen")
local parent = tiltLoadingScreen.Parent
local parent_1 = parent.Parent
local reactModule = require(parent_1.React)
local signalsReactModule = require(parent_1.SignalsReact)
local constantsModule = require(tiltLoadingScreen.Constants)
local createTiltLoadingScreenModelModule = require(tiltLoadingScreen.Models.createTiltLoadingScreenModel)
local loadingScreenTelemetryModule = require(parent.LoadingScreenTelemetry)
local useScreenSizeModule = require(script.Parent.useScreenSize)
local sharedFlagsModule = require(parent_1.SharedFlags)
local _ = require(tiltLoadingScreen.Types)
local fFlagAddAutoTranslateToLoadingScreen = sharedFlagsModule.FFlagAddAutoTranslateToLoadingScreen
local fFlagAutoTranslateSkipZeroUniverseId = sharedFlagsModule.FFlagAutoTranslateSkipZeroUniverseId

return function(value) --[[ line: 22 | named "useTiltLoadingScreenViewModel" ]]
	-- upvalues: reactModule (ref), createTiltLoadingScreenModelModule (ref), signalsReactModule (ref), useScreenSizeModule (ref), fFlagAddAutoTranslateToLoadingScreen (ref), fFlagAutoTranslateSkipZeroUniverseId (ref), loadingScreenTelemetryModule (ref), constantsModule (ref)
	local var8 = reactModule.useMemo(function() --[[ line: 23 ]]
		-- upvalues: createTiltLoadingScreenModelModule (copy), value (ref)
		return createTiltLoadingScreenModelModule(value)
	end, { value })
	local var9 = signalsReactModule.useSignalState(var8.getAssetInfo)
	local var10 = signalsReactModule.useSignalState(var8.getUniverseId)
	local var11 = signalsReactModule.useSignalState(var8.getFollowUserId)
	local var12 = signalsReactModule.useSignalState(var8.getIsAutoTranslated)
	local var13 = signalsReactModule.useSignalState(var8.getIsSubjectToChinaPolicies)
	local var14 = signalsReactModule.useSignalState(var8.getJoinState)
	local var15 = signalsReactModule.useSignalState(var8.getQueuePosition)
	local var16 = signalsReactModule.useSignalState(var8.getQueueTreatment)
	local var17 = signalsReactModule.useSignalState(var8.getServerStatusText)
	local var18 = useScreenSizeModule()
	local var19 = reactModule.useRef(var12)
	local var20 = reactModule.useRef(false)
	reactModule.useEffect(function() --[[ line: 39 ]]
		-- upvalues: var8 (ref)
		var8.start()
		
		return var8.destroy
	end, { var8 })
	var19.current = var12
	local var21 = fFlagAddAutoTranslateToLoadingScreen
	
	if var21 then
		var21 = not (fFlagAutoTranslateSkipZeroUniverseId and var10 <= 0)
	end
	var20.current = var21
	reactModule.useEffect(function() --[[ line: 46 ]]
		-- upvalues: var20 (ref), var19 (ref), loadingScreenTelemetryModule (copy)
		return function() --[[ line: 47 ]]
			-- upvalues: var20 (copy), var19 (copy), loadingScreenTelemetryModule (copy)
			if var20.current and var19.current == nil then
				loadingScreenTelemetryModule.countPlayerLocalizationChoiceNotReady()
			end
		end
	end, {})
	
	return {
		isMobile = math.min(var18.X, var18.Y) <= constantsModule.MOBILE_BREAKPOINT,
		gameData = reactModule.useMemo(function() --[[ line: 67 ]]
			-- upvalues: var9 (ref)
			return if var9 then {
				name = var9.name or "",
				creator = var9.creatorName or "",
				verified = var9.creatorHasVerifiedBadge == true
			} else nil
		end, { var9 }),
		thumbnailUrl = if var10 > 0 then string.format("rbxthumb://type=GameIcon&id=%d&w=256&h=256", var10) else "",
		isAutoTranslated = var12,
		statusPanel = {
			status = var14,
			statusText = var17,
			queuePosition = var15,
			queueTreatment = var16,
			followUserId = var11,
			isSubjectToChinaPolicies = var13,
			onAutoJoinNewServer = reactModule.useCallback(function() --[[ line: 58 ]]
				-- upvalues: var8 (ref)
				var8.launchExperience()
			end, { var8 }),
			onJoinNewServer = reactModule.useCallback(function(p0) --[[ line: 54 ]]
				-- upvalues: var8 (ref)
				var8.logQueuedStateButtonClick("JoinNewServer", p0)
				var8.launchExperience()
			end, { var8 }),
			onJoinTheLine = reactModule.useCallback(function(p1) --[[ line: 61 ]]
				-- upvalues: var8 (ref)
				var8.logQueuedStateButtonClick("JoinTheLine", p1)
			end, { var8 }),
			onShowConnectionHealth = reactModule.useCallback(function() --[[ line: 64 ]]
				-- upvalues: var8 (ref)
				var8.showConnectionHealth()
			end, { var8 })
		}
	}
end