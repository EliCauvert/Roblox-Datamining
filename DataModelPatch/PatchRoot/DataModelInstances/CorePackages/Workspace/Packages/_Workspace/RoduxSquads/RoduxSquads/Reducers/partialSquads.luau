local RoduxSquads = script:FindFirstAncestor("RoduxSquads")
local Parent = RoduxSquads.Parent
local CryoModule = require(Parent.Cryo)
local RoduxModule = require(Parent.Rodux)
local PartialSquadAdded = require(RoduxSquads.Actions).PartialSquadAdded
local PartialSquadRemoved = require(RoduxSquads.Actions).PartialSquadRemoved
local PartialSquadModel = require(RoduxSquads.Models).PartialSquadModel
local _ = require(script.Parent.Parent.RoduxSquadsTypes)
local t = {}

return function()
	-- upvalues: RoduxModule (copy), t (copy), PartialSquadAdded (copy), PartialSquadModel (copy), CryoModule (copy), PartialSquadRemoved (copy)
	return RoduxModule.createReducer(t, {
		[PartialSquadAdded.name] = function(p1, p2)
			-- upvalues: PartialSquadModel (upval), CryoModule (upval)
			local FormatResult = PartialSquadModel.format(p2.payload.partialSquad)
			
			return CryoModule.Dictionary.join(p1, { [FormatResult.channelId] = FormatResult })
		end,
		[PartialSquadRemoved.name] = function(p1, p2)
			-- upvalues: CryoModule (upval)
			return CryoModule.Dictionary.join(p1, { [p2.payload.channelId] = CryoModule.None })
		end
	})
end