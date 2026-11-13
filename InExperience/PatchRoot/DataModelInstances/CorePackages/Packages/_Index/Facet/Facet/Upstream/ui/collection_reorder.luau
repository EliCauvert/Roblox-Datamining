local _ = require("./control_types")
local CollectionReorderStateModule = require("./collection_reorder_state")
local CollectionReorderPointerModule = require("./collection_reorder_pointer")
local CollectionReorderRowModule = require("./collection_reorder_row")
local CollectionReorderDropModule = require("./collection_reorder_drop")
local CollectionReorderFeedbackModule = require("./collection_reorder_feedback")
local CollectionReorderKeysModule = require("./collection_reorder_keys")
local _ = require("../vendor/compose/core")
local _ = require("./types")
local _ = require("./collection_types")
local DynamicModule = require("../vendor/compose/core/dynamic")

return function(p1, p2, p3, p4, Callback1, p5, Callback, p6, p7, p8, p9, p10, p11, p12)
	-- upvalues: CollectionReorderStateModule (copy), CollectionReorderPointerModule (copy), CollectionReorderRowModule (copy), CollectionReorderDropModule (copy), CollectionReorderFeedbackModule (copy), CollectionReorderKeysModule (copy), DynamicModule (copy)
	local ReadFunction = p1.read
	local TypesEnum = p1.types.Enum
	local CollectionReorderStateModuleResult = CollectionReorderStateModule(p1, p2, p3, p4, Callback1, p5, Callback, p6, p7, p8, p9, p10, p11, p12)
	local Moving = CollectionReorderStateModuleResult.moving
	local CollectionReorderPointerModuleResult = CollectionReorderPointerModule(CollectionReorderStateModuleResult)
	local CollectionReorderRowModuleResult = CollectionReorderRowModule(CollectionReorderStateModuleResult, CollectionReorderPointerModuleResult)
	
	local function overlay(p13)
		-- upvalues: Callback (copy), CollectionReorderDropModule (upval), CollectionReorderStateModuleResult (copy), p1 (copy), CollectionReorderPointerModuleResult (copy), CollectionReorderFeedbackModule (upval), CollectionReorderKeysModule (upval)
		local CallbackResult = Callback()
		CollectionReorderDropModule(CollectionReorderStateModuleResult, CallbackResult)
		local CanvasPositionResult = p1.observe.CanvasPosition(CallbackResult)
		local PositionResult = p1.observe.Position(CallbackResult)
		CollectionReorderPointerModuleResult.listen(CallbackResult)
		local CollectionReorderFeedbackModuleResult = CollectionReorderFeedbackModule(CollectionReorderStateModuleResult, CallbackResult, p13, CanvasPositionResult, PositionResult)
		CollectionReorderKeysModule(CollectionReorderStateModuleResult, CollectionReorderFeedbackModuleResult, CallbackResult)
		
		return CollectionReorderFeedbackModuleResult
	end
	
	local v1 = nil
	local v2 = false
	
	local function orderOf(PeekResult)
		-- upvalues: v1 (ref), p12 (copy), p1 (copy), p4 (copy), Callback1 (copy), p5 (copy), p9 (copy)
		local PeekResult1: number = PeekResult.slot:peek()
		local v3 = v1
		
		if v3 and v3.remaining == PeekResult.remaining and v3.keys == PeekResult.keys and v3.slot == PeekResult1 then
			return v3
		end
		local Copy = table.clone(PeekResult.remaining)
		
		for i, key in PeekResult.keys do
			table.insert(Copy, PeekResult1 + i, key)
		end
		local NewPeekResult = PeekResult1 + 1
		local NewPeekResult1 = PeekResult1 + #PeekResult.keys
		
		if p12 then
			for i1, value in p1.readSource(p4) do
				if PeekResult.included[Callback1(value, i1)] then
					NewPeekResult = math.min(NewPeekResult, i1)
					NewPeekResult1 = math.max(NewPeekResult1, i1)
				end
			end
		else
			for _, key1 in PeekResult.keys do
				local v4: number = assert(p5.indexOfKey)(key1)
				
				if v4 then
					NewPeekResult = math.min(NewPeekResult, v4)
					NewPeekResult1 = math.max(NewPeekResult1, v4)
				end
			end
		end
		if #Copy < NewPeekResult1 then
			NewPeekResult1 = #Copy
		end
		local Indexes = {}
		
		for i2 = NewPeekResult, NewPeekResult1 do
			Indexes[Copy[i2]] = i2
		end
		local Offsets = nil
		
		if not p9 and p12 == nil then
			local Offsets1 = {}
			local Offset = assert(p5.placementOf)(NewPeekResult).offset
			local OffsetDelta = if #p1.readSource(p4) > 1 then assert(p5.placementOf)(2).offset - assert(p5.placementOf)(1).size - assert(p5.placementOf)(1).offset else 0
			for i3 = NewPeekResult, NewPeekResult1 do
				local Entry = Copy[i3]
				Offsets1[Entry] = Offset
				local v5 = assert(p5.indexOfKey)(Entry)
				
				if v5 then
					Offset += assert(p5.placementOf)(v5).size + OffsetDelta
				end
			end
			Offsets = Offsets1
		end
		local config = {
			remaining = PeekResult.remaining,
			keys = PeekResult.keys,
			slot = PeekResult1,
			indexes = Indexes,
			offsets = Offsets,
			first = NewPeekResult,
			last = NewPeekResult1
		}
		v1 = config
		
		return config
	end
	
	local Source = nil
	local BeforeKey = nil
	local v6 = nil
	
	local function placement(Key, Tbl, Callback)
		-- upvalues: Moving (copy), CollectionReorderStateModuleResult (copy), v2 (ref), p3 (copy), orderOf (copy), p12 (copy), ReadFunction (copy), p4 (copy), Callback1 (copy), p5 (copy), DynamicModule (upval), p1 (copy), Source (ref), BeforeKey (ref), v6 (ref)
		local CallbackResult = Callback(Moving)
		local CallbackResult1 = Callback(CollectionReorderStateModuleResult.incoming)
		local CallbackResult2 = Callback(CollectionReorderStateModuleResult.drag.state)
		
		if not v2 or CallbackResult2 == nil then
			return Tbl
		end
		if CallbackResult and CallbackResult.keyboard and p3.drag == nil and p3.drop == nil then
			return Tbl
		end
		if CallbackResult then
			Callback(CallbackResult.slot)
			local OrderOfResult = orderOf(CallbackResult)
			local Offset = if OrderOfResult.offsets then OrderOfResult.offsets[Key] else nil
			
			if Offset == nil then
				local Index = OrderOfResult.indexes[Key]
				
				if Index and p12 then
					local t = {}
					
					for i, value in ReadFunction(p4, Callback) do
						t[Callback1(value, i)] = true
					end
					local Count = 0
					
					for i1, value1 in ReadFunction(p12, Callback) do
						if t[value1] then
							Count += 1
							
							if Count == Index then
								return assert(p5.placementOf)(i1)
							end
						end
					end
				end
				return if Index then assert(p5.placementOf)(Index) else Tbl
			elseif Offset == Tbl.offset then
				return Tbl
			else
				local Copy = table.clone(Tbl)
				Copy.offset = Offset
				
				return Copy
			end
		else
			if CallbackResult1 then
				local Keys = if type(CallbackResult2.payload) == "table" then DynamicModule.raw(CallbackResult2.payload, "keys") else nil
				
				if CollectionReorderStateModuleResult.recall(CallbackResult2.payload, Callback) ~= nil then
					return Tbl
				end
				local v7: number = assert(p5.indexOfKey)(Key)
				local SlotGapResult, SlotGapResult2 = CollectionReorderStateModuleResult.slotGap(CallbackResult2.payload, CallbackResult1, Callback)
				
				if v7 and SlotGapResult and SlotGapResult2 then
					return if SlotGapResult <= v7 and v7 < SlotGapResult2 then assert(p5.placementOf)(v7 + 1) elseif v7 < SlotGapResult and SlotGapResult2 < v7 then assert(p5.placementOf)(v7 - 1) else Tbl
				end
				local BeforeKey1 = CallbackResult1.beforeKey
				local Source1 = p1.readSource(p4, Callback)
				
				if Source1 ~= Source or BeforeKey1 ~= BeforeKey then
					Source = Source1
					BeforeKey = BeforeKey1
					v6 = nil
					
					if BeforeKey1 ~= nil then
						local CallbackResult3 = nil
						for i2, value2 in Source1 do
							CallbackResult3 = Callback1(value2, i2)
							
							if CallbackResult3 == BeforeKey1 then
								v6 = CallbackResult3
								break
							end
						end
					end
				end
				local v8 = if v6 == nil then nil else assert(p5.indexOfKey)(v6)
				
				if v7 and v8 and v8 <= v7 then
					return assert(p5.placementOf)(v7 + (if type(Keys) == "table" then math.max(1, #Keys) else 1))
				end
			end
			return Tbl
		end
	end
	
	local t = {}
	local Compose = p1.Compose
	local TypesVector2 = p1.types.Vector2
	local v9 = assert(Compose.currentOwner())
	local Flag = false
	local Snappy = p1.motionSpring("snappy")
	
	local function peek(p13)
		return p13:peek()
	end
	
	local t1 = {}
	local OnFrameResult: (() -> ())? = nil
	Compose.cleanup(function()
		-- upvalues: OnFrameResult (ref)
		if OnFrameResult then
			OnFrameResult()
			OnFrameResult = nil
		end
	end)
	
	local function _(Key)
		-- upvalues: t1 (copy), TypesVector2 (copy), OnFrameResult (ref)
		t1[Key] = nil
		Key.current = TypesVector2.new(Key.target[1], Key.target[2])
		Key.publish(Key.current)
		
		if next(t1) == nil and OnFrameResult then
			OnFrameResult()
			OnFrameResult = nil
		end
	end
	
	local function tick(p13)
		-- upvalues: t1 (copy), Compose (copy), Snappy (copy), TypesVector2 (copy), OnFrameResult (ref)
		for Key, value in t1 do
			Compose.stepSpring(value.spring, Key.target, p13, Snappy.period, Snappy.damping)
			
			if Compose.springAtRest(value.spring, Key.target, value.reference, 0.0001) then
				t1[Key] = nil
				Key.current = TypesVector2.new(Key.target[1], Key.target[2])
				Key.publish(Key.current)
				
				if next(t1) == nil and OnFrameResult then
					OnFrameResult()
					OnFrameResult = nil
				end
			else
				Key.current = TypesVector2.new(value.spring.position[1], value.spring.position[2])
				Key.publish(Key.current)
			end
		end
	end
	
	local function update(Key, Base)
		-- upvalues: placement (copy), peek (copy), TypesVector2 (copy), t1 (copy), CollectionReorderStateModuleResult (copy), ReadFunction (copy), OnFrameResult (ref), Compose (copy), p1 (copy), tick (copy)
		local PlacementResult = placement(Key.key, Base, peek)
		local NewTypesVector = TypesVector2.new(PlacementResult.crossOffset - Base.crossOffset, PlacementResult.offset - Base.offset)
		local IsMagnitudeBelow: boolean = Base.index == Key.base.index and (NewTypesVector - Key.shift).Magnitude <= 0.5
		local IsNotBaseMatch: boolean = IsMagnitudeBelow and Base ~= Key.base
		Key.base = Base
		Key.shift = NewTypesVector
		
		if PlacementResult.crossOffset == Key.target[1] and PlacementResult.offset == Key.target[2] and (not IsNotBaseMatch or not t1[Key]) then
			Key.publish(Key.current)
			
			return
		end
		local Target = Key.target
		local Offset = PlacementResult.offset
		Key.target[1] = PlacementResult.crossOffset
		Target[2] = Offset
		
		if IsMagnitudeBelow or CollectionReorderStateModuleResult.motionReduced() or ReadFunction(Key.reduced) == true then
			t1[Key] = nil
			Key.current = TypesVector2.new(Key.target[1], Key.target[2])
			Key.publish(Key.current)
			
			if next(t1) == nil and OnFrameResult then
				OnFrameResult()
				OnFrameResult = nil
			end
			return
		else
			local Reference = { Key.current.X, Key.current.Y }
			local Entry = t1[Key]
			
			if Entry then
				Entry.reference = Reference
			else
				t1[Key] = {
					spring = Compose.createSpringState(Reference, 2),
					reference = Reference
				}
			end
			if OnFrameResult == nil then
				OnFrameResult = assert(p1.runtime.host.frames).onFrame(tick)
			end
		end
	end
	
	local v10 = nil
	local v11 = false
	CollectionReorderStateModuleResult.setPlacement(function(Enabled)
		-- upvalues: Moving (copy), CollectionReorderStateModuleResult (copy), v2 (ref), Source (ref), BeforeKey (ref), v6 (ref), v11 (ref), update (copy), p12 (copy), orderOf (copy), v10 (ref), p1 (copy), p4 (copy), peek (copy), t (copy), Callback1 (copy)
		local PeekResult = Moving:peek()
		local PeekResult1 = CollectionReorderStateModuleResult.incoming:peek()
		local IsNotEnabled: boolean = not v2 and Enabled ~= true
		
		if Enabled ~= nil then
			v2 = Enabled
		end
		if IsNotEnabled then return end
		if PeekResult1 == nil then
			Source = nil
			BeforeKey = nil
			v6 = nil
		end
		local NoPeekResult: boolean = v11 and PeekResult1 == nil
		v11 = PeekResult1 ~= nil
		
		local function _(Key)
			-- upvalues: update (upval)
			update(Key, (Key.at:peek()))
		end
		
		if p12 == nil and PeekResult1 == nil and not NoPeekResult then
			local OrderOfResult = if PeekResult and v2 then orderOf(PeekResult) else nil
			local v12 = v10
			v10 = OrderOfResult
			
			if v12 == OrderOfResult then return end
			local Smallest = math.min(if v12 then v12.first else 1e999, if OrderOfResult then OrderOfResult.first else 1e999)
			local Last = if v12 then v12.last else 0
			local Source1 = p1.readSource(p4, peek)
			
			for i = Smallest, math.min(math.max(Last, if OrderOfResult then OrderOfResult.last else 0), #Source1) do
				local Entry = t[Callback1(Source1[i], i)]
				
				if Entry then
					update(Entry, (Entry.at:peek()))
				end
			end
			return
		else
			v10 = nil
			
			for _, value in t do
				update(value, (value.at:peek()))
			end
		end
	end)
	
	return {
		placement = placement,
		position = function(Key, At, Publish, Reduced)
			-- upvalues: Flag (ref), Compose (copy), v9 (copy), CollectionReorderStateModuleResult (copy), ReadFunction (copy), t (copy), t1 (copy), TypesVector2 (copy), OnFrameResult (ref), placement (copy), peek (copy), update (copy)
			if not Flag then
				Flag = true
				Compose.withOwner(v9, function()
					-- upvalues: Compose (upval), CollectionReorderStateModuleResult (upval), ReadFunction (upval), Reduced (copy), t (upval), t1 (upval), TypesVector2 (upval), OnFrameResult (upval)
					Compose.watch(function(p14)
						-- upvalues: CollectionReorderStateModuleResult (upval), ReadFunction (upval), Reduced (upval), t (upval), t1 (upval), TypesVector2 (upval), OnFrameResult (upval)
						if CollectionReorderStateModuleResult.motionReduced(p14) or ReadFunction(Reduced, p14) == true then
							for _, Key in t do
								if t1[Key] then
									t1[Key] = nil
									Key.current = TypesVector2.new(Key.target[1], Key.target[2])
									Key.publish(Key.current)
									
									if next(t1) == nil and OnFrameResult then
										OnFrameResult()
										OnFrameResult = nil
									end
								end
							end
						end
					end)
				end)
			end
			local PeekResult = At:peek()
			local PlacementResult = placement(Key, PeekResult, peek)
			local config = {
				key = Key,
				at = At,
				base = PeekResult,
				shift = TypesVector2.new(PlacementResult.crossOffset - PeekResult.crossOffset, PlacementResult.offset - PeekResult.offset),
				target = { PlacementResult.crossOffset, PlacementResult.offset },
				current = TypesVector2.new(PlacementResult.crossOffset, PlacementResult.offset),
				publish = Publish,
				reduced = Reduced
			}
			t[Key] = config
			Compose.cleanup(function()
				-- upvalues: t (upval), Key (copy), config (copy), t1 (upval), OnFrameResult (upval)
				if t[Key] == config then
					t[Key] = nil
				end
				t1[config] = nil
				
				if next(t1) == nil and OnFrameResult then
					OnFrameResult()
					OnFrameResult = nil
				end
			end)
			
			return function(Base)
				-- upvalues: update (upval), config (copy)
				update(config, Base)
			end
		end,
		pickUp = function(p14, Input): boolean
			-- upvalues: p3 (copy), TypesEnum (copy), Moving (copy), CollectionReorderStateModuleResult (copy)
			if not p3.drag or Input == nil or Input.UserInputType == TypesEnum.UserInputType.MouseButton1 then
				return false
			end
			if Moving:peek() == nil then
				CollectionReorderStateModuleResult.begin(p14, nil, nil, Input.UserInputType == TypesEnum.UserInputType.Touch)
			end
			return Moving:peek() ~= nil
		end,
		wrap = CollectionReorderRowModuleResult,
		overlay = overlay,
		leading = CollectionReorderStateModuleResult.leading,
		trailing = CollectionReorderStateModuleResult.trailing,
		header = CollectionReorderStateModuleResult.header,
		press = CollectionReorderPointerModuleResult.press,
		mouseDown = CollectionReorderPointerModuleResult.mouseDown,
		finish = CollectionReorderPointerModuleResult.finish,
		busy = function(): boolean
			-- upvalues: Moving (copy)
			return Moving:peek() ~= nil
		end,
		deleteSelected = function()
			-- upvalues: CollectionReorderStateModuleResult (copy)
			CollectionReorderStateModuleResult.remove(true)
		end,
		canDeleteSelected = CollectionReorderStateModuleResult.canDeleteSelected
	}
end