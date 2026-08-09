local parent = script:FindFirstAncestor("AvatarExperienceUIKit").Parent
local reactModule = require(parent.React)
local avatarExperienceFlagsModule = require(parent.AvatarExperienceFlags)
local backgroundGradientModule = require(script.Parent.BackgroundGradient)
local backgroundImageModule = require(script.Parent.BackgroundImage)
local fFlagAXHeroWidget = avatarExperienceFlagsModule.FFlagAXHeroWidget

return function(value) --[[ line: 40 | named "BackgroundLayers" ]]
	-- upvalues: reactModule (ref), backgroundGradientModule (ref), backgroundImageModule (ref), fFlagAXHeroWidget (ref)
	local t = {}
	
	for i, v in value.backgroundLayers do
		local var5 = (value.ZIndex or 0) - (#value.backgroundLayers - i)
		
		if v.type == "GradientBackground" then
			t[`GradientBackground_{i}`] = reactModule.createElement(backgroundGradientModule, {
				colorSequence = v.colorSequence,
				cornerRadius = value.cornerRadius,
				offset = v.offset,
				rotation = v.rotation,
				transparency = v.transparency,
				ZIndex = var5,
				tag = v.tag
			})
		elseif v.type == "ImageBackground" then
			t[`ImageBackground_{i}`] = reactModule.createElement(backgroundImageModule, {
				anchorPoint = v.anchorPoint,
				color = v.color,
				cornerRadius = value.cornerRadius,
				position = v.position,
				resourceIdentifier = v.resourceIdentifier,
				transparency = v.transparency,
				ZIndex = var5,
				tag = v.tag,
				scaleType = if fFlagAXHeroWidget then value.imageScaleType else nil
			})
		end
	end
	return reactModule.createElement(reactModule.Fragment, nil, t)
end