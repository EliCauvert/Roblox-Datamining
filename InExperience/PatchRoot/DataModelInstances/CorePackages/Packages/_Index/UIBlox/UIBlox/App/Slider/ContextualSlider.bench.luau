local parent = script.Parent
local parent_1 = parent.Parent.Parent
local parent_2 = parent_1.Parent
local reactModule = require(parent_2.React)
local contextualSliderModule = require(parent.ContextualSlider)
local systemSliderModule = require(parent.SystemSlider)
local describe = require(parent_2.Dev.JestGlobals).describe
local benchmarksModule = require(parent_1.Utility.benchmarks)
local mountComponentTimes = benchmarksModule.mountComponentTimes
local scrollComponentTimes = benchmarksModule.scrollComponentTimes
local var1 = reactModule.createElement(contextualSliderModule, {
	min = 0,
	max = 100,
	value = 0,
	onValueChanged = function() end
})
local var2 = reactModule.createElement(systemSliderModule, {
	min = 0,
	max = 100,
	value = 0,
	onValueChanged = function() end
})
describe("ContextualSlider", function()
	-- upvalues: mountComponentTimes (ref), var1 (ref), scrollComponentTimes (ref)
	mountComponentTimes(var1, 100, "ContextualSlider")
	scrollComponentTimes(var1, 100, "ContextualSlider")
end)
describe("SystemSlider", function()
	-- upvalues: mountComponentTimes (ref), var2 (ref), scrollComponentTimes (ref)
	mountComponentTimes(var2, 100, "SystemSlider")
	scrollComponentTimes(var2, 100, "SystemSlider")
end)