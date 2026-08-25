local parent = script:FindFirstAncestor("Groups").Parent
local displayModule = require(parent.Display)
local responsiveModule = require(parent.Responsive)
local fFlagEnableLuaCommunityList = require(parent.SharedFlags).FFlagEnableLuaCommunityList

return {
	getShouldUseLuaCommunityList = function()
		-- upvalues: fFlagEnableLuaCommunityList (ref), displayModule (ref), responsiveModule (ref)
		return if fFlagEnableLuaCommunityList then responsiveModule.getIsCompactTouch(displayModule.GetDisplayStore(false).getViewportSize(false), responsiveModule.GetInputModeStore(false).getPreferredInputType(false)) else false
	end
}