local moments = script:FindFirstAncestor("Moments")
local parent = moments.Parent
local reactModule = require(parent.React)
local view = require(parent.Foundation).View
local constantsModule = require(moments.Constants)
local useChromeRatioModule = require(moments.Hooks.useChromeRatio)
local fFlagMomentsImmersiveHeaderFadeOutModule = require(moments.Flags.FFlagMomentsImmersiveHeaderFadeOut)
local fFlagMomentsUseCompositionLibraryModule = require(moments.Flags.FFlagMomentsUseCompositionLibrary)

return function(p1)
	-- upvalues: useChromeRatioModule (ref), fFlagMomentsUseCompositionLibraryModule (ref), fFlagMomentsImmersiveHeaderFadeOutModule (ref), reactModule (ref), constantsModule (ref), view (ref)
	local var1 = useChromeRatioModule()
	local fFlagMomentsImmersiveHeaderFadeOutModule_1 = fFlagMomentsUseCompositionLibraryModule and fFlagMomentsImmersiveHeaderFadeOutModule
	local var2 = not fFlagMomentsUseCompositionLibraryModule
	local var3 = not fFlagMomentsUseCompositionLibraryModule or not fFlagMomentsImmersiveHeaderFadeOutModule
	local var4, var5 = reactModule.useState(function()
		-- upvalues: fFlagMomentsImmersiveHeaderFadeOutModule_1 (ref), var1 (ref)
		return fFlagMomentsImmersiveHeaderFadeOutModule_1 and var1:getValue() < 1
	end)
	reactModule.useEffect(function()
		-- upvalues: fFlagMomentsImmersiveHeaderFadeOutModule_1 (ref), var5 (ref), var1 (ref), reactModule (copy)
		if fFlagMomentsImmersiveHeaderFadeOutModule_1 then
			local function applyRatio(p2)
				-- upvalues: var5 (copy)
				local var6 = p2 < 1
				var5(function(p3)
					-- upvalues: var6 (ref)
					return if p3 == var6 then p3 else var6
				end)
			end
			
			local var6 = var1:getValue() < 1
			var5(function(p2)
				-- upvalues: var6 (ref)
				return if p2 == var6 then p2 else var6
			end)
			
			return reactModule.__subscribeToBinding(var1, applyRatio)
		end
	end, { var1, fFlagMomentsImmersiveHeaderFadeOutModule_1 })
	local var6, var7 = reactModule.useBinding(0)
	local var8 = reactModule.useCallback(function(p2)
		-- upvalues: var7 (ref)
		var7(p2.AbsoluteSize.Y)
	end, {})
	local var9 = reactModule.joinBindings({ ratio = var1, height = var6 }):map(function(p2)
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
	
	if var3 then
		t.Position = var9
		t[reactModule.Change.AbsoluteSize] = var8
	end
	local var10 = "Frame"
	
	if var2 or fFlagMomentsImmersiveHeaderFadeOutModule_1 and var4 then
		var10 = "CanvasGroup"
		t.GroupTransparency = var1:map(function(p2)
			return 1 - p2
		end)
	end
	return reactModule.createElement(var10, t, {
		Header = reactModule.createElement(view, { tag = "size-full-0 auto-y" }, p1.children)
	})
end