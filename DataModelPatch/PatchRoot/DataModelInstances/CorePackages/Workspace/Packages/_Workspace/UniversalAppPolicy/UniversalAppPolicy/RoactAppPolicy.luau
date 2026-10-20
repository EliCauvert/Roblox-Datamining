local Parent = script.Parent.Parent
local UniversalAppPolicyModule = require(script.Parent.UniversalAppPolicy)
require(Parent.PolicyProvider).Logger:setParent(require(Parent.Loggers).Logger)

return UniversalAppPolicyModule