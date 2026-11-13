local _ = require("../types")
local OwnerModule = require("../ownership/owner")
local _ = require("../runtime/children")
local AdmissionModule = require("../collection/admission")
local DiagnosticsModule = require("../diagnostics")
local FramePumpModule = require("../collection/frame-pump")
local SupportModule = require("./support")
local _ = require("../reactive/types")
local CellModule = require("../reactive/cell")
local KeyedModule = require("./keyed")
local config = {
	from = true,
	key = true,
	render = true,
	mountsPerFrame = true,
	priority = true,
	status = true
}
local IdentityKey = require("../reactive/graph").identityKey

return function(p1)
	-- upvalues: SupportModule (copy), config (copy), IdentityKey (copy), DiagnosticsModule (copy), CellModule (copy), FramePumpModule (copy), OwnerModule (copy), AdmissionModule (copy), KeyedModule (copy)
	local MountBudget = SupportModule.optionsOf(p1, "MountBudget", "from = ..., mountsPerFrame = ..., render = ...")
	SupportModule.noUnknownFields(MountBudget, "MountBudget", config)
	local MountBudget1 = SupportModule.sourceOf(MountBudget.from, "MountBudget", "from")
	local MountBudget2 = SupportModule.builderOf(MountBudget.render, "MountBudget", "render")
	local IdentityKey1 = if MountBudget.key == nil then IdentityKey else SupportModule.builderOf(MountBudget.key, "MountBudget", "key")
	local MountBudget3 = if MountBudget.priority == nil then nil else SupportModule.builderOf(MountBudget.priority, "MountBudget", "priority")
	local MountsPerFrame: number = MountBudget.mountsPerFrame
	
	if type(MountsPerFrame) == "number" and MountsPerFrame == MountsPerFrame and MountsPerFrame >= 1 then
		local Largest = math.max(1, (math.floor(MountsPerFrame)))
		local MountBudget4 = if MountBudget.status == nil then nil else SupportModule.writableOf(MountBudget.status, "MountBudget", "status")
		
		return function(p2)
			-- upvalues: SupportModule (upval), CellModule (upval), FramePumpModule (upval), OwnerModule (upval), MountBudget1 (copy), IdentityKey1 (copy), DiagnosticsModule (upval), MountBudget3 (copy), AdmissionModule (upval), Largest (copy), MountBudget4 (copy), MountBudget2 (copy), KeyedModule (upval)
			local MountBudget = SupportModule.ownerFor("MountBudget")
			SupportModule.mountPointOf(p2, "MountBudget")
			local t = {}
			local Tbl = {}
			local CellResult = CellModule.cell(Tbl, function(): boolean
				return false
			end)
			local Tbl1 = {}
			local CellResult1 = CellModule.cell(0)
			local MountBudget5 = FramePumpModule(MountBudget, p2.host, CellResult1, "MountBudget")
			local v1 = nil
			local Tbl2 = {}
			local Tbl3 = {}
			local Tbl4 = {}
			local Count = 1
			local Flag = false
			OwnerModule.watch(MountBudget, function(Callback: (any) -> ())
				-- upvalues: CellResult1 (copy), MountBudget1 (upval), v1 (ref), Tbl2 (copy), Tbl3 (ref), Tbl4 (copy), IdentityKey1 (upval), DiagnosticsModule (upval), t (copy), MountBudget3 (upval), AdmissionModule (upval), Count (ref), Largest (upval), Flag (ref), Tbl (copy), Tbl1 (copy), CellResult (copy), MountBudget4 (upval), MountBudget5 (copy)
				Callback(CellResult1)
				local MountBudgetResult = MountBudget1(Callback)
				local IsNotMountBudgetResultMatch = MountBudgetResult ~= v1
				
				if IsNotMountBudgetResultMatch then
					local t1 = {}
					table.clear(Tbl2)
					table.clear(Tbl3)
					table.clear(Tbl4)
					
					for Index, value in MountBudgetResult do
						local IdentityKeyResult = IdentityKey1(value, Index)
						
						if t1[IdentityKeyResult] then
							return DiagnosticsModule.raise("structure/duplicate-key", "two MountBudget items share a key", {
								contract = "keys identify mounted items and must be unique",
								index = Index
							})
						end
						t1[IdentityKeyResult] = true
						Tbl2[Index] = IdentityKeyResult
					end
					for i in t do
						if not t1[i] then
							t[i] = nil
						end
					end
					local Indexes = {}
					local MountBudgetResult1 = nil
					
					for Index1, value1 in MountBudgetResult do
						local Entry = t[Tbl2[Index1]]
						
						if not Entry then
							Indexes[#Indexes + 1] = Index1
							Entry = MountBudget3 == nil
						end
						if not Entry then
							MountBudgetResult1 = MountBudget3(value1, Index1)
							
							if type(MountBudgetResult1) ~= "number" or MountBudgetResult1 ~= MountBudgetResult1 or math.abs(MountBudgetResult1) == 1e999 then
								return DiagnosticsModule.raise("mount-budget/invalid-priority", "MountBudget.priority returned an invalid score", {
									expected = "a finite number",
									index = Index1,
									actual = DiagnosticsModule.describe(MountBudgetResult1)
								})
							end
							Tbl4[Index1] = MountBudgetResult1
						end
					end
					local AdmissionModuleResult = AdmissionModule(#Indexes, if MountBudget3 == nil then nil else 0, function(p3, p4): boolean
						-- upvalues: Indexes (copy), Tbl4 (upval)
						local Index = Indexes[p3]
						local Index1 = Indexes[p4]
						
						return if Tbl4[Index] == Tbl4[Index1] then Index < Index1 else Tbl4[Index1] < Tbl4[Index]
					end)
					
					if AdmissionModuleResult.order == nil then
						Tbl3 = Indexes
					else
						for _, value2 in AdmissionModuleResult.order do
							Tbl3[#Tbl3 + 1] = Indexes[value2]
						end
					end
					Count = 1
					v1 = MountBudgetResult
				end
				local t2 = {}
				
				for _ = 1, Largest do
					local Entry1 = Tbl3[Count]
					
					if Entry1 == nil then break end
					Count += 1
					t[Tbl2[Entry1]] = true
					t2[#t2 + 1] = Entry1
				end
				if IsNotMountBudgetResultMatch or MountBudget3 ~= nil or not Flag then
					table.clear(Tbl)
					table.clear(Tbl1)
					Flag = true
					local Flag1 = false
					
					for i1, value4 in MountBudgetResult do
						local Entry2 = Tbl2[i1]
						
						if t[Entry2] then
							Tbl[#Tbl + 1] = value4
							Tbl1[#Tbl1 + 1] = Entry2
							
							if Flag1 then
								Flag = false
							end
						else
							Flag1 = true
						end
					end
				else
					for _, value3 in t2 do
						Tbl[#Tbl + 1] = MountBudgetResult[value3]
						Tbl1[#Tbl1 + 1] = Tbl2[value3]
					end
				end
				CellResult:set(Tbl)
				local Pending = #MountBudgetResult - #Tbl
				
				if MountBudget4 ~= nil then
					MountBudget4:set({
						total = #MountBudgetResult,
						mounted = #Tbl,
						pending = Pending
					})
				end
				MountBudget5.update(Pending > 0)
			end)
			KeyedModule({
				from = CellResult,
				key = function(_, p3)
					-- upvalues: Tbl1 (copy)
					return Tbl1[p3]
				end,
				render = MountBudget2
			})(p2)
		end
	else
		return DiagnosticsModule.raise("mount-budget/invalid-limit", "MountBudget needs a positive mountsPerFrame", {
			expected = "a positive number",
			actual = DiagnosticsModule.describe(MountsPerFrame)
		})
	end
end