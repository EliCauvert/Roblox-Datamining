local _ = require(script.createPresenceStore)

return {
	PresenceStore = require(script.PresenceStore),
	PresenceEnums = require(script.Enums),
	normalizePresenceRawData = require(script.normalizePresenceRawData)
}