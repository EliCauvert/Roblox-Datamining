local moments = script:FindFirstAncestor("Moments")
local parent = moments.Parent
local reactModule = require(parent.React)
local useDispatch = require(parent.RoactUtils).Hooks.RoactRodux.useDispatch
local setTabBarVisible = require(parent.AppTabBarRodux).Actions.SetTabBarVisible
local analytics = require(parent.MomentsCommon).Analytics
local funnelEventNames = analytics.FunnelEventNames
local createGalleryCaptureSourceModule = require(moments.Capture.createGalleryCaptureSource)
local isStudioModule = require(parent.MomentsCommon.isStudio)
local hasGalleryApiModule = require(moments.Capture.hasGalleryApi)
local logCreationEntryResolvedModule = require(moments.Analytics.logCreationEntryResolved)
local fFlagMomentsCreationEntryOutcomeModule = require(moments.Flags.FFlagMomentsCreationEntryOutcome)

return function(p1)
	-- upvalues: reactModule (ref), useDispatch (ref), isStudioModule (ref), hasGalleryApiModule (ref), fFlagMomentsCreationEntryOutcomeModule (ref), analytics (ref), funnelEventNames (ref), logCreationEntryResolvedModule (ref), createGalleryCaptureSourceModule (ref), setTabBarVisible (ref)
	local var1, var2 = reactModule.useState(false)
	local var3, var4 = reactModule.useState(false)
	local var5 = reactModule.useRef(nil)
	local var6 = reactModule.useRef(false)
	local var7 = useDispatch()
	local var8 = if p1 ~= nil then p1.manageTabBarVisibility ~= false else true
	local var9 = isStudioModule() or not hasGalleryApiModule()
	local var10 = reactModule.useCallback(function()
		-- upvalues: fFlagMomentsCreationEntryOutcomeModule (copy), analytics (copy), funnelEventNames (copy), var9 (ref), var2 (ref), logCreationEntryResolvedModule (copy), var6 (ref), var5 (ref), createGalleryCaptureSourceModule (copy), var4 (ref)
		local var11 = if fFlagMomentsCreationEntryOutcomeModule then analytics.SessionManager.getSessionId(funnelEventNames.FunnelTypes.CreationFlow) else nil
		
		if var9 then
			var2(true)
			
			if fFlagMomentsCreationEntryOutcomeModule then
				logCreationEntryResolvedModule.log(logCreationEntryResolvedModule.Outcome.GalleryUnavailable, var11)
			end
			return
		elseif not var6.current then
			var6.current = true
			task.spawn(function()
				-- upvalues: var5 (copy), createGalleryCaptureSourceModule (copy), var6 (copy), var4 (copy), var2 (copy), fFlagMomentsCreationEntryOutcomeModule (copy), logCreationEntryResolvedModule (copy), var11 (ref)
				var5.current = createGalleryCaptureSourceModule(nil, function(p2, p3, p4)
					-- upvalues: var6 (copy), var4 (copy), var2 (copy), fFlagMomentsCreationEntryOutcomeModule (copy), logCreationEntryResolvedModule (copy), var11 (copy)
					var6.current = false
					
					if p3 and #p2 == 0 then
						var4(true)
					else
						var2(true)
					end
					if fFlagMomentsCreationEntryOutcomeModule then
						logCreationEntryResolvedModule.log(logCreationEntryResolvedModule.resolveGalleryOutcome(p3, #p2, p4), var11)
					end
				end)
			end)
			
			return
		elseif fFlagMomentsCreationEntryOutcomeModule then
			logCreationEntryResolvedModule.log(logCreationEntryResolvedModule.Outcome.RequestInFlight, var11)
		end
	end, { var9 })
	reactModule.useEffect(function()
		-- upvalues: var8 (ref), var1 (ref), var7 (ref), setTabBarVisible (copy)
		if var8 and var1 then
			var7(setTabBarVisible(false))
		end
		return function()
			-- upvalues: var8 (copy), var1 (copy), var7 (copy), setTabBarVisible (copy)
			if var8 and var1 then
				var7(setTabBarVisible(true))
			end
		end
	end, { var1, var7, var8 })
	
	return {
		isCreating = var1,
		showFtux = if var9 then false else var3,
		captureSource = if var9 then nil else var5.current,
		onCreatePressed = var10,
		onExitCreation = reactModule.useCallback(function()
			-- upvalues: var5 (ref), var2 (ref)
			var5.current = nil
			var2(false)
		end, {}),
		onExitFtux = reactModule.useCallback(function()
			-- upvalues: var5 (ref), var4 (ref)
			var5.current = nil
			var4(false)
		end, {})
	}
end