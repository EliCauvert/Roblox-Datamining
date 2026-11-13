local Parent = script.Parent.Parent
local PolicyProviderModule = require(Parent.PolicyProvider)
local Logger = require(Parent.Loggers).Logger
local UniversalAppPolicyModule = require(script.Parent.UniversalAppPolicy)
PolicyProviderModule.Logger:setParent(Logger)

return UniversalAppPolicyModule