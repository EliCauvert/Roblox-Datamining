local RecycledInlineLayout = script:FindFirstAncestor("RecycledInlineLayout")
local Parent = RecycledInlineLayout.Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local ToolkitModule = require(RecycledInlineLayout.Toolkit)
local LinkDecoration = ToolkitModule.defineDecoration({
	name = "LinkDecoration",
	view = ReactModule.memo(function(p1)
		-- upvalues: FoundationModule (copy), ReactModule (copy), ToolkitModule (copy)
		local SetSpanStateFunction = p1.setSpanState
		local Hover = FoundationModule.Hooks.useTokens().Color.State.Hover
		local UseRefResult = ReactModule.useRef(0)
		local UseResult = ReactModule.useCallback(function()
			-- upvalues: UseRefResult (copy), SetSpanStateFunction (copy)
			UseRefResult.current += 1
			SetSpanStateFunction("hovered", true)
		end, { SetSpanStateFunction })
		local UseResult1 = ReactModule.useCallback(function()
			-- upvalues: UseRefResult (copy), SetSpanStateFunction (copy)
			UseRefResult.current = math.max(UseRefResult.current - 1, 0)
			SetSpanStateFunction("hovered", UseRefResult.current > 0)
		end, { SetSpanStateFunction })
		local Current = ReactModule.useRef({}).current
		
		for i = #Current + 1, p1.rowCapacity or 1 do
			Current[i] = ReactModule.createRef()
		end
		ToolkitModule.Utils.useTestId(p1.testId, Current, p1.rows:map(function(p2): number
			return if p2 then #p2 else 0
		end))
		local MapResult = p1.spanState.hovered:map(function(p2)
			-- upvalues: Hover (copy)
			return if p2 then Hover.Transparency else 1
		end)
		local TextButtons = {}
		
		for i1 = 1, p1.rowCapacity or 1 do
			local MapResult1 = p1.rows:map(function(p2)
				-- upvalues: i1 (copy)
				return p2 and p2[i1]
			end)
			TextButtons[`Row{i1}`] = ReactModule.createElement("TextButton", {
				ref = Current[i1],
				Text = "",
				AutoButtonColor = false,
				BorderSizePixel = 0,
				BackgroundColor3 = Hover.Color3,
				BackgroundTransparency = MapResult,
				Visible = MapResult1:map(function(p2): boolean
					return p2 ~= nil
				end),
				Position = MapResult1:map(function(p2): UDim2
					return if p2 then UDim2.fromOffset(p2.position.X, p2.position.Y) else UDim2.new()
				end),
				Size = MapResult1:map(function(p2): UDim2
					return if p2 then UDim2.fromOffset(p2.size.X, p2.size.Y) else UDim2.new()
				end),
				[ReactModule.Event.Activated] = p1.onActivated,
				[ReactModule.Event.MouseEnter] = UseResult,
				[ReactModule.Event.MouseLeave] = UseResult1
			})
		end
		return ReactModule.createElement("Frame", { BackgroundTransparency = 1, Size = UDim2.fromScale(1, 1) }, TextButtons)
	end)
})
local Link, Link2 = ToolkitModule.defineSpan({
	name = "Link",
	props = {
		onActivated = { layout = "none", delivery = "callback" },
		textStyle = { layout = "none", delivery = "binding" }
	},
	inherit = { "textStyle" },
	state = { hovered = false },
	decoration = LinkDecoration
})

return {
	Link = Link,
	LinkDecoration = LinkDecoration,
	definition = Link2
}