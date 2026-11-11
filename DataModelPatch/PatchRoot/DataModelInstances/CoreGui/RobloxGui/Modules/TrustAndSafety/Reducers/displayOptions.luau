local CorePackages = game:GetService("CorePackages")
local CryoModule = require(CorePackages.Packages.Cryo)
local Parent = script.Parent.Parent

return require(CorePackages.Packages.Rodux).createReducer({
	inputType = nil,
	visible = true,
	screenSize = Vector2.new(0, 0)
}, {
	[require(Parent.Actions.SetScreenSize).name] = function(p1, p2)
		-- upvalues: CryoModule (copy)
		return CryoModule.Dictionary.join(p1, { screenSize = p2.screenSize })
	end,
	[require(Parent.Actions.Hide).name] = function(p1)
		-- upvalues: CryoModule (copy)
		return CryoModule.Dictionary.join(p1, { visible = false })
	end,
	[require(Parent.Actions.Show).name] = function(p1)
		-- upvalues: CryoModule (copy)
		return CryoModule.Dictionary.join(p1, { visible = true })
	end
})