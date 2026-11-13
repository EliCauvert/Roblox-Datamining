local _ = require("./types")
local _ = require("./control_types")
local _ = require("./spatial_grid_props")
local _ = require("./spatial_grid_types")
local _ = require("./environment_types")
local _ = require("./drag_types")
local SpatialGridGeometryModule = require("./spatial_grid_geometry")
local DragSessionModule = require("./drag_session")

return function(p1, p2)
	-- upvalues: DragSessionModule (copy), SpatialGridGeometryModule (copy)
	local Compose = p1.Compose
	local Host = p1.Host
	local Runtime = p1.runtime
	local TypesUDim2 = p1.types.UDim2
	local TypesVector2 = p1.types.Vector2
	local TypesEnum = p1.types.Enum
	local DragSessionModuleResult = DragSessionModule(p1)
	p2.SpatialGrid = p1.construct("SpatialGrid", function(p3)
		-- upvalues: SpatialGridGeometryModule (upval), Compose (copy), p1 (copy), TypesUDim2 (copy), Host (copy), TypesEnum (copy), DragSessionModuleResult (copy), p2 (copy), Runtime (copy), TypesVector2 (copy)
		assert(SpatialGridGeometryModule.integer(p3.columns) and SpatialGridGeometryModule.integer(p3.rows), "SpatialGrid needs positive integer columns and rows")
		assert(p3.drop == nil or p3.footprint ~= nil, "SpatialGrid.drop requires footprint(payload)")
		local RenderResults = {}
		local ButtonResults = {}
		local AbsolutePositionResults = {}
		local CellResult = Compose.cell(nil)
		local CellResult1 = Compose.cell(false)
		local FormulaResult = Compose.formula(function(p4): number
			-- upvalues: p1 (upval), p3 (copy)
			local ReadResult: number = p1.read(p3.cellSize or p1.metric("targetSizes.minimum", p4), p4)
			assert(ReadResult > 0 and ReadResult < 1e999, "SpatialGrid.cellSize must be finite and positive")
			
			return (math.max(p1.metric("targetSizes.minimum", p4), ReadResult))
		end)
		local FormulaResult1 = Compose.formula(function(p4): number
			-- upvalues: p1 (upval), p3 (copy)
			local ReadResult: number = p1.read(p3.gap or p1.metric("space.xs", p4), p4)
			assert(ReadResult >= 0 and ReadResult < 1e999, "SpatialGrid.gap must be finite and nonnegative")
			
			return ReadResult
		end)
		local FormulaResult2 = Compose.formula(function(p4)
			-- upvalues: p1 (upval), p3 (copy), SpatialGridGeometryModule (upval)
			local ReadResult = p1.read(p3.from, p4)
			local t = {}
			local List = {}
			
			for _, value in ReadResult do
				local KeyResult = p3.key(value)
				local PlacementResult = p3.placement(value)
				assert(not t[KeyResult], "SpatialGrid requires unique keys")
				assert(SpatialGridGeometryModule.inside(PlacementResult, p3.columns, p3.rows), "SpatialGrid item is outside its cells")
				
				for _, value1 in List do
					assert(not SpatialGridGeometryModule.overlaps(PlacementResult, value1), "SpatialGrid items overlap")
				end
				t[KeyResult] = true
				table.insert(List, PlacementResult)
			end
			return ReadResult
		end)
		
		local function dimensions(Placement, Callback)
			-- upvalues: FormulaResult (copy), FormulaResult1 (copy), TypesUDim2 (upval)
			local CallbackResult = Callback(FormulaResult)
			local CallbackResult1 = Callback(FormulaResult1)
			
			return TypesUDim2.fromOffset(Placement.width * (CallbackResult + CallbackResult1) - CallbackResult1, Placement.height * (CallbackResult + CallbackResult1) - CallbackResult1)
		end
		
		local Cells = Host.Frame({
			Name = "Cells",
			BackgroundTransparency = 1,
			Size = TypesUDim2.fromScale(1, 1),
			Host.UIGridLayout({
				CellSize = function(Callback)
					-- upvalues: TypesUDim2 (upval), FormulaResult (copy)
					return TypesUDim2.fromOffset(Callback(FormulaResult), Callback(FormulaResult))
				end,
				CellPadding = function(Callback)
					-- upvalues: TypesUDim2 (upval), FormulaResult1 (copy)
					return TypesUDim2.fromOffset(Callback(FormulaResult1), Callback(FormulaResult1))
				end,
				FillDirectionMaxCells = p3.columns,
				SortOrder = TypesEnum.SortOrder.LayoutOrder
			})
		})
		local LayoutUnitResult = nil
		local AbsolutePositionResult = p1.observe.AbsolutePosition(Cells)
		
		local function position(Placement, Callback)
			-- upvalues: AbsolutePositionResults (copy), p3 (copy), AbsolutePositionResult (copy), LayoutUnitResult (ref), TypesUDim2 (upval)
			local CallbackResultRatio = (Callback(AbsolutePositionResults[(Placement.row - 1) * p3.columns + Placement.column]) - Callback(AbsolutePositionResult)) / Callback(LayoutUnitResult)
			
			return TypesUDim2.fromOffset(CallbackResultRatio.X, CallbackResultRatio.Y)
		end
		
		local function register(ButtonResult, p5, p6)
			-- upvalues: p3 (copy), ButtonResults (copy), FormulaResult (copy), FormulaResult1 (copy), LayoutUnitResult (ref), FormulaResult2 (copy), RenderResults (copy), DragSessionModuleResult (upval), Cells (copy), SpatialGridGeometryModule (upval), CellResult (copy), CellResult1 (copy), p2 (upval)
			local Drop = p3.drop
			
			if Drop == nil then return end
			local Copy = table.clone(Drop)
			Copy.feedback = false
			
			if Copy.landing == nil then
				function Copy.landing(p7)
					-- upvalues: ButtonResults (upval), p3 (upval), FormulaResult (upval), FormulaResult1 (upval), LayoutUnitResult (upval)
					local Placement = assert(p7.placement)
					local ButtonResult = ButtonResults[(Placement.row - 1) * p3.columns + Placement.column]
					local PeekResult = FormulaResult:peek()
					local PeekResult1 = FormulaResult1:peek()
					local PeekResult2 = LayoutUnitResult:peek()
					
					return {
						x = ButtonResult.AbsolutePosition.X,
						y = ButtonResult.AbsolutePosition.Y,
						w = (Placement.width * (PeekResult + PeekResult1) - PeekResult1) * PeekResult2,
						h = (Placement.height * (PeekResult + PeekResult1) - PeekResult1) * PeekResult2
					}
				end
			end
			function Copy.propose(p7, p8)
				-- upvalues: p3 (upval), p5 (copy), p6 (copy), FormulaResult2 (upval), RenderResults (upval), ButtonResult (copy), DragSessionModuleResult (upval), Cells (upval), FormulaResult (upval), FormulaResult1 (upval), LayoutUnitResult (upval), SpatialGridGeometryModule (upval)
				local Vector = assert(p3.footprint)(p7)
				
				if Vector == nil then
					p8.invalid = "This item does not fit this container"
					
					return
				end
				local P9 = p5 or 1
				local P10 = p6 or 1
				
				if p5 == nil and p8.mode == "armed" then
					for _, value in FormulaResult2:peek() do
						if RenderResults[p3.key(value)] == ButtonResult then
							local PlacementResult = p3.placement(value)
							P9 = PlacementResult.column
							P10 = PlacementResult.row
						end
					end
				end
				local PeekResult = DragSessionModuleResult.state:peek()
				
				if p8.position and (p8.mode == "pointer" or p5 == nil) then
					local PositionDelta = p8.position - Cells.AbsolutePosition
					
					if p8.mode == "pointer" and PeekResult and p8.operation == "move" then
						PositionDelta -= PeekResult.pickupAnchor * PeekResult.pickupSize
					end
					local ScaledPeekResult = (FormulaResult:peek() + FormulaResult1:peek()) * LayoutUnitResult:peek()
					local v1: number = if p8.mode == "pointer" then 0.5 else 0
					P9 = math.floor(PositionDelta.X / ScaledPeekResult + v1) + 1
					P10 = math.floor(PositionDelta.Y / ScaledPeekResult + v1) + 1
				end
				local Placement = {
					column = P9,
					row = P10,
					width = Vector.X,
					height = Vector.Y
				}
				p8.placement = Placement
				
				if not SpatialGridGeometryModule.inside(Placement, p3.columns, p3.rows) then
					p8.invalid = "Item is outside the container"
					
					return
				end
				for _, value1 in FormulaResult2:peek() do
					if (p8.operation ~= "move" or not rawequal(RenderResults[p3.key(value1)], p8.source)) and SpatialGridGeometryModule.overlaps(Placement, p3.placement(value1)) then
						p8.invalid = "These cells are occupied"
						break
					end
				end
			end
			
			function Copy.accepts(p9, p10)
				-- upvalues: Drop (copy)
				if p10.invalid then
					return false, p10.invalid
				elseif Drop.accepts then
					return Drop.accepts(p9, p10)
				else
					return true, nil
				end
			end
			
			function Copy.onUpdate(p9, p10, p11, p12)
				-- upvalues: CellResult (upval), CellResult1 (upval), Drop (copy)
				CellResult:set(p10.placement)
				CellResult1:set(p11)
				
				if Drop.onUpdate then
					Drop.onUpdate(p9, p10, p11, p12)
				end
			end
			
			function Copy.onLeave(p9)
				-- upvalues: CellResult (upval), Drop (copy)
				CellResult:set(nil)
				
				if Drop.onLeave then
					Drop.onLeave(p9)
				end
			end
			
			p2.dropTarget(ButtonResult, Copy)
		end
		
		for i = 1, p3.rows do
			for i1 = 1, p3.columns do
				local ButtonResult = p2.Button({
					label = "",
					Name = `Cell{i1}_{i}`,
					LayoutOrder = (i - 1) * p3.columns + i1,
					AutomaticSize = TypesEnum.AutomaticSize.None,
					enabled = function(Callback): boolean
						-- upvalues: p3 (copy), DragSessionModuleResult (upval)
						return p3.drop ~= nil and Callback(DragSessionModuleResult.state) ~= nil
					end
				})
				ButtonResults[#ButtonResults + 1] = ButtonResult
				AbsolutePositionResults[#AbsolutePositionResults + 1] = p1.observe.AbsolutePosition(ButtonResult)
				register(ButtonResult, i1, i)
				Runtime.mountFragment(function()
					-- upvalues: ButtonResult (copy)
					return { ButtonResult }
				end, Cells)
			end
		end
		local FrameResult = Host.Frame((p1.props(p3, {
			"from", "key", "placement", "columns", "rows", "cellSize", "gap", "render",
			"drag", "drop", "footprint"
		}, {
			Name = "SpatialGrid",
			BackgroundTransparency = 1,
			Size = function(p9)
				-- upvalues: dimensions (copy), p3 (copy)
				return dimensions({
					column = 1,
					row = 1,
					width = p3.columns,
					height = p3.rows
				}, p9)
			end
		})))
		LayoutUnitResult = p1.layoutUnit(FrameResult)
		register(FrameResult)
		local UIStrokeResult = Host.UIStroke({
			Thickness = function(p9)
				-- upvalues: p1 (upval)
				return p1.metric("strokes.hairline", p9)
			end
		})
		Compose.watch(function(Callback)
			-- upvalues: UIStrokeResult (copy), CellResult1 (copy)
			UIStrokeResult:RemoveTag("facet-drop-accepted")
			UIStrokeResult:RemoveTag("facet-drop-rejected")
			UIStrokeResult:AddTag(if Callback(CellResult1) then "facet-drop-accepted" else "facet-drop-rejected")
		end)
		Runtime.mountFragment(function()
			-- upvalues: Cells (copy), Compose (upval), FormulaResult2 (copy), p3 (copy), RenderResults (copy), Runtime (upval), position (copy), dimensions (copy), TypesVector2 (upval), TypesEnum (upval), DragSessionModuleResult (upval), p2 (upval), register (copy), Host (upval), CellResult (copy), SpatialGridGeometryModule (upval), AbsolutePositionResults (copy), AbsolutePositionResult (copy), LayoutUnitResult (ref), TypesUDim2 (upval), FormulaResult (copy), FormulaResult1 (copy), UIStrokeResult (copy)
			return {
				Cells,
				Compose.keyed({
					from = FormulaResult2,
					key = function(p9, _)
						-- upvalues: p3 (upval)
						return p3.key(p9)
					end,
					render = function(p9, _, Key)
						-- upvalues: p3 (upval), RenderResults (upval), Compose (upval), Runtime (upval), position (upval), dimensions (upval), TypesVector2 (upval), TypesEnum (upval), DragSessionModuleResult (upval), p2 (upval), register (upval)
						local RenderResult = p3.render(p9, Key)
						RenderResults[Key] = RenderResult
						Compose.cleanup(function()
							-- upvalues: RenderResults (upval), Key (copy)
							RenderResults[Key] = nil
						end)
						Runtime.decorate(RenderResult, {
							Position = function(Callback)
								-- upvalues: position (upval), p3 (upval), p9 (copy)
								return position(p3.placement(Callback(p9)), Callback)
							end,
							Size = function(Callback)
								-- upvalues: dimensions (upval), p3 (upval), p9 (copy)
								return dimensions(p3.placement(Callback(p9)), Callback)
							end,
							AnchorPoint = TypesVector2.zero,
							AutomaticSize = TypesEnum.AutomaticSize.None,
							Selectable = function(Callback): boolean
								-- upvalues: DragSessionModuleResult (upval)
								return Callback(DragSessionModuleResult.state) == nil
							end
						})
						
						if p3.drag then
							local Copy = table.clone(p3.drag(p9, Key))
							
							if Copy.armOnTap == nil then
								Copy.armOnTap = true
							end
							p2.draggable(RenderResult, Copy)
						end
						register(RenderResult)
						
						return RenderResult
					end
				}),
				Host.Frame({
					Name = "PlacementPreview",
					BackgroundTransparency = 1,
					BorderSizePixel = 0,
					ZIndex = 10,
					Active = false,
					Selectable = false,
					Attributes = { FacetDragFeedback = true },
					Visible = function(Callback)
						-- upvalues: CellResult (upval), DragSessionModuleResult (upval), SpatialGridGeometryModule (upval), p3 (upval)
						local CallbackResult = Callback(CellResult)
						
						return Callback(DragSessionModuleResult.state) ~= nil and (CallbackResult ~= nil and SpatialGridGeometryModule.inside(CallbackResult, p3.columns, p3.rows))
					end,
					Position = function(Callback)
						-- upvalues: CellResult (upval), SpatialGridGeometryModule (upval), p3 (upval), AbsolutePositionResults (upval), AbsolutePositionResult (upval), LayoutUnitResult (upval), TypesUDim2 (upval)
						local CallbackResult = Callback(CellResult)
						
						if CallbackResult and SpatialGridGeometryModule.inside(CallbackResult, p3.columns, p3.rows) then
							local CallbackResultRatio = (Callback(AbsolutePositionResults[(CallbackResult.row - 1) * p3.columns + CallbackResult.column]) - Callback(AbsolutePositionResult)) / Callback(LayoutUnitResult)
							
							return (TypesUDim2.fromOffset(CallbackResultRatio.X, CallbackResultRatio.Y))
						else
							return (TypesUDim2.fromOffset(0, 0))
						end
					end,
					Size = function(Callback)
						-- upvalues: CellResult (upval), SpatialGridGeometryModule (upval), p3 (upval), FormulaResult (upval), FormulaResult1 (upval), TypesUDim2 (upval)
						local CallbackResult = Callback(CellResult)
						
						if CallbackResult and SpatialGridGeometryModule.inside(CallbackResult, p3.columns, p3.rows) then
							local CallbackResult1 = Callback(FormulaResult)
							local CallbackResult2 = Callback(FormulaResult1)
							
							return (TypesUDim2.fromOffset(CallbackResult.width * (CallbackResult1 + CallbackResult2) - CallbackResult2, CallbackResult.height * (CallbackResult1 + CallbackResult2) - CallbackResult2))
						else
							return (TypesUDim2.fromOffset(0, 0))
						end
					end,
					UIStrokeResult
				})
			}
		end, FrameResult)
		
		if p1.config.guiService then
			local v2 = nil
			Compose.watch(function(Callback)
				-- upvalues: DragSessionModuleResult (upval), FormulaResult2 (copy), ButtonResults (copy), p1 (upval), p3 (copy), v2 (ref), SpatialGridGeometryModule (upval), RenderResults (copy)
				local CallbackResult = Callback(DragSessionModuleResult.state)
				local CallbackResult1 = Callback(FormulaResult2)
				
				if CallbackResult == nil then
					for i, buttonResult in ButtonResults do
						if p1.selection.get() == buttonResult then
							local config = {
								width = 1,
								height = 1,
								column = (i - 1) % p3.columns + 1,
								row = math.ceil(i / p3.columns)
							}
							local v3 = v2
							local v4 = if v3 and v3.Parent then v3 else nil
							
							if v4 == nil then
								for _, value in CallbackResult1 do
									if SpatialGridGeometryModule.overlaps(config, p3.placement(value)) then
										v4 = RenderResults[p3.key(value)]
										break
									end
								end
							end
							p1.selection.set(v4)
							break
						end
					end
					v2 = nil
					
					return
				else
					local Source = if CallbackResult.source:IsA("GuiObject") then CallbackResult.source else nil
					v2 = Source
					
					if CallbackResult.mode ~= "armed" or Source == nil then return end
					for _, value1 in CallbackResult1 do
						if RenderResults[p3.key(value1)] == Source and p1.selection.get() == Source then
							local PlacementResult = p3.placement(value1)
							p1.selection.set(ButtonResults[(PlacementResult.row - 1) * p3.columns + PlacementResult.column])
						end
					end
				end
			end)
		end
		return FrameResult
	end)
end