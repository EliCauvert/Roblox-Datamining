local parent = script:FindFirstAncestor("ProfilePlatform").Parent
local reactModule = require(parent.React)
local horizontalPageMargin = require(parent.UIBlox).App.Container.HorizontalPageMargin

return function(p0) --[[ line: 14 | named "SocialCountsRow" ]]
	-- upvalues: reactModule (ref), horizontalPageMargin (ref)
	return reactModule.createElement(horizontalPageMargin, {
		backgroundTransparency = 1,
		useAutomaticSizing = true,
		layoutOrder = p0.layoutOrder,
		size = p0.size
	}, p0.children)
end