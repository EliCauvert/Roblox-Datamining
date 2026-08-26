local parent = script:FindFirstAncestor("ProfilePlatform").Parent
local reactModule = require(parent.React)
local horizontalPageMargin = require(parent.UIBlox).App.Container.HorizontalPageMargin

return function(p1)
	-- upvalues: reactModule (ref), horizontalPageMargin (ref)
	return reactModule.createElement(horizontalPageMargin, {
		backgroundTransparency = 1,
		useAutomaticSizing = true,
		layoutOrder = p1.layoutOrder,
		size = p1.size
	}, p1.children)
end