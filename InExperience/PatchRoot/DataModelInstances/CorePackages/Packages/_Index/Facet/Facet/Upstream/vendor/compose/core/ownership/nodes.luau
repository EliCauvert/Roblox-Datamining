--!native

local WeakModule = require("../weak")
local DiagnosticsModule = require("../diagnostics")
local _ = require("../host")
local _ = require("./types")
local Tbl = {}
local Tbl1 = {}
local Count = 0
WeakModule.keys(Tbl)
WeakModule.keys(Tbl1)
local Tracked = { dependents = 0, labels = 0, charges = 0 }

local function assertReference(Key, p1)
	-- upvalues: DiagnosticsModule (copy)
	local ValueType = type(Key)
	
	if ValueType == "table" or ValueType == "userdata" then return end
	return DiagnosticsModule.raise("host/node-not-a-reference", ("%s received a node that is not a reference value"):format(p1), {
		expected = "a table or userdata",
		contract = "host nodes must be reference values so custody and identity can be tracked",
		actual = DiagnosticsModule.describe(Key)
	})
end

local function ownerToken(): number
	-- upvalues: Count (ref)
	Count += 4
	
	return Count
end

local function markOwned(Key, p1)
	-- upvalues: assertReference (copy), Tbl (copy)
	assertReference(Key, "createNode")
	Tbl[Key] = p1
end

local function belongsTo(p1, p2): boolean
	-- upvalues: Tbl (copy)
	local Entry = Tbl[p1]
	
	if type(Entry) ~= "table" and type(Entry) ~= "userdata" then
		local NodeToken: number = p2.nodeToken
		
		return NodeToken ~= nil and (Entry == NodeToken or (Entry == NodeToken + 1 or Entry == NodeToken + 2))
	end
	local Head = p2.head
	while Head ~= nil do
		for i = 1, #Head do
			if Head[i] == p1 then
				return true
			end
		end
		Head = Head.following
	end
	return false
end

local Tbl2 = {}

local function membership(p3, p4): boolean?
	-- upvalues: Tbl (copy)
	local Entry = Tbl[p3]
	
	if type(Entry) == "table" or type(Entry) == "userdata" then
		return nil
	else
		local NodeToken: number = p4.nodeToken
		
		return NodeToken ~= nil and (Entry == NodeToken or (Entry == NodeToken + 1 or Entry == NodeToken + 2))
	end
end

local function foreignLeaves(p3, p4, p5)
	-- upvalues: Tbl (copy), Tbl2 (copy)
	local Count = 0
	
	for i = p4, #p3 do
		local v1 = p3[i]
		local Entry = Tbl[v1]
		
		if (type(Entry) == "table" or type(Entry) == "userdata") and Tbl2[v1] == nil then
			Tbl2[v1] = true
			Count += 1
		end
	end
	local Head = p5.head
	while Head ~= nil and Count > 0 do
		for i1 = #Head, 1, -1 do
			local HeadEntry = Head[i1]
			
			if Tbl2[HeadEntry] ~= nil then
				Tbl2[HeadEntry] = nil
				Count -= 1
				
				if Count == 0 then break end
			else
				continue
			end
		end
		Head = Head.following
	end
	if Count == 0 then
		return nil
	else
		local Copy = table.clone(Tbl2)
		table.clear(Tbl2)
		
		return Copy
	end
end

local function protect(Key)
	-- upvalues: Tbl (copy), Tbl1 (copy)
	local Entry: number = Tbl[Key]
	
	if type(Entry) == "number" and Entry > 0 then
		Tbl[Key] = -Entry
		
		return
	end
	if type(Entry) == "table" or type(Entry) == "userdata" then
		Tbl1[Key] = Entry
		Tbl[Key] = "owned"
	end
end

local function _(Key, p6, p7)
	-- upvalues: Tbl (copy), Tbl1 (copy)
	local Entry: number = Tbl[Key]
	
	if type(Entry) == "number" then
		local Magnitude = math.abs(Entry)
		local NewMagnitude = Magnitude - Magnitude % 4 + p7
		Tbl[Key] = if Entry < 0 then -NewMagnitude else NewMagnitude
		
		return
	end
	if type(Entry) == "table" or type(Entry) == "userdata" then
		Tbl1[Key] = Entry
	end
	Tbl[Key] = p6
end

local function markAdopted(Key)
	-- upvalues: assertReference (copy), Tbl (copy), Tbl1 (copy)
	assertReference(Key, "adopt")
	local Entry: number = Tbl[Key]
	
	if type(Entry) == "number" then
		local Magnitude = math.abs(Entry)
		local NewMagnitude = Magnitude - Magnitude % 4 + 2
		Tbl[Key] = if Entry < 0 then -NewMagnitude else NewMagnitude
		
		return
	end
	if type(Entry) == "table" or type(Entry) == "userdata" then
		Tbl1[Key] = Entry
	end
	Tbl[Key] = "adopted"
end

local function markBorrowed(Key)
	-- upvalues: assertReference (copy), Tbl (copy), Tbl1 (copy)
	assertReference(Key, "borrow")
	local Entry: number = Tbl[Key]
	
	if type(Entry) == "number" then
		local Magnitude = math.abs(Entry)
		local NewMagnitude = Magnitude - Magnitude % 4 + 1
		Tbl[Key] = if Entry < 0 then -NewMagnitude else NewMagnitude
		
		return
	end
	if type(Entry) == "table" or type(Entry) == "userdata" then
		Tbl1[Key] = Entry
	end
	Tbl[Key] = "borrowed"
end

local function custodyOf(p6)
	-- upvalues: Tbl (copy)
	local Entry: number = Tbl[p6]
	
	if type(Entry) == "number" then
		local MagnitudeRemainder = math.abs(Entry) % 4
		
		return if MagnitudeRemainder == 1 then "borrowed" elseif MagnitudeRemainder == 2 then "adopted" else "owned"
	else
		return if Entry == nil then "borrowed" elseif type(Entry) == "string" then Entry else "owned"
	end
end

local function isDestructible(p6): boolean
	-- upvalues: Tbl (copy)
	local Entry: number = Tbl[p6]
	
	return if type(Entry) == "number" then math.abs(Entry) % 4 ~= 1 else Entry == "owned" or (Entry == "adopted" or (type(Entry) == "table" or type(Entry) == "userdata"))
end

local function rememberEvent(Key, p6): boolean
	-- upvalues: Tbl (copy)
	local Entry: number = Tbl[Key]
	
	if type(Entry) == "number" and Entry > 0 and Entry % 4 == 0 and (type(p6) == "table" or type(p6) == "userdata") then
		Tbl[Key] = p6
		
		return true
	else
		return false
	end
end

local function takeEvent(Key)
	-- upvalues: Tbl (copy), Tbl1 (copy)
	local Entry = Tbl[Key]
	
	if type(Entry) == "table" or type(Entry) == "userdata" then
		Tbl[Key] = "owned"
		
		return Entry
	else
		Tbl1[Key] = nil
		
		return Tbl1[Key]
	end
end

local Tbl3 = {}
WeakModule.keys(Tbl3)

local function attachDependent(Key, Value)
	-- upvalues: assertReference (copy), Tbl3 (copy), Tracked (copy)
	assertReference(Key, "mount")
	local Entry = Tbl3[Key]
	
	if Entry == nil then
		Entry = {}
		Tbl3[Key] = Entry
		local Tracked1 = Tracked
		Tracked1.dependents += 1
	end
	table.insert(Entry, Value)
	local Flag = false
	
	return function()
		-- upvalues: Flag (ref), Tbl3 (upval), Key (copy), Value (copy)
		if Flag then return end
		Flag = true
		local Entry = Tbl3[Key]
		
		if Entry == nil then return end
		local FoundIndex: number? = table.find(Entry, Value)
		
		if FoundIndex ~= nil then
			table.remove(Entry, FoundIndex)
		end
	end
end

local function releaseDependents(Key)
	-- upvalues: Tracked (copy), Tbl3 (copy)
	if Tracked.dependents == 0 then return end
	local Entry = Tbl3[Key]
	
	if Entry == nil then return end
	Tbl3[Key] = nil
	Tracked.dependents -= 1
	local v2: string? = nil
	
	for i = #Entry, 1, -1 do
		local Success, Result = pcall(Entry[i])
		
		if not Success and v2 == nil then
			v2 = tostring(Result)
		end
	end
	if v2 ~= nil then
		error(v2, 0)
	end
end

local Tbl4 = {}
WeakModule.keys(Tbl4)
local v3 = nil

return {
	inspecting = { active = false },
	tracked = Tracked,
	markOwned = markOwned,
	ownerToken = ownerToken,
	belongsTo = belongsTo,
	membership = membership,
	foreignLeaves = foreignLeaves,
	rememberEvent = rememberEvent,
	takeEvent = takeEvent,
	protect = protect,
	markAdopted = markAdopted,
	markBorrowed = markBorrowed,
	custodyOf = custodyOf,
	label = function(Key, p6)
		-- upvalues: Tbl4 (copy), Tracked (copy)
		if Tbl4[Key] == nil then
			Tracked.labels += 1
		end
		Tbl4[Key] = p6
	end,
	labelOf = function(p6)
		-- upvalues: Tbl4 (copy)
		return Tbl4[p6]
	end,
	isDestructible = isDestructible,
	attachDependent = attachDependent,
	releaseDependents = releaseDependents,
	forget = function(Key)
		-- upvalues: Tbl (copy), Tbl1 (copy), Tracked (copy), Tbl4 (copy), v3 (ref), releaseDependents (copy)
		Tbl[Key] = nil
		Tbl1[Key] = nil
		
		if Tracked.labels > 0 and Tbl4[Key] ~= nil then
			Tbl4[Key] = nil
			Tracked.labels -= 1
		end
		if Tracked.charges > 0 then
			local v4 = v3
			
			if v4 ~= nil then
				v4.releaseCharge(Key)
			end
		end
		if Tracked.dependents > 0 then
			releaseDependents(Key)
		end
	end,
	trackedCount = function(): number
		-- upvalues: Tbl (copy)
		local Count = 0
		
		for _ in Tbl do
			Count += 1
		end
		return Count
	end,
	chargeToOwner = function(p6, p7, p8)
		-- upvalues: v3 (ref), Tracked (copy)
		local V27 = v3 or require("./charges")(Tracked)
		v3 = V27
		V27.chargeToOwner(p6, p7, p8)
	end,
	resetCharges = function()
		-- upvalues: v3 (ref)
		local v4 = v3
		
		if v4 ~= nil then
			v4.reset()
		end
	end,
	ownedCounts = function(p6)
		-- upvalues: v3 (ref)
		local v4 = v3
		
		return if v4 == nil then { ownedNodes = 0, borrowedNodes = 0 } else v4.ownedCounts(p6)
	end,
	resetForTests = function()
		-- upvalues: Tbl (copy), Tbl1 (copy), Tbl3 (copy), Tbl4 (copy), Tracked (copy), v3 (ref)
		table.clear(Tbl)
		table.clear(Tbl1)
		table.clear(Tbl3)
		table.clear(Tbl4)
		Tracked.dependents = 0
		Tracked.labels = 0
		local v4 = v3
		
		if v4 ~= nil then
			v4.reset()
		end
	end
}