local parent = script:FindFirstAncestor("Components").Parent
local parent_1 = parent.Parent
local foundationModule = require(parent_1.Foundation)
local reactModule = require(parent_1.React)
local useCallback = reactModule.useCallback
local useRef = reactModule.useRef
local useState = reactModule.useState
local useEffect = reactModule.useEffect
local map = require(parent_1.Dash).map
local _ = require(parent.Components.InlineLayout.InlineLayoutElements.RenderableInlineElement)
local hardBreakElementModule = require(parent.Components.InlineLayout.InlineLayoutElements.HardBreakElement)
local hoverContextModule = require(parent.Components.InlineLayout.InlineLayoutElements.HoverContext)
local view = foundationModule.View
local fFlagDebugInlineLayout = game:DefineFastFlag("FFlagDebugInlineLayout", false)

local function layoutElements(p0, p1)
	-- upvalues: hardBreakElementModule (ref), fFlagDebugInlineLayout (ref), map (ref), reactModule (ref), view (ref)
	if #p0 == 0 then
		return {}
	end
	local t = {}
	local t_1 = {}
	local var8 = p1
	local var9 = nil
	local var10 = 1
	local var11 = 0
	local _ = nil
	
	local function _()
		-- upvalues: t (ref), t_1 (write), var8 (write), p1 (ref)
		table.insert(t, t_1)
		t_1 = {}
		var8 = p1
	end
	while (var10 <= #p0 or var9) and var11 < 100 do
		local var9_1 = var9 or p0[var10]
		
		if var9_1 == hardBreakElementModule then
			var10 += 1
			table.insert(t, t_1)
			t_1 = {}
			var8 = p1
			continue
		end
		local width = var9_1:getWidth()
		local t_1Count = #t_1
		
		if width <= var8 then
			table.insert(t_1, var9_1:render(var10, t_1Count))
			var8 -= width
			var9 = nil
			var10 += 1
		else
			local var15, var16 = var9_1:split(var8)
			
			if var15:getWidth() <= var8 then
				table.insert(t_1, var15:render(var10, t_1Count))
				var9 = var16
			elseif #t_1 == 0 then
				if var9_1.canForceSplit then
					local var17, var18 = var9_1:split(var8, true)
					var15 = var17
					var16 = var18
				end
				table.insert(t_1, var15:render(var10, t_1Count))
				var9 = var16
			else
				var9 = var9_1
			end
			table.insert(t, t_1)
			t_1 = {}
			var8 = p1
		end
		var11 += 1
	end
	if var11 == 100 and fFlagDebugInlineLayout then
		warn("InlineLayout: trying to wrap text across multiple lines and iterations cap is reached. Layout may be imperfect", `Desired width: {p1}`, debug.traceback())
	end
	if #t_1 > 0 then
		table.insert(t, t_1)
	end
	return map(t, function(p2, p3)
		-- upvalues: reactModule (copy), view (copy)
		return reactModule.createElement(view, {
			tag = "auto-xy row align-x-left",
			key = tostring(p3),
			LayoutOrder = p3
		}, p2)
	end)
end

return function(p4)
	-- upvalues: useRef (ref), foundationModule (ref), useState (ref), useCallback (ref), layoutElements (ref), useEffect (ref), reactModule (ref), hoverContextModule (ref), view (ref)
	local var19 = useRef(nil)
	local var20 = foundationModule.Hooks.useTokens()
	local var21, var22 = useState({})
	local var23 = useCallback(function()
		-- upvalues: var19 (ref), var22 (ref), layoutElements (copy), p4 (ref)
		if var19.current == nil then return end
		if var19.current.AbsoluteSize.X == 0 then
			return
		end
		var22(layoutElements(p4.Elements, var19.current.AbsoluteSize.X))
	end, { p4.Elements })
	useEffect(var23, { var23 })
	
	return reactModule.createElement(hoverContextModule.Provider, nil, reactModule.createElement(view, {
		tag = "size-full-0 auto-y",
		onAbsoluteSizeChanged = var23,
		ref = var19,
		layout = {
			FillDirection = Enum.FillDirection.Vertical,
			HorizontalAlignment = p4.HorizontalAlignment or Enum.HorizontalAlignment.Left,
			Padding = p4.VerticalPadding or UDim.new(0, var20.Gap.Small)
		}
	}, var21))
end