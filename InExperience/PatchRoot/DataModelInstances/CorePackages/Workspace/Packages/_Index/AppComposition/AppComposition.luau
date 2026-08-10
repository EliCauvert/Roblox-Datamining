local fFlagEnableSplitPane = require(script.Parent.SharedFlags).FFlagEnableSplitPane
local _ = require(script.AppCompositionTypes)

return {
	CompositionTags = require(script.CompositionTags),
	useCompositionLayout = require(script.useCompositionLayout),
	resolveBreakpoint = if fFlagEnableSplitPane then require(script.resolveBreakpoint) else nil,
	getRegionOverrides = if fFlagEnableSplitPane then (if fFlagEnableSplitPane then require(script.CompositionConfig) else nil).getRegionOverrides else nil,
	RegionName = if fFlagEnableSplitPane then require(script.AppCompositionEnums).RegionName else nil,
	CompositionStyleSheet = require(script.CompositionStyleSheet),
	setupCompositionStyleRules = require(script.setupCompositionStyleRules),
	["jest.config"] = script["jest.config"]
}