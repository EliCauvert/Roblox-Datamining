local reactModule = require(script:FindFirstAncestor("AvatarExperienceUIKit").Parent.React)
local backgroundGradientModule = require(script.Parent.BackgroundGradient)
local backgroundImageModule = require(script.Parent.BackgroundImage)

return function(value)
	-- upvalues: reactModule (ref), backgroundGradientModule (ref), backgroundImageModule (ref)
	local t = {}
	
	for i, v in value.backgroundLayers do
		local var1 = (value.ZIndex or 0) - (#value.backgroundLayers - i)
		
		if v.type == "GradientBackground" then
			t[`GradientBackground_{i}`] = reactModule.createElement(backgroundGradientModule, {
				colorSequence = v.colorSequence,
				cornerRadius = value.cornerRadius,
				offset = v.offset,
				rotation = v.rotation,
				transparency = v.transparency,
				ZIndex = var1,
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
				ZIndex = var1,
				tag = v.tag,
				scaleType = value.imageScaleType
			})
		end
	end
	return reactModule.createElement(reactModule.Fragment, nil, t)
end