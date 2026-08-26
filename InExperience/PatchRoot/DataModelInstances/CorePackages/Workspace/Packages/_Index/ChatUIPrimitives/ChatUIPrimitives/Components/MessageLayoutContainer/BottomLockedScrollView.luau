local chatUIPrimitives = script:FindFirstAncestor("ChatUIPrimitives")
local parent = chatUIPrimitives.Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local _ = require(chatUIPrimitives.Types)

local function _(p1)
	local y = p1.AbsoluteWindowSize.Y
	local y_1 = p1.AbsoluteCanvasSize.Y
	
	return y_1 <= y or p1.CanvasPosition.Y / (y_1 - y) >= 0.9
end

return reactModule.memo(function(p1)
	-- upvalues: reactModule (ref), foundationModule (ref)
	local var1 = reactModule.useRef(nil)
	local var2 = reactModule.useRef(true)
	local onScroll = p1.onScroll
	local var3 = reactModule.useCallback(function(p2)
		-- upvalues: var2 (ref), onScroll (ref)
		local y = p2.AbsoluteWindowSize.Y
		local y_1 = p2.AbsoluteCanvasSize.Y
		var2.current = y_1 <= y or p2.CanvasPosition.Y / (y_1 - y) >= 0.9
		
		if onScroll and not var2.current then
			onScroll()
		end
	end, { onScroll })
	local var4 = reactModule.useCallback(function(p2)
		-- upvalues: var2 (ref)
		if var2.current then
			p2.CanvasPosition = Vector2.new(0, 9007199254740992)
		end
	end, {})
	reactModule.useEffect(function()
		-- upvalues: var1 (ref)
		local current = var1.current
		
		if current then
			current.CanvasPosition = Vector2.new(0, 9007199254740992)
		end
	end, {})
	
	return reactModule.createElement(foundationModule.ScrollView, {
		tag = "fill",
		scrollBarVisibility = "Auto",
		Size = p1.Size or UDim2.fromScale(1, 1),
		scrollingFrameRef = var1,
		scroll = {
			AutomaticCanvasSize = Enum.AutomaticSize.Y,
			CanvasSize = UDim2.fromScale(0, 0)
		},
		onCanvasPositionChanged = var3,
		onAbsoluteCanvasSizeChanged = var4
	}, if p1.contentPadding then {
		paddedContent = reactModule.createElement(foundationModule.View, {
			tag = "auto-y",
			Size = UDim2.fromScale(1, 0),
			padding = p1.contentPadding
		}, p1.children)
	} else p1.children)
end)