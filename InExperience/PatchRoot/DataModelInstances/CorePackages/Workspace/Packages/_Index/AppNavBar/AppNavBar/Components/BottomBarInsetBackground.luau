local Parent = script.Parent.Parent
local Parent1 = Parent.Parent
local ReactModule = require(Parent1.React)
local VisibilityControlModule = require(Parent.VisibilityControl)
local GetScrollAwayEnabledModule = require(Parent.getScrollAwayEnabled)
local UseTokensFunction = require(Parent1.Foundation).Hooks.useTokens

return ReactModule.memo(function(Frame) --[[ Line: 19 | Named "BottomBarInsetBackground" ]]
	-- upvalues: UseTokensFunction (copy), ReactModule (copy), GetScrollAwayEnabledModule (copy), VisibilityControlModule (copy)
	local UseTokensResult = UseTokensFunction()
	local NavigationBarColor3 = UseTokensResult.Color.Common.NavigationBar.Color3
	local Transparency = UseTokensResult.Color.Common.NavigationBar.Transparency
	local SurfaceColor3 = UseTokensResult.Color.Surface.Surface_0.Color3
	local Transparency1 = UseTokensResult.Color.Surface.Surface_0.Transparency
	local UseBindingResult, UseBindingResult2 = ReactModule.useBinding(NavigationBarColor3)
	local UseBindingResult1, UseBindingResult2_1 = ReactModule.useBinding(Transparency)
	ReactModule.useEffect(function() --[[ Line: 29 ]]
		-- upvalues: UseBindingResult2 (copy), NavigationBarColor3 (copy), SurfaceColor3 (copy), UseBindingResult2_1 (copy), Transparency (copy), Transparency1 (copy), GetScrollAwayEnabledModule (upval), Frame (copy), VisibilityControlModule (upval), ReactModule (upval)
		local function update(p1: number) --[[ Line: 30 ]]
			-- upvalues: UseBindingResult2 (upval), NavigationBarColor3 (upval), SurfaceColor3 (upval), UseBindingResult2_1 (upval), Transparency (upval), Transparency1 (upval)
			local Alpha = 1 - p1
			UseBindingResult2(NavigationBarColor3:Lerp(SurfaceColor3, Alpha))
			UseBindingResult2_1(Transparency + (Transparency1 - Transparency) * Alpha)
		end
		
		if GetScrollAwayEnabledModule() then
			local FooterBinding = VisibilityControlModule.getFooterBinding()
			local SubscribeToBindingResult = ReactModule.__subscribeToBinding(FooterBinding, update)
			local Alpha = 1 - FooterBinding:getValue()
			UseBindingResult2(NavigationBarColor3:Lerp(SurfaceColor3, Alpha))
			UseBindingResult2_1(Transparency + (Transparency1 - Transparency) * Alpha)
			
			return SubscribeToBindingResult
		else
			local Alpha = 1 - (if Frame.isVisible then 1 else 0)
			UseBindingResult2(NavigationBarColor3:Lerp(SurfaceColor3, Alpha))
			UseBindingResult2_1(Transparency + (Transparency1 - Transparency) * Alpha)
			
			return nil
		end
	end, {
		Frame.isVisible,
		NavigationBarColor3,
		Transparency,
		SurfaceColor3,
		Transparency1
	})
	
	return ReactModule.createElement("Frame", {
		BorderSizePixel = 0,
		Active = true,
		ZIndex = 0,
		AnchorPoint = Frame.AnchorPoint,
		Position = Frame.Position,
		Size = Frame.Size,
		BackgroundColor3 = UseBindingResult,
		BackgroundTransparency = UseBindingResult1
	})
end)