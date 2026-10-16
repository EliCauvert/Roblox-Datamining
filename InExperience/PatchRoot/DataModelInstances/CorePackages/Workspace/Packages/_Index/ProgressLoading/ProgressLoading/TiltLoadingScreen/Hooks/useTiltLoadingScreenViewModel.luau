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

return function(value)
	-- upvalues: reactModule (ref), createTiltLoadingScreenModelModule (ref), signalsReactModule (ref), useScreenSizeModule (ref), loadingScreenTelemetryModule (ref), constantsModule (ref)
	local var1 = reactModule.useMemo(function()
		-- upvalues: createTiltLoadingScreenModelModule (copy), value (ref)
		return createTiltLoadingScreenModelModule(value)
	end, { value })
	local var2 = signalsReactModule.useSignalState(var1.getAssetInfo)
	local var3 = signalsReactModule.useSignalState(var1.getUniverseId)
	local var4 = signalsReactModule.useSignalState(var1.getFollowUserId)
	local var5 = signalsReactModule.useSignalState(var1.getIsAutoTranslated)
	local var6 = signalsReactModule.useSignalState(var1.getIsSubjectToChinaPolicies)
	local var7 = signalsReactModule.useSignalState(var1.getJoinState)
	local var8 = signalsReactModule.useSignalState(var1.getQueuePosition)
	local var9 = signalsReactModule.useSignalState(var1.getQueueTreatment)
	local var10 = signalsReactModule.useSignalState(var1.getServerStatusText)
	local var11 = useScreenSizeModule()
	local var12 = reactModule.useRef(var5)
	local var13 = reactModule.useRef(false)
	reactModule.useEffect(function()
		-- upvalues: var1 (ref)
		var1.start()
		
		return var1.destroy
	end, { var1 })
	var12.current = var5
	var13.current = not (var3 <= 0)
	reactModule.useEffect(function()
		-- upvalues: var13 (ref), var12 (ref), loadingScreenTelemetryModule (copy)
		return function()
			-- upvalues: var13 (copy), var12 (copy), loadingScreenTelemetryModule (copy)
			if var13.current and var12.current == nil then
				loadingScreenTelemetryModule.countPlayerLocalizationChoiceNotReady()
			end
		end
	end, {})
	
	return {
		isMobile = math.min(var11.X, var11.Y) <= constantsModule.MOBILE_BREAKPOINT,
		gameData = reactModule.useMemo(function()
			-- upvalues: var2 (ref)
			return if var2 then {
				name = var2.name or "",
				creator = var2.creatorName or "",
				verified = var2.creatorHasVerifiedBadge == true
			} else nil
		end, { var2 }),
		thumbnailUrl = if var3 > 0 then string.format("rbxthumb://type=GameIcon&id=%d&w=256&h=256", var3) else "",
		isAutoTranslated = var5,
		statusPanel = {
			status = var7,
			statusText = var10,
			queuePosition = var8,
			queueTreatment = var9,
			followUserId = var4,
			isSubjectToChinaPolicies = var6,
			onAutoJoinNewServer = reactModule.useCallback(function()
				-- upvalues: var1 (ref)
				var1.launchExperience()
			end, { var1 }),
			onJoinNewServer = reactModule.useCallback(function(p1)
				-- upvalues: var1 (ref)
				var1.logQueuedStateButtonClick("JoinNewServer", p1)
				var1.launchExperience()
			end, { var1 }),
			onJoinTheLine = reactModule.useCallback(function(p1)
				-- upvalues: var1 (ref)
				var1.logQueuedStateButtonClick("JoinTheLine", p1)
			end, { var1 }),
			onShowConnectionHealth = reactModule.useCallback(function()
				-- upvalues: var1 (ref)
				var1.showConnectionHealth()
			end, { var1 })
		}
	}
end