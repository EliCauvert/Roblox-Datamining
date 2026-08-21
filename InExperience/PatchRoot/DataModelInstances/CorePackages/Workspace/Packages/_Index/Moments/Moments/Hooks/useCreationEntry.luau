local moments = script:FindFirstAncestor("Moments")
local parent = moments.Parent
local reactModule = require(parent.React)
local useDispatch = require(parent.RoactUtils).Hooks.RoactRodux.useDispatch
local setTabBarVisible = require(parent.AppTabBarRodux).Actions.SetTabBarVisible
local createGalleryCaptureSourceModule = require(moments.Capture.createGalleryCaptureSource)
local isStudioModule = require(parent.MomentsCommon.isStudio)
local hasGalleryApiModule = require(moments.Capture.hasGalleryApi)

return function() --[[ line: 41 | named "useCreationEntry" ]]
	-- upvalues: reactModule (ref), useDispatch (ref), isStudioModule (ref), hasGalleryApiModule (ref), createGalleryCaptureSourceModule (ref), setTabBarVisible (ref)
	local var5, var6 = reactModule.useState(false)
	local var7, var8 = reactModule.useState(false)
	local var9 = reactModule.useRef(nil)
	local var10 = reactModule.useRef(false)
	local var11 = useDispatch()
	local var12 = isStudioModule() or not hasGalleryApiModule()
	local var13 = reactModule.useCallback(function() --[[ line: 53 ]]
		-- upvalues: var12 (ref), var6 (ref), var10 (ref), var9 (ref), createGalleryCaptureSourceModule (copy), var8 (ref)
		if var12 then
			var6(true)
			
			return
		elseif var10.current then
			return
		end
		var10.current = true
		task.spawn(function() --[[ line: 63 ]]
			-- upvalues: var9 (copy), createGalleryCaptureSourceModule (copy), var10 (copy), var8 (copy), var6 (copy)
			var9.current = createGalleryCaptureSourceModule(nil, function(p0, p1) --[[ line: 64 ]]
				-- upvalues: var10 (copy), var8 (copy), var6 (copy)
				var10.current = false
				
				if p1 and #p0 == 0 then
					var8(true)
					
					return
				end
				var6(true)
			end)
		end)
	end, { var12 })
	reactModule.useEffect(function() --[[ line: 75 ]]
		-- upvalues: var5 (ref), var11 (ref), setTabBarVisible (copy)
		if var5 then
			var11(setTabBarVisible(false))
		end
		return function() --[[ line: 79 ]]
			-- upvalues: var5 (copy), var11 (copy), setTabBarVisible (copy)
			if var5 then
				var11(setTabBarVisible(true))
			end
		end
	end, { var5, var11 })
	
	return {
		isCreating = var5,
		showFtux = if var12 then false else var7,
		captureSource = if var12 then nil else var9.current,
		onCreatePressed = var13,
		onExitCreation = reactModule.useCallback(function() --[[ line: 86 ]]
			-- upvalues: var9 (ref), var6 (ref)
			var9.current = nil
			var6(false)
		end, {}),
		onExitFtux = reactModule.useCallback(function() --[[ line: 91 ]]
			-- upvalues: var9 (ref), var8 (ref)
			var9.current = nil
			var8(false)
		end, {})
	}
end