local Parent = script:FindFirstAncestor("AvatarExperienceUIKit").Parent
local ReactModule = require(Parent.React)
local BackgroundGradientModule = require(script.Parent.BackgroundGradient)
local BackgroundImageModule = require(script.Parent.BackgroundImage)
local FFlagAXBackgroundImageOnLoaded = require(Parent.AvatarExperienceFlags).FFlagAXBackgroundImageOnLoaded

return function(p1)
	-- upvalues: ReactModule (copy), BackgroundGradientModule (copy), BackgroundImageModule (copy), FFlagAXBackgroundImageOnLoaded (copy)
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
				scaleType = p1.imageScaleType,
				onLoaded = if FFlagAXBackgroundImageOnLoaded then p1.onImageLoaded else nil
			})
		end
	end
	return ReactModule.createElement(ReactModule.Fragment, nil, Elements)
end