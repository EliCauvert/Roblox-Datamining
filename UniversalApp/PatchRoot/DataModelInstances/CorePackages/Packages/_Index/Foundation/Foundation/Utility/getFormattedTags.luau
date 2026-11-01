local Foundation = script:FindFirstAncestor("Foundation")
local FlagsModule = require(Foundation.Utility.Flags)
local _ = require(Foundation.Components.Types)
local DevAssertModule = require(Foundation.Utility.devAssert)

return function(List)
	-- upvalues: FlagsModule (copy), DevAssertModule (copy)
	if List ~= nil then
		if typeof(List) == "table" then
			local List1 = {}
			
			for i, value in List do
				if value then
					table.insert(List1, i)
				end
			end
			return table.concat(List1, " ")
		else
			if typeof(List) == "string" then
				return List
			end
			if FlagsModule.FoundationDevOnlyPropAsserts then
				DevAssertModule(false, "Invalid argument to useStyleTags. Expected a table or string, got " .. typeof(List))
			else
				assert(false, "Invalid argument to useStyleTags. Expected a table or string, got " .. typeof(List))
			end
		end
	end
	return nil
end