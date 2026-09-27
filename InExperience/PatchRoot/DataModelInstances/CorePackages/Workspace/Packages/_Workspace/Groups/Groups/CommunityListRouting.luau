local parent = script:FindFirstAncestor("Groups").Parent
local displayModule = require(parent.Display)
local responsiveModule = require(parent.Responsive)
local _ = require(parent.Signals)
local sharedFlagsModule = require(parent.SharedFlags)
local fFlagEnableLuaCommunityList = sharedFlagsModule.FFlagEnableLuaCommunityList
local fFlagEnableGroupDetailPane = sharedFlagsModule.FFlagEnableGroupDetailPane

local function getIsCompactTouch(p1)
	-- upvalues: displayModule (ref), responsiveModule (ref)
	return responsiveModule.getIsCompactTouch(displayModule.GetDisplayStore(false).getViewportSize(p1), responsiveModule.GetInputModeStore(false).getPreferredInputType(p1))
end

return {
	getIsCompactTouch = getIsCompactTouch,
	getShouldOpenGroupDetailPane = function()
		-- upvalues: fFlagEnableGroupDetailPane (ref), getIsCompactTouch (ref)
		return if fFlagEnableGroupDetailPane then getIsCompactTouch(false) else false
	end,
	getShouldUseLuaCommunityList = function()
		-- upvalues: fFlagEnableLuaCommunityList (ref), fFlagEnableGroupDetailPane (ref), getIsCompactTouch (ref)
		return if fFlagEnableLuaCommunityList then if fFlagEnableGroupDetailPane then true else getIsCompactTouch(false) else false
	end
}