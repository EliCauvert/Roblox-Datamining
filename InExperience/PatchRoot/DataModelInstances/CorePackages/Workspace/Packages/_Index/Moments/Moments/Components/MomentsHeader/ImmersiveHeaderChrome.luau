local moments = script:FindFirstAncestor("Moments")
local parent = moments.Parent
local reactModule = require(parent.React)
local view = require(parent.Foundation).View
local constantsModule = require(moments.Constants)
local useChromeRatioModule = require(moments.Hooks.useChromeRatio)
local fFlagMomentsUseCompositionLibraryModule = require(moments.Flags.FFlagMomentsUseCompositionLibrary)

return function(p0)
	-- upvalues: useChromeRatioModule (ref), reactModule (ref), constantsModule (ref), fFlagMomentsUseCompositionLibraryModule (ref), view (ref)
	local var5 = useChromeRatioModule()
	local var6, var7 = reactModule.useBinding(0)
	local t = {
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		LayoutOrder = p0.layoutOrder,
		Size = UDim2.new(1, 0, 0, 0),
		AutomaticSize = Enum.AutomaticSize.Y,
		Position = reactModule.joinBindings({ ratio = var5, height = var6 }):map(function(p1)
			return UDim2.new(0, 0, 0, (p1.ratio - 1) * p1.height)
		end),
		Interactable = var5:map(function(p2)
			return p2 > 0.01
		end),
		ZIndex = constantsModule.DisplayOrder.FeedTopBar,
		[reactModule.Change.AbsoluteSize] = reactModule.useCallback(function(p3)
			-- upvalues: var7 (ref)
			var7(p3.AbsoluteSize.Y)
		end, {}),
		[reactModule.Tag] = "data-testid=--moments-immersive-header-chrome"
	}
	local var9 = "Frame"
	
	if not fFlagMomentsUseCompositionLibraryModule then
		var9 = "CanvasGroup"
		t.GroupTransparency = var5:map(function(p4)
			return 1 - p4
		end)
	end
	return reactModule.createElement(var9, t, {
		Header = reactModule.createElement(view, { tag = "size-full-0 auto-y" }, p0.children)
	})
end