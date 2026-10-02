local foundation = script:FindFirstAncestor("Foundation")
local reactModule = require(foundation.Parent.React)
local imageModule = require(foundation.Components.Image)
local mediaAspectRatioModule = require(foundation.Enums.MediaAspectRatio)
local mediaOrientationModule = require(foundation.Enums.MediaOrientation)
local _ = require(foundation.Components.Types)
local withCommonPropsModule = require(foundation.Utility.withCommonProps)
local withDefaultsModule = require(foundation.Utility.withDefaults)
local t = {
	[mediaAspectRatioModule.Ratio1x1] = 1,
	[mediaAspectRatioModule.Ratio5x4] = 1.25,
	[mediaAspectRatioModule.Ratio4x3] = 1.333333333333,
	[mediaAspectRatioModule.Ratio3x2] = 1.5,
	[mediaAspectRatioModule.Ratio16x9] = 1.777777777778,
	[mediaAspectRatioModule.Ratio2x1] = 2
}
local t_1 = {
	testId = "--foundation-media",
	aspectRatio = mediaAspectRatioModule.Ratio1x1,
	orientation = mediaOrientationModule.Landscape
}

return reactModule.memo(function(p1)
	-- upvalues: withDefaultsModule (ref), t_1 (ref), reactModule (ref), t (ref), mediaOrientationModule (ref), imageModule (ref), withCommonPropsModule (ref)
	local var1 = withDefaultsModule(p1, t_1)
	local content = var1.content
	
	return reactModule.createElement(imageModule, withCommonPropsModule(var1, {
		Image = if content and content.type == "Image" then content.source else nil,
		ScaleType = Enum.ScaleType.Crop,
		Size = UDim2.fromScale(1, 0),
		aspectRatio = reactModule.useMemo(function()
			-- upvalues: t (copy), var1 (ref), mediaOrientationModule (copy)
			local aspectRatio = t[var1.aspectRatio]
			
			return {
				AspectRatio = if var1.orientation == mediaOrientationModule.Portrait then 1 / aspectRatio else aspectRatio,
				AspectType = Enum.AspectType.ScaleWithParentSize,
				DominantAxis = Enum.DominantAxis.Width
			}
		end, { var1.aspectRatio, var1.orientation })
	}))
end)