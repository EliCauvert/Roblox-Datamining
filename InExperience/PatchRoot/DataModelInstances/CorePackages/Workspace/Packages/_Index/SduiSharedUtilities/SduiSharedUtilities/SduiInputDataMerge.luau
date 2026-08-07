local _ = require(script:FindFirstAncestor("SduiSharedUtilities").SduiIntegrationTypes)
local t = {}

local function _(p0) --[[ line: 15 | named "isArrayLike" ]]
	return typeof(p0) == "table" and #p0 > 0
end

local _ = function(value, p1) --[[ line: 19 | named "shallowAssignFromNew" ]]
	for i, v in p1 do
		value[i] = v
	end
end

local _ = function(p2, p3) --[[ line: 25 | named "appendArray" ]]
	for i, v in p3 do
		table.insert(p2, v)
	end
end

local function mergeInto(p4, p5, p6, p7) --[[ line: 31 ]]
	-- upvalues: mergeInto (ref)
	for i, v in p5 do
		if typeof(v) ~= "table" then
			p4[i] = v
			continue
		end
		table.insert(p7, tostring(i))
		local var2 = if p6 then p6(p7, v, p4[i]) else nil
		
		if var2 == "replace" then
			p4[i] = v
		elseif var2 == "merge" then
			if p4[i] == nil then
				p4[i] = v
			else
				local var3 = p4[i]
				
				for i_1, v_1 in v do
					var3[i_1] = v_1
				end
			end
		elseif var2 ~= "append" then
			if p4[i] == nil then
				p4[i] = {}
			end
			if typeof(v) == "table" and #v > 0 then
				local var6 = p4[i]
				
				for i_1, v_1 in v do
					table.insert(var6, v_1)
				end
			else
				mergeInto(p4[i], v, p6, p7)
			end
		elseif p4[i] == nil then
			p4[i] = v
		elseif typeof(v) == "table" and #v > 0 then
			local var5 = p4[i]
			
			for i_1, v_1 in v do
				table.insert(var5, v_1)
			end
		else
			local var4 = p4[i]
			
			for i_1, v_1 in v do
				var4[i_1] = v_1
			end
		end
		table.remove(p7)
		continue
	end
end

function t.merge(p8, p9, p10) --[[ line: 78 ]]
	-- upvalues: mergeInto (ref)
	local cloned = table.clone(p8)
	mergeInto(cloned, p9, p10, {})
	
	return cloned
end

return t