local Llama = require(script:FindFirstAncestor("AppChat").Parent.LuaSocialLibrariesDeps).llama

return function(p1) --[[ Line: 6 ]]
	-- upvalues: Llama (copy)
	return #p1.existing == #p1.new and Llama.List.equals(Llama.List.sort(p1.existing), (Llama.List.sort(p1.new)))
end