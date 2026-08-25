local moments = script:FindFirstAncestor("Moments")
local parent = moments.Parent
local reactModule = require(parent.React)
local useDispatch = require(parent.RoactUtils).Hooks.RoactRodux.useDispatch
local setTabBarVisible = require(parent.AppTabBarRodux).Actions.SetTabBarVisible
local createGalleryCaptureSourceModule = require(moments.Capture.createGalleryCaptureSource)
local isStudioModule = require(parent.MomentsCommon.isStudio)
local hasGalleryApiModule = require(moments.Capture.hasGalleryApi)

return function(p0)
	-- upvalues: reactModule (ref), useDispatch (ref), isStudioModule (ref), hasGalleryApiModule (ref), createGalleryCaptureSourceModule (ref), setTabBarVisible (ref)
	local var5, var6 = reactModule.useState(false)
	local var7, var8 = reactModule.useState(false)
	local var9 = reactModule.useRef(nil)
	local var10 = reactModule.useRef(false)
	local var11 = useDispatch()
	local var12 = if p0 ~= nil then p0.manageTabBarVisibility ~= false else true
	local var13 = isStudioModule() or not hasGalleryApiModule()
	local var14 = reactModule.useCallback(function()
		-- upvalues: var13 (ref), var6 (ref), var10 (ref), var9 (ref), createGalleryCaptureSourceModule (copy), var8 (ref)
		if var13 then
			var6(true)
			
			return
		elseif var10.current then
			return
		end
		var10.current = true
		task.spawn(function()
			-- upvalues: var9 (copy), createGalleryCaptureSourceModule (copy), var10 (copy), var8 (copy), var6 (copy)
			var9.current = createGalleryCaptureSourceModule(nil, function(p1, p2)
				-- upvalues: var10 (copy), var8 (copy), var6 (copy)
				var10.current = false
				
				if p2 and #p1 == 0 then
					var8(true)
					
					return
				end
				var6(true)
			end)
		end)
	end, { var13 })
	reactModule.useEffect(function()
		-- upvalues: var12 (ref), var5 (ref), var11 (ref), setTabBarVisible (copy)
		if var12 and var5 then
			var11(setTabBarVisible(false))
		end
		return function()
			-- upvalues: var12 (copy), var5 (copy), var11 (copy), setTabBarVisible (copy)
			if var12 and var5 then
				var11(setTabBarVisible(true))
			end
		end
	end, { var5, var11, var12 })
	
	return {
		isCreating = var5,
		showFtux = if var13 then false else var7,
		captureSource = if var13 then nil else var9.current,
		onCreatePressed = var14,
		onExitCreation = reactModule.useCallback(function()
			-- upvalues: var9 (ref), var6 (ref)
			var9.current = nil
			var6(false)
		end, {}),
		onExitFtux = reactModule.useCallback(function()
			-- upvalues: var9 (ref), var8 (ref)
			var9.current = nil
			var8(false)
		end, {})
	}
end