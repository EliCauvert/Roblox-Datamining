local llamaModule = require(script:FindFirstAncestor("RoduxFriends").Parent.llama)
local addUserModule = require(script.Parent.addUser)
local removeUserModule = require(script.Parent.removeUser)

function difference(p0, p1) --[[ line: 8 ]]
	local t = {}
	
	for i, v in pairs(p0) do
		t[v] = true
	end
	for i, v_1 in pairs(p1) do
		t[v_1] = nil
	end
	local t_1 = {}
	local var5 = 0
	
	for i_2, v_2 in pairs(p0) do
		if t[v_2] then
			var5 += 1
			t_1[var5] = v_2
		end
	end
	return t_1
end

return function(p2, p3) --[[ line: 33 ]]
	-- upvalues: llamaModule (ref), addUserModule (ref), removeUserModule (ref)
	local var6 = tostring(p3.namedIds.users)
	local var7 = p2[var6] or {}
	local var8 = llamaModule.List.map(llamaModule.Dictionary.values(p3.responseBody.data), function(p4) --[[ line: 37 ]]
		return tostring(p4.id)
	end)
	local var9 = difference(var7, var8)
	
	for i, v in pairs(difference(var8, var7)) do
		p2 = llamaModule.Dictionary.join(p2, {
			[var6] = addUserModule(p2[var6], v),
			[v] = addUserModule(p2[v], var6)
		})
	end
	for i_1, v_1 in pairs(var9) do
		p2 = llamaModule.Dictionary.join(p2, {
			[var6] = removeUserModule(p2[var6], v_1),
			[v_1] = removeUserModule(p2[v_1], var6)
		})
	end
	for i_2, v_2 in pairs(p2) do
		if llamaModule.isEmpty(v_2) then
			p2[i_2] = nil
		end
	end
	return p2
end