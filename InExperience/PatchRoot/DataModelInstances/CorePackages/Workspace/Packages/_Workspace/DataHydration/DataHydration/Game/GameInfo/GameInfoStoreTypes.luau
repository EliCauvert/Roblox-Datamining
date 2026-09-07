local dataHydration = script:FindFirstAncestor("DataHydration")
local parent = dataHydration.Parent
local _ = require(dataHydration.DataHydrationTypes)
local tModule = require(parent.t)
local fFlagSduiExperienceDetailsSupport = require(parent.SharedFlags).FFlagSduiExperienceDetailsSupport

return {
	gameInfoResponseValidator = tModule.interface({
		data = tModule.array(tModule.interface({
			id = tModule.number,
			rootPlaceId = tModule.number,
			name = tModule.optional(tModule.string),
			description = tModule.optional(tModule.string),
			creator = tModule.optional(tModule.interface({
				id = tModule.optional(tModule.number),
				name = tModule.optional(tModule.string),
				hasVerifiedBadge = tModule.optional(tModule.boolean)
			})),
			playerCount = if require(parent.SharedFlags).FFlagLuaAppDataHydrationPlayerCountGameInfoStore then tModule.optional(tModule.number) else nil,
			totalUpVotes = if fFlagSduiExperienceDetailsSupport then tModule.optional(tModule.string) else nil,
			totalDownVotes = if fFlagSduiExperienceDetailsSupport then tModule.optional(tModule.string) else nil
		}))
	})
}