local ServiceModule = require(script:FindFirstAncestor("Chrome").Service)
local IntegrationIds = require(game:GetService("CorePackages").Workspace.Packages.InExperienceSideSheet).Constants.IntegrationIds
local RegisterConnectIntegrationModule = require(script.Parent.registerConnectIntegration)

return if require(script.Parent.isConnectDropdownEnabled)() then RegisterConnectIntegrationModule(IntegrationIds.ConnectDropdown, ServiceModule.AvailabilitySignal.Available) else nil