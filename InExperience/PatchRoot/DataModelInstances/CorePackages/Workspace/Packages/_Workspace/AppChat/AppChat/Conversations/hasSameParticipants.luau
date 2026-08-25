local llama = require(script:FindFirstAncestor("AppChat").Parent.LuaSocialLibrariesDeps).llama

return function(p0)
	-- upvalues: llama (ref)
	return #p0.existing == #p0.new and llama.List.equals(llama.List.sort(p0.existing), llama.List.sort(p0.new))
end