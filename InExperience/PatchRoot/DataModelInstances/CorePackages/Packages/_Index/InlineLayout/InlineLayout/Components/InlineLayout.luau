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
local flags = require(parent_1.MarkdownCore).Flags
local fFlagDebugInlineLayout = game:DefineFastFlag("FFlagDebugInlineLayout", false)

local function layoutElements(p1, p2)
	-- upvalues: flags (ref), hardBreakElementModule (ref), fFlagDebugInlineLayout (ref), map (ref), reactModule (ref), view (ref)
	if #p1 == 0 then
		return {}
	end
	local var1 = if flags.FFlagMarkdownAssistantParity then #p1 * 4 + 100 else 100
	local t = {}
	local t_1 = {}
	local var2 = p2
	local var3 = nil
	local var4 = 1
	local var5 = 0
	local _ = nil
	
	local function _()
		-- upvalues: t (ref), t_1 (write), var2 (write), p2 (ref)
		table.insert(t, t_1)
		t_1 = {}
		var2 = p2
	end
	while (var4 <= #p1 or var3) and var5 < var1 do
		local var6 = var3 or p1[var4]
		
		if var6 == hardBreakElementModule then
			var4 += 1
			table.insert(t, t_1)
			t_1 = {}
			var2 = p2
			continue
		end
		local width = var6:getWidth()
		local t_1Count = #t_1
		
		if width <= var2 then
			table.insert(t_1, var6:render(var4, t_1Count))
			var2 -= width
			var3 = nil
			var4 += 1
		else
			local var7, var8 = var6:split(var2)
			
			if var7:getWidth() <= var2 then
				table.insert(t_1, var7:render(var4, t_1Count))
				var3 = var8
			elseif #t_1 == 0 then
				if var6.canForceSplit then
					local var9, var10 = var6:split(var2, true)
					var7 = var9
					var8 = var10
				end
				table.insert(t_1, var7:render(var4, t_1Count))
				var3 = var8
			else
				var3 = var6
			end
			if flags.FFlagMarkdownAssistantParity and var3 == nil then
				var4 += 1
			end
			table.insert(t, t_1)
			t_1 = {}
			var2 = p2
		end
		var5 += 1
	end
	if var5 == var1 and fFlagDebugInlineLayout then
		warn("InlineLayout: trying to wrap text across multiple lines and iterations cap is reached. Layout may be imperfect", `Desired width: {p2}, elements: {#p1}`, debug.traceback())
	end
	if #t_1 > 0 then
		table.insert(t, t_1)
	end
	return map(t, function(p3, p4)
		-- upvalues: reactModule (copy), view (copy)
		return reactModule.createElement(view, {
			tag = "auto-xy row align-x-left",
			key = tostring(p4),
			LayoutOrder = p4
		}, p3)
	end)
end

return function(p3)
	-- upvalues: useRef (ref), foundationModule (ref), useState (ref), useCallback (ref), layoutElements (ref), useEffect (ref), reactModule (ref), hoverContextModule (ref), view (ref)
	local var11 = useRef(nil)
	local var12 = foundationModule.Hooks.useTokens()
	local var13, var14 = useState({})
	local var15 = useCallback(function()
		-- upvalues: var11 (ref), var14 (ref), layoutElements (copy), p3 (ref)
		if var11.current == nil then return end
		if var11.current.AbsoluteSize.X == 0 then
			return
		end
		var14(layoutElements(p3.Elements, var11.current.AbsoluteSize.X))
	end, { p3.Elements })
	useEffect(var15, { var15 })
	
	return reactModule.createElement(hoverContextModule.Provider, nil, reactModule.createElement(view, {
		tag = "size-full-0 auto-y",
		onAbsoluteSizeChanged = var15,
		ref = var11,
		layout = {
			FillDirection = Enum.FillDirection.Vertical,
			HorizontalAlignment = p3.HorizontalAlignment or Enum.HorizontalAlignment.Left,
			Padding = p3.VerticalPadding or UDim.new(0, var12.Gap.Small)
		}
	}, var13))
end