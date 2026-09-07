local moments = script:FindFirstAncestor("Moments")
local parent = moments.Parent
local reactModule = require(parent.React)
local useDispatch = require(parent.RoactUtils).Hooks.RoactRodux.useDispatch
local setTabBarVisible = require(parent.AppTabBarRodux).Actions.SetTabBarVisible
local createGalleryCaptureSourceModule = require(moments.Capture.createGalleryCaptureSource)
local isStudioModule = require(parent.MomentsCommon.isStudio)
local hasGalleryApiModule = require(moments.Capture.hasGalleryApi)

return function(p1)
	-- upvalues: reactModule (ref), useDispatch (ref), isStudioModule (ref), hasGalleryApiModule (ref), createGalleryCaptureSourceModule (ref), setTabBarVisible (ref)
	local var1, var2 = reactModule.useState(false)
	local var3, var4 = reactModule.useState(false)
	local var5 = reactModule.useRef(nil)
	local var6 = reactModule.useRef(false)
	local var7 = useDispatch()
	local var8 = if p1 ~= nil then p1.manageTabBarVisibility ~= false else true
	local var9 = isStudioModule() or not hasGalleryApiModule()
	local var10 = reactModule.useCallback(function()
		-- upvalues: var9 (ref), var2 (ref), var6 (ref), var5 (ref), createGalleryCaptureSourceModule (copy), var4 (ref)
		if var9 then
			var2(true)
			
			return
		elseif var6.current then
			return
		end
		var6.current = true
		task.spawn(function()
			-- upvalues: var5 (copy), createGalleryCaptureSourceModule (copy), var6 (copy), var4 (copy), var2 (copy)
			var5.current = createGalleryCaptureSourceModule(nil, function(p2, p3)
				-- upvalues: var6 (copy), var4 (copy), var2 (copy)
				var6.current = false
				
				if p3 and #p2 == 0 then
					var4(true)
					
					return
				end
				var2(true)
			end)
		end)
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