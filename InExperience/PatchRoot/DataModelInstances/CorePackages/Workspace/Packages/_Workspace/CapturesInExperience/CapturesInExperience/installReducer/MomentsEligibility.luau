local Parent = script.Parent.Parent
local Parent1 = Parent.Parent
local CryoModule = require(Parent1.Cryo)

return require(Parent1.Rodux).createReducer({ byUniverseId = {} }, {
	[require(Parent.Actions.MomentsEligibilityReceived).name] = function(p1, p2) --[[ Line: 18 ]]
		-- upvalues: CryoModule (copy)
		return {
			byUniverseId = CryoModule.Dictionary.join(p1.byUniverseId, { [p2.universeId] = p2.isEligible })
		}
	end
})