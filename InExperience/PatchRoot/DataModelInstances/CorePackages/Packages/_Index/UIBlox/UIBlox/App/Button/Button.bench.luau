local Parent = script.Parent
local Parent1 = Parent.Parent.Parent
local Parent2 = Parent1.Parent
local ButtonModule = require(Parent.Button)
local BenchmarksModule = require(Parent1.Utility.benchmarks)
local MountComponentTimesFunction = BenchmarksModule.mountComponentTimes
local ScrollComponentTimesFunction = BenchmarksModule.scrollComponentTimes
local Element = require(Parent2.React).createElement(ButtonModule, {
	text = "Button",
	onActivated = function() end
})
require(Parent2.Dev.JestGlobals).describe("Button", function()
	-- upvalues: MountComponentTimesFunction (copy), Element (copy), ScrollComponentTimesFunction (copy)
	MountComponentTimesFunction(Element, 100, "Button")
	ScrollComponentTimesFunction(Element, 100, "Button")
end)