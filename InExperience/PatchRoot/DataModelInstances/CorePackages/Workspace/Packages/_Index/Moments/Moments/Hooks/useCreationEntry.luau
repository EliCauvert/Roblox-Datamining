local Moments = script:FindFirstAncestor("Moments")
local Parent = Moments.Parent
local ReactModule = require(Parent.React)
local UseDispatchFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useDispatch
local SetTabBarVisibleFunction = require(Parent.AppTabBarRodux).Actions.SetTabBarVisible
local Analytics = require(Parent.MomentsCommon).Analytics
local FunnelEventNames = Analytics.FunnelEventNames
local CreateGalleryCaptureSourceModule = require(Moments.Capture.createGalleryCaptureSource)
local IsStudioModule = require(Parent.MomentsCommon.isStudio)
local HasGalleryApiModule = require(Moments.Capture.hasGalleryApi)
local LogCreationEntryResolvedModule = require(Moments.Analytics.logCreationEntryResolved)
local FFlagMomentsCreationEntryOutcomeModule = require(Moments.Flags.FFlagMomentsCreationEntryOutcome)

return function(p1)
	-- upvalues: ReactModule (copy), UseDispatchFunction (copy), IsStudioModule (copy), HasGalleryApiModule (copy), FFlagMomentsCreationEntryOutcomeModule (copy), Analytics (copy), FunnelEventNames (copy), LogCreationEntryResolvedModule (copy), CreateGalleryCaptureSourceModule (copy), SetTabBarVisibleFunction (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(false)
	local UseRefResult = ReactModule.useRef(nil)
	local UseRefResult1 = ReactModule.useRef(false)
	local UseDispatchResult = UseDispatchFunction()
	local v1: boolean = p1 == nil or p1.manageTabBarVisibility ~= false
	local IsStudioModule1 = IsStudioModule()
	local HasGalleryApiModule1 = HasGalleryApiModule()
	local IsStudioModule1_1 = IsStudioModule1 or not HasGalleryApiModule1
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: FFlagMomentsCreationEntryOutcomeModule (upval), Analytics (upval), FunnelEventNames (upval), IsStudioModule1_1 (copy), UseStateResult2 (copy), LogCreationEntryResolvedModule (upval), UseRefResult1 (copy), UseRefResult (copy), CreateGalleryCaptureSourceModule (upval), UseStateResult2_1 (copy)
		local SessionId = if FFlagMomentsCreationEntryOutcomeModule then Analytics.SessionManager.getSessionId(FunnelEventNames.FunnelTypes.CreationFlow) else nil
		
		if IsStudioModule1_1 then
			UseStateResult2(true)
			
			if FFlagMomentsCreationEntryOutcomeModule then
				LogCreationEntryResolvedModule.log(LogCreationEntryResolvedModule.Outcome.GalleryUnavailable, SessionId)
			end
			return
		elseif not UseRefResult1.current then
			UseRefResult1.current = true
			task.spawn(function()
				-- upvalues: UseRefResult (upval), CreateGalleryCaptureSourceModule (upval), UseRefResult1 (upval), UseStateResult2_1 (upval), UseStateResult2 (upval), FFlagMomentsCreationEntryOutcomeModule (upval), LogCreationEntryResolvedModule (upval), SessionId (copy)
				UseRefResult.current = CreateGalleryCaptureSourceModule(nil, function(p2, p3, p4)
					-- upvalues: UseRefResult1 (upval), UseStateResult2_1 (upval), UseStateResult2 (upval), FFlagMomentsCreationEntryOutcomeModule (upval), LogCreationEntryResolvedModule (upval), SessionId (upval)
					UseRefResult1.current = false
					
					if p3 and #p2 == 0 then
						UseStateResult2_1(true)
					else
						UseStateResult2(true)
					end
					if FFlagMomentsCreationEntryOutcomeModule then
						LogCreationEntryResolvedModule.log(LogCreationEntryResolvedModule.resolveGalleryOutcome(p3, #p2, p4), SessionId)
					end
				end)
			end)
			
			return
		else
			if FFlagMomentsCreationEntryOutcomeModule then
				LogCreationEntryResolvedModule.log(LogCreationEntryResolvedModule.Outcome.RequestInFlight, SessionId)
			end
		end
	end, { IsStudioModule1_1 })
	ReactModule.useEffect(function()
		-- upvalues: v1 (copy), UseStateResult (copy), UseDispatchResult (copy), SetTabBarVisibleFunction (upval)
		if v1 and UseStateResult then
			UseDispatchResult(SetTabBarVisibleFunction(false))
		end
		return function()
			-- upvalues: v1 (upval), UseStateResult (upval), UseDispatchResult (upval), SetTabBarVisibleFunction (upval)
			if v1 and UseStateResult then
				UseDispatchResult(SetTabBarVisibleFunction(true))
			end
		end
	end, { UseStateResult, UseDispatchResult, v1 })
	
	return {
		isCreating = UseStateResult,
		showFtux = not IsStudioModule1_1 and UseStateResult1,
		captureSource = if IsStudioModule1_1 then nil else UseRefResult.current,
		onCreatePressed = UseResult,
		onExitCreation = ReactModule.useCallback(function()
			-- upvalues: UseRefResult (copy), UseStateResult2 (copy)
			UseRefResult.current = nil
			UseStateResult2(false)
		end, {}),
		onExitFtux = ReactModule.useCallback(function()
			-- upvalues: UseRefResult (copy), UseStateResult2_1 (copy)
			UseRefResult.current = nil
			UseStateResult2_1(false)
		end, {})
	}
end