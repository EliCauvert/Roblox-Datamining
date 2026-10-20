local ChatUIPrimitives = script:FindFirstAncestor("ChatUIPrimitives")
local Parent = ChatUIPrimitives.Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local _ = require(ChatUIPrimitives.Types)

local function _(ScrollFrame): boolean
	local Y = ScrollFrame.AbsoluteWindowSize.Y
	local Y1 = ScrollFrame.AbsoluteCanvasSize.Y
	
	return Y1 <= Y or ScrollFrame.CanvasPosition.Y / (Y1 - Y) >= 0.9
end

return ReactModule.memo(function(p1)
	-- upvalues: ReactModule (copy), FoundationModule (copy)
	local UseRefResult = ReactModule.useRef(nil)
	local UseRefResult1 = ReactModule.useRef(true)
	local UseResult = ReactModule.useCallback(function(ScrollFrame)
		-- upvalues: UseRefResult1 (copy)
		local Y = ScrollFrame.AbsoluteWindowSize.Y
		local Y1 = ScrollFrame.AbsoluteCanvasSize.Y
		UseRefResult1.current = Y1 <= Y or ScrollFrame.CanvasPosition.Y / (Y1 - Y) >= 0.9
	end, {})
	local UseResult1 = ReactModule.useCallback(function(ScrollFrame)
		-- upvalues: UseRefResult1 (copy)
		if UseRefResult1.current then
			ScrollFrame.CanvasPosition = Vector2.new(0, 9007199254740992)
		end
	end, {})
	ReactModule.useEffect(function()
		-- upvalues: UseRefResult (copy)
		local Current = UseRefResult.current
		
		if Current then
			Current.CanvasPosition = Vector2.new(0, 9007199254740992)
		end
	end, {})
	
	return ReactModule.createElement(FoundationModule.ScrollView, {
		tag = "fill",
		scrollBarVisibility = "Auto",
		Size = p1.Size or UDim2.fromScale(1, 1),
		scrollingFrameRef = UseRefResult,
		scroll = {
			AutomaticCanvasSize = Enum.AutomaticSize.Y,
			CanvasSize = UDim2.fromScale(0, 0)
		},
		onCanvasPositionChanged = UseResult,
		onAbsoluteCanvasSizeChanged = UseResult1
	}, if p1.contentPadding then {
		paddedContent = ReactModule.createElement(FoundationModule.View, {
			tag = "auto-y",
			Size = UDim2.fromScale(1, 0),
			padding = p1.contentPadding
		}, p1.children)
	} else p1.children)
end)