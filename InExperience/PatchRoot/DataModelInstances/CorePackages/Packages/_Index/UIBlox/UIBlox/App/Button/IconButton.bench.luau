local parent = script.Parent
local parent_1 = parent.Parent.Parent
local parent_2 = parent_1.Parent
local reactModule = require(parent_2.React)
local iconButtonModule = require(parent.IconButton)
local describe = require(parent_2.Dev.JestGlobals).describe
local benchmarksModule = require(parent_1.Utility.benchmarks)
local mountComponentTimes = benchmarksModule.mountComponentTimes
local scrollComponentTimes = benchmarksModule.scrollComponentTimes
local var1 = reactModule.createElement(iconButtonModule, {
	icon = "rbxassetid://7173696656978",
	onActivated = function() end
})
describe("IconButton", function()
	-- upvalues: mountComponentTimes (ref), var1 (ref), scrollComponentTimes (ref)
	mountComponentTimes(var1, 1000, "IconButton")
	scrollComponentTimes(var1, 1000, "IconButton")
end)