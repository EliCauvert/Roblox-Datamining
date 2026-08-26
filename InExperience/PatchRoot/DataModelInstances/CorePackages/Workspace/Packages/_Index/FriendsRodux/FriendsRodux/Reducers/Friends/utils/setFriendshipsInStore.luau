local llamaModule = require(script:FindFirstAncestor("FriendsRodux").Parent.llama)
local addUserModule = require(script.Parent.addUser)
local removeUserModule = require(script.Parent.removeUser)

function difference(p1, p2)
	local t = {}
	
	for i, v in pairs(p1) do
		t[v] = true
	end
	for i, v_1 in pairs(p2) do
		t[v_1] = nil
	end
	local t_1 = {}
	local var1 = 0
	
	for i_2, v_2 in pairs(p1) do
		if t[v_2] then
			var1 += 1
			t_1[var1] = v_2
		end
	end
	return t_1
end

return function(p3, p4)
	-- upvalues: llamaModule (ref), addUserModule (ref), removeUserModule (ref)
	local var2 = tostring(p4.namedIds.users)
	local var3 = p3[var2] or {}
	local var4 = llamaModule.List.map(llamaModule.Dictionary.values(p4.responseBody.data), function(p5)
		return tostring(p5.id)
	end)
	local var5 = difference(var3, var4)
	
	for i, v in pairs(difference(var4, var3)) do
		p3 = llamaModule.Dictionary.join(p3, {
			[var2] = addUserModule(p3[var2], v),
			[v] = addUserModule(p3[v], var2)
		})
	end
	for i_1, v_1 in pairs(var5) do
		p3 = llamaModule.Dictionary.join(p3, {
			[var2] = removeUserModule(p3[var2], v_1),
			[v_1] = removeUserModule(p3[v_1], var2)
		})
	end
	for i_2, v_2 in pairs(p3) do
		if llamaModule.isEmpty(v_2) then
			p3[i_2] = nil
		end
	end
	return p3
end