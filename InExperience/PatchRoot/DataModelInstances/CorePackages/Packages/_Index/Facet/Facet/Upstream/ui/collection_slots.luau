local _ = require("../vendor/compose/core")
local _ = require("./types")
local _ = require("./engine_types")
local _ = require("./collection_state")

return function(p1, p2)
	local Compose = p1.Compose
	local Host = p1.Host
	local ReadFunction = p1.read
	local TypesUDim2 = p1.types.UDim2
	local Spec = p2.spec
	local SourceFunction = p2.source
	local KeyOfFunction = p2.keyOf
	local Horizontal = p2.horizontal
	local t = {}
	local SlotControls = Spec.slotControls
	local Slots = Spec.slots
	
	if Slots == nil then
		assert(SlotControls == nil, "Facet collection slotControls requires slots")
		
		return {}
	end
	if SlotControls then
		function SlotControls.nodeOfKey(p3)
			-- upvalues: t (copy)
			return t[p3]
		end
		
		Compose.cleanup(function()
			-- upvalues: SlotControls (copy)
			SlotControls.nodeOfKey = nil
		end)
	end
	local FormulaResult = Compose.formula(function(p3)
		-- upvalues: SourceFunction (copy), KeyOfFunction (copy)
		local t = {}
		
		for i, value in SourceFunction(p3) do
			t[KeyOfFunction(value, i)] = value
		end
		return t
	end)
	local t1 = {}
	
	return {
		source = Compose.formula(function(Callback)
			-- upvalues: t1 (ref), SourceFunction (copy), FormulaResult (copy), ReadFunction (copy), Slots (copy), KeyOfFunction (copy)
			local List = {}
			local t = {}
			
			for _, value in t1 do
				t[value.key] = value
			end
			t1 = List
			
			local function _(Key, Item)
				-- upvalues: t (copy), List (copy)
				local Entry = t[Key]
				
				if Entry == nil or not rawequal(Entry.item, Item) then
					Entry = { key = Key, item = Item }
				end
				table.insert(List, Entry)
			end
			
			local SourceResult = SourceFunction(Callback)
			local CallbackResult = Callback(FormulaResult)
			local t2 = {}
			
			for _, Key in ReadFunction(Slots, Callback) do
				assert(not t2[Key], "Facet collection slots must have unique keys")
				t2[Key] = true
				local CallbackResultEntry = CallbackResult[Key]
				local Entry = t[Key]
				
				if Entry == nil or not rawequal(Entry.item, CallbackResultEntry) then
					Entry = { key = Key, item = CallbackResultEntry }
				end
				table.insert(List, Entry)
			end
			for i, Item in SourceResult do
				local KeyOfResult = KeyOfFunction(Item, i)
				
				if not t2[KeyOfResult] then
					local Entry = t[KeyOfResult]
					
					if Entry == nil or not rawequal(Entry.item, Item) then
						Entry = { key = KeyOfResult, item = Item }
					end
					table.insert(List, Entry)
				end
			end
			return List
		end, function(List, p4): boolean
			if List == nil or #List ~= #p4 then
				return false
			end
			for i, value in List do
				if value.key ~= p4[i].key then
					return false
				end
			end
			return true
		end),
		wrap = function(Callback)
			-- upvalues: Compose (copy), FormulaResult (copy), p1 (copy), Host (copy), TypesUDim2 (copy), Horizontal (copy), t (copy)
			return function(p5, p6, Key)
				-- upvalues: Compose (upval), FormulaResult (upval), p1 (upval), Host (upval), TypesUDim2 (upval), Horizontal (upval), t (upval), Callback (copy)
				local FormulaResult1 = Compose.formula(function(Callback)
					-- upvalues: FormulaResult (upval), Key (copy)
					return Callback(FormulaResult)[Key]
				end)
				local Item = p5:peek().item
				local FormulaResult2 = Compose.formula(function(Callback)
					-- upvalues: FormulaResult1 (copy), Item (ref)
					local CallbackResult = Callback(FormulaResult1)
					
					if CallbackResult ~= nil then
						Item = CallbackResult
					end
					return assert(Item)
				end)
				local CellResult = Compose.cell(nil)
				local v1 = Host.Frame("SlotAnchor")({
					BackgroundTransparency = 1,
					BorderSizePixel = 0,
					Selectable = false,
					Attributes = { FacetReservedKey = tostring(Key) },
					Position = function(Callback)
						-- upvalues: CellResult (copy), p6 (copy), Horizontal (upval), TypesUDim2 (upval)
						local CallbackResult = Callback(CellResult)
						
						if CallbackResult then
							return CallbackResult
						else
							local CallbackResult1 = Callback(p6)
							
							return if Horizontal then TypesUDim2.fromOffset(CallbackResult1.offset, CallbackResult1.crossOffset) else TypesUDim2.fromOffset(CallbackResult1.crossOffset, CallbackResult1.offset)
						end
					end,
					Size = function(Callback)
						-- upvalues: p6 (copy), Horizontal (upval), TypesUDim2 (upval)
						local CallbackResult = Callback(p6)
						
						return if Horizontal then TypesUDim2.fromOffset(CallbackResult.size, CallbackResult.crossSize) else TypesUDim2.fromOffset(CallbackResult.crossSize, CallbackResult.size)
					end,
					(p1.styled(Host.Frame("ReservedSlot")({
						Interactable = false,
						Selectable = false,
						Visible = function(Callback): boolean
							-- upvalues: FormulaResult1 (copy)
							return Callback(FormulaResult1) == nil
						end,
						Size = TypesUDim2.fromScale(1, 1)
					}), "fill"))
				})
				t[Key] = v1
				Compose.cleanup(function()
					-- upvalues: t (upval), Key (copy), v1 (copy)
					if t[Key] == v1 then
						t[Key] = nil
					end
				end)
				
				return Host.Frame({
					Name = "Slot",
					BackgroundTransparency = 1,
					Size = TypesUDim2.fromScale(1, 1),
					Compose.show(function(Callback): boolean
						-- upvalues: FormulaResult1 (copy)
						return Callback(FormulaResult1) ~= nil
					end, function()
						-- upvalues: Callback (upval), FormulaResult2 (copy), p6 (copy), Key (copy), p1 (upval), Compose (upval), CellResult (copy)
						local CallbackResult = Callback(FormulaResult2, p6, Key)
						local PositionResult = p1.observe.Position(CallbackResult)
						Compose.watch(function(Callback)
							-- upvalues: CellResult (upval), PositionResult (copy)
							CellResult:set(Callback(PositionResult))
						end)
						Compose.cleanup(function()
							-- upvalues: CellResult (upval)
							CellResult:set(nil)
						end)
						
						return CallbackResult
					end),
					v1
				})
			end
		end
	}
end