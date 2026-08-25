local chatUIPrimitives = script:FindFirstAncestor("ChatUIPrimitives")
local parent = chatUIPrimitives.Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local _ = require(chatUIPrimitives.Types)

local function _(p0)
	local y = p0.AbsoluteWindowSize.Y
	local y_1 = p0.AbsoluteCanvasSize.Y
	
	return y_1 <= y or p0.CanvasPosition.Y / (y_1 - y) >= 0.9
end

return reactModule.memo(function(p1)
	-- upvalues: reactModule (ref), foundationModule (ref)
	local var3 = reactModule.useRef(nil)
	local var4 = reactModule.useRef(true)
	local onScroll = p1.onScroll
	local var5 = reactModule.useCallback(function(p2)
		-- upvalues: var4 (ref), onScroll (ref)
		local y = p2.AbsoluteWindowSize.Y
		local y_1 = p2.AbsoluteCanvasSize.Y
		var4.current = y_1 <= y or p2.CanvasPosition.Y / (y_1 - y) >= 0.9
		
		if onScroll and not var4.current then
			onScroll()
		end
	end, { onScroll })
	local var6 = reactModule.useCallback(function(p3)
		-- upvalues: var4 (ref)
		if var4.current then
			p3.CanvasPosition = Vector2.new(0, 9007199254740992)
		end
	end, {})
	reactModule.useEffect(function()
		-- upvalues: var3 (ref)
		local current = var3.current
		
		if current then
			current.CanvasPosition = Vector2.new(0, 9007199254740992)
		end
	end, {})
	
	return reactModule.createElement(foundationModule.ScrollView, {
		tag = "fill",
		scrollBarVisibility = "Auto",
		Size = p1.Size or UDim2.fromScale(1, 1),
		scrollingFrameRef = var3,
		scroll = {
			AutomaticCanvasSize = Enum.AutomaticSize.Y,
			CanvasSize = UDim2.fromScale(0, 0)
		},
		onCanvasPositionChanged = var5,
		onAbsoluteCanvasSizeChanged = var6
	}, if p1.contentPadding then {
		paddedContent = reactModule.createElement(foundationModule.View, {
			tag = "auto-y",
			Size = UDim2.fromScale(1, 0),
			padding = p1.contentPadding
		}, p1.children)
	} else p1.children)
end)