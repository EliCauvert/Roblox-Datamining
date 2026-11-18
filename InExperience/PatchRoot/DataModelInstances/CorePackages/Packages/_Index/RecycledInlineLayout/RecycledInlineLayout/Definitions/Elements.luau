local _ = require(script:FindFirstAncestor("RecycledInlineLayout").Types)
local Inverted = not not _G.__DEV__
local self = setmetatable({}, { __mode = "k" })

local function warnUndeclared(Definition, Props)
	-- upvalues: self (copy)
	local Inherit = Definition.inherit
	
	for prop in Props do
		if Definition.props[prop] == nil and (not Inherit or not table.find(Inherit, prop)) then
			local SelfEntry = self[Definition]
			
			if SelfEntry == nil then
				SelfEntry = {}
				self[Definition] = SelfEntry
			end
			if not SelfEntry[prop] then
				SelfEntry[prop] = true
				warn(`RecycledInlineLayout: {Definition.name} has no prop "{prop}", so it's ignored`)
			end
		end
	end
end

local function splitKey(Tbl)
	if Tbl == nil then
		return nil, table.freeze({})
	end
	local Key = Tbl.key
	
	if Key == nil then
		return nil, table.freeze(table.clone(Tbl))
	else
		local Copy = table.clone(Tbl)
		Copy.key = nil
		
		return tostring(Key), table.freeze(Copy)
	end
end

return {
	createLeafElement = function(Definition, p1)
		-- upvalues: splitKey (copy), Inverted (copy), warnUndeclared (copy)
		local SplitKeyResult, SplitKeyResult2 = splitKey(p1)
		
		if Inverted then
			warnUndeclared(Definition, SplitKeyResult2)
		end
		return table.freeze({
			type = "Leaf",
			definition = Definition,
			key = SplitKeyResult,
			props = SplitKeyResult2
		})
	end,
	createSpanElement = function(Definition, p1, p2)
		-- upvalues: splitKey (copy), Inverted (copy), warnUndeclared (copy)
		local SplitKeyResult, SplitKeyResult2 = splitKey(p1)
		
		if Inverted then
			warnUndeclared(Definition, SplitKeyResult2)
		end
		return table.freeze({
			type = "Span",
			definition = Definition,
			key = SplitKeyResult,
			props = SplitKeyResult2,
			children = table.freeze(table.clone(p2 or {}))
		})
	end
}