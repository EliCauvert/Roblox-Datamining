local parent = script:FindFirstAncestor("ChatUIPrimitives").Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local _ = require(script.Parent.Types)

local function _(p0) --[[ line: 12 | named "isNearBottom" ]]
	local y = p0.AbsoluteWindowSize.Y
	local y_1 = p0.AbsoluteCanvasSize.Y
	
	return y_1 <= y or p0.CanvasPosition.Y / (y_1 - y) >= 0.9
end

return reactModule.memo(function(p1) --[[ line: 27 | named "BottomLockedScrollView" ]]
	-- upvalues: reactModule (ref), foundationModule (ref)
	local var2 = reactModule.useRef(nil)
	local var3 = reactModule.useRef(true)
	local var4 = reactModule.useCallback(function(p2) --[[ line: 31 ]]
		-- upvalues: var3 (ref)
		local y = p2.AbsoluteWindowSize.Y
		local y_1 = p2.AbsoluteCanvasSize.Y
		var3.current = y_1 <= y or p2.CanvasPosition.Y / (y_1 - y) >= 0.9
	end, {})
	local var5 = reactModule.useCallback(function(p3) --[[ line: 35 ]]
		-- upvalues: var3 (ref)
		if var3.current then
			p3.CanvasPosition = Vector2.new(0, 9007199254740992)
		end
	end, {})
	reactModule.useEffect(function() --[[ line: 42 ]]
		-- upvalues: var2 (ref)
		local current = var2.current
		
		if current then
			current.CanvasPosition = Vector2.new(0, 9007199254740992)
		end
	end, {})
	
	return reactModule.createElement(foundationModule.ScrollView, {
		tag = "fill",
		scrollBarVisibility = "Auto",
		Size = p1.Size or UDim2.fromScale(1, 1),
		scrollingFrameRef = var2,
		scroll = {
			AutomaticCanvasSize = Enum.AutomaticSize.Y,
			CanvasSize = UDim2.fromScale(0, 0)
		},
		onCanvasPositionChanged = var4,
		onAbsoluteCanvasSizeChanged = var5
	}, if p1.contentPadding then {
		paddedContent = reactModule.createElement(foundationModule.View, {
			tag = "auto-y",
			Size = UDim2.fromScale(1, 0),
			padding = p1.contentPadding
		}, p1.children)
	} else p1.children)
end)