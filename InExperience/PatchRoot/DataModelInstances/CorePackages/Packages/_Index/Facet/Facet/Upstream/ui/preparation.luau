local _ = require("./types")
local _ = require("../vendor/compose/core")
local self = setmetatable({}, { __mode = "k" })

local function _(Key)
	-- upvalues: self (copy)
	local SelfEntry = self[Key]
	
	if SelfEntry == nil then
		local CellResult = Key.Compose.cell({})
		self[Key] = CellResult
		
		return CellResult
	else
		return SelfEntry
	end
end

local function mark(Key, Key1, Value)
	-- upvalues: self (copy)
	Key1:SetAttribute("FacetPreparing", Value)
	local SelfEntry = self[Key]
	local CellResult1 = nil
	
	if SelfEntry == nil then
		local CellResult = Key.Compose.cell({})
		self[Key] = CellResult
		CellResult1 = CellResult
	else
		CellResult1 = SelfEntry
	end
	if CellResult1:peek()[Key1] == true == Value then return end
	local Copy = table.clone(CellResult1:peek())
	
	if Value then
		Copy[Key1] = true
	else
		Copy[Key1] = nil
	end
	CellResult1:set(Copy)
end

return {
	begin = function(p1, Key)
		-- upvalues: mark (copy), self (copy)
		mark(p1, Key, true)
		p1.Compose.cleanup(function()
			-- upvalues: p1 (copy), self (upval), Key (copy)
			local SelfEntry = self[p1]
			local CellResult1 = nil
			
			if SelfEntry == nil then
				local CellResult = p1.Compose.cell({})
				self[p1] = CellResult
				CellResult1 = CellResult
			else
				CellResult1 = SelfEntry
			end
			if CellResult1:peek()[Key] then
				local Copy = table.clone(CellResult1:peek())
				Copy[Key] = nil
				CellResult1:set(Copy)
			end
		end)
	end,
	finish = function(p1, Key)
		-- upvalues: mark (copy)
		mark(p1, Key, false)
	end,
	within = function(Key, Ancestor, Callback): boolean
		-- upvalues: self (copy)
		local SelfEntry = self[Key]
		local CellResult1 = nil
		
		if SelfEntry == nil then
			local CellResult = Key.Compose.cell({})
			self[Key] = CellResult
			CellResult1 = CellResult
		else
			CellResult1 = SelfEntry
		end
		for i in Callback(CellResult1) do
			if i:IsDescendantOf(Ancestor) then
				return true
			end
		end
		return false
	end
}