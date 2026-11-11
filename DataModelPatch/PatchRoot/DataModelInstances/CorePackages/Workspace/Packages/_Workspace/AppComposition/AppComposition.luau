local FFlagEnableSplitPane = require(script.Parent.SharedFlags).FFlagEnableSplitPane
local CompositionConfigModule = if FFlagEnableSplitPane then require(script.CompositionConfig) else nil
local _ = require(script.AppCompositionTypes)
local AppCompositionEnumsModule = require(script.AppCompositionEnums)

return {
	CompositionTags = require(script.CompositionTags),
	useCompositionLayout = require(script.useCompositionLayout),
	resolveBreakpoint = if FFlagEnableSplitPane then require(script.resolveBreakpoint) else nil,
	getRegionOverrides = if FFlagEnableSplitPane then CompositionConfigModule.getRegionOverrides else nil,
	RegionName = if FFlagEnableSplitPane then AppCompositionEnumsModule.RegionName else nil,
	CompositionStyleSheet = require(script.CompositionStyleSheet),
	setupCompositionStyleRules = require(script.setupCompositionStyleRules),
	["jest.config"] = script["jest.config"]
}