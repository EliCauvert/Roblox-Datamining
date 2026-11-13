local _ = require("./types")
local ActiveModule = require("./ownership/active")
local DiagnosticsModule = require("./diagnostics")
local OwnerModule = require("./ownership/owner")
local _ = require("./reactive/types")
local CellModule = require("./reactive/cell")
local FormulaModule = require("./reactive/formula")
local SupportModule = require("./structure/support")
local config = {
	from = true,
	key = true,
	disabled = true,
	position = true,
	wrap = true,
	initial = true,
	autoFocus = true
}
local IdentityKey = require("./reactive/graph").identityKey

return function(p1)
	-- upvalues: SupportModule (copy), config (copy), ActiveModule (copy), DiagnosticsModule (copy), IdentityKey (copy), CellModule (copy), OwnerModule (copy), FormulaModule (copy)
	local CreateFocusScope = SupportModule.optionsOf(p1, "createFocusScope", "from = ..., key = ...")
	SupportModule.noUnknownFields(CreateFocusScope, "createFocusScope", config)
	local CurrentResult = ActiveModule.current()
	
	if CurrentResult == nil then
		return DiagnosticsModule.raise("focus-scope/no-active-owner", "createFocusScope ran outside an owner", {
			contract = "a focus scope lives exactly as long as the component or owner that created it",
			fix = "create it inside a component or Compose.withOwner(owner, ...)"
		})
	else
		local CreateFocusScope1 = SupportModule.sourceOf(CreateFocusScope.from, "createFocusScope", "from")
		local IdentityKey1 = if CreateFocusScope.key == nil then IdentityKey else SupportModule.builderOf(CreateFocusScope.key, "createFocusScope", "key")
		local CreateFocusScope2 = if CreateFocusScope.disabled == nil then nil else SupportModule.builderOf(CreateFocusScope.disabled, "createFocusScope", "disabled")
		local CreateFocusScope3 = if CreateFocusScope.position == nil then nil else SupportModule.builderOf(CreateFocusScope.position, "createFocusScope", "position")
		local IsWrap = CreateFocusScope.wrap == true
		local IsAutoFocus = CreateFocusScope.autoFocus == true
		local CellResult = CellModule.cell(CreateFocusScope.initial)
		local Tbl = {}
		local Tbl1 = {}
		local Tbl2 = {}
		local Flag = true
		OwnerModule.own(CurrentResult, function()
			-- upvalues: Flag (ref), Tbl (copy), Tbl1 (copy), Tbl2 (copy)
			Flag = false
			table.clear(Tbl)
			table.clear(Tbl1)
			table.clear(Tbl2)
		end)
		OwnerModule.watch(CurrentResult, function(p2)
			-- upvalues: CreateFocusScope1 (copy), Tbl (copy), Tbl1 (copy), Tbl2 (copy), CreateFocusScope2 (copy), IdentityKey1 (copy), DiagnosticsModule (upval), CreateFocusScope3 (copy), CellResult (copy), IsAutoFocus (copy)
			local FocusScope = CreateFocusScope1(p2)
			table.clear(Tbl)
			table.clear(Tbl1)
			table.clear(Tbl2)
			
			for Index, value in FocusScope do
				if CreateFocusScope2 == nil or not CreateFocusScope2(value, Index) then
					local IdentityKeyResult = IdentityKey1(value, Index)
					
					if Tbl1[IdentityKeyResult] ~= nil then
						return DiagnosticsModule.raise("focus-scope/duplicate-key", "createFocusScope encountered the same key twice", {
							contract = "focus candidates have stable unique keys",
							index = Index
						})
					end
					Tbl[#Tbl + 1] = IdentityKeyResult
					Tbl1[IdentityKeyResult] = #Tbl
					
					if CreateFocusScope3 ~= nil then
						local FocusScope1, FocusScope2 = CreateFocusScope3(value, Index)
						
						if type(FocusScope1) ~= "number" or type(FocusScope2) ~= "number" or FocusScope1 ~= FocusScope1 or FocusScope2 ~= FocusScope2 or math.abs(FocusScope1) == 1e999 or math.abs(FocusScope2) == 1e999 then
							return DiagnosticsModule.raise("focus-scope/invalid-position", "createFocusScope.position returned invalid coordinates", { expected = "two finite numbers", index = Index })
						end
						Tbl2[IdentityKeyResult] = { FocusScope1, FocusScope2 }
					end
				end
			end
			local PeekResult = CellResult:peek()
			
			if PeekResult ~= nil and Tbl1[PeekResult] == nil then
				CellResult:set(if IsAutoFocus then Tbl[1] else nil)
				
				return
			end
			if PeekResult == nil and IsAutoFocus then
				CellResult:set(Tbl[1])
			end
		end)
		
		local function _()
			-- upvalues: Flag (ref)
			return Flag
		end
		
		local _ = function(Value: number)
			-- upvalues: Flag (ref), Tbl (copy), IsWrap (copy), CellResult (copy)
			if Flag and #Tbl ~= 0 then
				local Entry = Tbl[if IsWrap then (Value - 1) % #Tbl + 1 else math.clamp(Value, 1, #Tbl)]
				CellResult:set(Entry)
				
				return Entry
			else
				return nil
			end
		end
		
		local _ = function(p3: number)
			-- upvalues: CellResult (copy), Flag (ref), Tbl (copy), IsWrap (copy), Tbl1 (copy)
			local PeekResult = CellResult:peek()
			
			if PeekResult ~= nil then
				local Value1 = (Tbl1[PeekResult] or 1) + p3
				
				if Flag and #Tbl ~= 0 then
					local Entry = Tbl[if IsWrap then (Value1 - 1) % #Tbl + 1 else math.clamp(Value1, 1, #Tbl)]
					CellResult:set(Entry)
					
					return Entry
				else
					return nil
				end
			elseif p3 <= 0 then
				local CountTbl = #Tbl
				
				if Flag and #Tbl ~= 0 then
					local Entry = Tbl[if IsWrap then (CountTbl - 1) % #Tbl + 1 else math.clamp(CountTbl, 1, #Tbl)]
					CellResult:set(Entry)
					
					return Entry
				else
					return nil
				end
			elseif Flag and #Tbl ~= 0 then
				local Value = 1
				local Entry = Tbl[if IsWrap then (Value - 1) % #Tbl + 1 else math.clamp(Value, 1, #Tbl)]
				CellResult:set(Entry)
				
				return Entry
			else
				return nil
			end
		end
		
		return {
			current = CellResult,
			focus = function(p4): boolean
				-- upvalues: Flag (ref), Tbl1 (copy), CellResult (copy)
				if Flag and Tbl1[p4] ~= nil then
					CellResult:set(p4)
					
					return true
				else
					return false
				end
			end,
			clear = function()
				-- upvalues: Flag (ref), CellResult (copy)
				if Flag then
					CellResult:set(nil)
				end
			end,
			next = function()
				-- upvalues: CellResult (copy), Flag (ref), Tbl (copy), IsWrap (copy), Tbl1 (copy)
				local PeekResult = CellResult:peek()
				
				if PeekResult ~= nil then
					local Value = (Tbl1[PeekResult] or 1) + 1
					
					if Flag and #Tbl ~= 0 then
						local Entry = Tbl[if IsWrap then (Value - 1) % #Tbl + 1 else math.clamp(Value, 1, #Tbl)]
						CellResult:set(Entry)
						
						return Entry
					else
						return nil
					end
				elseif Flag and #Tbl ~= 0 then
					local Value1 = 1
					local Entry = Tbl[if IsWrap then (Value1 - 1) % #Tbl + 1 else math.clamp(Value1, 1, #Tbl)]
					CellResult:set(Entry)
					
					return Entry
				else
					return nil
				end
			end,
			previous = function()
				-- upvalues: CellResult (copy), Tbl (copy), Flag (ref), IsWrap (copy), Tbl1 (copy)
				local PeekResult = CellResult:peek()
				
				if PeekResult == nil then
					local CountTbl = #Tbl
					
					if Flag and #Tbl ~= 0 then
						local Entry = Tbl[if IsWrap then (CountTbl - 1) % #Tbl + 1 else math.clamp(CountTbl, 1, #Tbl)]
						CellResult:set(Entry)
						
						return Entry
					else
						return nil
					end
				else
					local Value = (Tbl1[PeekResult] or 1) + -1
					
					if Flag and #Tbl ~= 0 then
						local Entry = Tbl[if IsWrap then (Value - 1) % #Tbl + 1 else math.clamp(Value, 1, #Tbl)]
						CellResult:set(Entry)
						
						return Entry
					else
						return nil
					end
				end
			end,
			move = function(p4)
				-- upvalues: DiagnosticsModule (upval), CreateFocusScope3 (copy), CellResult (copy), Tbl2 (copy), Flag (ref), Tbl (copy), IsWrap (copy)
				if p4 ~= "left" and p4 ~= "right" and p4 ~= "up" and p4 ~= "down" then
					return DiagnosticsModule.raise("focus-scope/unknown-direction", "focus movement needs a known direction", {
						expected = "\"left\", \"right\", \"up\", or \"down\"",
						actual = DiagnosticsModule.describe(p4)
					})
				end
				if CreateFocusScope3 == nil then
					return DiagnosticsModule.raise("focus-scope/no-positions", "directional focus movement needs candidate positions", {
						fix = "pass position = function(item) return item.x, item.y end, or use next/previous"
					})
				end
				local PeekResult = CellResult:peek()
				
				if PeekResult ~= nil and Tbl2[PeekResult] ~= nil then
					local Entry = Tbl2[PeekResult]
					local v1: number = if p4 == "left" or p4 == "right" then 1 else 2
					local v2 = 3 - v1
					local v3: number = if p4 == "left" or p4 == "up" then -1 else 1
					local Entry1 = Entry[v1]
					local Entry2 = Entry[v2]
					local v4 = nil
					local v5 = 1e999
					
					for _, value in Tbl do
						if value ~= PeekResult then
							local Entry3 = Tbl2[value]
							local ScaledEntry = (Entry3[v1] - Entry1) * v3
							
							if ScaledEntry > 0 then
								local NewScaledEntry = ScaledEntry + math.abs(Entry3[v2] - Entry2) * 2
								
								if NewScaledEntry < v5 then
									v4 = value
									v5 = NewScaledEntry
								end
							end
						end
					end
					if v4 == nil then
						return PeekResult
					else
						CellResult:set(v4)
						
						return v4
					end
				elseif Flag and #Tbl ~= 0 then
					local Value = 1
					local Entry = Tbl[if IsWrap then (Value - 1) % #Tbl + 1 else math.clamp(Value, 1, #Tbl)]
					CellResult:set(Entry)
					
					return Entry
				else
					return nil
				end
			end,
			first = function()
				-- upvalues: Flag (ref), Tbl (copy), IsWrap (copy), CellResult (copy)
				if Flag and #Tbl ~= 0 then
					local Value = 1
					local Entry = Tbl[if IsWrap then (Value - 1) % #Tbl + 1 else math.clamp(Value, 1, #Tbl)]
					CellResult:set(Entry)
					
					return Entry
				else
					return nil
				end
			end,
			last = function()
				-- upvalues: Tbl (copy), Flag (ref), IsWrap (copy), CellResult (copy)
				local CountTbl = #Tbl
				
				if Flag and #Tbl ~= 0 then
					local Entry = Tbl[if IsWrap then (CountTbl - 1) % #Tbl + 1 else math.clamp(CountTbl, 1, #Tbl)]
					CellResult:set(Entry)
					
					return Entry
				else
					return nil
				end
			end,
			isFocused = function(p5)
				-- upvalues: FormulaModule (upval), CellResult (copy), OwnerModule (upval), CurrentResult (copy)
				local FormulaModuleResult = FormulaModule(function(Callback): boolean
					-- upvalues: CellResult (upval), p5 (copy)
					return Callback(CellResult) == p5
				end)
				OwnerModule.own(CurrentResult, function()
					-- upvalues: FormulaModuleResult (copy)
					FormulaModuleResult:dispose()
				end)
				
				return FormulaModuleResult
			end
		}
	end
end