local telemetry = script:FindFirstAncestor("AppChat").Telemetry

return require(telemetry.createReactTelemetryLayer)(require(telemetry.Layers.AppTelemetryLayer).Context, {})