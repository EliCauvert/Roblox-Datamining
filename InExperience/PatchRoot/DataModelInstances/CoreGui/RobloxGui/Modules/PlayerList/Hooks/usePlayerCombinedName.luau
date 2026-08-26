local corePackagesService = game:GetService("CorePackages")
local userProfileStore = require(corePackagesService.Workspace.Packages.UserProfiles).Stores.UserProfileStore
local signalsReactModule = require(corePackagesService.Packages.SignalsReact)

return function(p1, p2)
	-- upvalues: userProfileStore (ref), signalsReactModule (ref)
	return signalsReactModule.useSignalBinding(userProfileStore.get().fetchNamesByUserIds({ p1 })(false).data[1].names.getInExperienceCombinedName):map(function(p3)
		-- upvalues: p2 (ref)
		return if string.len(p3) == 0 then p2 else p3
	end)
end