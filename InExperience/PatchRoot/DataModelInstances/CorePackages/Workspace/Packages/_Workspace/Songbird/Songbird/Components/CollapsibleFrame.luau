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

return function(p0) --[[ line: 31 | named "CollapsibleFrame" ]]
	-- upvalues: usePrevious (ref), useBinding (ref), useAnimatedBinding (ref), useCallback (ref), useEffect (ref), reactOtterModule (ref), t (ref), reactModule (ref), foundationModule (ref)
	local var6 = usePrevious(p0.isCollapsed)
	local var7, var8 = useBinding(Vector2.new(1e999, 1e999))
	local var9, var10 = useAnimatedBinding(if p0.isCollapsed then 0 else 1)
	local var11 = useCallback(function(p1) --[[ line: 36 ]]
		-- upvalues: var8 (ref)
		var8(p1.AbsoluteCanvasSize)
	end, {})
	useEffect(function() --[[ line: 40 ]]
		-- upvalues: var6 (ref), p0 (ref), var10 (ref), reactOtterModule (copy), t (copy)
		if var6 ~= nil then
			if not p0.isCollapsed and var6 then
				var10(reactOtterModule.spring(1, t))
				
				return
			elseif p0.isCollapsed and not var6 then
				var10(reactOtterModule.spring(0, t))
			end
		end
	end, { p0.isCollapsed, var6 })
	
	return reactModule.createElement(foundationModule.View, {
		tag = "size-full clip",
		sizeConstraint = {
			MaxSize = reactModule.joinBindings({ maxSize = var7, alpha = var9 }):map(function(p2) --[[ line: 53 ]]
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
			[reactModule.Change.AbsoluteCanvasSize] = var11
		}, {
			Container = reactModule.createElement(foundationModule.View, { tag = "auto-y size-full-0" }, p0.children)
		})
	})
end