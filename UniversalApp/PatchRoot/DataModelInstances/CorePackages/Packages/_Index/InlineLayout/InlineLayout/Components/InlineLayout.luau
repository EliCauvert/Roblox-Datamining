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

local function layoutElements(p1, p2)
	-- upvalues: hardBreakElementModule (ref), fFlagDebugInlineLayout (ref), map (ref), reactModule (ref), view (ref)
	if #p1 == 0 then
		return {}
	end
	local t = {}
	local t_1 = {}
	local var1 = p2
	local var2 = nil
	local var3 = 1
	local var4 = 0
	local _ = nil
	
	local function _()
		-- upvalues: t (ref), t_1 (write), var1 (write), p2 (ref)
		table.insert(t, t_1)
		t_1 = {}
		var1 = p2
	end
	while (var3 <= #p1 or var2) and var4 < 100 do
		local var5 = var2 or p1[var3]
		
		if var5 == hardBreakElementModule then
			var3 += 1
			table.insert(t, t_1)
			t_1 = {}
			var1 = p2
			continue
		end
		local width = var5:getWidth()
		local t_1Count = #t_1
		
		if width <= var1 then
			table.insert(t_1, var5:render(var3, t_1Count))
			var1 -= width
			var2 = nil
			var3 += 1
		else
			local var6, var7 = var5:split(var1)
			
			if var6:getWidth() <= var1 then
				table.insert(t_1, var6:render(var3, t_1Count))
				var2 = var7
			elseif #t_1 == 0 then
				if var5.canForceSplit then
					local var8, var9 = var5:split(var1, true)
					var6 = var8
					var7 = var9
				end
				table.insert(t_1, var6:render(var3, t_1Count))
				var2 = var7
			else
				var2 = var5
			end
			table.insert(t, t_1)
			t_1 = {}
			var1 = p2
		end
		var4 += 1
	end
	if var4 == 100 and fFlagDebugInlineLayout then
		warn("InlineLayout: trying to wrap text across multiple lines and iterations cap is reached. Layout may be imperfect", `Desired width: {p2}`, debug.traceback())
	end
	if #t_1 > 0 then
		table.insert(t, t_1)
	end
	return map(t, function(p1, p2)
		-- upvalues: reactModule (copy), view (copy)
		return reactModule.createElement(view, {
			tag = "auto-xy row align-x-left",
			key = tostring(p2),
			LayoutOrder = p2
		}, p1)
	end)
end

return function(p1)
	-- upvalues: useRef (ref), foundationModule (ref), useState (ref), useCallback (ref), layoutElements (ref), useEffect (ref), reactModule (ref), hoverContextModule (ref), view (ref)
	local var1 = useRef(nil)
	local var2 = foundationModule.Hooks.useTokens()
	local var3, var4 = useState({})
	local var5 = useCallback(function()
		-- upvalues: var1 (ref), var4 (ref), layoutElements (copy), p1 (ref)
		if var1.current == nil then return end
		if var1.current.AbsoluteSize.X == 0 then
			return
		end
		var4(layoutElements(p1.Elements, var1.current.AbsoluteSize.X))
	end, { p1.Elements })
	useEffect(var5, { var5 })
	
	return reactModule.createElement(hoverContextModule.Provider, nil, reactModule.createElement(view, {
		tag = "size-full-0 auto-y",
		onAbsoluteSizeChanged = var5,
		ref = var1,
		layout = {
			FillDirection = Enum.FillDirection.Vertical,
			HorizontalAlignment = p1.HorizontalAlignment or Enum.HorizontalAlignment.Left,
			Padding = p1.VerticalPadding or UDim.new(0, var2.Gap.Small)
		}
	}, var3))
end