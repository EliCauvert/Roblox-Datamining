local LlamaModule = require(script:FindFirstAncestor("FriendsRodux").Parent.llama)
local AddUserModule = require(script.Parent.addUser)
local RemoveUserModule = require(script.Parent.removeUser)

function difference(List, List1)
	local t = {}
	
	for _, value in pairs(List) do
		t[value] = true
	end
	for _, value1 in pairs(List1) do
		t[value1] = nil
	end
	local t1 = {}
	local Count = 0
	
	for _, value2 in pairs(List) do
		if t[value2] then
			Count += 1
			t1[Count] = value2
		end
	end
	return t1
end

return function(JoinResult, p1)
	-- upvalues: LlamaModule (copy), AddUserModule (copy), RemoveUserModule (copy)
	local Text = tostring(p1.namedIds.users)
	local JoinResultEntry = JoinResult[Text] or {}
	local MapResult = LlamaModule.List.map(LlamaModule.Dictionary.values(p1.responseBody.data), function(p2): string
		return (tostring(p2.id))
	end)
	local DifferenceResult = difference(JoinResultEntry, MapResult)
	
	for i, value in pairs((difference(MapResult, JoinResultEntry))) do
		JoinResult = LlamaModule.Dictionary.join(JoinResult, {
			[Text] = AddUserModule(JoinResult[Text], value),
			[value] = AddUserModule(JoinResult[value], Text)
		})
	end
	for i, value1 in pairs(DifferenceResult) do
		JoinResult = LlamaModule.Dictionary.join(JoinResult, {
			[Text] = RemoveUserModule(JoinResult[Text], value1),
			[value1] = RemoveUserModule(JoinResult[value1], Text)
		})
	end
	for i, value2 in pairs(JoinResult) do
		if LlamaModule.isEmpty(value2) then
			JoinResult[i] = nil
		end
	end
	return JoinResult
end