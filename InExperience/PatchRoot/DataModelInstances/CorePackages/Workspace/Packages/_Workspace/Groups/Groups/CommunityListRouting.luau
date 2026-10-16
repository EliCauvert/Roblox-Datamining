local Parent = script:FindFirstAncestor("Groups").Parent
local DisplayModule = require(Parent.Display)
local ResponsiveModule = require(Parent.Responsive)
local _ = require(Parent.Signals)
local SharedFlagsModule = require(Parent.SharedFlags)
local FFlagEnableLuaCommunityList = SharedFlagsModule.FFlagEnableLuaCommunityList
local FFlagEnableGroupDetailPane = SharedFlagsModule.FFlagEnableGroupDetailPane

local function getIsCompactTouch(p1) --[[ Line: 11 ]]
	-- upvalues: DisplayModule (copy), ResponsiveModule (copy)
	return ResponsiveModule.getIsCompactTouch(DisplayModule.GetDisplayStore(false).getViewportSize(p1), (ResponsiveModule.GetInputModeStore(false).getPreferredInputType(p1)))
end

return {
	getIsCompactTouch = getIsCompactTouch,
	getShouldOpenGroupDetailPane = function() --[[ Line: 28 ]]
		-- upvalues: FFlagEnableGroupDetailPane (copy), getIsCompactTouch (copy)
		return if FFlagEnableGroupDetailPane then getIsCompactTouch(false) else false
	end,
	getShouldUseLuaCommunityList = function() --[[ Line: 17 ]]
		-- upvalues: FFlagEnableLuaCommunityList (copy), FFlagEnableGroupDetailPane (copy), getIsCompactTouch (copy)
		return if FFlagEnableLuaCommunityList then if FFlagEnableGroupDetailPane then true else getIsCompactTouch(false) else false
	end
}