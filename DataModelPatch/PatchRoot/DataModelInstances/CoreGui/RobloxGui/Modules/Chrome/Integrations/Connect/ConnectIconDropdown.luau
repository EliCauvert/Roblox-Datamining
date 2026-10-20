local ServiceModule = require(script:FindFirstAncestor("Chrome").Service)
local RegisterConnectIntegrationModule = require(script.Parent.registerConnectIntegration)

return if require(script.Parent.isConnectDropdownEnabled)() then RegisterConnectIntegrationModule("connect_dropdown", ServiceModule.AvailabilitySignal.Available) else nil