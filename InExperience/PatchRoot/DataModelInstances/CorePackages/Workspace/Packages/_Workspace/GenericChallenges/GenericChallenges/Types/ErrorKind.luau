local genericChallenges = script:FindFirstAncestor("GenericChallenges")
local addRawValueMethodToEnumModule = require(genericChallenges.Utils.addRawValueMethodToEnum)
local t = {
	Unknown = "Unknown",
	Invalidated = "Invalidated",
	Abandoned = "Abandoned",
	LoadFailed = "LoadFailed"
}
local var3 = require(genericChallenges.Parent.enumerate)(script.Name, t)
addRawValueMethodToEnumModule(var3, t)

return var3