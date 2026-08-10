local experienceLoadingScript = script:FindFirstAncestor("ExperienceLoadingScript")
local parent = experienceLoadingScript.Parent
local experienceService = game:GetService("ExperienceService")
local httpService = game:GetService("HttpService")
local reactModule = require(parent.React)
local roactUtilsModule = require(parent.RoactUtils)
local useSelector = roactUtilsModule.Hooks.RoactRodux.useSelector
local useDispatch = roactUtilsModule.Hooks.RoactRodux.useDispatch
local responsiveModule = require(parent.Responsive)
local loggingProtocolModule = require(parent.LoggingProtocol)
local getGameProductInfoModule = require(experienceLoadingScript.Thunks.GetGameProductInfo)
local getIsSubjectToChinaPoliciesModule = require(experienceLoadingScript.Thunks.GetIsSubjectToChinaPolicies)
local getUniverseIdModule = require(experienceLoadingScript.Thunks.GetUniverseId)
local getFFlagReportFirstExperienceCancelledModule = require(experienceLoadingScript.Flags.GetFFlagReportFirstExperienceCancelled)
local requestInternalWrapper = require(parent.Http).NetworkLayers.requestInternalWrapper
local queueExperimentation = require(parent.SocialExperiments).QueueExperimentation
local progressLoadingModule = require(parent.ProgressLoading)
local loadingScreenView = progressLoadingModule.LoadingScreenView
local placeLauncherState = progressLoadingModule.PlaceLauncherState
local var12 = if require(parent.SharedFlags).FFlagAddAutoTranslateToLoadingScreen then progressLoadingModule.createNetworking else requestInternalWrapper(httpService)

return function(p0) --[[ line: 38 | named "LoadingScreenWrapper" ]]
	-- upvalues: useSelector (ref), useDispatch (ref), reactModule (ref), responsiveModule (ref), getUniverseIdModule (ref), var12 (ref), getGameProductInfoModule (ref), getIsSubjectToChinaPoliciesModule (ref), queueExperimentation (ref), experienceService (ref), placeLauncherState (ref), loadingScreenView (ref), getFFlagReportFirstExperienceCancelledModule (ref), loggingProtocolModule (ref)
	local var13 = useSelector(function(p1) --[[ line: 39 ]]
		-- upvalues: p0 (ref)
		return if p1.gameIds then p1.gameIds.placeId else p0.placeId
	end)
	local var14 = useSelector(function(p2) --[[ line: 42 ]]
		return if p2.gameIds then p2.gameIds.universeId else 0
	end)
	local var15 = useSelector(function(p3) --[[ line: 45 ]]
		return p3.productInfo
	end)
	local var16 = useSelector(function(p4) --[[ line: 48 ]]
		return p4.isSubjectToChinaPolicies
	end)
	local var17 = useDispatch()
	local var18, var19 = reactModule.useState(false)
	local var20 = reactModule.useRef(nil)
	var20.current = responsiveModule.usePreferredInput()
	reactModule.useEffect(function() --[[ line: 58 ]]
		-- upvalues: var17 (ref), getUniverseIdModule (copy), var12 (copy), var13 (ref), getGameProductInfoModule (copy), getIsSubjectToChinaPoliciesModule (copy)
		var17(getUniverseIdModule(var12, var13))
		var17(getGameProductInfoModule(var13))
		var17(getIsSubjectToChinaPoliciesModule())
	end, { var13, var17 })
	reactModule.useEffect(function() --[[ line: 65 ]]
		-- upvalues: var19 (ref)
		local loadedConnection = game.Loaded:Connect(function() --[[ line: 66 ]]
			-- upvalues: var19 (copy)
			var19(true)
		end)
		
		return function() --[[ line: 69 ]]
			-- upvalues: loadedConnection (ref)
			loadedConnection:Disconnect()
		end
	end, {})
	reactModule.useEffect(function() --[[ line: 75 ]]
		-- upvalues: queueExperimentation (copy), experienceService (copy), var13 (ref), placeLauncherState (copy)
		if not queueExperimentation.isInExperiment() or experienceService:GetFollowUserId() <= 0 or var13 <= 0 then return end
		if experienceService:GetPlaceJoinState() == placeLauncherState.Queued then
			queueExperimentation.logExposure()
			
			return
		end
		local placeJoinStateChangedConnection = experienceService.PlaceJoinStateChanged:Connect(function(p5) --[[ line: 83 ]]
			-- upvalues: placeLauncherState (copy), queueExperimentation (copy)
			if p5 == placeLauncherState.Queued then
				queueExperimentation.logExposure()
			end
		end)
		
		return function() --[[ line: 88 ]]
			-- upvalues: placeJoinStateChangedConnection (ref)
			placeJoinStateChangedConnection:Disconnect()
		end
	end, { var13 })
	
	return reactModule.createElement(loadingScreenView, {
		manageRobloxGuiFocus = true,
		placeId = var13,
		universeId = var14,
		productInfo = var15,
		isSubjectToChinaPolicies = var16,
		preferredInputRef = var20,
		shouldStartFadeOut = var18,
		onCloseButtonActivated = function() --[[ line: 101 ]]
			-- upvalues: getFFlagReportFirstExperienceCancelledModule (copy), loggingProtocolModule (copy)
			if getFFlagReportFirstExperienceCancelledModule then
				loggingProtocolModule.default:logEventOnce("first_experience_cancelled")
			end
			game:Shutdown()
		end,
		onGamepadCancel = function() --[[ line: 107 ]]
			if not game:IsLoaded() then
				game:Shutdown()
			end
		end
	})
end