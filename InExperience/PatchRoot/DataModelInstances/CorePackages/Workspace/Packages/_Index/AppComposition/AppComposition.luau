local sharedFlagsModule = require(script.Parent.SharedFlags)
local fFlagLuaAppCompositionSupport = sharedFlagsModule.FFlagLuaAppCompositionSupport
local fFlagEnableSplitPane = sharedFlagsModule.FFlagEnableSplitPane
local _ = require(script.AppCompositionTypes)

return {
	CompositionTags = require(script.CompositionTags),
	useCompositionLayout = require(script.useCompositionLayout),
	resolveBreakpoint = if fFlagEnableSplitPane then require(script.resolveBreakpoint) else nil,
	getRegionOverrides = if fFlagEnableSplitPane then (if fFlagEnableSplitPane then require(script.CompositionConfig) else nil).getRegionOverrides else nil,
	RegionName = if fFlagEnableSplitPane then require(script.AppCompositionEnums).RegionName else nil,
	CompositionStyleSheet = if fFlagLuaAppCompositionSupport then require(script.CompositionStyleSheet) else nil,
	setupCompositionStyleRules = if fFlagLuaAppCompositionSupport then require(script.setupCompositionStyleRules) else nil,
	["jest.config"] = script["jest.config"]
}