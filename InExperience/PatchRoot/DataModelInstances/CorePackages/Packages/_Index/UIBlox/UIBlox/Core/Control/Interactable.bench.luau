local parent = script.Parent
local parent_1 = parent.Parent.Parent
local parent_2 = parent_1.Parent
local roactModule = require(parent_2.Roact)
local interactableModule = require(parent.Interactable)
local describe = require(parent_2.Dev.JestGlobals).describe
local benchmarksModule = require(parent_1.Utility.benchmarks)
local mountComponentTimes = benchmarksModule.mountComponentTimes
local scrollComponentTimes = benchmarksModule.scrollComponentTimes
local var3 = roactModule.createElement(interactableModule, { onStateChanged = function() --[[ line: 17 ]] end })
describe("Interactable", function() --[[ line: 20 ]]
	-- upvalues: mountComponentTimes (ref), var3 (ref), scrollComponentTimes (ref)
	mountComponentTimes(var3, 100, "Interactable")
	scrollComponentTimes(var3, 100, "Interactable")
end)