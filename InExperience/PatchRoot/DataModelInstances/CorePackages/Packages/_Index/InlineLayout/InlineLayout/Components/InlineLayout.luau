local Parent = script:FindFirstAncestor("Components").Parent
local Parent1 = Parent.Parent
local FoundationModule = require(Parent1.Foundation)
local ReactModule = require(Parent1.React)
local UseCallbackFunction = ReactModule.useCallback
local UseRefFunction = ReactModule.useRef
local UseStateFunction = ReactModule.useState
local UseEffectFunction = ReactModule.useEffect
local MapFunction = require(Parent1.Dash).map
local _ = require(Parent.Components.InlineLayout.InlineLayoutElements.RenderableInlineElement)
local HardBreakElementModule = require(Parent.Components.InlineLayout.InlineLayoutElements.HardBreakElement)
local HoverContextModule = require(Parent.Components.InlineLayout.InlineLayoutElements.HoverContext)
local RenderInMeasuredFrameModule = require(Parent.Utils.renderInMeasuredFrame)
local View = FoundationModule.View
local Flags = require(Parent1.MarkdownCore).Flags
local FFlagDebugInlineLayout = game:DefineFastFlag("FFlagDebugInlineLayout", false)

local function layoutElements(Elements, X)
	-- upvalues: Flags (copy), HardBreakElementModule (copy), RenderInMeasuredFrameModule (copy), FFlagDebugInlineLayout (copy), MapFunction (copy), ReactModule (copy), View (copy)
	if #Elements == 0 then
		return {}
	end
	local Count: number = if Flags.FFlagMarkdownAssistantParity then #Elements * 4 + 100 else 100
	local List = {}
	local List1 = {}
	local Total = X
	local v1: string? = nil
	local Count1 = 1
	local Count2 = 0
	local Flag = false
	
	local function _()
		-- upvalues: List (copy), List1 (ref), Total (ref), X (copy)
		table.insert(List, List1)
		List1 = {}
		Total = X
	end
	while (Count1 <= #Elements or v1) and Count2 < Count do
		local V16 = v1 or Elements[Count1]
		
		if V16 == HardBreakElementModule then
			Count1 += 1
			table.insert(List, List1)
			List1 = {}
			Total = X
			Flag = false
		else
			if #List1 == 0 and Flag and V16.trimStart then
				local TrimStartResult = V16:trimStart()
				
				if TrimStartResult == nil then
					v1 = nil
					Count1 += 1
					Count2 += 1
					continue
				else
					V16 = TrimStartResult
				end
			end
			local Width = V16:getWidth()
			local CountList1 = #List1
			
			if Width <= Total then
				table.insert(List1, RenderInMeasuredFrameModule(V16:render(Count1, CountList1), Width, CountList1))
				Total -= Width
				v1 = nil
				Count1 += 1
			else
				local Parts, Parts2 = V16:split(Total)
				
				if Parts:getWidth() <= Total then
					table.insert(List1, RenderInMeasuredFrameModule(Parts:render(Count1, CountList1), Parts:getWidth(), CountList1))
					v1 = Parts2
				elseif #List1 == 0 then
					if V16.canForceSplit then
						Parts, Parts2 = V16:split(Total, true)
					end
					table.insert(List1, RenderInMeasuredFrameModule(Parts:render(Count1, CountList1), Parts:getWidth(), CountList1))
					v1 = Parts2
				else
					v1 = V16
				end
				if Flags.FFlagMarkdownAssistantParity and v1 == nil then
					Count1 += 1
				end
				table.insert(List, List1)
				List1 = {}
				Total = X
				Flag = true
			end
			Count2 += 1
		end
	end
	if Count2 == Count and FFlagDebugInlineLayout then
		warn("InlineLayout: trying to wrap text across multiple lines and iterations cap is reached. Layout may be imperfect", `Desired width: {X}, elements: {#Elements}`, debug.traceback())
	end
	if #List1 > 0 then
		table.insert(List, List1)
	end
	return MapFunction(List, function(p1, LayoutOrder)
		-- upvalues: ReactModule (upval), View (upval)
		return ReactModule.createElement(View, {
			tag = "auto-xy row align-x-left",
			key = tostring(LayoutOrder),
			LayoutOrder = LayoutOrder
		}, p1)
	end)
end

return function(p1)
	-- upvalues: UseRefFunction (copy), FoundationModule (copy), UseStateFunction (copy), UseCallbackFunction (copy), layoutElements (copy), UseEffectFunction (copy), ReactModule (copy), HoverContextModule (copy), View (copy)
	local UseRefResult = UseRefFunction(nil)
	local UseTokensResult = FoundationModule.Hooks.useTokens()
	local UseStateResult, UseStateResult2 = UseStateFunction({})
	local UseCallbackResult = UseCallbackFunction(function()
		-- upvalues: UseRefResult (copy), UseStateResult2 (copy), layoutElements (upval), p1 (copy)
		if UseRefResult.current == nil then return end
		if UseRefResult.current.AbsoluteSize.X ~= 0 then
			UseStateResult2(layoutElements(p1.Elements, UseRefResult.current.AbsoluteSize.X))
			
			return
		end
	end, { p1.Elements })
	UseEffectFunction(UseCallbackResult, { UseCallbackResult })
	
	return ReactModule.createElement(HoverContextModule.Provider, nil, ReactModule.createElement(View, {
		tag = "size-full-0 auto-y",
		onAbsoluteSizeChanged = UseCallbackResult,
		ref = UseRefResult,
		layout = {
			FillDirection = Enum.FillDirection.Vertical,
			HorizontalAlignment = p1.HorizontalAlignment or Enum.HorizontalAlignment.Left,
			Padding = p1.VerticalPadding or UDim.new(0, UseTokensResult.Gap.Small)
		}
	}, UseStateResult))
end