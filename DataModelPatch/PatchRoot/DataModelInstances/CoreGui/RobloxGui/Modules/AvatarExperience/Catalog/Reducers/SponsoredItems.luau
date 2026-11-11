local CorePackages = game:GetService("CorePackages")
local CryoModule = require(CorePackages.Packages.Cryo)

return require(CorePackages.Packages.Rodux).createReducer({}, {
	[require(game:GetService("CoreGui").RobloxGui.Modules.AvatarExperience.Catalog.Actions.SetSponsoredItems).name] = function(p1, p2)
		-- upvalues: CryoModule (copy)
		return (CryoModule.Dictionary.join(p1, {
			[p2.category] = CryoModule.List.map(p2.items, function(p3)
				return {
					id = tostring(p3.id),
					type = tostring(p3.itemType),
					productId = p3.productId,
					encryptedAdTrackingData = p3.encryptedAdTrackingData
				}
			end)
		}))
	end
})