local parent = script.Parent.Parent
local parent_1 = parent.Parent
local cryoModule = require(parent_1.Cryo)

return require(parent_1.Rodux).createReducer({ byUniverseId = {} }, {
	[require(parent.Actions.MomentsEligibilityReceived).name] = function(p0, p1)
		-- upvalues: cryoModule (ref)
		return {
			byUniverseId = cryoModule.Dictionary.join(p0.byUniverseId, { [p1.universeId] = p1.isEligible })
		}
	end
})