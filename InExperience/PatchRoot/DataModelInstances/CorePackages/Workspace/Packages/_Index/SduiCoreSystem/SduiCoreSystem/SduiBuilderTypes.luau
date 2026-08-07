local sduiCoreSystem = script:FindFirstAncestor("SduiCoreSystem")
local parent = sduiCoreSystem.Parent
local _ = require(parent.React)
local _ = require(parent.UnifiedLogging)
local _ = require(parent.Foundation)
local _ = require(parent.CollectionViews)
local _ = require(parent.Signals)
local _ = require(sduiCoreSystem.SduiActionType)
local _ = require(sduiCoreSystem.SduiComponentType)
local _ = require(sduiCoreSystem.SduiErrors)
local _ = require(sduiCoreSystem.SduiConfigTypes)
local _ = require(sduiCoreSystem.SduiDataStoreTypes)
local _ = require(parent.DataHydration)

return {
	SduiBuilderProcessingPhase = { Eager = "Eager", Render = "Render", Lazy = "Lazy" }
}