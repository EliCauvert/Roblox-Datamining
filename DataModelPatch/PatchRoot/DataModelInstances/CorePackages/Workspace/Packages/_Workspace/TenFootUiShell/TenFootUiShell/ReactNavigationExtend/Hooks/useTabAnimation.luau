local TenFootUiShell = script:FindFirstAncestor("TenFootUiShell")
local Parent = TenFootUiShell.Parent
local ReactModule = require(Parent.React)
local ReactOtterModule = require(Parent.ReactOtter)
local ConstantsModule = require(TenFootUiShell.ReactNavigationExtend.Views.Constants)
local TenFootUiSceneModule = require(TenFootUiShell.Hooks.TenFootUiScene)
local TabAnimationStateEnumModule = require(script.Parent.TabAnimationStateEnum)
local UseCameraFacingGeometryFunction = require(Parent.SceneManagement).useCameraFacingGeometry

local function _(TabOpened, p1)
	-- upvalues: TabAnimationStateEnumModule (copy)
	local IsTabOpenedMatch: boolean = TabOpened == TabAnimationStateEnumModule.TabOpening or TabOpened == TabAnimationStateEnumModule.TabOpened
	
	local function _(p2)
		-- upvalues: p1 (copy), IsTabOpenedMatch (copy)
		return if p1 == 0 then 0 elseif IsTabOpenedMatch then if p1 < 0 then -p2 else p2 elseif p1 < 0 then p2 else -p2
	end
	
	return function(p2): CFrame
		-- upvalues: p1 (copy), IsTabOpenedMatch (copy)
		local ScaledStep = (1 - p2.step) * (p2.viewportFillDimensions.X * 0.3333)
		
		return CFrame.new(if p1 == 0 then 0 elseif IsTabOpenedMatch then if p1 < 0 then -ScaledStep else ScaledStep elseif p1 < 0 then ScaledStep else -ScaledStep, 0, 0)
	end
end

local function useAnimationState(IsActiveTab)
	-- upvalues: ReactModule (copy), TabAnimationStateEnumModule (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(TabAnimationStateEnumModule.TabClosed)
	ReactModule.useEffect(function()
		-- upvalues: UseStateResult2 (copy), IsActiveTab (copy), TabAnimationStateEnumModule (upval)
		UseStateResult2(function(TabClosed)
			-- upvalues: IsActiveTab (upval), TabAnimationStateEnumModule (upval)
			return if IsActiveTab and (TabClosed == TabAnimationStateEnumModule.TabClosed or TabClosed == TabAnimationStateEnumModule.TabClosing) then TabAnimationStateEnumModule.TabOpening elseif IsActiveTab or TabClosed ~= TabAnimationStateEnumModule.TabOpened and TabClosed ~= TabAnimationStateEnumModule.TabOpening then TabClosed else TabAnimationStateEnumModule.TabClosing
		end)
	end, { IsActiveTab })
	
	return UseStateResult, UseStateResult2
end

return function(p1)
	-- upvalues: useAnimationState (copy), UseCameraFacingGeometryFunction (copy), ConstantsModule (copy), ReactModule (copy), TabAnimationStateEnumModule (copy), ReactOtterModule (copy), TenFootUiSceneModule (copy)
	local CurrentTabIndex = p1.currentTabIndex
	local CurrentTabIndexDelta = CurrentTabIndex - p1.previousTabIndex
	local UseAnimationStateResult, UseAnimationStateResult2 = useAnimationState(p1.isActiveTab)
	local UseCameraFacingGeometryResult = UseCameraFacingGeometryFunction(ConstantsModule.DEFAULT_SCREEN_DISTANCE_TO_CAMERA)
	local UseAnimatedBindingResult, UseAnimatedBindingResult2 = ReactOtterModule.useAnimatedBinding(0, (ReactModule.useCallback(function()
		-- upvalues: UseAnimationStateResult2 (copy), TabAnimationStateEnumModule (upval)
		UseAnimationStateResult2(function(TabClosing)
			-- upvalues: TabAnimationStateEnumModule (upval)
			return if TabClosing == TabAnimationStateEnumModule.TabOpening then TabAnimationStateEnumModule.TabOpened elseif TabClosing == TabAnimationStateEnumModule.TabClosing then TabAnimationStateEnumModule.TabClosed else TabClosing
		end)
	end, {})))
	ReactModule.useEffect(function()
		-- upvalues: UseAnimationStateResult (copy), TabAnimationStateEnumModule (upval), UseAnimatedBindingResult2 (copy), ReactOtterModule (upval), ConstantsModule (upval)
		if UseAnimationStateResult == TabAnimationStateEnumModule.TabOpening then
			UseAnimatedBindingResult2(ReactOtterModule.spring(1, ConstantsModule.X_DIRECTION_ANIMATION_SPRING_CONFIG))
			
			return
		end
		if UseAnimationStateResult == TabAnimationStateEnumModule.TabClosing then
			UseAnimatedBindingResult2(ReactOtterModule.spring(0, ConstantsModule.X_DIRECTION_ANIMATION_SPRING_CONFIG))
		end
	end, { UseAnimationStateResult })
	ReactModule.useEffect(function()
		-- upvalues: UseAnimationStateResult (copy), TabAnimationStateEnumModule (upval), UseCameraFacingGeometryResult (copy), CurrentTabIndex (copy), TenFootUiSceneModule (upval)
		if UseAnimationStateResult == TabAnimationStateEnumModule.TabOpening or UseAnimationStateResult == TabAnimationStateEnumModule.TabOpened then
			TenFootUiSceneModule.updateXPosition(-(UseCameraFacingGeometryResult.viewportFillDimensions:getValue().X * 0.1634 * (CurrentTabIndex - 1)))
		end
	end, {
		UseAnimationStateResult,
		UseCameraFacingGeometryResult.viewportFillDimensions,
		CurrentTabIndex
	})
	
	return ReactModule.useMemo(function()
		-- upvalues: UseAnimationStateResult (copy), CurrentTabIndexDelta (copy), TabAnimationStateEnumModule (upval), ReactModule (upval), UseAnimatedBindingResult (copy), UseCameraFacingGeometryResult (copy)
		local IsUseAnimationStateResultMatch: boolean = UseAnimationStateResult == TabAnimationStateEnumModule.TabOpening or UseAnimationStateResult == TabAnimationStateEnumModule.TabOpened
		
		local function _(p2)
			-- upvalues: CurrentTabIndexDelta (copy), IsUseAnimationStateResultMatch (copy)
			return if CurrentTabIndexDelta == 0 then 0 elseif IsUseAnimationStateResultMatch then if CurrentTabIndexDelta < 0 then -p2 else p2 elseif CurrentTabIndexDelta < 0 then p2 else -p2
		end
		
		return {
			isVisible = UseAnimationStateResult ~= TabAnimationStateEnumModule.TabClosed,
			cFrame = ReactModule.joinBindings({
				step = UseAnimatedBindingResult,
				viewportFillDimensions = UseCameraFacingGeometryResult.viewportFillDimensions
			}):map(function(p2): CFrame
				-- upvalues: CurrentTabIndexDelta (copy), IsUseAnimationStateResultMatch (copy)
				local ScaledStep = (1 - p2.step) * (p2.viewportFillDimensions.X * 0.3333)
				
				return CFrame.new(if CurrentTabIndexDelta == 0 then 0 elseif IsUseAnimationStateResultMatch then if CurrentTabIndexDelta < 0 then -ScaledStep else ScaledStep elseif CurrentTabIndexDelta < 0 then ScaledStep else -ScaledStep, 0, 0)
			end),
			transparency = UseAnimatedBindingResult:map(function(p2: number): number
				return 1 - p2
			end)
		}
	end, {
		UseAnimatedBindingResult,
		UseCameraFacingGeometryResult,
		UseAnimationStateResult,
		CurrentTabIndexDelta
	})
end