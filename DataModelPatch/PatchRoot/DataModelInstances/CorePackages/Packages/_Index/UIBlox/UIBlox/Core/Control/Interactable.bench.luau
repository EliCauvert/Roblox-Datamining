local Parent = script.Parent
local Parent1 = Parent.Parent.Parent
local Parent2 = Parent1.Parent
local BenchmarksModule = require(Parent1.Utility.benchmarks)
local MountComponentTimesFunction = BenchmarksModule.mountComponentTimes
local ScrollComponentTimesFunction = BenchmarksModule.scrollComponentTimes
local Element = require(Parent2.Roact).createElement(require(Parent.Interactable), { onStateChanged = function() end })
require(Parent2.Dev.JestGlobals).describe("Interactable", function()
	-- upvalues: MountComponentTimesFunction (copy), Element (copy), ScrollComponentTimesFunction (copy)
	MountComponentTimesFunction(Element, 100, "Interactable")
	ScrollComponentTimesFunction(Element, 100, "Interactable")
end)