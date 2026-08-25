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
local var4 = nil

function t.mergeDeep(...)
	-- upvalues: var4 (write)
	return var4({ ... })
end

local t_1 = {}

function t.mergeDeepArray(p0)
	-- upvalues: t_1 (ref)
	local var6 = p0[1] or {}
	local p0Count = #p0
	
	if p0Count > 1 then
		local var8 = t_1.new()
		
		for i = 2, p0Count do
			var6 = var8:merge(var6, p0[i])
		end
	end
	return var6
end

t_1.__index = t_1

function t_1.new(p1)
	-- upvalues: t_1 (ref), isNonNullObject (ref), set (ref)
	local tbl = setmetatable({}, t_1)
	
	local var10 = function(p2, p3, p4, p5)
		return p2:merge(p3[p5], p4[p5])
	end
	
	if p1 == nil then
		p1 = var10
	end
	tbl.reconciler = p1
	tbl.isObject = isNonNullObject
	tbl.pastCopies = set.new()
	
	return tbl
end

function t_1.merge(p6, p7, p8, ...)
	-- upvalues: isNonNullObject (ref), objectKeysForEachModule (ref), hasOwnPropertyModule (ref), var1 (ref)
	local packed = table.pack(...)
	
	if isNonNullObject(p8) and isNonNullObject(p7) then
		objectKeysForEachModule(p8, function(p9)
			-- upvalues: hasOwnPropertyModule (copy), p7 (write), p8 (ref), p6 (ref), packed (ref), var1 (copy)
			if hasOwnPropertyModule(p7, p9) then
				local var12 = p7[p9]
				
				if p8[p9] ~= var12 then
					local var13 = p6:reconciler(p7, p8, p9, table.unpack(packed))
					
					if var13 ~= var12 then
						p7 = p6:shallowCopyForMerge(p7)
						p7[p9] = var13
					end
				end
			else
				p7 = p6:shallowCopyForMerge(p7)
				p7[p9] = p8[p9]
			end
			if p7[p9] == var1 then
				p7[p9] = nil
			end
		end)
		
		return p7
	end
	return p8
end

function t_1:shallowCopyForMerge(p10)
	-- upvalues: isNonNullObject (ref)
	if isNonNullObject(p10) and not self.pastCopies:has(p10) then
		p10 = table.clone(p10)
		self.pastCopies:add(p10)
	end
	return p10
end

t_1.None = var1
t.DeepMerger = t_1

return t