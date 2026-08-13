local experienceLoadingScript = script:FindFirstAncestor("ExperienceLoadingScript")
local parent = experienceLoadingScript.Parent
local experienceService = game:GetService("ExperienceService")
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
local queueExperimentation = require(parent.SocialExperiments).QueueExperimentation
local progressLoadingModule = require(parent.ProgressLoading)
local loadingScreenView = progressLoadingModule.LoadingScreenView
local placeLauncherState = progressLoadingModule.PlaceLauncherState
local createNetworking = progressLoadingModule.createNetworking

return function(p0) --[[ line: 33 | named "LoadingScreenWrapper" ]]
	-- upvalues: useSelector (ref), useDispatch (ref), reactModule (ref), responsiveModule (ref), getUniverseIdModule (ref), createNetworking (ref), getGameProductInfoModule (ref), getIsSubjectToChinaPoliciesModule (ref), queueExperimentation (ref), experienceService (ref), placeLauncherState (ref), loadingScreenView (ref), getFFlagReportFirstExperienceCancelledModule (ref), loggingProtocolModule (ref)
	local var11 = useSelector(function(p1) --[[ line: 34 ]]
		-- upvalues: p0 (ref)
		return if p1.gameIds then p1.gameIds.placeId else p0.placeId
	end)
	local var12 = useSelector(function(p2) --[[ line: 37 ]]
		return if p2.gameIds then p2.gameIds.universeId else 0
	end)
	local var13 = useSelector(function(p3) --[[ line: 40 ]]
		return p3.productInfo
	end)
	local var14 = useSelector(function(p4) --[[ line: 43 ]]
		return p4.isSubjectToChinaPolicies
	end)
	local var15 = useDispatch()
	local var16, var17 = reactModule.useState(false)
	local var18 = reactModule.useRef(nil)
	var18.current = responsiveModule.usePreferredInput()
	reactModule.useEffect(function() --[[ line: 53 ]]
		-- upvalues: var15 (ref), getUniverseIdModule (copy), createNetworking (copy), var11 (ref), getGameProductInfoModule (copy), getIsSubjectToChinaPoliciesModule (copy)
		var15(getUniverseIdModule(createNetworking, var11))
		var15(getGameProductInfoModule(var11))
		var15(getIsSubjectToChinaPoliciesModule())
	end, { var11, var15 })
	reactModule.useEffect(function() --[[ line: 60 ]]
		-- upvalues: var17 (ref)
		local loadedConnection = game.Loaded:Connect(function() --[[ line: 61 ]]
			-- upvalues: var17 (copy)
			var17(true)
		end)
		
		return function() --[[ line: 64 ]]
			-- upvalues: loadedConnection (ref)
			loadedConnection:Disconnect()
		end
	end, {})
	reactModule.useEffect(function() --[[ line: 70 ]]
		-- upvalues: queueExperimentation (copy), experienceService (copy), var11 (ref), placeLauncherState (copy)
		if not queueExperimentation.isInExperiment() or experienceService:GetFollowUserId() <= 0 or var11 <= 0 then return end
		if experienceService:GetPlaceJoinState() == placeLauncherState.Queued then
			queueExperimentation.logExposure()
			
			return
		end
		local placeJoinStateChangedConnection = experienceService.PlaceJoinStateChanged:Connect(function(p5) --[[ line: 78 ]]
			-- upvalues: placeLauncherState (copy), queueExperimentation (copy)
			if p5 == placeLauncherState.Queued then
				queueExperimentation.logExposure()
			end
		end)
		
		return function() --[[ line: 83 ]]
			-- upvalues: placeJoinStateChangedConnection (ref)
			placeJoinStateChangedConnection:Disconnect()
		end
	end, { var11 })
	
	return reactModule.createElement(loadingScreenView, {
		manageRobloxGuiFocus = true,
		placeId = var11,
		universeId = var12,
		productInfo = var13,
		isSubjectToChinaPolicies = var14,
		preferredInputRef = var18,
		shouldStartFadeOut = var16,
		onCloseButtonActivated = function() --[[ line: 96 ]]
			-- upvalues: getFFlagReportFirstExperienceCancelledModule (copy), loggingProtocolModule (copy)
			if getFFlagReportFirstExperienceCancelledModule then
				loggingProtocolModule.default:logEventOnce("first_experience_cancelled")
			end
			game:Shutdown()
		end,
		onGamepadCancel = function() --[[ line: 102 ]]
			if not game:IsLoaded() then
				game:Shutdown()
			end
		end
	})
end