local ReactModule = require(script:FindFirstAncestor("AvatarExperienceUIKit").Parent.React)
local BackgroundGradientModule = require(script.Parent.BackgroundGradient)
local BackgroundImageModule = require(script.Parent.BackgroundImage)

return function(p1) --[[ Line: 36 | Named "BackgroundLayers" ]]
	-- upvalues: ReactModule (copy), BackgroundGradientModule (copy), BackgroundImageModule (copy)
	local Elements = {}
	
	for i, backgroundLayer in p1.backgroundLayers do
		local ZIndex = (p1.ZIndex or 0) - (#p1.backgroundLayers - i)
		
		if backgroundLayer.type == "GradientBackground" then
			Elements[`GradientBackground_{i}`] = ReactModule.createElement(BackgroundGradientModule, {
				colorSequence = backgroundLayer.colorSequence,
				cornerRadius = p1.cornerRadius,
				offset = backgroundLayer.offset,
				rotation = backgroundLayer.rotation,
				transparency = backgroundLayer.transparency,
				ZIndex = ZIndex,
				tag = backgroundLayer.tag
			})
		elseif backgroundLayer.type == "ImageBackground" then
			Elements[`ImageBackground_{i}`] = ReactModule.createElement(BackgroundImageModule, {
				anchorPoint = backgroundLayer.anchorPoint,
				color = backgroundLayer.color,
				cornerRadius = p1.cornerRadius,
				position = backgroundLayer.position,
				resourceIdentifier = backgroundLayer.resourceIdentifier,
				transparency = backgroundLayer.transparency,
				ZIndex = ZIndex,
				tag = backgroundLayer.tag,
				scaleType = p1.imageScaleType
			})
		end
	end
	return ReactModule.createElement(ReactModule.Fragment, nil, Elements)
end