local _ = require("./control_types")
local _ = require("../vendor/compose/core")
local _ = require("./types")
local _ = require("./collection_types")
local MotionModule = require("./motion")
local CollectionPolicyModule = require("./collection_policy")
local DragSessionModule = require("./drag_session")

return function(p1, p2, p3, Callback, Callback1)
	-- upvalues: MotionModule (copy), CollectionPolicyModule (copy), DragSessionModule (copy)
	local Compose = p1.Compose
	local Host = p1.Host
	local Runtime = p1.runtime
	local ReadFunction = p1.read
	local ReadFunction1 = p1.read
	local TypesUDim2 = p1.types.UDim2
	local TypesVector2 = p1.types.Vector2
	local TypesEnum = p1.types.Enum
	local Expanded = p3.expanded or Compose.cell({})
	assert(Expanded.set, "Facet outline expanded requires a writable Compose cell")
	assert(type(p3.children) == "function" or type(p3.children) == "string", "Facet outline requires children")
	local ReducedResult = MotionModule.reduced(p1)
	local Reveal = p1.motionTiming("reveal")
	local EffectiveInputResult = p1.effectiveInput()
	
	local function _(p4)
		-- upvalues: EffectiveInputResult (copy), p1 (copy)
		return if EffectiveInputResult(p4) == "KeyboardAndMouse" then 0 else p1.metric("targetSizes.minimum", p4)
	end
	
	local CellResult = Compose.cell(0)
	local CellResult1 = Compose.cell(false)
	local CellResult2 = Compose.cell(0)
	local TweenResult = Runtime.tween(function(Callback)
		-- upvalues: CellResult (copy)
		return Callback(CellResult)
	end, {
		seconds = Reveal.enter,
		ease = p1.motionEase("present"),
		reducedMotion = function(p4)
			-- upvalues: ReducedResult (copy), ReadFunction (copy), p3 (copy)
			return ReducedResult(p4) or ReadFunction(p3.reducedMotion, p4) == true
		end
	})
	local CellResult3 = Compose.cell({
		start = -1,
		nodes = {},
		byKey = {},
		changing = {},
		groups = {},
		weights = {}
	})
	local FormulaResult = Compose.formula(function(Callback)
		-- upvalues: CellResult1 (copy), ReducedResult (copy), ReadFunction (copy), p3 (copy), TweenResult (copy), CellResult3 (copy)
		return not Callback(CellResult1) and (ReducedResult(Callback) or (ReadFunction(p3.reducedMotion, Callback) == true or Callback(CellResult3).start + 1 <= Callback(TweenResult)))
	end)
	local FormulaResult1 = Compose.formula(function(Callback)
		-- upvalues: CellResult3 (copy), FormulaResult (copy), TweenResult (copy)
		local CallbackResult = Callback(CellResult3)
		local ClampedValues = {}
		
		if Callback(FormulaResult) then
			return ClampedValues
		end
		local ClampedValue = math.clamp(Callback(TweenResult) - CallbackResult.start, 0, 1)
		
		for _, group in CallbackResult.groups do
			local Total = 0
			
			for _, value in group do
				Total += CallbackResult.weights[value.key] or 0
			end
			local NewTotal = Total + ((if group[1].visible then #group else 0) - Total) * ClampedValue
			
			for i, value1 in group do
				ClampedValues[value1.key] = math.clamp(NewTotal - i + 1, 0, 1)
			end
		end
		return ClampedValues
	end)
	
	local function weight(Key, Callback)
		-- upvalues: CellResult3 (copy), p1 (copy), FormulaResult1 (copy)
		local ByKeyEntry = (if Callback then Callback(CellResult3) else CellResult3:peek()).byKey[Key]
		
		if ByKeyEntry then
			local v1: number = if ByKeyEntry.visible then 1 else 0
			local Source = p1.readSource(FormulaResult1, Callback)
			
			return if Source[Key] == nil then v1 else Source[Key]
		else
			return 0
		end
	end
	
	local Flag = false
	local PeekResult = Expanded:peek()
	Compose.watch(function(Callback2)
		-- upvalues: Expanded (copy), Flag (ref), PeekResult (ref), Callback1 (copy), Callback (copy), p3 (copy), ReadFunction (copy), CellResult3 (copy), weight (copy), TweenResult (copy), CellResult1 (copy), p1 (copy), CellResult (copy)
		local CallbackResult = Callback2(Expanded)
		local IsNotCallbackResultMatch: boolean = Flag and CallbackResult ~= PeekResult
		PeekResult = CallbackResult
		local Nodes = {}
		local ByKey = {}
		
		local function visit(p4, Parent, Depth: number, Visible)
			-- upvalues: Callback1 (upval), Callback2 (copy), Callback (upval), ByKey (copy), p3 (upval), Nodes (copy), visit (copy), CallbackResult (copy)
			local CallbackResult1 = if Callback1 then Callback1(p4, Callback2) else p4
			for i, Item in CallbackResult1 do
				local CallbackResult2 = Callback(Item, i)
				assert(CallbackResult2 ~= nil and ByKey[CallbackResult2] == nil, "Facet outline requires unique keys and an acyclic tree")
				local ChildrenFunction = p3.children
				local ChildrenResult = if type(ChildrenFunction) == "function" then ChildrenFunction(Item) else Item[ChildrenFunction]
				assert(ChildrenResult == nil or type(ChildrenResult) == "table", "Facet outline children must be an array or nil")
				local config = {
					item = Item,
					key = CallbackResult2,
					parent = Parent,
					depth = Depth,
					branch = ChildrenResult ~= nil,
					visible = Visible
				}
				ByKey[CallbackResult2] = config
				table.insert(Nodes, config)
				
				if ChildrenResult then
					visit(ChildrenResult, CallbackResult2, Depth + 1, Visible and CallbackResult[CallbackResult2] == true)
				end
			end
		end
		
		visit(ReadFunction(p3.from, Callback2), nil, 0, true)
		local Weights = {}
		local Changing = {}
		local Groups = {}
		local Entry = nil
		
		for _, node in Nodes do
			Weights[node.key] = if IsNotCallbackResultMatch and CellResult3:peek().byKey[node.key] ~= nil then weight(node.key) elseif node.visible then 1 else 0
			
			if Weights[node.key] == (if node.visible then 1 else 0) then
				Entry = nil
			else
				table.insert(Changing, node)
				
				if Entry == nil or Entry[1].visible ~= node.visible then
					local t = {}
					Entry = t
					table.insert(Groups, t)
				end
				table.insert(assert(Entry), node)
			end
		end
		local PeekResult1 = if #Changing > 0 then TweenResult:peek() else -1
		local v1 = false
		
		for _, value in Changing do
			v1 = v1 or value.visible and Weights[value.key] == 0
		end
		CellResult1:set(v1 and p1.config.services.RunService ~= nil)
		CellResult3:set({
			nodes = Nodes,
			byKey = ByKey,
			changing = Changing,
			groups = Groups,
			weights = Weights,
			start = PeekResult1
		})
		
		if #Changing > 0 then
			CellResult:set(if CellResult1:peek() then PeekResult1 else PeekResult1 + 1)
		end
		Flag = true
	end)
	
	local function change(Key, IsNotPeekResultEntry)
		-- upvalues: CellResult3 (copy), CollectionPolicyModule (upval), p3 (copy), Expanded (copy)
		local ByKeyEntry = CellResult3:peek().byKey[Key]
		
		if not ByKeyEntry or not ByKeyEntry.branch or CollectionPolicyModule.disabled(p3.disabled, ByKeyEntry.item) then return end
		local Copy = table.clone(Expanded:peek())
		
		if IsNotPeekResultEntry then
			Copy[Key] = true
		else
			Copy[Key] = nil
		end
		if p3.onExpansionChange then
			p3.onExpansionChange(Copy)
			
			return
		else
			Expanded:set(Copy)
		end
	end
	
	local v2 = nil
	local v3 = nil
	local v4 = nil
	local List = {}
	local t = {}
	local Count = 0
	local v5 = nil
	local config = {
		preparing = CellResult1,
		preview = CellResult2,
		resume = function()
			-- upvalues: CellResult1 (copy), CellResult (copy), CellResult3 (copy)
			if CellResult1:peek() then
				CellResult1:set(false)
				CellResult:set(CellResult3:peek().start + 1)
			end
		end,
		from = Compose.formula(function(Callback)
			-- upvalues: CellResult3 (copy), FormulaResult1 (copy), CellResult2 (copy)
			local Items = {}
			local CallbackResult = Callback(CellResult3)
			local CallbackResult1 = Callback(FormulaResult1)
			local CallbackResult2 = Callback(CellResult2)
			
			for _, node in CallbackResult.nodes do
				local Visible = if CallbackResult1[node.key] == nil then node.visible else CallbackResult1[node.key] > 0
				local IsCallbackResultAbove: boolean = not Visible and (node.visible and CallbackResult2 > 0)
				
				if IsCallbackResultAbove then
					CallbackResult2 -= 1
				end
				if Visible or IsCallbackResultAbove then
					table.insert(Items, node.item)
				end
			end
			return Items
		end),
		all = Compose.formula(function(Callback)
			-- upvalues: CellResult3 (copy)
			local Items = {}
			
			for _, node in Callback(CellResult3).nodes do
				table.insert(Items, node.item)
			end
			return Items
		end),
		visible = function(p5, Callback)
			-- upvalues: CellResult3 (copy)
			local ByKeyEntry = (if Callback then Callback(CellResult3) else CellResult3:peek()).byKey[p5]
			
			return ByKeyEntry ~= nil and ByKeyEntry.visible
		end,
		ancestor = function(p5)
			-- upvalues: CellResult3 (copy)
			local PeekResult = CellResult3:peek()
			local ByKeyEntry = PeekResult.byKey[p5]
			
			if not ByKeyEntry or ByKeyEntry.visible then
				return nil
			end
			while ByKeyEntry and not ByKeyEntry.visible do
				if ByKeyEntry.parent == nil then
					ByKeyEntry = nil
				else
					ByKeyEntry = PeekResult.byKey[ByKeyEntry.parent]
				end
			end
			return if ByKeyEntry then ByKeyEntry.key else nil
		end,
		sizes = function(Callback, List, p6: number, p7: number)
			-- upvalues: CellResult3 (copy), FormulaResult (copy), weight (copy)
			local NewLargests = {}
			local CallbackResult = Callback(CellResult3)
			
			for i, value in List do
				if CallbackResult.byKey[i] and CallbackResult.byKey[i].visible then
					NewLargests[i] = math.max(p6, value) + p7
				end
			end
			if p7 > 0 then
				for _, node in CallbackResult.nodes do
					if node.visible and NewLargests[node.key] == nil then
						NewLargests[node.key] = p6 + p7
					end
				end
			end
			if not Callback(FormulaResult) then
				for _, value1 in CallbackResult.changing do
					NewLargests[value1.key] = (math.max(p6, List[value1.key] or p6) + p7) * weight(value1.key, Callback)
				end
			end
			return NewLargests
		end,
		toggle = function(Key)
			-- upvalues: change (copy), Expanded (copy)
			change(Key, Expanded:peek()[Key] ~= true)
		end,
		location = function(Entry, p8: number)
			-- upvalues: CellResult3 (copy), v5 (ref), v2 (ref), v3 (ref), v4 (ref), List (ref), t (ref), Count (ref), Callback (copy)
			local PeekResult = CellResult3:peek()
			local ByKeyEntry = PeekResult.byKey[Entry[1]]
			
			if not ByKeyEntry then
				return false, 0, nil
			end
			local Parent = ByKeyEntry.parent
			local t1 = {}
			
			for _, value in Entry do
				local ByKeyEntry1 = PeekResult.byKey[value]
				
				if not ByKeyEntry1 or ByKeyEntry1.parent ~= Parent then
					return false, 0, nil
				end
				t1[value] = true
			end
			local PeekResult1 = v5.from:peek()
			
			if PeekResult ~= v2 or PeekResult1 ~= v3 or Entry ~= v4 then
				v2 = PeekResult
				v3 = PeekResult1
				v4 = Entry
				List = {}
				t = {}
				Count = 0
				
				for _, value1 in PeekResult1 do
					local CallbackResult = Callback(value1, 1)
					
					if not t1[CallbackResult] then
						table.insert(List, CallbackResult)
					end
				end
				for _, node in PeekResult.nodes do
					t[node.key] = Count
					
					if node.parent == Parent and not t1[node.key] then
						Count += 1
					end
				end
			end
			local List1 = List
			local Entry1 = List1[p8 + 1]
			local ByKeyEntry2 = if Entry1 == nil then nil else PeekResult.byKey[Entry1]
			
			if ByKeyEntry2 == nil or ByKeyEntry2.parent ~= Parent then
				if ByKeyEntry2 and ByKeyEntry.depth < ByKeyEntry2.depth then
					return false, 0, nil
				end
				local Entry2 = List1[p8]
				local ByKeyEntry3 = if Entry2 == nil then nil else PeekResult.byKey[Entry2]
				while ByKeyEntry3 and ByKeyEntry3.key ~= Parent and ByKeyEntry3.parent ~= Parent do
					if ByKeyEntry3.parent == nil then
						ByKeyEntry3 = nil
					else
						ByKeyEntry3 = PeekResult.byKey[ByKeyEntry3.parent]
					end
				end
				if Parent ~= nil and ByKeyEntry3 == nil then
					return false, 0, nil
				end
			end
			return true, if Entry1 == nil then Count else t[Entry1], Parent
		end,
		wrap = function(p9, p10, p11)
			-- upvalues: p1 (copy), Host (copy), TypesUDim2 (copy), EffectiveInputResult (copy), Compose (copy), CellResult3 (copy), p3 (copy), ReadFunction1 (copy), Runtime (copy), Expanded (copy), Reveal (copy), ReducedResult (copy), ReadFunction (copy), p2 (copy), v5 (ref), CollectionPolicyModule (upval), TypesEnum (copy), TypesVector2 (copy)
			local AbsoluteSizeResult = p1.observe.AbsoluteSize(p9)
			local SizeResult = p1.observe.Size(p9)
			local AutomaticSizeResult = p1.observe.AutomaticSize(p9)
			local OutlineUnit = Host.Frame({
				Name = "OutlineUnit",
				Visible = false,
				Size = TypesUDim2.fromOffset(1, 1)
			})
			local AbsoluteSizeResult1 = p1.observe.AbsoluteSize(OutlineUnit)
			
			local function _(Callback)
				-- upvalues: AbsoluteSizeResult1 (copy)
				return if Callback(AbsoluteSizeResult1).X > 0 then Callback(AbsoluteSizeResult1).X else 1
			end
			
			local _ = function(p12): number
				-- upvalues: p1 (upval), EffectiveInputResult (upval)
				return (math.max(p1.controlSize("compact", "height", p12), if EffectiveInputResult(p12) == "KeyboardAndMouse" then 0 else p1.metric("targetSizes.minimum", p12)))
			end
			
			local CellResult = Compose.cell(0)
			
			local function left(Callback): number
				-- upvalues: CellResult3 (upval), p11 (copy), p3 (upval), p1 (upval), ReadFunction1 (upval), CellResult (copy), EffectiveInputResult (upval)
				local ByKeyEntry = Callback(CellResult3).byKey[p11]
				local SpaceL = if p3.indent == nil then p1.metric("space.l", Callback) else ReadFunction1(p3.indent, Callback)
				assert(SpaceL >= 0 and SpaceL < 1e999, "Facet outline indent must be a finite non-negative number")
				
				return p1.metric("space.s", Callback) + math.min((if ByKeyEntry then ByKeyEntry.depth else 0) * SpaceL, (math.max(0, Callback(CellResult) - math.max(p1.controlSize("compact", "height", Callback), if EffectiveInputResult(Callback) == "KeyboardAndMouse" then 0 else p1.metric("targetSizes.minimum", Callback)) * 3)))
			end
			
			local OutlineRow = Host.Frame({
				Name = "OutlineRow",
				AnchorPoint = TypesVector2.new(0, 0.5),
				Position = TypesUDim2.fromScale(0, 0.5),
				BackgroundTransparency = 1,
				ClipsDescendants = true,
				Size = function(Callback)
					-- upvalues: AutomaticSizeResult (copy), SizeResult (copy), TypesEnum (upval), AbsoluteSizeResult (copy), AbsoluteSizeResult1 (copy), TypesUDim2 (upval), p1 (upval), EffectiveInputResult (upval)
					local CallbackResult = Callback(AutomaticSizeResult)
					local CallbackResult1 = Callback(SizeResult)
					
					return TypesUDim2.new(1, 0, 0, math.max(math.max(p1.controlSize("compact", "height", Callback), if EffectiveInputResult(Callback) == "KeyboardAndMouse" then 0 else p1.metric("targetSizes.minimum", Callback)), if CallbackResult == TypesEnum.AutomaticSize.Y or CallbackResult == TypesEnum.AutomaticSize.XY or CallbackResult1.Y.Scale == 0 then Callback(AbsoluteSizeResult).Y / (if Callback(AbsoluteSizeResult1).X > 0 then Callback(AbsoluteSizeResult1).X else 1) else 0) + p1.metric("space.xs", Callback) + p1.metric("space.xs", Callback))
				end,
				Compose.show(function(Callback)
					-- upvalues: CellResult3 (upval), p11 (copy)
					local ByKeyEntry = Callback(CellResult3).byKey[p11]
					
					return ByKeyEntry ~= nil and ByKeyEntry.branch
				end, function()
					-- upvalues: Runtime (upval), Expanded (upval), p11 (copy), Reveal (upval), p1 (upval), ReducedResult (upval), ReadFunction (upval), p3 (upval), p2 (upval), CellResult3 (upval), v5 (upval), CollectionPolicyModule (upval), p10 (copy), TypesEnum (upval), TypesVector2 (upval), TypesUDim2 (upval), left (copy), EffectiveInputResult (upval)
					local TweenResult = Runtime.tween(function(Callback): number
						-- upvalues: Expanded (upval), p11 (upval)
						return if Callback(Expanded)[p11] then 90 else 0
					end, {
						seconds = Reveal.enter,
						ease = p1.motionEase("present"),
						reducedMotion = function(p12)
							-- upvalues: ReducedResult (upval), ReadFunction (upval), p3 (upval)
							return ReducedResult(p12) or ReadFunction(p3.reducedMotion, p12) == true
						end
					})
					local Disclosure = p2.Button({
						Name = "Disclosure",
						controlSize = "compact",
						icon = "chevron.trailing",
						appearance = "utility",
						name = function(Callback): string
							-- upvalues: Expanded (upval), p11 (upval)
							return if Callback(Expanded)[p11] then "Collapse" else "Expand"
						end,
						Visible = function(Callback)
							-- upvalues: CellResult3 (upval), p11 (upval)
							local ByKeyEntry = Callback(CellResult3).byKey[p11]
							
							return ByKeyEntry ~= nil and ByKeyEntry.branch
						end,
						enabled = function(Callback): boolean
							-- upvalues: v5 (upval), p11 (upval), CollectionPolicyModule (upval), p3 (upval), p10 (upval)
							return v5.visible(p11, Callback) and not CollectionPolicyModule.disabled(p3.disabled, Callback(p10))
						end,
						onActivate = function()
							-- upvalues: v5 (upval), p11 (upval)
							v5.toggle(p11)
						end
					})
					local Content = Disclosure:FindFirstChild("Content")
					
					if Content and Content:IsA("GuiObject") then
						Runtime.decorate(Content, { Rotation = TweenResult })
					end
					Runtime.decorate(Disclosure, {
						AutomaticSize = TypesEnum.AutomaticSize.None,
						AnchorPoint = TypesVector2.new(0, 0.5),
						Position = function(p12)
							-- upvalues: TypesUDim2 (upval), left (upval)
							return TypesUDim2.new(0, left(p12), 0.5, 0)
						end,
						Size = function(p12)
							-- upvalues: p1 (upval), EffectiveInputResult (upval), TypesUDim2 (upval)
							local Largest = math.max(p1.controlSize("compact", "height", p12), if EffectiveInputResult(p12) == "KeyboardAndMouse" then 0 else p1.metric("targetSizes.minimum", p12))
							
							return TypesUDim2.fromOffset(Largest, Largest)
						end
					})
					
					return Disclosure
				end),
				OutlineUnit,
				Host.Frame({
					Name = "OutlineContent",
					BackgroundTransparency = 1,
					ClipsDescendants = true,
					Position = function(p12)
						-- upvalues: TypesUDim2 (upval), left (copy), p1 (upval), EffectiveInputResult (upval)
						return TypesUDim2.fromOffset(left(p12) + math.max(p1.controlSize("compact", "height", p12), if EffectiveInputResult(p12) == "KeyboardAndMouse" then 0 else p1.metric("targetSizes.minimum", p12)), p1.metric("space.xs", p12))
					end,
					Size = function(p12)
						-- upvalues: TypesUDim2 (upval), left (copy), p1 (upval), EffectiveInputResult (upval)
						return TypesUDim2.new(1, -left(p12) - math.max(p1.controlSize("compact", "height", p12), if EffectiveInputResult(p12) == "KeyboardAndMouse" then 0 else p1.metric("targetSizes.minimum", p12)) - p1.metric("space.s", p12), 1, -p1.metric("space.xs", p12) - p1.metric("space.xs", p12))
					end,
					Host.UIListLayout({
						FillDirection = TypesEnum.FillDirection.Vertical,
						VerticalAlignment = TypesEnum.VerticalAlignment.Center,
						SortOrder = TypesEnum.SortOrder.LayoutOrder
					}),
					p9
				})
			})
			local AbsoluteSizeResult2 = p1.observe.AbsoluteSize(OutlineRow)
			Compose.watch(function(Callback)
				-- upvalues: CellResult (copy), AbsoluteSizeResult2 (copy), AbsoluteSizeResult1 (copy), CellResult3 (upval), p11 (copy), OutlineRow (copy), Expanded (upval)
				CellResult:set(Callback(AbsoluteSizeResult2).X / (if Callback(AbsoluteSizeResult1).X > 0 then Callback(AbsoluteSizeResult1).X else 1))
				local ByKeyEntry = Callback(CellResult3).byKey[p11]
				OutlineRow:SetAttribute("FacetOutlineDepth", if ByKeyEntry then ByKeyEntry.depth else 0)
				OutlineRow:SetAttribute("FacetExpanded", Callback(Expanded)[p11] == true)
			end)
			
			return OutlineRow
		end,
		bind = function(Ancestor, p9)
			-- upvalues: p1 (copy), Compose (copy), DragSessionModule (upval), CellResult3 (copy), Expanded (copy), TypesEnum (copy), change (copy), CollectionPolicyModule (upval), p3 (copy)
			local ObserveResult = if p1.config.guiService then p1.selection.observe() else Compose.cell(nil)
			local DragSessionModuleResult = DragSessionModule(p1)
			
			local function enabled(Callback): boolean
				-- upvalues: ObserveResult (copy), DragSessionModuleResult (copy), Ancestor (copy)
				local CallbackResult = Callback(ObserveResult)
				local CallbackResult1 = Callback(DragSessionModuleResult.state)
				
				return if CallbackResult1 == nil then CallbackResult ~= nil and (CallbackResult:IsDescendantOf(Ancestor) and (CallbackResult.Name == "RowHit" or CallbackResult.Name == "Disclosure")) else CallbackResult1.mode == "armed" and (not CallbackResult1.pending and (CallbackResult ~= nil and (CallbackResult:IsDescendantOf(Ancestor) and (CallbackResult.Name == "RowHit" or CallbackResult.Name == "Disclosure"))))
			end
			
			local function _(Callback)
				-- upvalues: p9 (copy), CellResult3 (upval)
				local CallbackResult = Callback(p9.current)
				
				return if CallbackResult == nil then nil else Callback(CellResult3).byKey[CallbackResult]
			end
			
			local function collapses(Callback): boolean
				-- upvalues: p9 (copy), CellResult3 (upval), enabled (copy), Expanded (upval)
				local CallbackResult = Callback(p9.current)
				local ByKeyEntry = if CallbackResult == nil then nil else Callback(CellResult3).byKey[CallbackResult]
				
				return enabled(Callback) and (ByKeyEntry ~= nil and (ByKeyEntry.branch == true and Callback(Expanded)[ByKeyEntry.key] == true or ByKeyEntry.parent ~= nil))
			end
			
			p1.action(Ancestor, "OutlineExpand", { TypesEnum.KeyCode.Right, TypesEnum.KeyCode.DPadRight }, function(Callback): boolean
				-- upvalues: p9 (copy), CellResult3 (upval), enabled (copy)
				local CallbackResult = Callback(p9.current)
				local ByKeyEntry = if CallbackResult == nil then nil else Callback(CellResult3).byKey[CallbackResult]
				
				return enabled(Callback) and (ByKeyEntry ~= nil and ByKeyEntry.branch == true)
			end, function()
				-- upvalues: p9 (copy), CellResult3 (upval), Expanded (upval), change (upval), CollectionPolicyModule (upval), p3 (upval)
				local PeekResult = p9.current:peek()
				local ByKeyEntry = if PeekResult == nil then nil else CellResult3:peek().byKey[PeekResult]
				
				if ByKeyEntry and ByKeyEntry.branch then
					if not Expanded:peek()[ByKeyEntry.key] then
						change(ByKeyEntry.key, true)
						
						return
					end
					for _, node in CellResult3:peek().nodes do
						if node.parent == ByKeyEntry.key and not CollectionPolicyModule.disabled(p3.disabled, node.item) then
							p9.focus(node.key)
							break
						end
					end
				end
			end, { priority = 300, capture = true })
			p1.action(Ancestor, "OutlineCollapse", { TypesEnum.KeyCode.Left, TypesEnum.KeyCode.DPadLeft }, collapses, function()
				-- upvalues: p9 (copy), CellResult3 (upval), Expanded (upval), change (upval)
				local PeekResult = p9.current:peek()
				local ByKeyEntry = if PeekResult == nil then nil else CellResult3:peek().byKey[PeekResult]
				
				if ByKeyEntry then
					if ByKeyEntry.branch and Expanded:peek()[ByKeyEntry.key] then
						change(ByKeyEntry.key, false)
						
						return
					end
					if ByKeyEntry.parent ~= nil then
						p9.focus(ByKeyEntry.parent)
					end
				end
			end, { priority = 300, capture = true })
		end
	}
	v5 = config
	
	return config
end