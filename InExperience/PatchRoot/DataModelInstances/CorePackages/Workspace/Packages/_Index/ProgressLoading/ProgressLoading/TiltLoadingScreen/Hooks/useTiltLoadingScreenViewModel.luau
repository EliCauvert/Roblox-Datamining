local TiltLoadingScreen = script:FindFirstAncestor("TiltLoadingScreen")
local Parent = TiltLoadingScreen.Parent
local Parent1 = Parent.Parent
local ReactModule = require(Parent1.React)
local SignalsReactModule = require(Parent1.SignalsReact)
local ConstantsModule = require(TiltLoadingScreen.Constants)
local CreateTiltLoadingScreenModelModule = require(TiltLoadingScreen.Models.createTiltLoadingScreenModel)
local LoadingScreenTelemetryModule = require(Parent.LoadingScreenTelemetry)
local _ = require(TiltLoadingScreen.Types)

return function(p1, Vector, p2) --[[ Line: 18 | Named "useTiltLoadingScreenViewModel" ]]
	-- upvalues: ReactModule (copy), CreateTiltLoadingScreenModelModule (copy), SignalsReactModule (copy), LoadingScreenTelemetryModule (copy), ConstantsModule (copy)
	local UseMemoResult = ReactModule.useMemo(function() --[[ Line: 23 ]]
		-- upvalues: CreateTiltLoadingScreenModelModule (upval), p1 (copy), p2 (copy)
		return CreateTiltLoadingScreenModelModule(p1, nil, p2)
	end, { p1, p2 })
	local UseSignalStateResult = SignalsReactModule.useSignalState(UseMemoResult.getAssetInfo)
	local UseSignalStateResult1: number = SignalsReactModule.useSignalState(UseMemoResult.getUniverseId)
	local UseSignalStateResult2 = SignalsReactModule.useSignalState(UseMemoResult.getFollowUserId)
	local UseSignalStateResult3 = SignalsReactModule.useSignalState(UseMemoResult.getIsAutoTranslated)
	local UseSignalStateResult4 = SignalsReactModule.useSignalState(UseMemoResult.getIsSubjectToChinaPolicies)
	local UseSignalStateResult5 = SignalsReactModule.useSignalState(UseMemoResult.getJoinState)
	local UseSignalStateResult6 = SignalsReactModule.useSignalState(UseMemoResult.getQueuePosition)
	local UseSignalStateResult7 = SignalsReactModule.useSignalState(UseMemoResult.getQueueTreatment)
	local UseSignalStateResult8 = SignalsReactModule.useSignalState(UseMemoResult.getServerStatusText)
	local UseRefResult = ReactModule.useRef(UseSignalStateResult3)
	local UseRefResult1 = ReactModule.useRef(false)
	ReactModule.useEffect(function() --[[ Line: 38 ]]
		-- upvalues: UseMemoResult (copy)
		UseMemoResult.start()
		
		return UseMemoResult.destroy
	end, { UseMemoResult })
	UseRefResult.current = UseSignalStateResult3
	UseRefResult1.current = not (UseSignalStateResult1 <= 0)
	ReactModule.useEffect(function() --[[ Line: 44 ]]
		-- upvalues: UseRefResult1 (copy), UseRefResult (copy), LoadingScreenTelemetryModule (upval)
		return function() --[[ Line: 45 ]]
			-- upvalues: UseRefResult1 (upval), UseRefResult (upval), LoadingScreenTelemetryModule (upval)
			if UseRefResult1.current and UseRefResult.current == nil then
				LoadingScreenTelemetryModule.countPlayerLocalizationChoiceNotReady()
			end
		end
	end, {})
	
	return {
		isMobile = math.min(Vector.X, Vector.Y) <= ConstantsModule.MOBILE_BREAKPOINT,
		gameData = ReactModule.useMemo(function() --[[ Line: 65 ]]
			-- upvalues: UseSignalStateResult (copy)
			return if UseSignalStateResult then {
				name = UseSignalStateResult.name or "",
				creator = UseSignalStateResult.creatorName or "",
				verified = UseSignalStateResult.creatorHasVerifiedBadge == true
			} else nil
		end, { UseSignalStateResult }),
		thumbnailUrl = if UseSignalStateResult1 > 0 then string.format("rbxthumb://type=GameIcon&id=%d&w=256&h=256", UseSignalStateResult1) else "",
		isAutoTranslated = UseSignalStateResult3,
		statusPanel = {
			status = UseSignalStateResult5,
			statusText = UseSignalStateResult8,
			queuePosition = UseSignalStateResult6,
			queueTreatment = UseSignalStateResult7,
			followUserId = UseSignalStateResult2,
			isSubjectToChinaPolicies = UseSignalStateResult4,
			onAutoJoinNewServer = ReactModule.useCallback(function() --[[ Line: 56 ]]
				-- upvalues: UseMemoResult (copy)
				UseMemoResult.launchExperience()
			end, { UseMemoResult }),
			onJoinNewServer = ReactModule.useCallback(function(p3) --[[ Line: 52 ]]
				-- upvalues: UseMemoResult (copy)
				UseMemoResult.logQueuedStateButtonClick("JoinNewServer", p3)
				UseMemoResult.launchExperience()
			end, { UseMemoResult }),
			onJoinTheLine = ReactModule.useCallback(function(p3) --[[ Line: 59 ]]
				-- upvalues: UseMemoResult (copy)
				UseMemoResult.logQueuedStateButtonClick("JoinTheLine", p3)
			end, { UseMemoResult }),
			onShowConnectionHealth = ReactModule.useCallback(function() --[[ Line: 62 ]]
				-- upvalues: UseMemoResult (copy)
				UseMemoResult.showConnectionHealth()
			end, { UseMemoResult })
		}
	}
end