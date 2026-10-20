local CorePackages = game:GetService("CorePackages")
local ReactModule = require(CorePackages.Packages.React)
local ImmutableModule = require(game:GetService("CoreGui").RobloxGui.Modules.Common.Immutable)
local BuilderIconsModule = require(CorePackages.Packages.BuilderIcons)
local UseTextSizeOffsetFunction = require(CorePackages.Packages.UIBlox).Core.Style.useTextSizeOffset
local UseTokensFunction = require(CorePackages.Packages.Foundation).Hooks.useTokens

local function _(Vector): boolean
	return if Vector.X.Offset == 0 then Vector.Y.Offset ~= 0 and Vector.X.Scale ~= 0 else Vector.Y.Scale ~= 0 or Vector.Y.Offset ~= 0 and Vector.X.Scale ~= 0
end

return function(p1)
	-- upvalues: UseTextSizeOffsetFunction (copy), UseTokensFunction (copy), ImmutableModule (copy), BuilderIconsModule (copy), ReactModule (copy)
	local FullProps = p1.fullProps
	local MigrationLookup = p1.migrationLookup
	local ElementType = p1.elementType
	local UseTextSizeOffsetResult: number = UseTextSizeOffsetFunction()
	local UseTokensResult = UseTokensFunction()
	local Image = ImmutableModule.RemoveFromDictionary(FullProps, "Image", "ImageRectOffset", "ImageRectSize", "SliceCenter", "SliceScale", "ResampleMode", "ScaleType", "TileSize")
	local Size = Image.Size
	local IsNotScaleMatch: boolean = if Size.X.Offset == 0 then Size.Y.Offset ~= 0 and Size.X.Scale ~= 0 else Size.Y.Scale ~= 0 or Size.Y.Offset ~= 0 and Size.X.Scale ~= 0
	
	if not IsNotScaleMatch and Image.Size.X.Offset ~= Image.Size.Y.Offset then
		local Smallest = math.min(Image.Size.X.Offset, Image.Size.Y.Offset)
		Image.Size = UDim2.fromOffset(Smallest, Smallest)
	end
	Image.TextSize = Image.Size.Y.Offset
	
	if Image.TextSize == 0 or IsNotScaleMatch then
		Image.TextScaled = true
	else
		local Size100 = UseTokensResult.Size.Size_100
		Image.TextSize = math.round(Image.TextSize / Size100) * Size100
	end
	Image.Text = MigrationLookup.name
	Image.FontFace = BuilderIconsModule.Font[MigrationLookup.variant]
	Image.Image = nil
	Image.TextColor3 = Image.ImageColor3 or UseTokensResult.Color.Content.Emphasis.Color3
	Image.TextTransparency = Image.ImageTransparency or UseTokensResult.Color.Content.Emphasis.Transparency
	Image.ImageColor3 = nil
	Image.ImageTransparency = nil
	
	return if UseTextSizeOffsetResult > 0 then ReactModule.createElement(ElementType, Image, {
		Children = ReactModule.createElement(ReactModule.Fragment, nil, Image.children),
		UITextSizeConstraint = ReactModule.createElement("UITextSizeConstraint", { MaxTextSize = Image.TextSize })
	}) else ReactModule.createElement(ElementType, Image)
end