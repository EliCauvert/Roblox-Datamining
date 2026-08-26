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

return function(p1)
	-- upvalues: useSelector (ref), useDispatch (ref), reactModule (ref), responsiveModule (ref), getUniverseIdModule (ref), createNetworking (ref), getGameProductInfoModule (ref), getIsSubjectToChinaPoliciesModule (ref), queueExperimentation (ref), experienceService (ref), placeLauncherState (ref), loadingScreenView (ref), getFFlagReportFirstExperienceCancelledModule (ref), loggingProtocolModule (ref)
	local var1 = useSelector(function(p2)
		-- upvalues: p1 (ref)
		return if p2.gameIds then p2.gameIds.placeId else p1.placeId
	end)
	local var2 = useSelector(function(p2)
		return if p2.gameIds then p2.gameIds.universeId else 0
	end)
	local var3 = useSelector(function(p2)
		return p2.productInfo
	end)
	local var4 = useSelector(function(p2)
		return p2.isSubjectToChinaPolicies
	end)
	local var5 = useDispatch()
	local var6, var7 = reactModule.useState(false)
	local var8 = reactModule.useRef(nil)
	var8.current = responsiveModule.usePreferredInput()
	reactModule.useEffect(function()
		-- upvalues: var5 (ref), getUniverseIdModule (copy), createNetworking (copy), var1 (ref), getGameProductInfoModule (copy), getIsSubjectToChinaPoliciesModule (copy)
		var5(getUniverseIdModule(createNetworking, var1))
		var5(getGameProductInfoModule(var1))
		var5(getIsSubjectToChinaPoliciesModule())
	end, { var1, var5 })
	reactModule.useEffect(function()
		-- upvalues: var7 (ref)
		local loadedConnection = game.Loaded:Connect(function()
			-- upvalues: var7 (copy)
			var7(true)
		end)
		
		return function()
			-- upvalues: loadedConnection (ref)
			loadedConnection:Disconnect()
		end
	end, {})
	reactModule.useEffect(function()
		-- upvalues: queueExperimentation (copy), experienceService (copy), var1 (ref), placeLauncherState (copy)
		if not queueExperimentation.isInExperiment() or experienceService:GetFollowUserId() <= 0 or var1 <= 0 then return end
		if experienceService:GetPlaceJoinState() == placeLauncherState.Queued then
			queueExperimentation.logExposure()
			
			return
		end
		local placeJoinStateChangedConnection = experienceService.PlaceJoinStateChanged:Connect(function(p2)
			-- upvalues: placeLauncherState (copy), queueExperimentation (copy)
			if p2 == placeLauncherState.Queued then
				queueExperimentation.logExposure()
			end
		end)
		
		return function()
			-- upvalues: placeJoinStateChangedConnection (ref)
			placeJoinStateChangedConnection:Disconnect()
		end
	end, { var1 })
	
	return reactModule.createElement(loadingScreenView, {
		manageRobloxGuiFocus = true,
		placeId = var1,
		universeId = var2,
		productInfo = var3,
		isSubjectToChinaPolicies = var4,
		preferredInputRef = var8,
		shouldStartFadeOut = var6,
		onCloseButtonActivated = function()
			-- upvalues: getFFlagReportFirstExperienceCancelledModule (copy), loggingProtocolModule (copy)
			if getFFlagReportFirstExperienceCancelledModule then
				loggingProtocolModule.default:logEventOnce("first_experience_cancelled")
			end
			game:Shutdown()
		end,
		onGamepadCancel = function()
			if not game:IsLoaded() then
				game:Shutdown()
			end
		end
	})
end