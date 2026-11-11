local Parent = script.Parent
local Parent1 = Parent.Parent.Parent
local Parent2 = Parent1.Parent
local ReactModule = require(Parent2.React)
local DescribeFunction: (any, any) -> () = require(Parent2.Dev.JestGlobals).describe
local BenchmarksModule = require(Parent1.Utility.benchmarks)
local MountComponentTimesFunction = BenchmarksModule.mountComponentTimes
local ScrollComponentTimesFunction = BenchmarksModule.scrollComponentTimes
local Element = ReactModule.createElement(require(Parent.ContextualSlider), {
	min = 0,
	max = 100,
	value = 0,
	onValueChanged = function() end
})
local Element1 = ReactModule.createElement(require(Parent.SystemSlider), {
	min = 0,
	max = 100,
	value = 0,
	onValueChanged = function() end
})
DescribeFunction("ContextualSlider", function()
	-- upvalues: MountComponentTimesFunction (copy), Element (copy), ScrollComponentTimesFunction (copy)
	MountComponentTimesFunction(Element, 100, "ContextualSlider")
	ScrollComponentTimesFunction(Element, 100, "ContextualSlider")
end)
DescribeFunction("SystemSlider", function()
	-- upvalues: MountComponentTimesFunction (copy), Element1 (copy), ScrollComponentTimesFunction (copy)
	MountComponentTimesFunction(Element1, 100, "SystemSlider")
	ScrollComponentTimesFunction(Element1, 100, "SystemSlider")
end)