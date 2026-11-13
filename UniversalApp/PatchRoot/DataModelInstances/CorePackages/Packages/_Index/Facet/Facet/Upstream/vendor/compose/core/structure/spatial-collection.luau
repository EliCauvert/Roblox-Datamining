--!native

local CreateFunction = table.create
local CreateFunction1 = table.create
local _ = require("../types")
local _ = require("../runtime/children")
local AdmissionModule = require("../collection/admission")
local DiagnosticsModule = require("../diagnostics")
local FramePumpModule = require("../collection/frame-pump")
local GridModule = require("../collection/grid")
local RelevanceModule = require("../collection/relevance")
local SupportModule = require("./support")
local _ = require("../reactive/types")
local CellModule = require("../reactive/cell")
local RetainModule = require("../collection/retain")
local config = {
	from = true,
	key = true,
	position = true,
	origin = true,
	tiers = true,
	render = true,
	cellSize = true,
	hysteresis = true,
	importance = true,
	pinned = true,
	budget = true,
	status = true
}
local config1 = { mountsPerFrame = true }

local function _(p1, p2)
	return if p1 == nil then p2 elseif type(p1) == "number" and p1 == p1 then p1 else p2
end

local IdentityKey = require("../reactive/graph").identityKey

return function(p1)
	-- upvalues: SupportModule (copy), config (copy), DiagnosticsModule (copy), RelevanceModule (copy), IdentityKey (copy), config1 (copy), CellModule (copy), FramePumpModule (copy), GridModule (copy), AdmissionModule (copy), CreateFunction (copy), CreateFunction1 (copy), RetainModule (copy)
	local SpatialCollection = SupportModule.optionsOf(p1, "SpatialCollection", "from = ..., position = ..., origin = ..., tiers = ..., render = ...")
	SupportModule.noUnknownFields(SpatialCollection, "SpatialCollection", config)
	local SpatialCollection1 = SupportModule.sourceOf(SpatialCollection.from, "SpatialCollection", "from")
	local SpatialCollection2 = SupportModule.builderOf(SpatialCollection.render, "SpatialCollection", "render")
	local SpatialCollection3 = SupportModule.builderOf(SpatialCollection.position, "SpatialCollection", "position")
	local SpatialCollection4 = SupportModule.sourceOf(SpatialCollection.origin, "SpatialCollection", "origin")
	local Tiers = SpatialCollection.tiers
	
	if type(Tiers) ~= "table" then
		return DiagnosticsModule.raise("collection/no-tiers", "SpatialCollection was given no tier list", {
			primitive = "SpatialCollection",
			expected = "{ { name = \"full\", radius = 100 }, ... }",
			actual = DiagnosticsModule.describe(Tiers)
		})
	end
	RelevanceModule.checkTiers(Tiers, "SpatialCollection")
	local CountTiers = #Tiers
	local Radius: number = Tiers[CountTiers].radius
	local IdentityKey1 = nil
	IdentityKey1 = if SpatialCollection.key == nil then IdentityKey else SupportModule.builderOf(SpatialCollection.key, "SpatialCollection", "key")
	local Hysteresis = SpatialCollection.hysteresis
	local Largest = math.max(0, if Hysteresis == nil then 0 elseif type(Hysteresis) == "number" and Hysteresis == Hysteresis then Hysteresis else 0)
	local CellSize = SpatialCollection.cellSize
	local Largest1 = math.max(1, Radius)
	local Largest2 = if CellSize == nil then Largest1 elseif type(CellSize) == "number" and CellSize == CellSize then CellSize else Largest1
	local ImportanceFunction = SpatialCollection.importance
	
	if ImportanceFunction ~= nil then
		ImportanceFunction = SupportModule.builderOf(ImportanceFunction, "SpatialCollection", "importance")
	end
	local SpatialCollection5 = if SpatialCollection.pinned == nil then nil else SupportModule.sourceOf(SpatialCollection.pinned, "SpatialCollection", "pinned")
	local Budget = SpatialCollection.budget or {}
	SupportModule.noUnknownFields(Budget, "SpatialCollection.budget", config1)
	local Largest3 = nil
	
	if Budget.mountsPerFrame == nil then
		Largest3 = nil
	else
		local MountsPerFrame = Budget.mountsPerFrame
		Largest3 = math.max(1, (math.floor(if MountsPerFrame == nil then 1 elseif type(MountsPerFrame) == "number" and MountsPerFrame == MountsPerFrame then MountsPerFrame else 1)))
	end
	local SpatialCollection6 = if SpatialCollection.status == nil then nil else SupportModule.writableOf(SpatialCollection.status, "SpatialCollection", "status")
	local NoLargest: boolean = SpatialCollection5 == nil and (ImportanceFunction == nil and Largest == 0) and Largest3 == nil
	
	return function(p2)
		-- upvalues: SupportModule (upval), CellModule (upval), FramePumpModule (upval), GridModule (upval), Largest2 (copy), NoLargest (copy), IdentityKey1 (ref), SpatialCollection5 (ref), ImportanceFunction (ref), SpatialCollection3 (copy), SpatialCollection4 (copy), CountTiers (copy), RelevanceModule (upval), Tiers (copy), SpatialCollection6 (copy), Radius (copy), Largest (copy), AdmissionModule (upval), Largest3 (copy), CreateFunction (upval), CreateFunction1 (upval), RetainModule (upval), SpatialCollection1 (copy), SpatialCollection2 (copy)
		local SpatialCollection = SupportModule.ownerFor("SpatialCollection")
		SupportModule.mountPointOf(p2, "SpatialCollection")
		local CellResult = CellModule.cell(0)
		local SpatialCollection7 = FramePumpModule(SpatialCollection, p2.host, CellResult, "SpatialCollection")
		local NewGrid = GridModule.create(Largest2)
		local v1 = nil
		local v2 = nil
		local Tbl = {}
		local Tbl1 = {}
		local v3 = 1
		local t = {}
		local Keys = {}
		local Tbl2 = {}
		RetainModule({
			primitive = "SpatialCollection",
			source = SpatialCollection1,
			key = IdentityKey1,
			select = function(Callback1: (any) -> (), p3)
				-- upvalues: v1 (ref), Tbl (copy), Tbl1 (copy), v3 (ref), NoLargest (upval), IdentityKey1 (upval), SpatialCollection5 (upval), ImportanceFunction (upval), GridModule (upval), NewGrid (copy), SpatialCollection3 (upval), v2 (ref), CellResult (copy), SpatialCollection4 (upval), CountTiers (upval), RelevanceModule (upval), Tiers (upval), t (ref), SpatialCollection6 (upval), Keys (copy), Tbl2 (copy), Radius (upval), Largest (upval), AdmissionModule (upval), Largest3 (upval), CreateFunction (upval), SpatialCollection7 (copy), CreateFunction1 (upval)
				if p3 ~= v1 then
					local CountP4 = #p3
					table.clear(Tbl)
					table.clear(Tbl1)
					v3 = 1
					
					if v1 == nil or not NoLargest then
						for i = 1, CountP4 do
							local v4 = p3[i]
							local IdentityKeyResult = IdentityKey1(v4, i)
							Tbl[i] = IdentityKeyResult
							
							if SpatialCollection5 ~= nil then
								Tbl1[IdentityKeyResult] = i
							end
							local Callback = ImportanceFunction
							
							if Callback ~= nil then
								local CallbackResult = Callback(v4)
								local Largest1 = math.max(0, if CallbackResult == nil then 1 elseif type(CallbackResult) == "number" and CallbackResult == CallbackResult then CallbackResult else 1)
								
								if v3 < Largest1 then
									v3 = Largest1
								end
							end
						end
					end
					if v1 == nil then
						GridModule.build(NewGrid, p3, function(p4)
							-- upvalues: SpatialCollection3 (upval)
							local SpatialCollectionResult, SpatialCollectionResult2, SpatialCollectionResult3 = SpatialCollection3(p4)
							
							return SpatialCollectionResult, SpatialCollectionResult2, SpatialCollectionResult3 or 0
						end)
						v2 = p3
					else
						v2 = nil
					end
					v1 = p3
				elseif v2 ~= p3 then
					if #Tbl ~= #p3 then
						for i1 = 1, #p3 do
							Tbl[i1] = IdentityKey1(p3[i1], i1)
						end
					end
					GridModule.build(NewGrid, p3, function(p4)
						-- upvalues: SpatialCollection3 (upval)
						local SpatialCollectionResult, SpatialCollectionResult2, SpatialCollectionResult3 = SpatialCollection3(p4)
						
						return SpatialCollectionResult, SpatialCollectionResult2, SpatialCollectionResult3 or 0
					end)
					v2 = p3
				end
				Callback1(CellResult)
				local SpatialCollectionResult = SpatialCollection4(Callback1)
				local X = SpatialCollectionResult.x
				local X1 = if X == nil then 0 elseif type(X) == "number" and X == X then X else 0
				local Y = SpatialCollectionResult.y
				local Y1 = if Y == nil then 0 elseif type(Y) == "number" and Y == Y then Y else 0
				local Z = SpatialCollectionResult.z
				local Z1 = if Z == nil then 0 elseif type(Z) == "number" and Z == Z then Z else 0
				local Callback2 = SpatialCollection5
				local CallbackResult = if Callback2 == nil then nil else Callback2(Callback1)
				local CountP4 = #p3
				
				if NoLargest and v2 ~= p3 then
					local Values = {}
					local Keys1 = {}
					local States = {}
					local Buffer = table.create(CountTiers, 0)
					
					for i2 = 1, CountP4 do
						local v5 = p3[i2]
						local SpatialCollectionResult1, SpatialCollectionResult2, SpatialCollectionResult3 = SpatialCollection3(v5)
						local SpatialCollectionResultDelta = SpatialCollectionResult1 - X1
						local SpatialCollectionResultDelta1 = SpatialCollectionResult2 - Y1
						local v6 = (SpatialCollectionResult3 or 0) - Z1
						local SquareRoot = math.sqrt(SpatialCollectionResultDelta * SpatialCollectionResultDelta + SpatialCollectionResultDelta1 * SpatialCollectionResultDelta1 + v6 * v6)
						local TierForResult = RelevanceModule.tierFor(SquareRoot, nil, Tiers, 0, 1)
						
						if TierForResult ~= nil then
							local v7 = #Values + 1
							Values[v7] = v5
							Keys1[v7] = IdentityKey1(v5, i2)
							States[v7] = {
								pinned = false,
								tier = TierForResult,
								name = Tiers[TierForResult].name,
								distance = SquareRoot
							}
							Buffer[TierForResult] += 1
						end
					end
					t = {}
					
					if SpatialCollection6 ~= nil then
						SpatialCollection6:set({
							pending = 0,
							cells = 0,
							total = CountP4,
							retained = #Values,
							queried = CountP4,
							perTier = Buffer
						})
					end
					return { values = Values, keys = Keys1, states = States }
				else
					local Queried = 0
					table.clear(Keys)
					table.clear(Tbl2)
					local NewLargest = (if ImportanceFunction == nil then Radius else Radius * v3) + Largest
					local QueryResult = 0
					
					if v2 == p3 then
						QueryResult = GridModule.query(NewGrid, X1, Y1, Z1, NewLargest, function(Key)
							-- upvalues: Tbl2 (upval), Queried (ref), Keys (upval)
							if not Tbl2[Key] then
								Tbl2[Key] = true
								Queried += 1
								Keys[#Keys + 1] = Key
							end
						end)
					else
						Queried = CountP4
						
						for i3 = 1, CountP4 do
							Tbl2[i3] = true
							Keys[i3] = i3
						end
					end
					if CallbackResult ~= nil then
						for i4, value in CallbackResult do
							local Entry = Tbl1[i4]
							
							if value and Entry ~= nil and not Tbl2[Entry] then
								Tbl2[Entry] = true
								Keys[#Keys + 1] = Entry
							end
						end
					end
					local t1 = {}
					local TierForResults1 = {}
					local SquareRoots1 = {}
					local v8 = {}
					local TierForResults = {}
					local SquareRoots = {}
					table.sort(Keys)
					
					for _, key in Keys do
						local v9 = p3[key]
						local SpatialCollectionResult1, SpatialCollectionResult2_1, SpatialCollectionResult3_1 = SpatialCollection3(v9)
						local SpatialCollectionResultDelta = SpatialCollectionResult1 - X1
						local SpatialCollectionResultDelta2 = SpatialCollectionResult2_1 - Y1
						local v10 = (SpatialCollectionResult3_1 or 0) - Z1
						local SquareRoot = math.sqrt(SpatialCollectionResultDelta * SpatialCollectionResultDelta + SpatialCollectionResultDelta2 * SpatialCollectionResultDelta2 + v10 * v10)
						local Entry = Tbl[key]
						local Entry1 = t[Entry]
						local Largest2 = nil
						
						if ImportanceFunction == nil then
							Largest2 = 1
						else
							local ImportanceResult = ImportanceFunction(v9)
							Largest2 = math.max(0, if ImportanceResult == nil then 1 elseif type(ImportanceResult) == "number" and ImportanceResult == ImportanceResult then ImportanceResult else 1)
						end
						local TierForResult = if CallbackResult == nil or not CallbackResult[Entry] then RelevanceModule.tierFor(SquareRoot, Entry1, Tiers, Largest, Largest2) else RelevanceModule.pinnedTier(SquareRoot, Entry1, Tiers, Largest, Largest2)
						
						if TierForResult ~= nil then
							if Entry1 == nil then
								v8[#v8 + 1] = key
								TierForResults[#TierForResults + 1] = TierForResult
								SquareRoots[#SquareRoots + 1] = SquareRoot
							else
								t1[#t1 + 1] = key
								TierForResults1[#TierForResults1 + 1] = TierForResult
								SquareRoots1[#SquareRoots1 + 1] = SquareRoot
							end
						end
					end
					local AdmissionModuleResult = AdmissionModule(#v8, Largest3, function(p4, p5): boolean
						-- upvalues: TierForResults (ref), SquareRoots (ref), v8 (ref)
						return if TierForResults[p4] == TierForResults[p5] then if SquareRoots[p4] == SquareRoots[p5] then v8[p4] < v8[p5] else SquareRoots[p4] < SquareRoots[p5] else TierForResults[p4] < TierForResults[p5]
					end)
					local Admitted = AdmissionModuleResult.admitted
					local Pending: number = AdmissionModuleResult.pending
					
					if AdmissionModuleResult.order ~= nil then
						local Order = AdmissionModuleResult.order
						local CreateResult = CreateFunction(Admitted)
						local CreateResult1 = CreateFunction(Admitted)
						local CreateResult2 = CreateFunction(Admitted)
						
						for i5 = 1, Admitted do
							local v11 = Order[i5]
							CreateResult[i5] = v8[v11]
							CreateResult1[i5] = TierForResults[v11]
							CreateResult2[i5] = SquareRoots[v11]
						end
						v8 = CreateResult
						TierForResults = CreateResult1
						SquareRoots = CreateResult2
					end
					SpatialCollection7.update(Pending > 0)
					local Retained = #t1 + #v8
					local Buffer = table.create(Retained)
					local Buffer1 = table.create(Retained)
					local CreateResult3 = CreateFunction1(Retained)
					local Buffer2 = table.create(CountTiers, 0)
					local Tiers1 = {}
					local Count = 1
					local Count1 = 1
					
					for i6 = 1, Retained do
						local TierForResult = nil
						local Entry = nil
						local SquareRoot = nil
						if Count <= #t1 and (Count1 > #v8 or t1[Count] < v8[Count1]) then
							Entry = t1[Count]
							TierForResult = TierForResults1[Count]
							SquareRoot = SquareRoots1[Count]
							Count += 1
						else
							Entry = v8[Count1]
							TierForResult = TierForResults[Count1]
							SquareRoot = SquareRoots[Count1]
							Count1 += 1
						end
						local Entry2 = Tbl[Entry]
						Buffer[i6] = p3[Entry]
						Buffer1[i6] = Entry2
						CreateResult3[i6] = {
							tier = TierForResult,
							name = Tiers[TierForResult].name,
							distance = SquareRoot,
							pinned = CallbackResult ~= nil and CallbackResult[Entry2] == true
						}
						Buffer2[TierForResult] += 1
						Tiers1[Entry2] = TierForResult
					end
					t = Tiers1
					
					if SpatialCollection6 ~= nil then
						SpatialCollection6:set({
							total = CountP4,
							retained = Retained,
							queried = Queried,
							pending = Pending,
							perTier = Buffer2,
							cells = QueryResult
						})
					end
					return { values = Buffer, keys = Buffer1, states = CreateResult3 }
				end
			end,
			render = SpatialCollection2,
			equals = function(p4, p5): boolean
				return p4.tier == p5.tier and p4.distance == p5.distance and p4.pinned == p5.pinned
			end
		})(p2)
	end
end