local CollectionPolicyModule = require("./collection_policy")
local CoreModule = require("../vendor/compose/core")
local _ = require("./types")
local _ = require("./collection_state")

return function(p1, p2, p3, p4, Callback)
	-- upvalues: CollectionPolicyModule (copy), CoreModule (copy)
	local Compose = p1.Compose
	local TypesEnum = p1.types.Enum
	local Spec = p2.spec
	local Kind = p2.kind
	local KeyOfFunction = p2.keyOf
	local Horizontal = p2.horizontal
	local ExtendSelectionFunction = p2.extendSelection
	local Tree = p2.tree
	
	local function _()
		-- upvalues: p2 (copy)
		return p2.source(function(p5)
			return p5:peek()
		end)
	end
	
	local _ = function(p5, p6): boolean
		-- upvalues: Tree (copy), KeyOfFunction (copy), CollectionPolicyModule (upval), Spec (copy)
		return not (Tree ~= nil and not Tree.visible(KeyOfFunction(p5, p6))) and not CollectionPolicyModule.disabled(Spec.disabled, p5)
	end
	
	local function atEdge(p5, Amount): boolean
		-- upvalues: p2 (copy), KeyOfFunction (copy), Tree (copy), CollectionPolicyModule (upval), Spec (copy)
		local SourceResult = p2.source(function(p6)
			return p6:peek()
		end)
		local v1 = nil
		
		for i, value in SourceResult do
			if KeyOfFunction(value, i) == p5 then
				v1 = i
				break
			end
		end
		if v1 == nil then
			return false
		end
		local NewAmount = v1 + Amount
		while NewAmount >= 1 and NewAmount <= #SourceResult do
			local SourceResultEntry = SourceResult[NewAmount]
			
			if not (Tree ~= nil and not Tree.visible(KeyOfFunction(SourceResultEntry, NewAmount))) and not CollectionPolicyModule.disabled(Spec.disabled, SourceResultEntry) then
				return false
			end
			NewAmount += Amount
		end
		return true
	end
	
	local _ = function(p6): number
		-- upvalues: Kind (copy), Horizontal (copy)
		local IsGrid: boolean = Kind == "grid" or (if Horizontal then p6 == "left" or p6 == "right" else p6 == "up" or p6 == "down")
		
		return if IsGrid then if p6 == "right" or p6 == "down" then 1 else -1 else 0
	end
	
	for _, value in {
		{
			name = "Left",
			direction = "left",
			keys = { TypesEnum.KeyCode.Left, TypesEnum.KeyCode.DPadLeft }
		},
		{
			name = "Right",
			direction = "right",
			keys = { TypesEnum.KeyCode.Right, TypesEnum.KeyCode.DPadRight }
		},
		{
			name = "Up",
			direction = "up",
			keys = { TypesEnum.KeyCode.Up, TypesEnum.KeyCode.DPadUp }
		},
		{
			name = "Down",
			direction = "down",
			keys = { TypesEnum.KeyCode.Down, TypesEnum.KeyCode.DPadDown }
		}
	} do
		local IsDirectionMatch: boolean = value.direction == (if Horizontal then "left" else "up") or value.direction == (if Horizontal then "right" else "down")
		p1.action(p3, "Collection" .. value.name, value.keys, function(p6)
			-- upvalues: IsDirectionMatch (copy), Kind (copy), Callback (copy)
			return if IsDirectionMatch then Callback(p6) else Kind == "grid" and Callback(p6)
		end, function()
			-- upvalues: p4 (copy), value (copy), Kind (copy), Spec (copy), p2 (copy), KeyOfFunction (copy), Horizontal (copy), atEdge (copy), ExtendSelectionFunction (copy)
			local PeekResult = p4.current:peek()
			local MoveResult = p4.move(value.direction)
			
			if Kind == "grid" and Spec.wrapFocus and PeekResult ~= nil and MoveResult == PeekResult then
				local SourceResult = p2.source(function(p6)
					return p6:peek()
				end)
				local GridColumnsResult: number = p2.gridColumns(nil, (math.max(0, p2.cross:peek() - 2 * p2.crossEdge())))
				local NewFloored: number? = nil
				
				for i, value1 in SourceResult do
					if KeyOfFunction(value1, i) == PeekResult then
						NewFloored = i
						break
					end
				end
				if NewFloored ~= nil then
					local NewFlooredRemainder = (NewFloored - 1) % GridColumnsResult
					local NewFlooredDelta = NewFloored - NewFlooredRemainder
					local Smallest = math.min(NewFlooredDelta + GridColumnsResult - 1, #SourceResult)
					local NewFlooredDelta1 = if value.direction == "right" then NewFlooredDelta elseif value.direction == "left" then Smallest elseif value.direction == "down" then NewFlooredRemainder + 1 else NewFlooredRemainder + 1 + math.floor((#SourceResult - 1 - NewFlooredRemainder) / GridColumnsResult) * GridColumnsResult
					
					if NewFlooredDelta1 ~= NewFloored and SourceResult[NewFlooredDelta1] ~= nil then
						p4.focus(KeyOfFunction(SourceResult[NewFlooredDelta1], NewFlooredDelta1))
					end
				end
				return
			else
				local v2 = nil
				if Spec.wrapFocus and PeekResult ~= nil and MoveResult == PeekResult then
					local Direction = value.direction
					local IsGrid: boolean = Kind == "grid" or (if Horizontal then Direction == "left" or Direction == "right" else Direction == "up" or Direction == "down")
					v2 = if IsGrid then if Direction == "right" or Direction == "down" then 1 else -1 else 0
				else
					v2 = 0
				end
				if v2 ~= 0 and not atEdge(assert(PeekResult), v2) then
					v2 = 0
				end
				if v2 > 0 then
					p4.next()
				elseif v2 < 0 then
					p4.previous()
				end
				local PeekResult1 = p4.current:peek()
				
				if PeekResult1 ~= nil then
					ExtendSelectionFunction(PeekResult, PeekResult1)
				end
			end
		end, { priority = 200 })
	end
	local _ = function(Callback)
		-- upvalues: p4 (copy), ExtendSelectionFunction (copy)
		return function()
			-- upvalues: p4 (upval), Callback (copy), ExtendSelectionFunction (upval)
			local PeekResult = p4.current:peek()
			Callback()
			local PeekResult1 = p4.current:peek()
			
			if PeekResult1 ~= nil then
				ExtendSelectionFunction(PeekResult, PeekResult1)
			end
		end
	end
	
	local Controls = p2.controls
	
	local _ = function(p6)
		-- upvalues: Controls (copy), p4 (copy), p2 (copy), Tree (copy), KeyOfFunction (copy), CollectionPolicyModule (upval), Spec (copy), ExtendSelectionFunction (copy)
		return function()
			-- upvalues: Controls (upval), p4 (upval), p2 (upval), p6 (copy), Tree (upval), KeyOfFunction (upval), CollectionPolicyModule (upval), Spec (upval), ExtendSelectionFunction (upval)
			local PlacementOfFunction = Controls.placementOf
			local IndexOfKeyFunction = Controls.indexOfKey
			local PeekResult = p4.current:peek()
			
			if PeekResult == nil or PlacementOfFunction == nil or IndexOfKeyFunction == nil then return end
			local IndexOfKeyResult: number = IndexOfKeyFunction(PeekResult)
			local SourceResult = p2.source(function(p7)
				return p7:peek()
			end)
			
			if IndexOfKeyResult == nil or SourceResult[IndexOfKeyResult] == nil then return end
			local PlacementOfResult = PlacementOfFunction(IndexOfKeyResult)
			local Largest = math.max(p2.viewport:peek().size, PlacementOfResult.size)
			local v2: number? = nil
			local v3: number? = nil
			local NewIndexOfKeyResult = IndexOfKeyResult + p6
			while NewIndexOfKeyResult >= 1 and NewIndexOfKeyResult <= #SourceResult do
				local PlacementOfResult1 = PlacementOfFunction(NewIndexOfKeyResult)
				local OffsetDelta = if p6 > 0 then PlacementOfResult1.offset + PlacementOfResult1.size - PlacementOfResult.offset else PlacementOfResult.offset + PlacementOfResult.size - PlacementOfResult1.offset
				
				if Largest < OffsetDelta and (v2 ~= nil or Largest * 2 < OffsetDelta) then break end
				local SourceResultEntry = SourceResult[NewIndexOfKeyResult]
				
				if not (Tree ~= nil and not Tree.visible(KeyOfFunction(SourceResultEntry, NewIndexOfKeyResult))) and not CollectionPolicyModule.disabled(Spec.disabled, SourceResultEntry) then
					v3 = NewIndexOfKeyResult
					
					if PlacementOfResult1.column == PlacementOfResult.column then
						v2 = NewIndexOfKeyResult
						
						if Largest < OffsetDelta then break end
					end
				end
				NewIndexOfKeyResult += p6
			end
			if v2 == nil and v3 ~= nil and PlacementOfFunction(v3).row == PlacementOfFunction(if p6 > 0 then #SourceResult else 1).row and PlacementOfFunction(v3).row ~= PlacementOfResult.row then
				v2 = v3
			end
			if v2 ~= nil then
				p4.focus(KeyOfFunction(SourceResult[v2], v2))
				local PeekResult1 = p4.current:peek()
				
				if PeekResult1 ~= nil then
					ExtendSelectionFunction(PeekResult, PeekResult1)
				end
			end
		end
	end
	
	local CollectionNavigationRequiresAComposeOwner = assert(Compose.currentOwner(), "collection navigation requires a Compose owner")
	
	function p2.armPaging()
		-- upvalues: p2 (copy), Compose (copy), CoreModule (upval), CollectionNavigationRequiresAComposeOwner (copy), p1 (copy), p3 (copy), TypesEnum (copy), Callback (copy), Controls (copy), p4 (copy), Tree (copy), KeyOfFunction (copy), CollectionPolicyModule (upval), Spec (copy), ExtendSelectionFunction (copy)
		p2.armPaging = nil
		Compose.withOwner(CoreModule.owner.createChild(CollectionNavigationRequiresAComposeOwner), function()
			-- upvalues: p1 (upval), p3 (upval), TypesEnum (upval), Callback (upval), Controls (upval), p4 (upval), p2 (upval), Tree (upval), KeyOfFunction (upval), CollectionPolicyModule (upval), Spec (upval), ExtendSelectionFunction (upval)
			local v2 = 1
			p1.action(p3, "CollectionPageDown", { TypesEnum.KeyCode.PageDown, TypesEnum.KeyCode.ButtonR2 }, Callback, function()
				-- upvalues: Controls (upval), p4 (upval), p2 (upval), v2 (copy), Tree (upval), KeyOfFunction (upval), CollectionPolicyModule (upval), Spec (upval), ExtendSelectionFunction (upval)
				local PlacementOfFunction = Controls.placementOf
				local IndexOfKeyFunction = Controls.indexOfKey
				local PeekResult = p4.current:peek()
				
				if PeekResult == nil or PlacementOfFunction == nil or IndexOfKeyFunction == nil then return end
				local IndexOfKeyResult: number = IndexOfKeyFunction(PeekResult)
				local SourceResult = p2.source(function(p7)
					return p7:peek()
				end)
				
				if IndexOfKeyResult == nil or SourceResult[IndexOfKeyResult] == nil then return end
				local PlacementOfResult = PlacementOfFunction(IndexOfKeyResult)
				local Largest = math.max(p2.viewport:peek().size, PlacementOfResult.size)
				local v3: number? = nil
				local v4: number? = nil
				local NewIndexOfKeyResult = IndexOfKeyResult + v2
				while NewIndexOfKeyResult >= 1 and NewIndexOfKeyResult <= #SourceResult do
					local PlacementOfResult1 = PlacementOfFunction(NewIndexOfKeyResult)
					local OffsetDelta = if v2 > 0 then PlacementOfResult1.offset + PlacementOfResult1.size - PlacementOfResult.offset else PlacementOfResult.offset + PlacementOfResult.size - PlacementOfResult1.offset
					
					if Largest < OffsetDelta and (v3 ~= nil or Largest * 2 < OffsetDelta) then break end
					local SourceResultEntry = SourceResult[NewIndexOfKeyResult]
					
					if not (Tree ~= nil and not Tree.visible(KeyOfFunction(SourceResultEntry, NewIndexOfKeyResult))) and not CollectionPolicyModule.disabled(Spec.disabled, SourceResultEntry) then
						v4 = NewIndexOfKeyResult
						
						if PlacementOfResult1.column == PlacementOfResult.column then
							v3 = NewIndexOfKeyResult
							
							if Largest < OffsetDelta then break end
						end
					end
					NewIndexOfKeyResult += v2
				end
				if v3 == nil and v4 ~= nil and PlacementOfFunction(v4).row == PlacementOfFunction(if v2 > 0 then #SourceResult else 1).row and PlacementOfFunction(v4).row ~= PlacementOfResult.row then
					v3 = v4
				end
				if v3 ~= nil then
					p4.focus(KeyOfFunction(SourceResult[v3], v3))
					local PeekResult1 = p4.current:peek()
					
					if PeekResult1 ~= nil then
						ExtendSelectionFunction(PeekResult, PeekResult1)
					end
				end
			end, { priority = 200 })
			local Amount = -1
			p1.action(p3, "CollectionPageUp", { TypesEnum.KeyCode.PageUp, TypesEnum.KeyCode.ButtonL2 }, Callback, function()
				-- upvalues: Controls (upval), p4 (upval), p2 (upval), Amount (copy), Tree (upval), KeyOfFunction (upval), CollectionPolicyModule (upval), Spec (upval), ExtendSelectionFunction (upval)
				local PlacementOfFunction = Controls.placementOf
				local IndexOfKeyFunction = Controls.indexOfKey
				local PeekResult = p4.current:peek()
				
				if PeekResult == nil or PlacementOfFunction == nil or IndexOfKeyFunction == nil then return end
				local IndexOfKeyResult: number = IndexOfKeyFunction(PeekResult)
				local SourceResult = p2.source(function(p7)
					return p7:peek()
				end)
				
				if IndexOfKeyResult == nil or SourceResult[IndexOfKeyResult] == nil then return end
				local PlacementOfResult = PlacementOfFunction(IndexOfKeyResult)
				local Largest = math.max(p2.viewport:peek().size, PlacementOfResult.size)
				local v5: number? = nil
				local v6: number? = nil
				local NewIndexOfKeyResult = IndexOfKeyResult + Amount
				while NewIndexOfKeyResult >= 1 and NewIndexOfKeyResult <= #SourceResult do
					local PlacementOfResult1 = PlacementOfFunction(NewIndexOfKeyResult)
					local OffsetDelta = if Amount > 0 then PlacementOfResult1.offset + PlacementOfResult1.size - PlacementOfResult.offset else PlacementOfResult.offset + PlacementOfResult.size - PlacementOfResult1.offset
					
					if Largest < OffsetDelta and (v5 ~= nil or Largest * 2 < OffsetDelta) then break end
					local SourceResultEntry = SourceResult[NewIndexOfKeyResult]
					
					if not (Tree ~= nil and not Tree.visible(KeyOfFunction(SourceResultEntry, NewIndexOfKeyResult))) and not CollectionPolicyModule.disabled(Spec.disabled, SourceResultEntry) then
						v6 = NewIndexOfKeyResult
						
						if PlacementOfResult1.column == PlacementOfResult.column then
							v5 = NewIndexOfKeyResult
							
							if Largest < OffsetDelta then break end
						end
					end
					NewIndexOfKeyResult += Amount
				end
				if v5 == nil and v6 ~= nil and PlacementOfFunction(v6).row == PlacementOfFunction(if Amount > 0 then #SourceResult else 1).row and PlacementOfFunction(v6).row ~= PlacementOfResult.row then
					v5 = v6
				end
				if v5 ~= nil then
					p4.focus(KeyOfFunction(SourceResult[v5], v5))
					local PeekResult1 = p4.current:peek()
					
					if PeekResult1 ~= nil then
						ExtendSelectionFunction(PeekResult, PeekResult1)
					end
				end
			end, { priority = 200 })
		end)
	end
	
	if p4.current:peek() ~= nil then
		p2.armPaging = nil
		Compose.withOwner(CoreModule.owner.createChild(CollectionNavigationRequiresAComposeOwner), function()
			-- upvalues: p1 (copy), p3 (copy), TypesEnum (copy), Callback (copy), Controls (copy), p4 (copy), p2 (copy), Tree (copy), KeyOfFunction (copy), CollectionPolicyModule (upval), Spec (copy), ExtendSelectionFunction (copy)
			local v3 = 1
			p1.action(p3, "CollectionPageDown", { TypesEnum.KeyCode.PageDown, TypesEnum.KeyCode.ButtonR2 }, Callback, function()
				-- upvalues: Controls (upval), p4 (upval), p2 (upval), v3 (copy), Tree (upval), KeyOfFunction (upval), CollectionPolicyModule (upval), Spec (upval), ExtendSelectionFunction (upval)
				local PlacementOfFunction = Controls.placementOf
				local IndexOfKeyFunction = Controls.indexOfKey
				local PeekResult = p4.current:peek()
				
				if PeekResult == nil or PlacementOfFunction == nil or IndexOfKeyFunction == nil then return end
				local IndexOfKeyResult: number = IndexOfKeyFunction(PeekResult)
				local SourceResult = p2.source(function(p7)
					return p7:peek()
				end)
				
				if IndexOfKeyResult == nil or SourceResult[IndexOfKeyResult] == nil then return end
				local PlacementOfResult = PlacementOfFunction(IndexOfKeyResult)
				local Largest = math.max(p2.viewport:peek().size, PlacementOfResult.size)
				local v4: number? = nil
				local v5: number? = nil
				local NewIndexOfKeyResult = IndexOfKeyResult + v3
				while NewIndexOfKeyResult >= 1 and NewIndexOfKeyResult <= #SourceResult do
					local PlacementOfResult1 = PlacementOfFunction(NewIndexOfKeyResult)
					local OffsetDelta = if v3 > 0 then PlacementOfResult1.offset + PlacementOfResult1.size - PlacementOfResult.offset else PlacementOfResult.offset + PlacementOfResult.size - PlacementOfResult1.offset
					
					if Largest < OffsetDelta and (v4 ~= nil or Largest * 2 < OffsetDelta) then break end
					local SourceResultEntry = SourceResult[NewIndexOfKeyResult]
					
					if not (Tree ~= nil and not Tree.visible(KeyOfFunction(SourceResultEntry, NewIndexOfKeyResult))) and not CollectionPolicyModule.disabled(Spec.disabled, SourceResultEntry) then
						v5 = NewIndexOfKeyResult
						
						if PlacementOfResult1.column == PlacementOfResult.column then
							v4 = NewIndexOfKeyResult
							
							if Largest < OffsetDelta then break end
						end
					end
					NewIndexOfKeyResult += v3
				end
				if v4 == nil and v5 ~= nil and PlacementOfFunction(v5).row == PlacementOfFunction(if v3 > 0 then #SourceResult else 1).row and PlacementOfFunction(v5).row ~= PlacementOfResult.row then
					v4 = v5
				end
				if v4 ~= nil then
					p4.focus(KeyOfFunction(SourceResult[v4], v4))
					local PeekResult1 = p4.current:peek()
					
					if PeekResult1 ~= nil then
						ExtendSelectionFunction(PeekResult, PeekResult1)
					end
				end
			end, { priority = 200 })
			local Amount = -1
			p1.action(p3, "CollectionPageUp", { TypesEnum.KeyCode.PageUp, TypesEnum.KeyCode.ButtonL2 }, Callback, function()
				-- upvalues: Controls (upval), p4 (upval), p2 (upval), Amount (copy), Tree (upval), KeyOfFunction (upval), CollectionPolicyModule (upval), Spec (upval), ExtendSelectionFunction (upval)
				local PlacementOfFunction = Controls.placementOf
				local IndexOfKeyFunction = Controls.indexOfKey
				local PeekResult = p4.current:peek()
				
				if PeekResult == nil or PlacementOfFunction == nil or IndexOfKeyFunction == nil then return end
				local IndexOfKeyResult: number = IndexOfKeyFunction(PeekResult)
				local SourceResult = p2.source(function(p7)
					return p7:peek()
				end)
				
				if IndexOfKeyResult == nil or SourceResult[IndexOfKeyResult] == nil then return end
				local PlacementOfResult = PlacementOfFunction(IndexOfKeyResult)
				local Largest = math.max(p2.viewport:peek().size, PlacementOfResult.size)
				local v6: number? = nil
				local v7: number? = nil
				local NewIndexOfKeyResult = IndexOfKeyResult + Amount
				while NewIndexOfKeyResult >= 1 and NewIndexOfKeyResult <= #SourceResult do
					local PlacementOfResult1 = PlacementOfFunction(NewIndexOfKeyResult)
					local OffsetDelta = if Amount > 0 then PlacementOfResult1.offset + PlacementOfResult1.size - PlacementOfResult.offset else PlacementOfResult.offset + PlacementOfResult.size - PlacementOfResult1.offset
					
					if Largest < OffsetDelta and (v6 ~= nil or Largest * 2 < OffsetDelta) then break end
					local SourceResultEntry = SourceResult[NewIndexOfKeyResult]
					
					if not (Tree ~= nil and not Tree.visible(KeyOfFunction(SourceResultEntry, NewIndexOfKeyResult))) and not CollectionPolicyModule.disabled(Spec.disabled, SourceResultEntry) then
						v7 = NewIndexOfKeyResult
						
						if PlacementOfResult1.column == PlacementOfResult.column then
							v6 = NewIndexOfKeyResult
							
							if Largest < OffsetDelta then break end
						end
					end
					NewIndexOfKeyResult += Amount
				end
				if v6 == nil and v7 ~= nil and PlacementOfFunction(v7).row == PlacementOfFunction(if Amount > 0 then #SourceResult else 1).row and PlacementOfFunction(v7).row ~= PlacementOfResult.row then
					v6 = v7
				end
				if v6 ~= nil then
					p4.focus(KeyOfFunction(SourceResult[v6], v6))
					local PeekResult1 = p4.current:peek()
					
					if PeekResult1 ~= nil then
						ExtendSelectionFunction(PeekResult, PeekResult1)
					end
				end
			end, { priority = 200 })
		end)
	end
	local First = p4.first
	p1.action(p3, "CollectionFirst", { TypesEnum.KeyCode.Home }, Callback, function()
		-- upvalues: p4 (copy), First (copy), ExtendSelectionFunction (copy)
		local PeekResult = p4.current:peek()
		First()
		local PeekResult1 = p4.current:peek()
		
		if PeekResult1 ~= nil then
			ExtendSelectionFunction(PeekResult, PeekResult1)
		end
	end, { priority = 200 })
	local Last = p4.last
	p1.action(p3, "CollectionLast", { TypesEnum.KeyCode.End }, Callback, function()
		-- upvalues: p4 (copy), Last (copy), ExtendSelectionFunction (copy)
		local PeekResult = p4.current:peek()
		Last()
		local PeekResult1 = p4.current:peek()
		
		if PeekResult1 ~= nil then
			ExtendSelectionFunction(PeekResult, PeekResult1)
		end
	end, { priority = 200 })
end