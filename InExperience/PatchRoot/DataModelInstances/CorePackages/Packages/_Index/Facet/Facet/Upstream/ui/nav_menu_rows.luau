local _ = require("./control_types")
local _ = require("../vendor/compose/core")
local _ = require("./types")
local _ = require("./navigation_types")
local NavMenuItemsModule = require("./nav_menu_items")
local _ = require("./theme_types")

return function(p1, p2, p3)
	-- upvalues: NavMenuItemsModule (copy)
	local Host = p1.Host
	local Compose = p1.Compose
	local Runtime = p1.runtime
	local ReadFunction = p1.read
	local TypesEnum = p1.types.Enum
	local TypesUDim2 = p1.types.UDim2
	local TypesVector2 = p1.types.Vector2
	local TypesUDim = p1.types.UDim
	local NavMenuItemsModuleResult = NavMenuItemsModule(p1)
	local ActionItemFunction = NavMenuItemsModuleResult.actionItem
	local CommitItemFunction = NavMenuItemsModuleResult.commitItem
	
	local function trailingMark(Object, ChevronTrailing, Callback, Enabled)
		-- upvalues: p1 (copy), ReadFunction (copy), TypesEnum (copy), Runtime (copy), Host (copy), TypesUDim (copy), TypesVector2 (copy), TypesUDim2 (copy)
		Object:AddTag("facet-menu-mark")
		local GuiStateResult = if p1.iconVaries(ChevronTrailing) then p1.observe.GuiState(Object) else nil
		local v1 = if GuiStateResult then function(Callback1): string
			-- upvalues: ReadFunction (upval), Enabled (copy), GuiStateResult (copy), TypesEnum (upval), Callback (copy)
			return if ReadFunction(Enabled, Callback1) == false then "disabled" elseif Callback1(GuiStateResult) == TypesEnum.GuiState.Press then "pressed" elseif Callback1(GuiStateResult) == TypesEnum.GuiState.Hover then "hover" elseif Callback(Callback1) then "selected" else "default"
		end else nil
		Runtime.mountFragment(function()
			-- upvalues: Host (upval), p1 (upval), TypesUDim (upval), ChevronTrailing (copy), TypesVector2 (upval), TypesUDim2 (upval), v1 (ref)
			return {
				Host.UIPadding({
					PaddingRight = if p1.config.theme == nil then TypesUDim.new(0, p1.controlSize(nil, "iconSize") + 8) else nil
				}),
				p1.icon(ChevronTrailing, {
					Name = "TrailingIcon",
					AnchorPoint = TypesVector2.new(1, 0.5),
					Position = function(p4)
						-- upvalues: TypesUDim2 (upval), p1 (upval)
						return TypesUDim2.new(1, p1.controlSize(nil, "iconSize", p4) + 8, 0.5, 0)
					end
				}, v1)
			}
		end, Object)
	end
	
	local function hairline()
		-- upvalues: p1 (copy), Host (copy), TypesUDim2 (copy)
		return p1.styled(Host.Frame({
			Name = "Hairline",
			ZIndex = 3,
			Size = TypesUDim2.new(1, 0, 0, 1)
		}), "menu-hairline")
	end
	
	local function fillTitle(Object)
		-- upvalues: p1 (copy), Runtime (copy), Host (copy)
		local Content = Object:FindFirstChild("Content")
		local Captions = Content and (Content:FindFirstChild("Captions") or Content:FindFirstChild("Title"))
		
		if Content and Content:IsA("GuiObject") and Content.Size.X.Scale == 0 then
			Content.Size = p1.types.UDim2.new(1, 0, Content.Size.Y.Scale, Content.Size.Y.Offset)
			Content.AutomaticSize = if Content.AutomaticSize == p1.types.Enum.AutomaticSize.None then p1.types.Enum.AutomaticSize.None else p1.types.Enum.AutomaticSize.Y
		end
		if Captions and not Captions:FindFirstChildWhichIsA("UIFlexItem") then
			Runtime.mount(function()
				-- upvalues: Host (upval), p1 (upval)
				return Host.UIFlexItem({ FlexMode = p1.types.Enum.UIFlexMode.Fill })
			end, Captions)
		end
	end
	
	return {
		entry = function(p4, LayoutOrder, p5)
			-- upvalues: p1 (copy), Host (copy), TypesUDim2 (copy), TypesEnum (copy), Compose (copy), ActionItemFunction (copy), ReadFunction (copy), p2 (copy), ReadFunction (copy), CommitItemFunction (copy), trailingMark (copy), fillTitle (copy), p3 (copy), hairline (copy), TypesVector2 (copy), TypesUDim (copy), Runtime (copy)
			local HitFloorFunction = p5.hitFloor
			local Sheeted = p5.sheeted
			local RowNodes = p5.rowNodes
			local Widths = p5.widths
			local EnterFunction = p5.enter
			local CloseFunction = p5.close
			local PeekResult = p4:peek()
			
			if PeekResult.heading then
				local SectionTitle = p1.text({
					Name = "SectionTitle",
					Text = function(Callback)
						-- upvalues: p4 (copy)
						return Callback(p4).heading or ""
					end
				})
				p1.textRole(SectionTitle, "caption")
				SectionTitle:AddTag("facet-secondary")
				
				return Host.Frame(PeekResult.key)({
					LayoutOrder = LayoutOrder,
					BackgroundTransparency = 1,
					Size = TypesUDim2.new(1, 0, 0, 0),
					AutomaticSize = TypesEnum.AutomaticSize.Y,
					p1.padding(12, 4),
					SectionTitle
				})
			end
			local FormulaResult = Compose.formula(function(Callback)
				-- upvalues: p4 (copy)
				return assert(Callback(p4).item)
			end)
			local PeekResult1 = FormulaResult:peek()
			
			if PeekResult1.divider then
				return p1.styled(Host.Frame("Divider")({
					Size = TypesUDim2.new(1, 0, 0, 1),
					LayoutOrder = LayoutOrder
				}), "divider")
			end
			local Text = tostring(PeekResult1.id or LayoutOrder:peek())
			local ChevronTrailing = if PeekResult1.children then "chevron.trailing" elseif PeekResult1.checked == nil and PeekResult1.selected == nil and PeekResult1.marked == nil then nil else "checkmark"
			local NoControlSize: boolean = PeekResult1.icon == nil and (PeekResult1.description == nil and PeekResult1.avatar == nil) and p1.config.controlSize == nil
			
			local function selected(Callback)
				-- upvalues: ActionItemFunction (upval), FormulaResult (copy), ReadFunction (upval)
				local ActionItemResult = ActionItemFunction(Callback(FormulaResult))
				
				return if ActionItemResult.checked then Callback(ActionItemResult.checked) elseif ActionItemResult.selected then Callback(ActionItemResult.selected) == ActionItemResult.value else ReadFunction(ActionItemResult.marked, Callback) == true
			end
			
			local function enabled(Callback): boolean
				-- upvalues: ReadFunction (upval), ActionItemFunction (upval), FormulaResult (copy)
				return ReadFunction(ActionItemFunction(Callback(FormulaResult)).enabled, Callback) ~= false
			end
			
			local Object = nil
			Object = p2.Button({
				TextWrapped = true,
				Name = Text,
				LayoutOrder = LayoutOrder,
				AutomaticSize = TypesEnum.AutomaticSize.Y,
				TextTruncate = TypesEnum.TextTruncate.None,
				Size = function(p6)
					-- upvalues: TypesUDim2 (upval), HitFloorFunction (copy)
					return TypesUDim2.new(1, 0, 0, HitFloorFunction(p6))
				end,
				label = function(Callback)
					-- upvalues: ReadFunction (upval), ActionItemFunction (upval), FormulaResult (copy)
					return ReadFunction(ActionItemFunction(Callback(FormulaResult)).label, Callback) or ""
				end,
				icon = PeekResult1.icon,
				role = PeekResult1.role,
				trailingIcon = if NoControlSize then nil else ChevronTrailing,
				subtitle = if PeekResult1.description == nil and PeekResult1.avatar == nil then nil else function(Callback)
					-- upvalues: ReadFunction (upval), ActionItemFunction (upval), FormulaResult (copy)
					return ReadFunction(ActionItemFunction(Callback(FormulaResult)).description, Callback) or ""
				end,
				TextXAlignment = TypesEnum.TextXAlignment.Left,
				enabled = enabled,
				selected = selected,
				onActivate = function()
					-- upvalues: ActionItemFunction (upval), FormulaResult (copy), ReadFunction (upval), EnterFunction (copy), Object (ref), CommitItemFunction (upval), CloseFunction (copy)
					local ActionItemResult = ActionItemFunction(FormulaResult:peek())
					
					if ReadFunction(ActionItemResult.enabled) == false then return end
					if ActionItemResult.children then
						EnterFunction(assert(ActionItemResult.id), Object)
						
						return
					end
					if CommitItemFunction(ActionItemResult) and (ActionItemResult.dismiss == true or ActionItemResult.dismiss ~= false and not ActionItemResult.checked and not ActionItemResult.selected) then
						CloseFunction()
					end
				end
			})
			
			if NoControlSize and ChevronTrailing then
				trailingMark(Object, ChevronTrailing, selected, enabled)
			end
			Object:AddTag("facet-menu-item")
			
			if NoControlSize then
				p1.textLayout(Object)
			end
			RowNodes[Text] = Object
			Compose.cleanup(function()
				-- upvalues: RowNodes (copy), Text (copy), Object (ref)
				if RowNodes[Text] == Object then
					RowNodes[Text] = nil
				end
			end)
			fillTitle(Object)
			p3.attach(Object, {
				Compose.show(function(Callback): boolean
					-- upvalues: p4 (copy), Sheeted (copy)
					return Callback(p4).ruled == true and not Callback(Sheeted)
				end, hairline)
			})
			Compose.watch(function(p6)
				-- upvalues: HitFloorFunction (copy), p1 (upval), Object (ref)
				if HitFloorFunction(p6) < p1.metric("targetSizes.minimum", p6) then
					Object:AddTag("facet-menu-dense")
					
					return
				end
				if Object:HasTag("facet-menu-dense") then
					Object:RemoveTag("facet-menu-dense")
				end
			end)
			local List = {}
			local Callback: ((any) -> number)? = nil
			
			if PeekResult1.badge ~= nil then
				table.insert(List, p2.Badge({
					Name = "Count",
					LayoutOrder = 1,
					label = function(Callback): string
						-- upvalues: ReadFunction (upval), ActionItemFunction (upval), FormulaResult (copy)
						local ReadResult = ReadFunction(ActionItemFunction(Callback(FormulaResult)).badge, Callback)
						
						return if ReadResult == nil then "" else tostring(ReadResult)
					end
				}))
			end
			if PeekResult1.meta ~= nil then
				local Meta = p1.text({
					Name = "Meta",
					LayoutOrder = 0,
					Text = function(Callback)
						-- upvalues: ReadFunction (upval), ActionItemFunction (upval), FormulaResult (copy)
						return ReadFunction(ActionItemFunction(Callback(FormulaResult)).meta, Callback) or ""
					end,
					AutomaticSize = TypesEnum.AutomaticSize.XY
				})
				Meta:AddTag("facet-secondary")
				table.insert(List, Meta)
			end
			if PeekResult1.shortcutLabel ~= nil then
				local Shortcut = p1.text({
					Name = "Shortcut",
					LayoutOrder = 2,
					Text = function(Callback)
						-- upvalues: ReadFunction (upval), ActionItemFunction (upval), FormulaResult (copy)
						return ReadFunction(ActionItemFunction(Callback(FormulaResult)).shortcutLabel, Callback) or ""
					end,
					AutomaticSize = TypesEnum.AutomaticSize.XY
				})
				Shortcut:AddTag("facet-secondary")
				table.insert(List, Shortcut)
			end
			if #List > 0 then
				local v1: number = if PeekResult1.checked or PeekResult1.selected or PeekResult1.marked then 32 else 0
				local v2 = Host.Frame("Accessories")({
					BackgroundTransparency = 1,
					AnchorPoint = TypesVector2.new(1, 0.5),
					Position = TypesUDim2.new(1, -v1, 0.5, 0),
					Size = TypesUDim2.fromOffset(0, 0),
					AutomaticSize = TypesEnum.AutomaticSize.XY,
					ZIndex = 2,
					Host.UIListLayout({
						FillDirection = TypesEnum.FillDirection.Horizontal,
						SortOrder = TypesEnum.SortOrder.LayoutOrder,
						VerticalAlignment = TypesEnum.VerticalAlignment.Center,
						Padding = TypesUDim.new(0, 8)
					}),
					table.unpack(List)
				})
				p3.attach(Object, { v2 })
				local Content = Object:FindFirstChild("Content")
				
				if Content then
					local AbsoluteSizeResult = p1.observe.AbsoluteSize(v2)
					
					Callback = function(Callback): number
						-- upvalues: AbsoluteSizeResult (copy), v1 (copy)
						return Callback(AbsoluteSizeResult).X + v1 + 8
					end
					
					Runtime.decorate(Content, {
						Size = function(Callback)
							-- upvalues: TypesUDim2 (upval), AbsoluteSizeResult (copy), v1 (copy)
							return TypesUDim2.new(1, -(Callback(AbsoluteSizeResult).X + v1 + 8), 0, 0)
						end
					})
				end
			end
			local Avatar = PeekResult1.avatar
			local Content1 = Object:FindFirstChild("Content")
			
			if Avatar and Content1 then
				Runtime.mount(function()
					-- upvalues: p2 (upval), Avatar (copy)
					return p2.Avatar({
						Name = "Avatar",
						LayoutOrder = 0,
						controlSize = "compact",
						Selectable = false,
						Active = false,
						Interactable = false,
						name = Avatar.name,
						image = Avatar.image,
						userId = Avatar.userId
					})
				end, Content1)
			end
			local TrailingIcon = if PeekResult1.children then nil else Object:FindFirstChild("TrailingIcon", true)
			
			if TrailingIcon and TrailingIcon:IsA("GuiObject") then
				Compose.watch(function(Callback)
					-- upvalues: ActionItemFunction (upval), FormulaResult (copy), TrailingIcon (copy), ReadFunction (upval)
					local ActionItemResult = ActionItemFunction(Callback(FormulaResult))
					TrailingIcon.Visible = if ActionItemResult.checked then Callback(ActionItemResult.checked) == true elseif ActionItemResult.selected then Callback(ActionItemResult.selected) == ActionItemResult.value else ReadFunction(ActionItemResult.marked, Callback) == true
				end)
			end
			if PeekResult1.role == "destructive" then
				Object:AddTag("facet-menu-destructive")
			end
			local Content = Object:FindFirstChild("Content") or Object
			
			if Content:IsA("GuiObject") then
				local UIListLayout1 = Content:FindFirstChildWhichIsA("UIListLayout")
				
				if UIListLayout1 then
					UIListLayout1.HorizontalAlignment = TypesEnum.HorizontalAlignment.Left
				end
				local TextBoundsResult = if Content == Object then p1.observe.TextBounds(Object) elseif UIListLayout1 then p1.observe.AbsoluteContentSize(UIListLayout1) else p1.observe.AbsoluteSize(Content)
				local Captions = Content:FindFirstChild("Captions") or Content:FindFirstChild("Title")
				local AbsoluteSizeResult1 = nil
				local AbsoluteContentSizeResult = nil
				
				if Captions and Captions:IsA("TextLabel") then
					AbsoluteSizeResult1 = p1.observe.AbsoluteSize(Captions)
					AbsoluteContentSizeResult = p1.observe.TextBounds(Captions)
				elseif Captions and Captions:IsA("GuiObject") then
					local UIListLayout = Captions:FindFirstChildWhichIsA("UIListLayout")
					
					if UIListLayout then
						AbsoluteSizeResult1 = p1.observe.AbsoluteSize(Captions)
						AbsoluteContentSizeResult = p1.observe.AbsoluteContentSize(UIListLayout)
					end
				end
				Compose.watch(function(Callback1)
					-- upvalues: TextBoundsResult (copy), NoControlSize (copy), ChevronTrailing (copy), p1 (upval), AbsoluteSizeResult1 (ref), AbsoluteContentSizeResult (ref), Callback (ref), Widths (copy), Text (copy)
					local X = Callback1(TextBoundsResult).X
					
					if NoControlSize and ChevronTrailing then
						X += p1.controlSize(nil, "iconSize", Callback1) + 8
					end
					if AbsoluteSizeResult1 and AbsoluteContentSizeResult then
						X = X - Callback1(AbsoluteSizeResult1).X + Callback1(AbsoluteContentSizeResult).X
					end
					if Callback then
						X += Callback(Callback1)
					end
					local Copy = table.clone(Widths:peek())
					Copy[Text] = X
					Widths:set(Copy)
				end)
				Compose.cleanup(function()
					-- upvalues: Widths (copy), Text (copy)
					local Copy = table.clone(Widths:peek())
					Copy[Text] = nil
					Widths:set(Copy)
				end)
			end
			return Object
		end,
		ancestor = function(p4, LayoutOrder, p5, p6)
			-- upvalues: p1 (copy), Host (copy), TypesUDim2 (copy), p2 (copy), TypesEnum (copy), ActionItemFunction (copy), ReadFunction (copy), CommitItemFunction (copy), fillTitle (copy), Compose (copy), p3 (copy), hairline (copy)
			local HitFloorFunction = p6.hitFloor
			local Path = p6.path
			local EnterFunction = p6.enter
			local CloseFunction = p6.close
			local PeekResult = p4:peek()
			
			if PeekResult.divider then
				return p1.styled(Host.Frame({
					Size = TypesUDim2.new(1, 0, 0, 1),
					LayoutOrder = LayoutOrder
				}), "divider")
			end
			local Object = nil
			Object = p2.Button({
				Name = PeekResult.id,
				label = PeekResult.label,
				enabled = PeekResult.enabled,
				icon = PeekResult.icon,
				subtitle = PeekResult.description,
				TextXAlignment = TypesEnum.TextXAlignment.Left,
				LayoutOrder = LayoutOrder,
				Size = function(p7)
					-- upvalues: TypesUDim2 (upval), HitFloorFunction (copy)
					return TypesUDim2.new(1, 0, 0, HitFloorFunction(p7))
				end,
				selected = function(Callback)
					-- upvalues: Path (copy), p5 (copy), PeekResult (copy), ActionItemFunction (upval), ReadFunction (upval)
					if Callback(Path)[Callback(p5).depth] == PeekResult.id then
						return true
					else
						local ActionItemResult = ActionItemFunction(PeekResult)
						
						return if ActionItemResult.checked then Callback(ActionItemResult.checked) elseif ActionItemResult.selected then Callback(ActionItemResult.selected) == ActionItemResult.value else ReadFunction(ActionItemResult.marked, Callback) == true
					end
				end,
				trailingIcon = if PeekResult.children then "chevron.trailing" elseif PeekResult.checked == nil and PeekResult.selected == nil and PeekResult.marked == nil then nil else "checkmark",
				onActivate = function()
					-- upvalues: PeekResult (copy), EnterFunction (copy), Object (ref), p5 (copy), CommitItemFunction (upval), CloseFunction (copy)
					if PeekResult.children then
						EnterFunction(assert(PeekResult.id), Object, p5:peek().prefix)
						
						return
					end
					if CommitItemFunction(PeekResult) and (PeekResult.dismiss == true or PeekResult.dismiss ~= false and not PeekResult.checked and not PeekResult.selected) then
						CloseFunction()
					end
				end
			})
			Object:AddTag("facet-menu-item")
			fillTitle(Object)
			
			if PeekResult.role == "destructive" then
				Object:AddTag("facet-menu-destructive")
			end
			local TrailingIcon = if PeekResult.children then nil else Object:FindFirstChild("TrailingIcon", true)
			
			if TrailingIcon and TrailingIcon:IsA("GuiObject") then
				Compose.watch(function(Callback)
					-- upvalues: ActionItemFunction (upval), PeekResult (copy), TrailingIcon (copy), ReadFunction (upval)
					local ActionItemResult = ActionItemFunction(PeekResult)
					TrailingIcon.Visible = if ActionItemResult.checked then Callback(ActionItemResult.checked) == true elseif ActionItemResult.selected then Callback(ActionItemResult.selected) == ActionItemResult.value else ReadFunction(ActionItemResult.marked, Callback) == true
				end)
			end
			local Content = Object:FindFirstChild("Content")
			local UIListLayout = if Content then Content:FindFirstChildWhichIsA("UIListLayout") else nil
			
			if UIListLayout then
				UIListLayout.HorizontalAlignment = TypesEnum.HorizontalAlignment.Left
			end
			p3.attach(Object, {
				Compose.show(function(Callback): boolean
					-- upvalues: p5 (copy), LayoutOrder (copy)
					local Item = Callback(p5).items[Callback(LayoutOrder) - 1]
					
					return Item ~= nil and Item.divider ~= true
				end, hairline)
			})
			
			return Object
		end
	}
end