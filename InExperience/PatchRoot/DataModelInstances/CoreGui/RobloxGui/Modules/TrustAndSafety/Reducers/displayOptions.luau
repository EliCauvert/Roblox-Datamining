local CorePackages = game:GetService("CorePackages")
local CryoModule = require(CorePackages.Packages.Cryo)

return require(CorePackages.Packages.Rodux).createReducer({ inputType = nil, screenSize = Vector2.new(0, 0) }, {
	[require(script.Parent.Parent.Actions.SetScreenSize).name] = function(p1, p2) --[[ Line: 13 ]]
		-- upvalues: CryoModule (copy)
		return CryoModule.Dictionary.join(p1, { screenSize = p2.screenSize })
	end
})