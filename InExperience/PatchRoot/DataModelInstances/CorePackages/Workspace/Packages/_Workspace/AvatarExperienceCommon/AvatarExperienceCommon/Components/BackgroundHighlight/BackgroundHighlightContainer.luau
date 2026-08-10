local reactModule = require(script:FindFirstAncestor("AvatarExperienceCommon").Parent.React)
local backgroundHighlightModule = require(script.Parent.BackgroundHighlight)
local useBackgroundHighlightPropsModule = require(script.Parent.useBackgroundHighlightProps)

return function(value) --[[ line: 11 | named "BackgroundHighlightContainer" ]]
	-- upvalues: useBackgroundHighlightPropsModule (ref), reactModule (ref), backgroundHighlightModule (ref)
	return reactModule.createElement(backgroundHighlightModule, useBackgroundHighlightPropsModule(value))
end