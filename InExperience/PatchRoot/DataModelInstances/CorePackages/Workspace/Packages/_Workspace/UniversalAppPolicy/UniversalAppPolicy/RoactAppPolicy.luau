local parent = script.Parent.Parent
local universalAppPolicyModule = require(script.Parent.UniversalAppPolicy)
require(parent.PolicyProvider).Logger:setParent(require(parent.Loggers).Logger)

return universalAppPolicyModule