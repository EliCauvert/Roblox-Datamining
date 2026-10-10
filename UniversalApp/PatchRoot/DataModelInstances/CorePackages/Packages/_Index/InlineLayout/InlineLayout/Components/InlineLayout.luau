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
local renderInMeasuredFrameModule = require(parent.Utils.renderInMeasuredFrame)
local view = foundationModule.View
local flags = require(parent_1.MarkdownCore).Flags
local fFlagDebugInlineLayout = game:DefineFastFlag("FFlagDebugInlineLayout", false)

local function layoutElements(p1, p2)
	-- upvalues: flags (ref), hardBreakElementModule (ref), renderInMeasuredFrameModule (ref), fFlagDebugInlineLayout (ref), map (ref), reactModule (ref), view (ref)
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
	local var6 = false
	
	local function _()
		-- upvalues: t (ref), t_1 (write), var2 (write), p2 (ref)
		table.insert(t, t_1)
		t_1 = {}
		var2 = p2
	end
	while (var4 <= #p1 or var3) and var5 < var1 do
		local var7
		local var8 = var3 or p1[var4]
		
		if var8 == hardBreakElementModule then
			var4 += 1
			table.insert(t, t_1)
			t_1 = {}
			var2 = p2
			var6 = false
		elseif #t_1 == 0 and var6 and var8.trimStart then
			var7 = var8:trimStart()
			
			if var7 == nil then
				var3 = nil
				var4 += 1
				var5 += 1
			else
				var8 = var7
			end
		end
		var7 = var8:getWidth()
		local t_1Count = #t_1
		
		if var7 <= var2 then
			table.insert(t_1, renderInMeasuredFrameModule(var8:render(var4, t_1Count), var7, t_1Count))
			var2 -= var7
			var3 = nil
			var4 += 1
		else
			local var9, var10 = var8:split(var2)
			
			if var9:getWidth() <= var2 then
				table.insert(t_1, renderInMeasuredFrameModule(var9:render(var4, t_1Count), var9:getWidth(), t_1Count))
				var3 = var10
			elseif #t_1 == 0 then
				if var8.canForceSplit then
					local var11, var12 = var8:split(var2, true)
					var9 = var11
					var10 = var12
				end
				table.insert(t_1, renderInMeasuredFrameModule(var9:render(var4, t_1Count), var9:getWidth(), t_1Count))
				var3 = var10
			else
				var3 = var8
			end
			if flags.FFlagMarkdownAssistantParity and var3 == nil then
				var4 += 1
			end
			table.insert(t, t_1)
			t_1 = {}
			var2 = p2
			var6 = true
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
	local var13 = useRef(nil)
	local var14 = foundationModule.Hooks.useTokens()
	local var15, var16 = useState({})
	local var17 = useCallback(function()
		-- upvalues: var13 (ref), var16 (ref), layoutElements (copy), p3 (ref)
		if var13.current == nil then return end
		if var13.current.AbsoluteSize.X == 0 then
			return
		end
		var16(layoutElements(p3.Elements, var13.current.AbsoluteSize.X))
	end, { p3.Elements })
	useEffect(var17, { var17 })
	
	return reactModule.createElement(hoverContextModule.Provider, nil, reactModule.createElement(view, {
		tag = "size-full-0 auto-y",
		onAbsoluteSizeChanged = var17,
		ref = var13,
		layout = {
			FillDirection = Enum.FillDirection.Vertical,
			HorizontalAlignment = p3.HorizontalAlignment or Enum.HorizontalAlignment.Left,
			Padding = p3.VerticalPadding or UDim.new(0, var14.Gap.Small)
		}
	}, var15))
end