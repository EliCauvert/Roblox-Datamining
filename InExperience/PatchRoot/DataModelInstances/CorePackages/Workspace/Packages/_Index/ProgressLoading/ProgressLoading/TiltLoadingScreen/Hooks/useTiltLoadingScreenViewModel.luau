local tiltLoadingScreen = script:FindFirstAncestor("TiltLoadingScreen")
local parent = tiltLoadingScreen.Parent
local parent_1 = parent.Parent
local reactModule = require(parent_1.React)
local signalsReactModule = require(parent_1.SignalsReact)
local constantsModule = require(tiltLoadingScreen.Constants)
local createTiltLoadingScreenModelModule = require(tiltLoadingScreen.Models.createTiltLoadingScreenModel)
local loadingScreenTelemetryModule = require(parent.LoadingScreenTelemetry)
local useScreenSizeModule = require(script.Parent.useScreenSize)
local _ = require(tiltLoadingScreen.Types)
local fFlagAutoTranslateSkipZeroUniverseId = require(parent_1.SharedFlags).FFlagAutoTranslateSkipZeroUniverseId

return function(value) --[[ line: 21 | named "useTiltLoadingScreenViewModel" ]]
	-- upvalues: reactModule (ref), createTiltLoadingScreenModelModule (ref), signalsReactModule (ref), useScreenSizeModule (ref), fFlagAutoTranslateSkipZeroUniverseId (ref), loadingScreenTelemetryModule (ref), constantsModule (ref)
	local var7 = reactModule.useMemo(function() --[[ line: 22 ]]
		-- upvalues: createTiltLoadingScreenModelModule (copy), value (ref)
		return createTiltLoadingScreenModelModule(value)
	end, { value })
	local var8 = signalsReactModule.useSignalState(var7.getAssetInfo)
	local var9 = signalsReactModule.useSignalState(var7.getUniverseId)
	local var10 = signalsReactModule.useSignalState(var7.getFollowUserId)
	local var11 = signalsReactModule.useSignalState(var7.getIsAutoTranslated)
	local var12 = signalsReactModule.useSignalState(var7.getIsSubjectToChinaPolicies)
	local var13 = signalsReactModule.useSignalState(var7.getJoinState)
	local var14 = signalsReactModule.useSignalState(var7.getQueuePosition)
	local var15 = signalsReactModule.useSignalState(var7.getQueueTreatment)
	local var16 = signalsReactModule.useSignalState(var7.getServerStatusText)
	local var17 = useScreenSizeModule()
	local var18 = reactModule.useRef(var11)
	local var19 = reactModule.useRef(false)
	reactModule.useEffect(function() --[[ line: 38 ]]
		-- upvalues: var7 (ref)
		var7.start()
		
		return var7.destroy
	end, { var7 })
	var18.current = var11
	var19.current = not (fFlagAutoTranslateSkipZeroUniverseId and var9 <= 0)
	reactModule.useEffect(function() --[[ line: 44 ]]
		-- upvalues: var19 (ref), var18 (ref), loadingScreenTelemetryModule (copy)
		return function() --[[ line: 45 ]]
			-- upvalues: var19 (copy), var18 (copy), loadingScreenTelemetryModule (copy)
			if var19.current and var18.current == nil then
				loadingScreenTelemetryModule.countPlayerLocalizationChoiceNotReady()
			end
		end
	end, {})
	
	return {
		isMobile = math.min(var17.X, var17.Y) <= constantsModule.MOBILE_BREAKPOINT,
		gameData = reactModule.useMemo(function() --[[ line: 65 ]]
			-- upvalues: var8 (ref)
			return if var8 then {
				name = var8.name or "",
				creator = var8.creatorName or "",
				verified = var8.creatorHasVerifiedBadge == true
			} else nil
		end, { var8 }),
		thumbnailUrl = if var9 > 0 then string.format("rbxthumb://type=GameIcon&id=%d&w=256&h=256", var9) else "",
		isAutoTranslated = var11,
		statusPanel = {
			status = var13,
			statusText = var16,
			queuePosition = var14,
			queueTreatment = var15,
			followUserId = var10,
			isSubjectToChinaPolicies = var12,
			onAutoJoinNewServer = reactModule.useCallback(function() --[[ line: 56 ]]
				-- upvalues: var7 (ref)
				var7.launchExperience()
			end, { var7 }),
			onJoinNewServer = reactModule.useCallback(function(p0) --[[ line: 52 ]]
				-- upvalues: var7 (ref)
				var7.logQueuedStateButtonClick("JoinNewServer", p0)
				var7.launchExperience()
			end, { var7 }),
			onJoinTheLine = reactModule.useCallback(function(p1) --[[ line: 59 ]]
				-- upvalues: var7 (ref)
				var7.logQueuedStateButtonClick("JoinTheLine", p1)
			end, { var7 }),
			onShowConnectionHealth = reactModule.useCallback(function() --[[ line: 62 ]]
				-- upvalues: var7 (ref)
				var7.showConnectionHealth()
			end, { var7 })
		}
	}
end