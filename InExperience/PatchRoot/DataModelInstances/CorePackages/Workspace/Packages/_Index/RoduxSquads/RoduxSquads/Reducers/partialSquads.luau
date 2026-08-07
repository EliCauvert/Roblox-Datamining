local roduxSquads = script:FindFirstAncestor("RoduxSquads")
local parent = roduxSquads.Parent
local cryoModule = require(parent.Cryo)
local roduxModule = require(parent.Rodux)
local partialSquadAdded = require(roduxSquads.Actions).PartialSquadAdded
local partialSquadRemoved = require(roduxSquads.Actions).PartialSquadRemoved
local partialSquadModel = require(roduxSquads.Models).PartialSquadModel
local _ = require(script.Parent.Parent.RoduxSquadsTypes)
local t = {}

return function() --[[ line: 16 ]]
	-- upvalues: roduxModule (ref), t (ref), partialSquadAdded (ref), partialSquadModel (ref), cryoModule (ref), partialSquadRemoved (ref)
	return roduxModule.createReducer(t, {
		[partialSquadAdded.name] = function(p0, p1) --[[ line: 18 ]]
			-- upvalues: partialSquadModel (copy), cryoModule (copy)
			local var4 = partialSquadModel.format(p1.payload.partialSquad)
			
			return cryoModule.Dictionary.join(p0, { [var4.channelId] = var4 })
		end,
		[partialSquadRemoved.name] = function(p2, p3) --[[ line: 26 ]]
			-- upvalues: cryoModule (copy)
			return cryoModule.Dictionary.join(p2, { [p3.payload.channelId] = cryoModule.None })
		end
	})
end