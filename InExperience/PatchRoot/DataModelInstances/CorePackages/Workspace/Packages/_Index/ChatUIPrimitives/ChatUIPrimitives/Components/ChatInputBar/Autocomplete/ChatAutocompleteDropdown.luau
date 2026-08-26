local parent = script:FindFirstAncestor("ChatUIPrimitives").Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local useMenuItemCursorModule = require(script.Parent.useMenuItemCursor)
local chatAutocompleteMaxVisibleEntries = game:DefineFastInt("ChatAutocompleteMaxVisibleEntries", 3)

return reactModule.memo(function(p1)
	-- upvalues: foundationModule (ref), useMenuItemCursorModule (ref), reactModule (ref), chatAutocompleteMaxVisibleEntries (ref)
	local var1 = foundationModule.Hooks.useTokens()
	local var2 = useMenuItemCursorModule()
	local var3 = reactModule.useRef(nil)
	local var4, var5 = reactModule.useState(0)
	reactModule.useEffect(function()
		-- upvalues: p1 (ref), var5 (ref)
		local current = p1.anchorRef.current
		
		if current and current:IsA("GuiObject") then
			var5(current.AbsoluteSize.X)
			local var6 = current:GetPropertyChangedSignal("AbsoluteSize"):Connect(function()
				-- upvalues: var5 (copy), current (ref)
				var5(current.AbsoluteSize.X)
			end)
			
			return function()
				-- upvalues: var6 (ref)
				var6:Disconnect()
			end
		end
	end, { p1.anchorRef })
	local XXSmall = var1.Padding.XXSmall
	reactModule.useEffect(function()
		-- upvalues: var3 (ref), p1 (ref), XXSmall (ref)
		local current = var3.current
		
		if not current or not p1.isOpen or p1.keyboardIndex < 1 then return end
		local var6 = (p1.keyboardIndex - 1) * (40 + XXSmall)
		local var7 = var6 + 40
		local y = current.AbsoluteWindowSize.Y
		local y_1 = current.CanvasPosition.Y
		
		if y_1 + y < var7 then
			current.CanvasPosition = Vector2.new(0, var7 - y)
			
			return
		elseif var6 < y_1 then
			current.CanvasPosition = Vector2.new(0, var6)
		end
	end, { p1.keyboardIndex, p1.isOpen, XXSmall })
	local var6 = reactModule.useMemo(function()
		-- upvalues: p1 (ref), reactModule (copy), foundationModule (copy), var1 (ref), var2 (ref)
		local t = {}
		
		if not p1.isOpen or not p1.renderEntry then
			return t
		end
		local renderEntry = p1.renderEntry
		
		for i, v in p1.results do
			local var7 = i == p1.selectedIndex
			t["entry_" .. tostring(i)] = reactModule.createElement(foundationModule.View, {
				Size = UDim2.new(1, 0, 0, 40),
				LayoutOrder = i,
				cornerRadius = UDim.new(0, var1.Radius.Medium),
				backgroundStyle = if var7 then var1.Color.ActionSoftEmphasis.Background else nil,
				stateLayer = {
					affordance = foundationModule.Enums.StateLayerAffordance.None
				},
				selection = { Selectable = true },
				cursor = var2,
				padding = {
					left = UDim.new(0, 12),
					right = UDim.new(0, 12),
					top = UDim.new(0, 10),
					bottom = UDim.new(0, 10)
				},
				onActivated = function()
					-- upvalues: p1 (copy), i (ref)
					p1.onSelect(i)
				end,
				onStateChanged = function(p2)
					-- upvalues: p1 (copy), i (ref)
					if p2 == "Hover" then
						p1.onHover(i)
					end
				end
			}, { content = renderEntry(v, var7) })
		end
		return t
	end, {
		p1.isOpen, p1.results, p1.selectedIndex, p1.renderEntry, p1.onSelect,
		p1.onHover, var2, var1
	})
	local minValue = math.min(#p1.results, chatAutocompleteMaxVisibleEntries)
	local var8 = if not p1.isOpen then 0 elseif chatAutocompleteMaxVisibleEntries < #p1.results then minValue * 40 + minValue * XXSmall + 20 else minValue * 40 + math.max(0, minValue - 1) * XXSmall
	
	return reactModule.createElement(foundationModule.Popover.Root, { isOpen = p1.isOpen }, {
		Anchor = reactModule.createElement(foundationModule.Popover.Anchor, { anchorRef = p1.anchorRef }),
		Content = reactModule.createElement(foundationModule.Popover.Content, {
			hasArrow = false,
			side = {
				offset = 0,
				position = p1.side or foundationModule.Enums.PopoverSide.Top
			},
			align = foundationModule.Enums.PopoverAlign.Center,
			backgroundStyle = var1.Color.Surface.Surface_200,
			radius = foundationModule.Enums.Radius.Medium,
			onPressedOutside = p1.onDismiss
		}, reactModule.createElement(foundationModule.View, {
			tag = "padding-small",
			Size = UDim2.fromOffset(if var4 > 0 then var4 else 280, var8 + 16)
		}, {
			scrollView = reactModule.createElement(foundationModule.ScrollView, {
				Size = UDim2.new(1, 0, 0, var8),
				scrollingFrameRef = var3,
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
				}, var6)
			})
		}))
	})
end)