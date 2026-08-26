local t = {}
local parent = script.Parent.Parent.Parent
local set = require(parent.Parent.LuauPolyfill).Set
local var1 = newproxy(true)

getmetatable(var1).__tostring = function()
	return "Value.None"
end

local isNonNullObject = require(script.Parent.objects).isNonNullObject
local hasOwnPropertyModule = require(parent.luaUtils.hasOwnProperty)
local objectKeysForEachModule = require(parent.luaUtils.objectKeysForEach)
local var2 = nil

function t.mergeDeep(...)
	-- upvalues: var2 (write)
	return var2({ ... })
end

local t_1 = {}

function t.mergeDeepArray(p1)
	-- upvalues: t_1 (ref)
	local var3 = p1[1] or {}
	local p0Count = #p1
	
	if p0Count > 1 then
		local var4 = t_1.new()
		
		for i = 2, p0Count do
			var3 = var4:merge(var3, p1[i])
		end
	end
	return var3
end

t_1.__index = t_1

function t_1.new(p2)
	-- upvalues: t_1 (ref), isNonNullObject (ref), set (ref)
	local tbl = setmetatable({}, t_1)
	
	local var5 = function(p3, p4, p5, p6)
		return p3:merge(p4[p6], p5[p6])
	end
	
	if p2 == nil then
		p2 = var5
	end
	tbl.reconciler = p2
	tbl.isObject = isNonNullObject
	tbl.pastCopies = set.new()
	
	return tbl
end

function t_1.merge(p2, p3, p4, ...)
	-- upvalues: isNonNullObject (ref), objectKeysForEachModule (ref), hasOwnPropertyModule (ref), var1 (ref)
	local packed = table.pack(...)
	
	if isNonNullObject(p4) and isNonNullObject(p3) then
		objectKeysForEachModule(p4, function(p5)
			-- upvalues: hasOwnPropertyModule (copy), p3 (write), p4 (ref), p2 (ref), packed (ref), var1 (copy)
			if hasOwnPropertyModule(p3, p5) then
				local var5 = p3[p5]
				
				if p4[p5] ~= var5 then
					local var6 = p2:reconciler(p3, p4, p5, table.unpack(packed))
					
					if var6 ~= var5 then
						p3 = p2:shallowCopyForMerge(p3)
						p3[p5] = var6
					end
				end
			else
				p3 = p2:shallowCopyForMerge(p3)
				p3[p5] = p4[p5]
			end
			if p3[p5] == var1 then
				p3[p5] = nil
			end
		end)
		
		return p3
	end
	return p4
end

function t_1:shallowCopyForMerge(p2)
	-- upvalues: isNonNullObject (ref)
	if isNonNullObject(p2) and not self.pastCopies:has(p2) then
		p2 = table.clone(p2)
		self.pastCopies:add(p2)
	end
	return p2
end

t_1.None = var1
t.DeepMerger = t_1

return t