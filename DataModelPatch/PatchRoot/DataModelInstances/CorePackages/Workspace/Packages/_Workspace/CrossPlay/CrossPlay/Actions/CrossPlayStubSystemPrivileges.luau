local CrossPlay = script:FindFirstAncestor("CrossPlay")
local Parent = CrossPlay.Parent
local CryoModule = require(Parent.Cryo)
local CrossPlayCapabilities = require(Parent.UniversalAppPolicy).Enum.CrossPlayCapabilities
local CrossPlaySetPrivilegesModule = require(script.Parent.CrossPlaySetPrivileges)
local PrivilegeCheckResults = require(CrossPlay.Hooks.Constants).PrivilegeCheckResults

return function(p1)
	-- upvalues: CryoModule (copy), CrossPlayCapabilities (copy), PrivilegeCheckResults (copy), CrossPlaySetPrivilegesModule (copy)
	return CrossPlaySetPrivilegesModule((CryoModule.Dictionary.join(p1 or {}, {
		[CrossPlayCapabilities.CrossPlatform] = {
			CanJoinGame = true,
			Success = true,
			PrivilegeCheckResult = PrivilegeCheckResults.NO_ISSUE
		}
	})))
end