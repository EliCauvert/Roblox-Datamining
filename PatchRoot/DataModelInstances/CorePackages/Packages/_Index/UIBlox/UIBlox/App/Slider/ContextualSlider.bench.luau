-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:32:58 2026 Pacific Standard Time.

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
local var4 = reactModule.createElement(contextualSliderModule, {
	min = 0,
	max = 100,
	value = 0,
	onValueChanged = function() --[[ line: 21 ]] end
})
local var5 = reactModule.createElement(systemSliderModule, {
	min = 0,
	max = 100,
	value = 0,
	onValueChanged = function() --[[ line: 27 ]] end
})
describe("ContextualSlider", function() --[[ line: 30 ]]
	-- upvalues: mountComponentTimes (ref), var4 (ref), scrollComponentTimes (ref)
	mountComponentTimes(var4, 100, "ContextualSlider")
	scrollComponentTimes(var4, 100, "ContextualSlider")
end)
describe("SystemSlider", function() --[[ line: 34 ]]
	-- upvalues: mountComponentTimes (ref), var5 (ref), scrollComponentTimes (ref)
	mountComponentTimes(var5, 100, "SystemSlider")
	scrollComponentTimes(var5, 100, "SystemSlider")
end)