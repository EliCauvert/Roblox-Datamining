local moments = script:FindFirstAncestor("Moments")
local parent = moments.Parent
local reactModule = require(parent.React)
local view = require(parent.Foundation).View
local constantsModule = require(moments.Constants)
local useChromeRatioModule = require(moments.Hooks.useChromeRatio)
local fFlagMomentsImmersiveHeaderFadeOutModule = require(moments.Flags.FFlagMomentsImmersiveHeaderFadeOut)

return function(p1)
	-- upvalues: useChromeRatioModule (ref), fFlagMomentsImmersiveHeaderFadeOutModule (ref), reactModule (ref), constantsModule (ref), view (ref)
	local var1 = useChromeRatioModule()
	local var2 = not fFlagMomentsImmersiveHeaderFadeOutModule
	local var3, var4 = reactModule.useState(function()
		-- upvalues: fFlagMomentsImmersiveHeaderFadeOutModule (ref), var1 (ref)
		return fFlagMomentsImmersiveHeaderFadeOutModule and var1:getValue() < 1
	end)
	reactModule.useEffect(function()
		-- upvalues: fFlagMomentsImmersiveHeaderFadeOutModule (ref), var4 (ref), var1 (ref), reactModule (copy)
		if fFlagMomentsImmersiveHeaderFadeOutModule then
			local function applyRatio(p2)
				-- upvalues: var4 (copy)
				local var5 = p2 < 1
				var4(function(p3)
					-- upvalues: var5 (ref)
					return if p3 == var5 then p3 else var5
				end)
			end
			
			local var5 = var1:getValue() < 1
			var4(function(p2)
				-- upvalues: var5 (ref)
				return if p2 == var5 then p2 else var5
			end)
			
			return reactModule.__subscribeToBinding(var1, applyRatio)
		end
	end, { var1, fFlagMomentsImmersiveHeaderFadeOutModule })
	local var5, var6 = reactModule.useBinding(0)
	local var7 = reactModule.useCallback(function(p2)
		-- upvalues: var6 (ref)
		var6(p2.AbsoluteSize.Y)
	end, {})
	local var8 = reactModule.joinBindings({ ratio = var1, height = var5 }):map(function(p2)
		return UDim2.new(0, 0, 0, (p2.ratio - 1) * p2.height)
	end)
	local t = {
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		LayoutOrder = p1.layoutOrder,
		Size = UDim2.new(1, 0, 0, 0),
		AutomaticSize = Enum.AutomaticSize.Y,
		Interactable = var1:map(function(p2)
			return p2 > 0.01
		end),
		ZIndex = constantsModule.DisplayOrder.FeedTopBar,
		[reactModule.Tag] = "data-testid=--moments-immersive-header-chrome"
	}
	
	if var2 then
		t.Position = var8
		t[reactModule.Change.AbsoluteSize] = var7
	end
	local var9 = "Frame"
	
	if fFlagMomentsImmersiveHeaderFadeOutModule and var3 then
		var9 = "CanvasGroup"
		t.GroupTransparency = var1:map(function(p2)
			return 1 - p2
		end)
	end
	return reactModule.createElement(var9, t, {
		Header = reactModule.createElement(view, { tag = "size-full-0 auto-y" }, p1.children)
	})
end