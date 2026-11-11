local DependenciesModule = require(script.Parent.Parent.dependencies)
local GuiService = game:GetService("GuiService")
local Roact = DependenciesModule.Roact
local RobloxAppAssets = DependenciesModule.RobloxAppAssets
local Cryo = DependenciesModule.Cryo
local Immutable = DependenciesModule.AppCommonLib.Immutable
local GetImageSetDataFunction = RobloxAppAssets.GetImageSetData
local GetImageSetPathPatternFunction = RobloxAppAssets.GetImageSetPathPattern
local ImageSetLabel = Roact.PureComponent:extend("ImageSetLabel")

function ImageSetLabel.render(p1)
	-- upvalues: GetImageSetDataFunction (copy), GuiService (copy), Immutable (copy), Roact (copy), GetImageSetPathPatternFunction (copy)
	local ImageSetData, ImageSetData2 = GetImageSetDataFunction(GuiService:GetResolutionScale())
	local ImageSet = ImageSetData[p1.props.Image]
	
	if not ImageSet then
		local ForwardRef = Immutable.RemoveFromDictionary(p1.props, "forwardRef")
		ForwardRef[Roact.Ref] = p1.props.forwardRef
		
		return Roact.createElement("ImageLabel", ForwardRef)
	end
	local Image = Immutable.RemoveFromDictionary(p1.props, "Image", "ImageRectOffset", "ImageRectSize", "SliceCenter", "forwardRef")
	Image[Roact.Ref] = p1.props.forwardRef
	
	if p1.props.Image then
		Image.Image = GetImageSetPathPatternFunction(ImageSet.ImageSet)
	end
	if p1.props.ImageRectOffset then
		Image.ImageRectOffset = Vector2.new(ImageSet.ImageRectOffset.X + p1.props.ImageRectOffset.X * ImageSetData2, ImageSet.ImageRectOffset.Y + p1.props.ImageRectOffset.Y * ImageSetData2)
	else
		Image.ImageRectOffset = ImageSet.ImageRectOffset
	end
	if p1.props.ImageRectSize then
		Image.ImageRectSize = Vector2.new(p1.props.ImageRectSize.X * ImageSetData2, p1.props.ImageRectSize.Y * ImageSetData2)
	else
		Image.ImageRectSize = ImageSet.ImageRectSize
	end
	if p1.props.SliceCenter then
		Image.SliceCenter = Rect.new(p1.props.SliceCenter.Min.X * ImageSetData2, p1.props.SliceCenter.Min.Y * ImageSetData2, p1.props.SliceCenter.Max.X * ImageSetData2, p1.props.SliceCenter.Max.Y * ImageSetData2)
		
		if p1.props.SliceScale then
			Image.SliceScale = p1.props.SliceScale / ImageSetData2
		else
			Image.SliceScale = 1 / ImageSetData2
		end
	end
	return Roact.createElement("ImageLabel", Image)
end

return Roact.forwardRef(function(p1, ForwardRef)
	-- upvalues: Roact (copy), ImageSetLabel (copy), Cryo (copy)
	return Roact.createElement(ImageSetLabel, Cryo.Dictionary.join(p1, { forwardRef = ForwardRef }))
end)