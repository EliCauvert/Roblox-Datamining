local Foundation = script:FindFirstAncestor("Foundation")
local ReactModule = require(Foundation.Parent.React)
local ImageModule = require(Foundation.Components.Image)
local MediaAspectRatioModule = require(Foundation.Enums.MediaAspectRatio)
local MediaOrientationModule = require(Foundation.Enums.MediaOrientation)
local _ = require(Foundation.Components.Types)
local WithCommonPropsModule = require(Foundation.Utility.withCommonProps)
local WithDefaultsModule = require(Foundation.Utility.withDefaults)
local config = {
	[MediaAspectRatioModule.Ratio1x1] = 1,
	[MediaAspectRatioModule.Ratio5x4] = 1.25,
	[MediaAspectRatioModule.Ratio4x3] = 1.3333333333333333,
	[MediaAspectRatioModule.Ratio3x2] = 1.5,
	[MediaAspectRatioModule.Ratio16x9] = 1.7777777777777777,
	[MediaAspectRatioModule.Ratio2x1] = 2
}
local config1 = {
	testId = "--foundation-media",
	aspectRatio = MediaAspectRatioModule.Ratio1x1,
	orientation = MediaOrientationModule.Landscape
}

return ReactModule.memo(function(p1) --[[ Line: 51 | Named "Media" ]]
	-- upvalues: WithDefaultsModule (copy), config1 (copy), ReactModule (copy), config (copy), MediaOrientationModule (copy), ImageModule (copy), WithCommonPropsModule (copy)
	local WithDefaultsModuleResult = WithDefaultsModule(p1, config1)
	local Content = WithDefaultsModuleResult.content
	
	return ReactModule.createElement(ImageModule, WithCommonPropsModule(WithDefaultsModuleResult, {
		Image = if Content and Content.type == "Image" then Content.source else nil,
		ScaleType = Enum.ScaleType.Crop,
		Size = UDim2.fromScale(1, 0),
		aspectRatio = ReactModule.useMemo(function() --[[ Line: 54 ]]
			-- upvalues: config (upval), WithDefaultsModuleResult (copy), MediaOrientationModule (upval)
			local Entry: number = config[WithDefaultsModuleResult.aspectRatio]
			
			return {
				AspectRatio = if WithDefaultsModuleResult.orientation == MediaOrientationModule.Portrait then 1 / Entry else Entry,
				AspectType = Enum.AspectType.ScaleWithParentSize,
				DominantAxis = Enum.DominantAxis.Width
			}
		end, {
			WithDefaultsModuleResult.aspectRatio,
			WithDefaultsModuleResult.orientation
		})
	}))
end)