local Parent = script.Parent.Parent
local Parent1 = Parent.Parent
local CryoModule = require(Parent1.Cryo)

return require(Parent1.Rodux).createReducer({ IsOpen = false, AssetIds = {} }, {
	[require(Parent.Actions.InspectClosed).name] = function(p1, _)
		-- upvalues: CryoModule (copy)
		return CryoModule.Dictionary.join(p1, { IsOpen = false })
	end,
	[require(Parent.Actions.InspectOpened).name] = function(p1, p2)
		-- upvalues: CryoModule (copy)
		return CryoModule.Dictionary.join(p1, { IsOpen = true, AssetIds = p2.assetIds })
	end
})