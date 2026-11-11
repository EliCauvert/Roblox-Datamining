local CorePackages = game:GetService("CorePackages")
local CryoModule = require(CorePackages.Packages.Cryo)

return require(CorePackages.Packages.Rodux).createReducer({
	isOpen = false,
	friend = { userId = nil, combinedName = "", userName = "" }
}, {
	[require(script.Parent.Parent.Actions.OpenOrUpdateCFM).name] = function(p1, p2)
		-- upvalues: CryoModule (copy)
		return if p2.friend and p2.friend.combinedName then CryoModule.Dictionary.join(p1, { isOpen = true, friend = p2.friend }) else {
			isOpen = false,
			friend = { userId = nil, combinedName = "", userName = "" }
		}
	end,
	[require(script.Parent.Parent.Actions.CloseCFM).name] = function(_, _)
		return {
			isOpen = false,
			friend = { userId = nil, combinedName = "", userName = "" }
		}
	end
})