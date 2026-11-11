local Telemetry = script:FindFirstAncestor("AppChat").Telemetry

return require(Telemetry.createReactTelemetryLayer)(require(Telemetry.Layers.AppTelemetryLayer).Context, {})