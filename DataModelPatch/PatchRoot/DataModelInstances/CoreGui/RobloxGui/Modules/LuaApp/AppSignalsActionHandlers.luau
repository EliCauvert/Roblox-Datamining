local CorePackages = game:GetService("CorePackages")
local SharedFlagsModule = require(CorePackages.Workspace.Packages.SharedFlags)
local CreateResult = require(CorePackages.Workspace.Packages.SignalsMiddleware).ActionHandlers.create()

if SharedFlagsModule.FFlagEnableSignalsForLocalUserId then
	require(CorePackages.Workspace.Packages.UserLib).Handlers.registerLocalUserIdSignalsActionHandlers(CreateResult)
end
if SharedFlagsModule.FFlagUseSignalsForAuthenticationStatus then
	require(CorePackages.Workspace.Packages.AuthenticationStatus).Handlers.registerAuthenticationStatusSignalsActionHandlers(CreateResult)
end
if SharedFlagsModule.FFlagSduiExperienceDetailsSupport then
	require(CorePackages.Workspace.Packages.DiscoverySignalsActionHandlers).registerDiscoverySignalsActionHandlers(CreateResult)
end
return CreateResult