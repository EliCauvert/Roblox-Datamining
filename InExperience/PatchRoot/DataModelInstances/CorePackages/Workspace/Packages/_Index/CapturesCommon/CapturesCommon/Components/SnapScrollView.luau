local parent = script.Parent.Parent
local parent_1 = parent.Parent
local cryoModule = require(parent_1.Cryo)
local foundationModule = require(parent_1.Foundation)
local reactModule = require(parent_1.React)
local _ = require(parent.Enums.NavigationType)
local _ = require(parent.Signal)
local view = foundationModule.View
local useCallback = reactModule.useCallback
local useEffect = reactModule.useEffect
local useSnapScrollControllerModule = require(parent.Hooks.useSnapScrollController)
local useState = reactModule.useState

return function(p1)
	-- upvalues: useState (ref), useSnapScrollControllerModule (ref), useCallback (ref), useEffect (ref), reactModule (ref), cryoModule (ref), view (ref)
	local var1, var2 = useState(Vector2.new(0, 0))
	local var3 = p1.active ~= nil or p1.active
	local initialIndex = p1.initialIndex or 1
	local itemAbsoluteSize = p1.itemAbsoluteSize or var1
	local windowSize = p1.windowSize or 3
	local var4, var5, var6, var7, var8 = useSnapScrollControllerModule(var3, initialIndex, itemAbsoluteSize, #p1.contents)
	local var9 = useCallback(function(p2)
		-- upvalues: var2 (ref)
		var2(p2.AbsoluteSize)
	end, {})
	useEffect(function()
		-- upvalues: p1 (ref), var4 (ref)
		if p1.onIndexChanged then
			p1.onIndexChanged(var4)
		end
	end, { var4, p1.onIndexChanged })
	local var10 = reactModule.useMemo(function()
		-- upvalues: cryoModule (copy), p1 (ref), var4 (ref), windowSize (ref), reactModule (copy), view (copy), itemAbsoluteSize (ref)
		return cryoModule.List.map(p1.contents, function(p2, p3)
			-- upvalues: var4 (copy), windowSize (copy), reactModule (copy), view (copy), itemAbsoluteSize (copy), p1 (copy)
			return if p3 < var4 - windowSize or var4 + windowSize < p3 then reactModule.createElement(view, {
				tag = "anchor-top-center bg-action-subtle position-top-center",
				key = `PLACEHOLDER-{p3}`,
				LayoutOrder = p3,
				Size = UDim2.fromOffset(itemAbsoluteSize.X, itemAbsoluteSize.Y)
			}) else p1.renderContent(p2, p3)
		end)
	end, {
		var4,
		itemAbsoluteSize,
		p1.contents,
		p1.renderContent,
		windowSize
	})
	useEffect(function()
		-- upvalues: p1 (ref), var7 (ref)
		if p1.scrollToIndexSignal then
			local scrollToIndexSignalConnection = p1.scrollToIndexSignal:connect(var7)
			
			return function()
				-- upvalues: scrollToIndexSignalConnection (ref)
				scrollToIndexSignalConnection:disconnect()
			end
		end
	end, { p1.scrollToIndexSignal, var7 })
	useEffect(function()
		-- upvalues: p1 (ref), var8 (ref)
		if p1.triggerNavigationSignal then
			local triggerNavigationSignalConnection = p1.triggerNavigationSignal:connect(var8)
			
			return function()
				-- upvalues: triggerNavigationSignalConnection (ref)
				triggerNavigationSignalConnection:disconnect()
			end
		end
	end, { p1.triggerNavigationSignal, var8 })
	
	return reactModule.createElement(view, {
		tag = "anchor-top-center bg-action-subtle position-top-center size-full",
		onAbsoluteSizeChanged = var9,
		ref = var5
	}, {
		MotionView = reactModule.createElement(view, {
			LayoutOrder = 1,
			tag = "align-x-center anchor-top-center bg-action-subtle col no-clip position-top-center",
			ref = var6,
			Size = UDim2.fromScale(1, #p1.contents)
		}, var10)
	})
end