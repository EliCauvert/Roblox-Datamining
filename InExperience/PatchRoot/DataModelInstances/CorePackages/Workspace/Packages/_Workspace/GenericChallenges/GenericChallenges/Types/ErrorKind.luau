local GenericChallenges = script:FindFirstAncestor("GenericChallenges")
local Parent = GenericChallenges.Parent
local AddRawValueMethodToEnumModule: (any, any) -> () = require(GenericChallenges.Utils.addRawValueMethodToEnum)
local EnumerateModule = require(Parent.enumerate)
local config = {
	Unknown = "Unknown",
	Invalidated = "Invalidated",
	Abandoned = "Abandoned",
	LoadFailed = "LoadFailed"
}
local EnumerateModuleResult = EnumerateModule(script.Name, config)
AddRawValueMethodToEnumModule(EnumerateModuleResult, config)

return EnumerateModuleResult