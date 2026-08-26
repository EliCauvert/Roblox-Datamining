local songbird = script:FindFirstAncestor("Songbird")
local foundationModule = require(songbird.Parent.Foundation)
local reactModule = require(songbird.Parent.React)
local reactUtilsModule = require(songbird.Parent.ReactUtils)
local reactOtterModule = require(songbird.Parent.ReactOtter)
local useBinding = reactModule.useBinding
local useCallback = reactModule.useCallback
local useEffect = reactModule.useEffect
local usePrevious = reactUtilsModule.usePrevious
local useAnimatedBinding = reactOtterModule.useAnimatedBinding
local t = { stiffness = 300, damping = 30, mass = 1 }
local _ = { isCollapsed = false }

return function(p1)
	-- upvalues: usePrevious (ref), useBinding (ref), useAnimatedBinding (ref), useCallback (ref), useEffect (ref), reactOtterModule (ref), t (ref), reactModule (ref), foundationModule (ref)
	local var1 = usePrevious(p1.isCollapsed)
	local var2, var3 = useBinding(Vector2.new(1e999, 1e999))
	local var4, var5 = useAnimatedBinding(if p1.isCollapsed then 0 else 1)
	local var6 = useCallback(function(p2)
		-- upvalues: var3 (ref)
		var3(p2.AbsoluteCanvasSize)
	end, {})
	useEffect(function()
		-- upvalues: var1 (ref), p1 (ref), var5 (ref), reactOtterModule (copy), t (copy)
		if var1 ~= nil then
			if not p1.isCollapsed and var1 then
				var5(reactOtterModule.spring(1, t))
				
				return
			elseif p1.isCollapsed and not var1 then
				var5(reactOtterModule.spring(0, t))
			end
		end
	end, { p1.isCollapsed, var1 })
	
	return reactModule.createElement(foundationModule.View, {
		tag = "size-full clip",
		sizeConstraint = {
			MaxSize = reactModule.joinBindings({ maxSize = var2, alpha = var4 }):map(function(p2)
				return Vector2.new(1e999, math.max(p2.maxSize.Y * p2.alpha, 0))
			end)
		}
	}, {
		ScrollingFrame = reactModule.createElement("ScrollingFrame", {
			Size = UDim2.fromScale(1, 0),
			AutomaticSize = Enum.AutomaticSize.XY,
			BackgroundTransparency = 1,
			CanvasSize = UDim2.fromScale(0, 0),
			AutomaticCanvasSize = Enum.AutomaticSize.XY,
			ClipsDescendants = true,
			ScrollingEnabled = false,
			HorizontalScrollBarInset = Enum.ScrollBarInset.None,
			ScrollBarImageTransparency = 1,
			Selectable = false,
			[reactModule.Change.AbsoluteCanvasSize] = var6
		}, {
			Container = reactModule.createElement(foundationModule.View, { tag = "auto-y size-full-0" }, p1.children)
		})
	})
end