local DataHydration = script:FindFirstAncestor("DataHydration")
local Parent = DataHydration.Parent
local _ = require(DataHydration.DataHydrationTypes)
local TModule = require(Parent.t)

return {
	gameInfoResponseValidator = TModule.interface({
		data = TModule.array(TModule.interface({
			id = TModule.number,
			rootPlaceId = TModule.number,
			name = TModule.optional(TModule.string),
			description = TModule.optional(TModule.string),
			creator = TModule.optional(TModule.interface({
				id = TModule.optional(TModule.number),
				name = TModule.optional(TModule.string),
				hasVerifiedBadge = TModule.optional(TModule.boolean)
			})),
			visits = TModule.optional(TModule.number),
			playerCount = if require(Parent.SharedFlags).FFlagLuaAppDataHydrationPlayerCountGameInfoStore then TModule.optional(TModule.number) else nil,
			totalUpVotes = TModule.optional(TModule.string),
			totalDownVotes = TModule.optional(TModule.string)
		}))
	})
}