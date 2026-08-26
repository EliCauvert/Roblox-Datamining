local moments = script:FindFirstAncestor("Moments")
local parent = moments.Parent
local reactModule = require(parent.React)
local view = require(parent.Foundation).View
local constantsModule = require(moments.Constants)
local useChromeRatioModule = require(moments.Hooks.useChromeRatio)
local fFlagMomentsUseCompositionLibraryModule = require(moments.Flags.FFlagMomentsUseCompositionLibrary)

return function(p1)
	-- upvalues: useChromeRatioModule (ref), reactModule (ref), constantsModule (ref), fFlagMomentsUseCompositionLibraryModule (ref), view (ref)
	local var1 = useChromeRatioModule()
	local var2, var3 = reactModule.useBinding(0)
	local t = {
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		LayoutOrder = p1.layoutOrder,
		Size = UDim2.new(1, 0, 0, 0),
		AutomaticSize = Enum.AutomaticSize.Y,
		Position = reactModule.joinBindings({ ratio = var1, height = var2 }):map(function(p2)
			return UDim2.new(0, 0, 0, (p2.ratio - 1) * p2.height)
		end),
		Interactable = var1:map(function(p2)
			return p2 > 0.01
		end),
		ZIndex = constantsModule.DisplayOrder.FeedTopBar,
		[reactModule.Change.AbsoluteSize] = reactModule.useCallback(function(p2)
			-- upvalues: var3 (ref)
			var3(p2.AbsoluteSize.Y)
		end, {}),
		[reactModule.Tag] = "data-testid=--moments-immersive-header-chrome"
	}
	local var4 = "Frame"
	
	if not fFlagMomentsUseCompositionLibraryModule then
		var4 = "CanvasGroup"
		t.GroupTransparency = var1:map(function(p2)
			return 1 - p2
		end)
	end
	return reactModule.createElement(var4, t, {
		Header = reactModule.createElement(view, { tag = "size-full-0 auto-y" }, p1.children)
	})
end