local DefaultSquadContractModule = require(script.Parent.DefaultSquadContract)
local _ = require(script.Parent.SquadContractType)
local CryoModule = require(script:FindFirstAncestor("SquadsCore").Parent.Cryo)

return function(p1) --[[ Line: 31 ]]
	-- upvalues: CryoModule (copy), DefaultSquadContractModule (copy)
	return CryoModule.Dictionary.union(DefaultSquadContractModule, p1)
end