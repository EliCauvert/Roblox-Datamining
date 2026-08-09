local corePackagesService = game:GetService("CorePackages")
local cryoModule = require(corePackagesService.Packages.Cryo)

return require(corePackagesService.Packages.Rodux).createReducer({
	isOpen = false,
	friend = { userId = nil, combinedName = "", userName = "" }
}, {
	[require(script.Parent.Parent.Actions.OpenOrUpdateCFM).name] = function(p0, p1) --[[ line: 16 ]]
		-- upvalues: cryoModule (ref)
		return if p1.friend and p1.friend.combinedName then cryoModule.Dictionary.join(p0, { isOpen = true, friend = p1.friend }) else {
			isOpen = false,
			friend = { userId = nil, combinedName = "", userName = "" }
		}
	end,
	[require(script.Parent.Parent.Actions.CloseCFM).name] = function(_, _) --[[ line: 34 ]]
		return {
			isOpen = false,
			friend = { userId = nil, combinedName = "", userName = "" }
		}
	end
})