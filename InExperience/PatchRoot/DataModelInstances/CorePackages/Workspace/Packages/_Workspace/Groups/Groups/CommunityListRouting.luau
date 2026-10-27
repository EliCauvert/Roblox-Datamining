local Parent = script:FindFirstAncestor("Groups").Parent
local DisplayModule = require(Parent.Display)
local ResponsiveModule = require(Parent.Responsive)
local _ = require(Parent.Signals)
local SharedFlagsModule = require(Parent.SharedFlags)
local FFlagEnableLuaCommunityList = SharedFlagsModule.FFlagEnableLuaCommunityList
local FFlagEnableGroupOverviewPane = SharedFlagsModule.FFlagEnableGroupOverviewPane

local function getIsCompactTouch(p1)
	-- upvalues: DisplayModule (copy), ResponsiveModule (copy)
	return ResponsiveModule.getIsCompactTouch(DisplayModule.GetDisplayStore(false).getViewportSize(p1), (ResponsiveModule.GetInputModeStore(false).getPreferredInputType(p1)))
end

local function _(): boolean
	-- upvalues: ResponsiveModule (copy)
	return ResponsiveModule.GetInputModeStore(false).getPreferredInputType(false) == ResponsiveModule.Input.Directional
end

return {
	getIsCompactTouch = getIsCompactTouch,
	getShouldOpenGroupOverviewPane = function()
		-- upvalues: FFlagEnableGroupOverviewPane (copy), ResponsiveModule (copy), getIsCompactTouch (copy)
		return if FFlagEnableGroupOverviewPane then ResponsiveModule.GetInputModeStore(false).getPreferredInputType(false) ~= ResponsiveModule.Input.Directional and getIsCompactTouch(false) else false
	end,
	getShouldUseLuaCommunityList = function()
		-- upvalues: FFlagEnableLuaCommunityList (copy), ResponsiveModule (copy), FFlagEnableGroupOverviewPane (copy), getIsCompactTouch (copy)
		return if FFlagEnableLuaCommunityList then ResponsiveModule.GetInputModeStore(false).getPreferredInputType(false) ~= ResponsiveModule.Input.Directional and (if FFlagEnableGroupOverviewPane then true else getIsCompactTouch(false)) else false
	end
}