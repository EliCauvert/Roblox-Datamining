local parent = script.Parent
local parent_1 = parent.Parent.Parent
local parent_2 = parent_1.Parent
local reactModule = require(parent_2.React)
local buttonModule = require(parent.Button)
local describe = require(parent_2.Dev.JestGlobals).describe
local benchmarksModule = require(parent_1.Utility.benchmarks)
local mountComponentTimes = benchmarksModule.mountComponentTimes
local scrollComponentTimes = benchmarksModule.scrollComponentTimes
local var3 = reactModule.createElement(buttonModule, {
	text = "Button",
	onActivated = function() end
})
describe("Button", function()
	-- upvalues: mountComponentTimes (ref), var3 (ref), scrollComponentTimes (ref)
	mountComponentTimes(var3, 100, "Button")
	scrollComponentTimes(var3, 100, "Button")
end)