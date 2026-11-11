local SduiCoreSystem = script:FindFirstAncestor("SduiCoreSystem")
local Parent = SduiCoreSystem.Parent
local _ = require(Parent.React)
local _ = require(Parent.UnifiedLogging)
local _ = require(Parent.Foundation)
local _ = require(Parent.CollectionViews)
local _ = require(Parent.Signals)
local _ = require(SduiCoreSystem.SduiActionType)
local _ = require(SduiCoreSystem.SduiComponentType)
local _ = require(SduiCoreSystem.SduiErrors)
local _ = require(SduiCoreSystem.SduiConfigTypes)
local _ = require(SduiCoreSystem.SduiDataStoreTypes)
local _ = require(Parent.DataHydration)

return {
	SduiBuilderProcessingPhase = { Eager = "Eager", Render = "Render", Lazy = "Lazy" }
}