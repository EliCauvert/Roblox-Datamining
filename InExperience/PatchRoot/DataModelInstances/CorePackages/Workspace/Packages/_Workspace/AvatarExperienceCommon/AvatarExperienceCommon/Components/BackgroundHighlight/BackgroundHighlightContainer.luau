local ReactModule = require(script:FindFirstAncestor("AvatarExperienceCommon").Parent.React)
local BackgroundHighlightModule = require(script.Parent.BackgroundHighlight)
local UseBackgroundHighlightPropsModule = require(script.Parent.useBackgroundHighlightProps)

return function(p1)
	-- upvalues: UseBackgroundHighlightPropsModule (copy), ReactModule (copy), BackgroundHighlightModule (copy)
	return ReactModule.createElement(BackgroundHighlightModule, (UseBackgroundHighlightPropsModule(p1)))
end