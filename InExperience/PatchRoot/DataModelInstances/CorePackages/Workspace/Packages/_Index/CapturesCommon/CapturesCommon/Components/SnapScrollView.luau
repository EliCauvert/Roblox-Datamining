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

return function(p0)
	-- upvalues: useState (ref), useSnapScrollControllerModule (ref), useCallback (ref), useEffect (ref), reactModule (ref), cryoModule (ref), view (ref)
	local var4, var5 = useState(Vector2.new(0, 0))
	local var6 = p0.active ~= nil or p0.active
	local initialIndex = p0.initialIndex or 1
	local itemAbsoluteSize = p0.itemAbsoluteSize or var4
	local windowSize = p0.windowSize or 3
	local var10, var11, var12, var13, var14 = useSnapScrollControllerModule(var6, initialIndex, itemAbsoluteSize, #p0.contents)
	local var15 = useCallback(function(p1)
		-- upvalues: var5 (ref)
		var5(p1.AbsoluteSize)
	end, {})
	useEffect(function()
		-- upvalues: p0 (ref), var10 (ref)
		if p0.onIndexChanged then
			p0.onIndexChanged(var10)
		end
	end, { var10, p0.onIndexChanged })
	local var16 = reactModule.useMemo(function()
		-- upvalues: cryoModule (copy), p0 (ref), var10 (ref), windowSize (ref), reactModule (copy), view (copy), itemAbsoluteSize (ref)
		return cryoModule.List.map(p0.contents, function(p2, p3)
			-- upvalues: var10 (copy), windowSize (copy), reactModule (copy), view (copy), itemAbsoluteSize (copy), p0 (copy)
			return if p3 < var10 - windowSize or var10 + windowSize < p3 then reactModule.createElement(view, {
				tag = "anchor-top-center bg-action-subtle position-top-center",
				key = `PLACEHOLDER-{p3}`,
				LayoutOrder = p3,
				Size = UDim2.fromOffset(itemAbsoluteSize.X, itemAbsoluteSize.Y)
			}) else p0.renderContent(p2, p3)
		end)
	end, {
		var10,
		itemAbsoluteSize,
		p0.contents,
		p0.renderContent,
		windowSize
	})
	useEffect(function()
		-- upvalues: p0 (ref), var13 (ref)
		if p0.scrollToIndexSignal then
			local scrollToIndexSignalConnection = p0.scrollToIndexSignal:connect(var13)
			
			return function()
				-- upvalues: scrollToIndexSignalConnection (ref)
				scrollToIndexSignalConnection:disconnect()
			end
		end
	end, { p0.scrollToIndexSignal, var13 })
	useEffect(function()
		-- upvalues: p0 (ref), var14 (ref)
		if p0.triggerNavigationSignal then
			local triggerNavigationSignalConnection = p0.triggerNavigationSignal:connect(var14)
			
			return function()
				-- upvalues: triggerNavigationSignalConnection (ref)
				triggerNavigationSignalConnection:disconnect()
			end
		end
	end, { p0.triggerNavigationSignal, var14 })
	
	return reactModule.createElement(view, {
		tag = "anchor-top-center bg-action-subtle position-top-center size-full",
		onAbsoluteSizeChanged = var15,
		ref = var11
	}, {
		MotionView = reactModule.createElement(view, {
			LayoutOrder = 1,
			tag = "align-x-center anchor-top-center bg-action-subtle col no-clip position-top-center",
			ref = var12,
			Size = UDim2.fromScale(1, #p0.contents)
		}, var16)
	})
end