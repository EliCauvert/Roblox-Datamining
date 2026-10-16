local Songbird = script:FindFirstAncestor("Songbird")
local FoundationModule = require(Songbird.Parent.Foundation)
local ReactModule = require(Songbird.Parent.React)
local ReactOtterModule = require(Songbird.Parent.ReactOtter)
local UseBindingFunction = ReactModule.useBinding
local UseCallbackFunction = ReactModule.useCallback
local UseEffectFunction = ReactModule.useEffect
local UsePreviousFunction = require(Songbird.Parent.ReactUtils).usePrevious
local UseAnimatedBindingFunction = ReactOtterModule.useAnimatedBinding
local config = { stiffness = 300, damping = 30, mass = 1 }

return function(p1) --[[ Line: 31 | Named "CollapsibleFrame" ]]
	-- upvalues: UsePreviousFunction (copy), UseBindingFunction (copy), UseAnimatedBindingFunction (copy), UseCallbackFunction (copy), UseEffectFunction (copy), ReactOtterModule (copy), config (copy), ReactModule (copy), FoundationModule (copy)
	local UsePreviousResult = UsePreviousFunction(p1.isCollapsed)
	local UseBindingResult, UseBindingResult2 = UseBindingFunction(Vector2.new(1e999, 1e999))
	local UseAnimatedBindingResult, UseAnimatedBindingResult2 = UseAnimatedBindingFunction(if p1.isCollapsed then 0 else 1)
	local UseCallbackResult = UseCallbackFunction(function(ScrollFrame) --[[ Line: 36 ]]
		-- upvalues: UseBindingResult2 (copy)
		UseBindingResult2(ScrollFrame.AbsoluteCanvasSize)
	end, {})
	UseEffectFunction(function() --[[ Line: 40 ]]
		-- upvalues: UsePreviousResult (copy), p1 (copy), UseAnimatedBindingResult2 (copy), ReactOtterModule (upval), config (upval)
		if UsePreviousResult ~= nil then
			if not p1.isCollapsed and UsePreviousResult then
				UseAnimatedBindingResult2(ReactOtterModule.spring(1, config))
				
				return
			end
			if p1.isCollapsed and not UsePreviousResult then
				UseAnimatedBindingResult2(ReactOtterModule.spring(0, config))
			end
		end
	end, { p1.isCollapsed, UsePreviousResult })
	
	return ReactModule.createElement(FoundationModule.View, {
		tag = "size-full clip",
		sizeConstraint = {
			MaxSize = ReactModule.joinBindings({
				maxSize = UseBindingResult,
				alpha = UseAnimatedBindingResult
			}):map(function(p2): Vector2 --[[ Line: 53 ]]
				return Vector2.new(1e999, (math.max(p2.maxSize.Y * p2.alpha, 0)))
			end)
		}
	}, {
		ScrollingFrame = ReactModule.createElement("ScrollingFrame", {
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
			[ReactModule.Change.AbsoluteCanvasSize] = UseCallbackResult
		}, {
			Container = ReactModule.createElement(FoundationModule.View, { tag = "auto-y size-full-0" }, p1.children)
		})
	})
end