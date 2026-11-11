local Moments = script:FindFirstAncestor("Moments")
local Parent = Moments.Parent
local ReactModule = require(Parent.React)
local UseDispatchFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useDispatch
local SetTabBarVisibleFunction = require(Parent.AppTabBarRodux).Actions.SetTabBarVisible
local CreateGalleryCaptureSourceModule = require(Moments.Capture.createGalleryCaptureSource)
local IsStudioModule = require(Parent.MomentsCommon.isStudio)
local HasGalleryApiModule = require(Moments.Capture.hasGalleryApi)

return function()
	-- upvalues: ReactModule (copy), UseDispatchFunction (copy), IsStudioModule (copy), HasGalleryApiModule (copy), CreateGalleryCaptureSourceModule (copy), SetTabBarVisibleFunction (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(false)
	local UseRefResult = ReactModule.useRef(nil)
	local UseRefResult1 = ReactModule.useRef(false)
	local UseDispatchResult = UseDispatchFunction()
	local IsStudioModule1 = IsStudioModule()
	local HasGalleryApiModule1 = HasGalleryApiModule()
	local IsStudioModule1_1 = IsStudioModule1 or not HasGalleryApiModule1
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: IsStudioModule1_1 (copy), UseStateResult2 (copy), UseRefResult1 (copy), UseRefResult (copy), CreateGalleryCaptureSourceModule (upval), UseStateResult2_1 (copy)
		if IsStudioModule1_1 then
			UseStateResult2(true)
			
			return
		end
		if not UseRefResult1.current then
			UseRefResult1.current = true
			task.spawn(function()
				-- upvalues: UseRefResult (upval), CreateGalleryCaptureSourceModule (upval), UseRefResult1 (upval), UseStateResult2_1 (upval), UseStateResult2 (upval)
				UseRefResult.current = CreateGalleryCaptureSourceModule(nil, function(p1, p2)
					-- upvalues: UseRefResult1 (upval), UseStateResult2_1 (upval), UseStateResult2 (upval)
					UseRefResult1.current = false
					
					if p2 and #p1 == 0 then
						UseStateResult2_1(true)
						
						return
					else
						UseStateResult2(true)
					end
				end)
			end)
			
			return
		end
	end, { IsStudioModule1_1 })
	ReactModule.useEffect(function()
		-- upvalues: UseStateResult (copy), UseDispatchResult (copy), SetTabBarVisibleFunction (upval)
		if UseStateResult then
			UseDispatchResult(SetTabBarVisibleFunction(false))
		end
		return function()
			-- upvalues: UseStateResult (upval), UseDispatchResult (upval), SetTabBarVisibleFunction (upval)
			if UseStateResult then
				UseDispatchResult(SetTabBarVisibleFunction(true))
			end
		end
	end, { UseStateResult, UseDispatchResult })
	
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