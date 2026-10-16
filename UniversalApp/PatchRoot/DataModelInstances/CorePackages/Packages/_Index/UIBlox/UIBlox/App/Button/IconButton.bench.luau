local Parent = script.Parent
local Parent1 = Parent.Parent.Parent
local Parent2 = Parent1.Parent
local BenchmarksModule = require(Parent1.Utility.benchmarks)
local MountComponentTimesFunction = BenchmarksModule.mountComponentTimes
local ScrollComponentTimesFunction = BenchmarksModule.scrollComponentTimes
local Element = require(Parent2.React).createElement(require(Parent.IconButton), {
	icon = "rbxassetid://7173696656978",
	onActivated = function() --[[ Line: 17 ]] end
})
require(Parent2.Dev.JestGlobals).describe("IconButton", function() --[[ Line: 21 ]]
	-- upvalues: MountComponentTimesFunction (copy), Element (copy), ScrollComponentTimesFunction (copy)
	MountComponentTimesFunction(Element, 1000, "IconButton")
	ScrollComponentTimesFunction(Element, 1000, "IconButton")
end)