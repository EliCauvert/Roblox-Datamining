local CryoModule = require(game:GetService("CorePackages").Packages.Cryo)
local RetryWithOverridableWaitModule = require(script.Parent.RetryWithOverridableWait)

return function(p1)
	-- upvalues: CryoModule (copy), RetryWithOverridableWaitModule (copy)
	return RetryWithOverridableWaitModule((CryoModule.Dictionary.join(p1, { waitImpl = wait })))
end