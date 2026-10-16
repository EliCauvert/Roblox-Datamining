local Parent = script:FindFirstAncestor("ProfilePlatform").Parent
local ReactModule = require(Parent.React)
local HorizontalPageMargin = require(Parent.UIBlox).App.Container.HorizontalPageMargin

return function(p1) --[[ Line: 14 | Named "SocialCountsRow" ]]
	-- upvalues: ReactModule (copy), HorizontalPageMargin (copy)
	return ReactModule.createElement(HorizontalPageMargin, {
		backgroundTransparency = 1,
		useAutomaticSizing = true,
		layoutOrder = p1.layoutOrder,
		size = p1.size
	}, p1.children)
end