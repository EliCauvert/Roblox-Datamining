local llama = require(script:FindFirstAncestor("AppChat").Parent.LuaSocialLibrariesDeps).llama

return function(p1)
	-- upvalues: llama (ref)
	return #p1.existing == #p1.new and llama.List.equals(llama.List.sort(p1.existing), llama.List.sort(p1.new))
end