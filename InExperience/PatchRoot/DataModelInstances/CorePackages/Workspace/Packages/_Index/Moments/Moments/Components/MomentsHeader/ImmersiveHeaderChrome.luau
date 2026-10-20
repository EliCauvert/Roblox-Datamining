local Moments = script:FindFirstAncestor("Moments")
local Parent = Moments.Parent
local ReactModule = require(Parent.React)
local View = require(Parent.Foundation).View
local ConstantsModule = require(Moments.Constants)
local UseChromeRatioModule = require(Moments.Hooks.useChromeRatio)
local FFlagMomentsImmersiveHeaderFadeOutModule = require(Moments.Flags.FFlagMomentsImmersiveHeaderFadeOut)

return function(p1)
	-- upvalues: UseChromeRatioModule (copy), FFlagMomentsImmersiveHeaderFadeOutModule (copy), ReactModule (copy), ConstantsModule (copy), View (copy)
	local UseChromeRatioModuleResult = UseChromeRatioModule()
	local NoFFlagMomentsImmersiveHeaderFadeOutModule = not FFlagMomentsImmersiveHeaderFadeOutModule
	local UseStateResult, UseStateResult2 = ReactModule.useState(function(): boolean
		-- upvalues: FFlagMomentsImmersiveHeaderFadeOutModule (copy), UseChromeRatioModuleResult (copy)
		return FFlagMomentsImmersiveHeaderFadeOutModule and UseChromeRatioModuleResult:getValue() < 1
	end)
	ReactModule.useEffect(function()
		-- upvalues: FFlagMomentsImmersiveHeaderFadeOutModule (copy), UseStateResult2 (copy), UseChromeRatioModuleResult (copy), ReactModule (upval)
		if not FFlagMomentsImmersiveHeaderFadeOutModule then return end
		local function applyRatio(p2: number)
			-- upvalues: UseStateResult2 (upval)
			local v1 = p2 < 1
			UseStateResult2(function(p3)
				-- upvalues: v1 (copy)
				return if p3 == v1 then p3 else v1
			end)
		end
		
		local IsValueBelow = UseChromeRatioModuleResult:getValue() < 1
		UseStateResult2(function(p2)
			-- upvalues: IsValueBelow (copy)
			return if p2 == IsValueBelow then p2 else IsValueBelow
		end)
		
		return ReactModule.__subscribeToBinding(UseChromeRatioModuleResult, applyRatio)
	end, {
		UseChromeRatioModuleResult,
		FFlagMomentsImmersiveHeaderFadeOutModule
	})
	local UseBindingResult, UseBindingResult2 = ReactModule.useBinding(0)
	local UseResult = ReactModule.useCallback(function(Frame)
		-- upvalues: UseBindingResult2 (copy)
		UseBindingResult2(Frame.AbsoluteSize.Y)
	end, {})
	local MapResult = ReactModule.joinBindings({
		ratio = UseChromeRatioModuleResult,
		height = UseBindingResult
	}):map(function(p2): UDim2
		return UDim2.new(0, 0, 0, (p2.ratio - 1) * p2.height)
	end)
	local config = {
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		LayoutOrder = p1.layoutOrder,
		Size = UDim2.new(1, 0, 0, 0),
		AutomaticSize = Enum.AutomaticSize.Y,
		Interactable = UseChromeRatioModuleResult:map(function(p2: number): boolean
			return p2 > 0.01
		end),
		ZIndex = ConstantsModule.DisplayOrder.FeedTopBar,
		[ReactModule.Tag] = "data-testid=--moments-immersive-header-chrome"
	}
	
	if NoFFlagMomentsImmersiveHeaderFadeOutModule then
		config.Position = MapResult
		config[ReactModule.Change.AbsoluteSize] = UseResult
	end
	local v1 = "Frame"
	
	if FFlagMomentsImmersiveHeaderFadeOutModule and UseStateResult then
		v1 = "CanvasGroup"
		config.GroupTransparency = UseChromeRatioModuleResult:map(function(p2: number): number
			return 1 - p2
		end)
	end
	return ReactModule.createElement(v1, config, {
		Header = ReactModule.createElement(View, { tag = "size-full-0 auto-y" }, p1.children)
	})
end