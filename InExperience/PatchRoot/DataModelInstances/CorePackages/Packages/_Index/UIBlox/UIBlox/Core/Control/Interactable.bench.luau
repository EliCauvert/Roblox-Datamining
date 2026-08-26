local parent = script.Parent
local parent_1 = parent.Parent.Parent
local parent_2 = parent_1.Parent
local roactModule = require(parent_2.Roact)
local interactableModule = require(parent.Interactable)
local describe = require(parent_2.Dev.JestGlobals).describe
local benchmarksModule = require(parent_1.Utility.benchmarks)
local mountComponentTimes = benchmarksModule.mountComponentTimes
local scrollComponentTimes = benchmarksModule.scrollComponentTimes
local var1 = roactModule.createElement(interactableModule, { onStateChanged = function() end })
describe("Interactable", function()
	-- upvalues: mountComponentTimes (ref), var1 (ref), scrollComponentTimes (ref)
	mountComponentTimes(var1, 100, "Interactable")
	scrollComponentTimes(var1, 100, "Interactable")
end)