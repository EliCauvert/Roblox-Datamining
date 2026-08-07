local parent = script:FindFirstAncestor("ChatUIPrimitives").Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local useMenuItemCursorModule = require(script.Parent.useMenuItemCursor)
local chatAutocompleteMaxVisibleEntries = game:DefineFastInt("ChatAutocompleteMaxVisibleEntries", 3)

return reactModule.memo(function(p0) --[[ line: 38 | named "ChatAutocompleteDropdown" ]]
	-- upvalues: foundationModule (ref), useMenuItemCursorModule (ref), reactModule (ref), chatAutocompleteMaxVisibleEntries (ref)
	local var4 = foundationModule.Hooks.useTokens()
	local var5 = useMenuItemCursorModule()
	local var6 = reactModule.useRef(nil)
	local var7, var8 = reactModule.useState(0)
	reactModule.useEffect(function() --[[ line: 45 ]]
		-- upvalues: p0 (ref), var8 (ref)
		local current = p0.anchorRef.current
		
		if current and current:IsA("GuiObject") then
			var8(current.AbsoluteSize.X)
			local var12 = current:GetPropertyChangedSignal("AbsoluteSize"):Connect(function() --[[ line: 51 ]]
				-- upvalues: var8 (copy), current (ref)
				var8(current.AbsoluteSize.X)
			end)
			
			return function() --[[ line: 54 ]]
				-- upvalues: var12 (ref)
				var12:Disconnect()
			end
		end
	end, { p0.anchorRef })
	local XXSmall = var4.Padding.XXSmall
	reactModule.useEffect(function() --[[ line: 65 ]]
		-- upvalues: var6 (ref), p0 (ref), XXSmall (ref)
		local current = var6.current
		
		if not current or not p0.isOpen or p0.keyboardIndex < 1 then return end
		local var13 = (p0.keyboardIndex - 1) * (40 + XXSmall)
		local var14 = var13 + 40
		local y = current.AbsoluteWindowSize.Y
		local y_1 = current.CanvasPosition.Y
		
		if y_1 + y < var14 then
			current.CanvasPosition = Vector2.new(0, var14 - y)
			
			return
		elseif var13 < y_1 then
			current.CanvasPosition = Vector2.new(0, var13)
		end
	end, { p0.keyboardIndex, p0.isOpen, XXSmall })
	local var9 = reactModule.useMemo(function() --[[ line: 83 ]]
		-- upvalues: p0 (ref), reactModule (copy), foundationModule (copy), var4 (ref), var5 (ref)
		local t = {}
		
		if not p0.isOpen or not p0.renderEntry then
			return t
		end
		local renderEntry = p0.renderEntry
		
		for i, v in p0.results do
			local var16 = i == p0.selectedIndex
			t["entry_" .. tostring(i)] = reactModule.createElement(foundationModule.View, {
				Size = UDim2.new(1, 0, 0, 40),
				LayoutOrder = i,
				cornerRadius = UDim.new(0, var4.Radius.Medium),
				backgroundStyle = if var16 then var4.Color.ActionSoftEmphasis.Background else nil,
				stateLayer = {
					affordance = foundationModule.Enums.StateLayerAffordance.None
				},
				selection = { Selectable = true },
				cursor = var5,
				padding = {
					left = UDim.new(0, 12),
					right = UDim.new(0, 12),
					top = UDim.new(0, 10),
					bottom = UDim.new(0, 10)
				},
				onActivated = function() --[[ line: 111 ]]
					-- upvalues: p0 (copy), i (ref)
					p0.onSelect(i)
				end,
				onStateChanged = function(p1) --[[ line: 114 ]]
					-- upvalues: p0 (copy), i (ref)
					if p1 == "Hover" then
						p0.onHover(i)
					end
				end
			}, { content = renderEntry(v, var16) })
		end
		return t
	end, {
		p0.isOpen, p0.results, p0.selectedIndex, p0.renderEntry, p0.onSelect,
		p0.onHover, var5, var4
	})
	local minValue = math.min(#p0.results, chatAutocompleteMaxVisibleEntries)
	local var11 = if not p0.isOpen then 0 elseif chatAutocompleteMaxVisibleEntries < #p0.results then minValue * 40 + minValue * XXSmall + 20 else minValue * 40 + math.max(0, minValue - 1) * XXSmall
	
	return reactModule.createElement(foundationModule.Popover.Root, { isOpen = p0.isOpen }, {
		Anchor = reactModule.createElement(foundationModule.Popover.Anchor, { anchorRef = p0.anchorRef }),
		Content = reactModule.createElement(foundationModule.Popover.Content, {
			hasArrow = false,
			side = {
				offset = 0,
				position = p0.side or foundationModule.Enums.PopoverSide.Top
			},
			align = foundationModule.Enums.PopoverAlign.Center,
			backgroundStyle = var4.Color.Surface.Surface_200,
			radius = foundationModule.Enums.Radius.Medium,
			onPressedOutside = p0.onDismiss
		}, reactModule.createElement(foundationModule.View, {
			tag = "padding-small",
			Size = UDim2.fromOffset(if var7 > 0 then var7 else 280, var11 + 16)
		}, {
			scrollView = reactModule.createElement(foundationModule.ScrollView, {
				Size = UDim2.new(1, 0, 0, var11),
				scrollingFrameRef = var6,
				scroll = {
					AutomaticCanvasSize = Enum.AutomaticSize.Y,
					CanvasSize = UDim2.fromScale(0, 0),
					scrollBarVisibility = foundationModule.Enums.Visibility.Always,
					VerticalScrollBarInset = Enum.ScrollBarInset.Always
				}
			}, {
				list = reactModule.createElement(foundationModule.View, {
					tag = "col gap-xxsmall auto-y",
					Size = UDim2.fromScale(1, 0)
				}, var9)
			})
		}))
	})
end)