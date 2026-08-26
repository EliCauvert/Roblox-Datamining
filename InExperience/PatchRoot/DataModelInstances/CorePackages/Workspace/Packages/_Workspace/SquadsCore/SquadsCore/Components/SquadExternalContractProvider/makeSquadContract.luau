local parent = script:FindFirstAncestor("SquadsCore").Parent
local defaultSquadContractModule = require(script.Parent.DefaultSquadContract)
local _ = require(script.Parent.SquadContractType)
local cryoModule = require(parent.Cryo)

return function(p1)
	-- upvalues: cryoModule (ref), defaultSquadContractModule (ref)
	return cryoModule.Dictionary.union(defaultSquadContractModule, p1)
end