local Parent = script:FindFirstAncestor("ChatUIPrimitives").Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local UseMenuItemCursorModule = require(script.Parent.useMenuItemCursor)
local ChatAutocompleteMaxVisibleEntries = game:DefineFastInt("ChatAutocompleteMaxVisibleEntries", 3)

return ReactModule.memo(function(p1)
	-- upvalues: FoundationModule (copy), UseMenuItemCursorModule (copy), ReactModule (copy), ChatAutocompleteMaxVisibleEntries (copy)
	local UseTokensResult = FoundationModule.Hooks.useTokens()
	local UseMenuItemCursorModuleResult = UseMenuItemCursorModule()
	local UseRefResult = ReactModule.useRef(nil)
	local UseStateResult, UseStateResult2 = ReactModule.useState(0)
	ReactModule.useEffect(function()
		-- upvalues: p1 (copy), UseStateResult2 (copy)
		local Current = p1.anchorRef.current
		
		if not Current or not Current:IsA("GuiObject") then return end
		UseStateResult2(Current.AbsoluteSize.X)
		local Connection = Current:GetPropertyChangedSignal("AbsoluteSize"):Connect(function()
			-- upvalues: UseStateResult2 (upval), Current (copy)
			UseStateResult2(Current.AbsoluteSize.X)
		end)
		
		return function()
			-- upvalues: Connection (copy)
			Connection:Disconnect()
		end
	end, { p1.anchorRef })
	local XXSmall = UseTokensResult.Padding.XXSmall
	ReactModule.useEffect(function()
		-- upvalues: UseRefResult (copy), p1 (copy), XXSmall (copy)
		local Current = UseRefResult.current
		
		if not Current or not p1.isOpen or p1.keyboardIndex < 1 then return end
		local ScaledKeyboardIndex = (p1.keyboardIndex - 1) * (40 + XXSmall)
		local NewScaledKeyboardIndex = ScaledKeyboardIndex + 40
		local Y: number = Current.AbsoluteWindowSize.Y
		local Y1: number = Current.CanvasPosition.Y
		
		if Y1 + Y < NewScaledKeyboardIndex then
			Current.CanvasPosition = Vector2.new(0, NewScaledKeyboardIndex - Y)
			
			return
		end
		if ScaledKeyboardIndex < Y1 then
			Current.CanvasPosition = Vector2.new(0, ScaledKeyboardIndex)
		end
	end, { p1.keyboardIndex, p1.isOpen, XXSmall })
	local Smallest = math.min(#p1.results, ChatAutocompleteMaxVisibleEntries)
	local IsChatAutocompleteMaxVisibleEntriesBelow = ChatAutocompleteMaxVisibleEntries < #p1.results
	local NewSmallest: number = if p1.isOpen then if IsChatAutocompleteMaxVisibleEntriesBelow then Smallest * 40 + Smallest * XXSmall + 20 else Smallest * 40 + math.max(0, Smallest - 1) * XXSmall else 0
	
	return ReactModule.createElement(FoundationModule.Popover.Root, { isOpen = p1.isOpen }, {
		Anchor = ReactModule.createElement(FoundationModule.Popover.Anchor, { anchorRef = p1.anchorRef }),
		Content = ReactModule.createElement(FoundationModule.Popover.Content, {
			hasArrow = false,
			side = {
				offset = 0,
				position = p1.side or FoundationModule.Enums.PopoverSide.Top
			},
			align = FoundationModule.Enums.PopoverAlign.Center,
			backgroundStyle = UseTokensResult.Color.Surface.Surface_200,
			radius = FoundationModule.Enums.Radius.Medium,
			onPressedOutside = p1.onDismiss
		}, ReactModule.createElement(FoundationModule.View, {
			tag = "padding-small",
			Size = UDim2.fromOffset(if UseStateResult > 0 then UseStateResult else 280, NewSmallest + 16)
		}, {
			scrollView = ReactModule.createElement(FoundationModule.ScrollView, {
				Size = UDim2.new(1, 0, 0, NewSmallest),
				scrollingFrameRef = UseRefResult,
				scroll = {
					AutomaticCanvasSize = Enum.AutomaticSize.Y,
					CanvasSize = UDim2.fromScale(0, 0),
					scrollBarVisibility = FoundationModule.Enums.Visibility.Always,
					VerticalScrollBarInset = Enum.ScrollBarInset.Always
				}
			}, {
				list = ReactModule.createElement(FoundationModule.View, {
					tag = "col gap-xxsmall auto-y",
					Size = UDim2.fromScale(1, 0)
				}, (ReactModule.useMemo(function()
					-- upvalues: p1 (copy), ReactModule (upval), FoundationModule (upval), UseTokensResult (copy), UseMenuItemCursorModuleResult (copy)
					local Elements = {}
					
					if not p1.isOpen or not p1.renderEntry then
						return Elements
					end
					local RenderEntryFunction = p1.renderEntry
					
					for LayoutOrder, result in p1.results do
						local IsSelectedIndexMatch = LayoutOrder == p1.selectedIndex
						Elements["entry_" .. tostring(LayoutOrder)] = ReactModule.createElement(FoundationModule.View, {
							Size = UDim2.new(1, 0, 0, 40),
							LayoutOrder = LayoutOrder,
							cornerRadius = UDim.new(0, UseTokensResult.Radius.Medium),
							backgroundStyle = if IsSelectedIndexMatch then UseTokensResult.Color.ActionSoftEmphasis.Background else nil,
							stateLayer = {
								affordance = FoundationModule.Enums.StateLayerAffordance.None
							},
							selection = { Selectable = true },
							cursor = UseMenuItemCursorModuleResult,
							padding = {
								left = UDim.new(0, 12),
								right = UDim.new(0, 12),
								top = UDim.new(0, 10),
								bottom = UDim.new(0, 10)
							},
							onActivated = function()
								-- upvalues: p1 (upval), LayoutOrder (copy)
								p1.onSelect(LayoutOrder)
							end,
							onStateChanged = function(p2)
								-- upvalues: p1 (upval), LayoutOrder (copy)
								if p2 == "Hover" then
									p1.onHover(LayoutOrder)
								end
							end
						}, {
							content = RenderEntryFunction(result, IsSelectedIndexMatch)
						})
					end
					return Elements
				end, {
					p1.isOpen, p1.results, p1.selectedIndex, p1.renderEntry, p1.onSelect,
					p1.onHover, UseMenuItemCursorModuleResult, UseTokensResult
				})))
			})
		}))
	})
end)