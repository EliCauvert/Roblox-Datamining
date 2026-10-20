local Nil = require(script.Parent.Parent.Parent.Parent.Shared).Symbol.named("Nil")
local t = {}

local function tryPropertyName(p1, p2)
	return p1[p2]
end

return function(Key, Key1)
	-- upvalues: t (copy), Nil (copy), tryPropertyName (copy)
	local Entry = t[Key]
	
	if Entry then
		local Entry1 = Entry[Key1]
		
		if Entry1 == Nil then
			return true, nil
		end
		if Entry1 ~= nil then
			return true, Entry1
		end
	else
		Entry = {}
		t[Key] = Entry
	end
	local NewInstance = Instance.new(Key)
	local Success, Result = pcall(tryPropertyName, NewInstance, Key1)
	NewInstance:Destroy()
	
	if Success then
		if Result == nil then
			Entry[Key1] = Nil
			
			return Success, Result
		end
		Entry[Key1] = Result
	end
	return Success, Result
end