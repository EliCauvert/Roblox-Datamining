local parent = script.Parent.Parent
local parent_1 = parent.Parent
local cryoModule = require(parent_1.Cryo)

return require(parent_1.Rodux).createReducer({ byUniverseId = {} }, {
	[require(parent.Actions.MomentsEligibilityReceived).name] = function(p1, p2)
		-- upvalues: cryoModule (ref)
		return {
			byUniverseId = cryoModule.Dictionary.join(p1.byUniverseId, { [p2.universeId] = p2.isEligible })
		}
	end
})