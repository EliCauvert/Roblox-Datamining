local CollectionPolicyModule = require("./collection_policy")
local _ = require("../vendor/compose/core")
local _ = require("./types")
local _ = require("./collection_types")

return function(p1, p2, p3, Callback, p4, p5, p6)
	-- upvalues: CollectionPolicyModule (copy)
	local Compose = p1.Compose
	local ReadFunction1 = p1.read
	local TypesEnum = p1.types.Enum
	local ReadFunction = p1.read
	local v1 = nil
	local SelectionMode = p2.selectionMode or p6
	assert(SelectionMode == "none" or (SelectionMode == "single" or SelectionMode == "multiple"), `Facet collection selectionMode must be none, single or multiple (got {tostring(SelectionMode)})`)
	
	local function _(p7)
		-- upvalues: p2 (copy), p5 (copy)
		if p2.onSelectionChange then
			p2.onSelectionChange(p7)
			
			return
		end
		if type(p5.set) == "function" then
			p5:set(p7)
		end
	end
	
	local function validKeys(p7)
		-- upvalues: ReadFunction (copy), p2 (copy), p3 (copy), Callback (copy)
		local t = {}
		local SelectionFrom = p2.selectionFrom or p3
		for i, value in ReadFunction(SelectionFrom, p7) do
			t[Callback(value, i)] = true
		end
		return t
	end
	
	local FormulaResult = if SelectionMode == "none" and p2.selection == nil and p2.onSelectionChange == nil then nil else Compose.formula(validKeys)
	Compose.watch(function(Callback)
		-- upvalues: p5 (copy), FormulaResult (copy), validKeys (copy), p2 (copy)
		local CallbackResult = Callback(p5)
		
		if next(CallbackResult) == nil then return end
		local CallbackResult1 = if FormulaResult then Callback(FormulaResult) else validKeys(Callback)
		for i, value in CallbackResult do
			if not value or not CallbackResult1[i] then
				local t = {}
				
				for i1, value1 in CallbackResult do
					if value1 and CallbackResult1[i1] then
						t[i1] = true
					end
				end
				if p2.onSelectionChange then
					p2.onSelectionChange(t)
					break
				end
				if type(p5.set) == "function" then
					p5:set(t)
				end
				break
			end
		end
	end)
	local Copy = {}
	local KeyCodes = {
		TypesEnum.KeyCode.LeftShift,
		TypesEnum.KeyCode.RightShift
	}
	local KeyCodes1 = {
		TypesEnum.KeyCode.LeftControl, TypesEnum.KeyCode.RightControl,
		TypesEnum.KeyCode.LeftMeta, TypesEnum.KeyCode.RightMeta,
		TypesEnum.KeyCode.LeftSuper, TypesEnum.KeyCode.RightSuper
	}
	
	local _ = function(KeyCodes): boolean
		-- upvalues: p1 (copy)
		local UserInputService = p1.config.userInputService
		
		if UserInputService == nil then
			return false
		end
		for _, keyCode in KeyCodes do
			if UserInputService:IsKeyDown(keyCode) then
				return true
			end
		end
		return false
	end
	
	local _ = function(p8): boolean
		-- upvalues: CollectionPolicyModule (upval), p2 (copy)
		return CollectionPolicyModule.allows(p2.selectable, p8) and not CollectionPolicyModule.disabled(p2.disabled, p8)
	end
	
	local function range(p8, Key): boolean
		-- upvalues: p4 (copy), p5 (copy), Copy (ref), ReadFunction (copy), p3 (copy), CollectionPolicyModule (upval), p2 (copy), Callback (copy)
		local v2: number = assert(p4.indexOfKey)(p8)
		local v3: number = assert(p4.indexOfKey)(Key)
		
		if v2 == nil or v3 == nil then
			return false
		end
		local t = {}
		local PeekResult = p5:peek()
		
		for i in Copy do
			if PeekResult[i] then
				t[i] = true
			end
		end
		local ReadResult = ReadFunction(p3)
		
		for i1 = math.min(v2, v3), math.max(v2, v3) do
			local ReadResultEntry = ReadResult[i1]
			
			if ReadResultEntry ~= nil and (CollectionPolicyModule.allows(p2.selectable, ReadResultEntry) and not CollectionPolicyModule.disabled(p2.disabled, ReadResultEntry)) then
				t[Callback(ReadResultEntry, i1)] = true
			end
		end
		if p2.onSelectionChange then
			p2.onSelectionChange(t)
		elseif type(p5.set) == "function" then
			p5:set(t)
		end
		return true
	end
	
	local _ = function(p9, Tbl)
		-- upvalues: v1 (ref), Copy (ref)
		v1 = p9
		Copy = table.clone(Tbl)
	end
	
	return function(Key, p9, _)
		-- upvalues: SelectionMode (copy), CollectionPolicyModule (upval), p2 (copy), ReadFunction1 (copy), p5 (copy), v1 (ref), KeyCodes (copy), p1 (copy), range (copy), KeyCodes1 (copy), Copy (ref)
		if SelectionMode == "none" or (not CollectionPolicyModule.allows(p2.selectable, p9) or CollectionPolicyModule.disabled(p2.disabled, p9)) then return end
		if SelectionMode == "multiple" then
			if v1 ~= nil then
				local UserInputService = p1.config.userInputService
				local Flag = nil
				
				if UserInputService == nil then
					Flag = false
				else
					Flag = false
					
					for _, keyCode in KeyCodes do
						if UserInputService:IsKeyDown(keyCode) then
							Flag = true
							break
						end
					end
				end
				if Flag and range(v1, Key) then return end
			end
			local Tbl = {}
			local UserInputService1 = p1.config.userInputService
			local Flag = nil
			
			if UserInputService1 == nil then
				Flag = false
			else
				Flag = false
				
				for _, value in KeyCodes1 do
					if UserInputService1:IsKeyDown(value) then
						Flag = true
						break
					end
				end
			end
			if Flag or ReadFunction1(p2.editing) == true then
				local PeekResult = p5:peek()
				
				for i, value1 in PeekResult do
					if value1 and not rawequal(i, Key) then
						Tbl[i] = true
					end
				end
				if not PeekResult[Key] then
					Tbl[Key] = true
				end
			else
				Tbl[Key] = true
			end
			v1 = Key
			Copy = table.clone(Tbl)
			
			if p2.onSelectionChange then
				p2.onSelectionChange(Tbl)
				
				return
			end
			if type(p5.set) == "function" then
				p5:set(Tbl)
			end
			return
		else
			local T = if ReadFunction1(p2.editing) == true and p5:peek()[Key] then {} else { [Key] = true }
			
			if p2.onSelectionChange then
				p2.onSelectionChange(T)
				
				return
			end
			if type(p5.set) == "function" then
				p5:set(T)
			end
		end
	end, function(Key, p10)
		-- upvalues: SelectionMode (copy), KeyCodes (copy), p1 (copy), v1 (ref), p4 (copy), p5 (copy), Copy (ref), range (copy)
		if SelectionMode == "multiple" and Key ~= nil and not rawequal(Key, p10) then
			local UserInputService = p1.config.userInputService
			local Flag = nil
			
			if UserInputService == nil then
				Flag = false
			else
				Flag = false
				
				for _, keyCode in KeyCodes do
					if UserInputService:IsKeyDown(keyCode) then
						Flag = true
						break
					end
				end
			end
			if Flag then
				if v1 == nil or assert(p4.indexOfKey)(v1) == nil then
					local Copy1 = table.clone(p5:peek())
					Copy1[Key] = true
					v1 = Key
					Copy = table.clone(Copy1)
				end
				range(v1, p10)
				
				return
			end
		end
	end
end