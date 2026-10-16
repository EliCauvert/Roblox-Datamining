local Parent = script.Parent
local Parent1 = Parent.Parent.Parent
local SetModule = require(Parent.Parent.Set)
local _ = require(Parent1.ES7Types)
local InstanceOfModule = require(Parent1.InstanceOf)

return function(Text) --[[ Line: 26 ]]
	-- upvalues: InstanceOfModule (copy), SetModule (copy)
	if Text == nil then
		error("cannot extract keys from a nil value")
	end
	local ValueType = typeof(Text)
	local List = nil
	
	if ValueType == "table" then
		List = {}
		
		if InstanceOfModule(Text, SetModule) then
			return List
		end
		for i in pairs(Text) do
			table.insert(List, i)
		end
		return List
	else
		if ValueType == "string" then
			local Length = Text:len()
			List = table.create(Length)
			
			for i1 = 1, Length do
				List[i1] = tostring(i1)
			end
		end
		return List
	end
end