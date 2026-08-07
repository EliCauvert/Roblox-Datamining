local corePackagesService = game:GetService("CorePackages")
local userProfileStore = require(corePackagesService.Workspace.Packages.UserProfiles).Stores.UserProfileStore
local signalsReactModule = require(corePackagesService.Packages.SignalsReact)

return function(p0, p1) --[[ line: 6 | named "usePlayerCombinedName" ]]
	-- upvalues: userProfileStore (ref), signalsReactModule (ref)
	return signalsReactModule.useSignalBinding(userProfileStore.get().fetchNamesByUserIds({ p0 })(false).data[1].names.getInExperienceCombinedName):map(function(p2) --[[ line: 9 ]]
		-- upvalues: p1 (ref)
		return if string.len(p2) == 0 then p1 else p2
	end)
end