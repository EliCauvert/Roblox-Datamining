local DataHydration = script:FindFirstAncestor("DataHydration")
local Parent = DataHydration.Parent
local _ = require(DataHydration.DataHydrationTypes)
local TModule = require(Parent.t)
local FFlagSduiExperienceDetailsSupport = require(Parent.SharedFlags).FFlagSduiExperienceDetailsSupport

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
			playerCount = if require(Parent.SharedFlags).FFlagLuaAppDataHydrationPlayerCountGameInfoStore then TModule.optional(TModule.number) else nil,
			totalUpVotes = if FFlagSduiExperienceDetailsSupport then TModule.optional(TModule.string) else nil,
			totalDownVotes = if FFlagSduiExperienceDetailsSupport then TModule.optional(TModule.string) else nil
		}))
	})
}