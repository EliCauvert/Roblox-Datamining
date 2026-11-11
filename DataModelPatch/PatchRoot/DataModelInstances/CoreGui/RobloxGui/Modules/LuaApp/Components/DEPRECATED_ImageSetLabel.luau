local CorePackages = game:GetService("CorePackages")
local GuiService = game:GetService("GuiService")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local RoactModule = require(Modules.Common.Roact)
local ImmutableModule = require(Modules.Common.Immutable)
local GetImageSetDataFunction = require(CorePackages.Workspace.Packages.RobloxAppAssets).GetImageSetData
local GetImageSetPathPatternFunction = require(CorePackages.Workspace.Packages.RobloxAppAssets).GetImageSetPathPattern
local CryoModule = require(CorePackages.Packages.Cryo)
local BuilderIconMigrationModule = require(Modules.LuaApp.Components.BuilderIconMigration)
local ImageSetLabel = RoactModule.PureComponent:extend("ImageSetLabel")
local LuaApps = require(CorePackages.Packages.BuilderIcons).Migration.luaApps

function ImageSetLabel.render(p1)
	-- upvalues: GetImageSetDataFunction (copy), GuiService (copy), ImmutableModule (copy), RoactModule (copy), GetImageSetPathPatternFunction (copy)
	local ImageSetData, ImageSetData2 = GetImageSetDataFunction(GuiService:GetResolutionScale())
	local ImageSet = ImageSetData[p1.props.Image]
	
	if not ImageSet then
		local ForwardRef = ImmutableModule.RemoveFromDictionary(p1.props, "forwardRef")
		ForwardRef[RoactModule.Ref] = p1.props.forwardRef
		
		return RoactModule.createElement("ImageLabel", ForwardRef)
	end
	local Image = ImmutableModule.RemoveFromDictionary(p1.props, "Image", "ImageRectOffset", "ImageRectSize", "SliceCenter", "forwardRef")
	Image[RoactModule.Ref] = p1.props.forwardRef
	
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
	return RoactModule.createElement("ImageLabel", Image)
end

return RoactModule.forwardRef(function(FullProps, ForwardRef)
	-- upvalues: LuaApps (copy), RoactModule (copy), BuilderIconMigrationModule (copy), ImageSetLabel (copy), CryoModule (copy)
	return if LuaApps[FullProps.Image] then RoactModule.createElement(BuilderIconMigrationModule, {
		elementType = "TextLabel",
		fullProps = FullProps,
		migrationLookup = LuaApps[FullProps.Image]
	}) else RoactModule.createElement(ImageSetLabel, CryoModule.Dictionary.join(FullProps, { forwardRef = ForwardRef }))
end)