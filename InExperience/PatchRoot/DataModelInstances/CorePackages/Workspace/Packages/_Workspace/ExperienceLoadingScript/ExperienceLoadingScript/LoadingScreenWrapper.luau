local ExperienceLoadingScript = script:FindFirstAncestor("ExperienceLoadingScript")
local Parent = ExperienceLoadingScript.Parent
local ExperienceService = game:GetService("ExperienceService")
local ReactModule = require(Parent.React)
local RoactUtilsModule = require(Parent.RoactUtils)
local UseSelectorFunction = RoactUtilsModule.Hooks.RoactRodux.useSelector
local UseDispatchFunction = RoactUtilsModule.Hooks.RoactRodux.useDispatch
local ResponsiveModule = require(Parent.Responsive)
local LoggingProtocolModule = require(Parent.LoggingProtocol)
local GetGameProductInfoModule = require(ExperienceLoadingScript.Thunks.GetGameProductInfo)
local GetIsSubjectToChinaPoliciesModule = require(ExperienceLoadingScript.Thunks.GetIsSubjectToChinaPolicies)
local GetUniverseIdModule = require(ExperienceLoadingScript.Thunks.GetUniverseId)
local GetFFlagReportFirstExperienceCancelledModule = require(ExperienceLoadingScript.Flags.GetFFlagReportFirstExperienceCancelled)
local QueueExperimentation = require(Parent.SocialExperiments).QueueExperimentation
local ProgressLoadingModule = require(Parent.ProgressLoading)
local LoadingScreenView = ProgressLoadingModule.LoadingScreenView
local PlaceLauncherState = ProgressLoadingModule.PlaceLauncherState
local CreateNetworking = ProgressLoadingModule.createNetworking

return function(p1) --[[ Line: 33 | Named "LoadingScreenWrapper" ]]
	-- upvalues: UseSelectorFunction (copy), UseDispatchFunction (copy), ReactModule (copy), ResponsiveModule (copy), GetUniverseIdModule (copy), CreateNetworking (copy), GetGameProductInfoModule (copy), GetIsSubjectToChinaPoliciesModule (copy), QueueExperimentation (copy), ExperienceService (copy), PlaceLauncherState (copy), LoadingScreenView (copy), GetFFlagReportFirstExperienceCancelledModule (copy), LoggingProtocolModule (copy)
	local UseSelectorResult = UseSelectorFunction(function(p2) --[[ Line: 34 ]]
		-- upvalues: p1 (copy)
		return p2.gameIds and p2.gameIds.placeId or p1.placeId
	end)
	local UseSelectorResult1 = UseSelectorFunction(function(p2) --[[ Line: 37 ]]
		return p2.gameIds and p2.gameIds.universeId or 0
	end)
	local UseSelectorResult2 = UseSelectorFunction(function(p2) --[[ Line: 40 ]]
		return p2.productInfo
	end)
	local UseSelectorResult3 = UseSelectorFunction(function(p2) --[[ Line: 43 ]]
		return p2.isSubjectToChinaPolicies
	end)
	local UseDispatchResult = UseDispatchFunction()
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	local UseRefResult = ReactModule.useRef(nil)
	UseRefResult.current = ResponsiveModule.usePreferredInput()
	ReactModule.useEffect(function() --[[ Line: 53 ]]
		-- upvalues: UseDispatchResult (copy), GetUniverseIdModule (upval), CreateNetworking (upval), UseSelectorResult (copy), GetGameProductInfoModule (upval), GetIsSubjectToChinaPoliciesModule (upval)
		UseDispatchResult(GetUniverseIdModule(CreateNetworking, UseSelectorResult))
		UseDispatchResult(GetGameProductInfoModule(UseSelectorResult))
		UseDispatchResult(GetIsSubjectToChinaPoliciesModule())
	end, { UseSelectorResult, UseDispatchResult })
	ReactModule.useEffect(function() --[[ Line: 60 ]]
		-- upvalues: UseStateResult2 (copy)
		local LoadedConnection = game.Loaded:Connect(function() --[[ Line: 61 ]]
			-- upvalues: UseStateResult2 (upval)
			UseStateResult2(true)
		end)
		
		return function() --[[ Line: 64 ]]
			-- upvalues: LoadedConnection (copy)
			LoadedConnection:Disconnect()
		end
	end, {})
	ReactModule.useEffect(function() --[[ Line: 70 ]]
		-- upvalues: QueueExperimentation (upval), ExperienceService (upval), UseSelectorResult (copy), PlaceLauncherState (upval)
		if not QueueExperimentation.isInExperiment() or ExperienceService:GetFollowUserId() <= 0 or UseSelectorResult <= 0 then return end
		if ExperienceService:GetPlaceJoinState() == PlaceLauncherState.Queued then
			QueueExperimentation.logExposure()
			
			return
		end
		local PlaceJoinStateChangedConnection = ExperienceService.PlaceJoinStateChanged:Connect(function(Queued) --[[ Line: 78 ]]
			-- upvalues: PlaceLauncherState (upval), QueueExperimentation (upval)
			if Queued == PlaceLauncherState.Queued then
				QueueExperimentation.logExposure()
			end
		end)
		
		return function() --[[ Line: 83 ]]
			-- upvalues: PlaceJoinStateChangedConnection (copy)
			PlaceJoinStateChangedConnection:Disconnect()
		end
	end, { UseSelectorResult })
	
	return ReactModule.createElement(LoadingScreenView, {
		manageRobloxGuiFocus = true,
		placeId = UseSelectorResult,
		universeId = UseSelectorResult1,
		productInfo = UseSelectorResult2,
		isSubjectToChinaPolicies = UseSelectorResult3,
		preferredInputRef = UseRefResult,
		shouldStartFadeOut = UseStateResult,
		onCloseButtonActivated = function() --[[ Line: 96 ]]
			-- upvalues: GetFFlagReportFirstExperienceCancelledModule (upval), LoggingProtocolModule (upval)
			if GetFFlagReportFirstExperienceCancelledModule then
				LoggingProtocolModule.default:logEventOnce("first_experience_cancelled")
			end
			game:Shutdown()
		end,
		onGamepadCancel = function() --[[ Line: 102 ]]
			if not game:IsLoaded() then
				game:Shutdown()
			end
		end
	})
end