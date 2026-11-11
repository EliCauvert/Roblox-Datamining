local Parent = script.Parent.Parent
local DependenciesModule = require(Parent.dependencies)
local React = DependenciesModule.React
local UIBlox = DependenciesModule.UIBlox
local UseStyleFunction = UIBlox.Core.Style.useStyle
local LoadableImage = UIBlox.App.Loading.LoadableImage
local TypeModule = require(Parent.type)
local GetRbxthumbWithTypeSizeAndOptionsFunction = DependenciesModule.getRbxthumbWithTypeSizeAndOptions
local UserLibConstants = DependenciesModule.UserLibConstants
local ConstantsModule = require(Parent.constants)
local EnableStreamAvatarImageUrlThumbnail = game:DefineFastFlag("EnableStreamAvatarImageUrlThumbnail", false)
local Images = UIBlox.App.ImageSet.Images
local ImageSetLabel = UIBlox.Core.ImageSet.ImageSetLabel
local IconsLogoBlock = Images["icons/logo/block"]
local IconsCommonSafety = Images["icons/common/safety"]
local UseNotificationCardStateModule = require(Parent.context.useNotificationCardState)

local function v14(IdType)
	-- upvalues: TypeModule (copy), UserLibConstants (copy), EnableStreamAvatarImageUrlThumbnail (copy)
	return if IdType == TypeModule.SENDERThumbnailTypeEnum.Game then UserLibConstants.RbxthumbTypes.GameIcon elseif IdType == TypeModule.SENDERThumbnailTypeEnum.User then UserLibConstants.RbxthumbTypes.AvatarHeadShot elseif IdType == TypeModule.SENDERThumbnailTypeEnum.Group then UserLibConstants.RbxthumbTypes.GroupIcon elseif IdType == TypeModule.SENDERThumbnailTypeEnum.Asset then UserLibConstants.RbxthumbTypes.Asset elseif IdType == TypeModule.SENDERThumbnailTypeEnum.Bundle then UserLibConstants.RbxthumbTypes.BundleThumbnail elseif IdType == TypeModule.SENDERThumbnailTypeEnum.GamePass then UserLibConstants.RbxthumbTypes.GamePass elseif EnableStreamAvatarImageUrlThumbnail and IdType == TypeModule.SENDERThumbnailTypeEnum.AvatarImageUrl then UserLibConstants.RbxthumbTypes.AvatarImageUrl else UserLibConstants.RbxthumbTypes.GameIcon
end

local function _(p1): boolean
	-- upvalues: TypeModule (copy), EnableStreamAvatarImageUrlThumbnail (copy)
	return p1.idType == TypeModule.SENDERThumbnailTypeEnum.User or EnableStreamAvatarImageUrlThumbnail and p1.idType == TypeModule.SENDERThumbnailTypeEnum.AvatarImageUrl
end

return function()
	-- upvalues: UseNotificationCardStateModule (copy), EnableStreamAvatarImageUrlThumbnail (copy), TypeModule (copy), UseStyleFunction (copy), ConstantsModule (copy), React (copy), ImageSetLabel (copy), IconsCommonSafety (copy), IconsLogoBlock (copy), v14 (copy), UserLibConstants (copy), GetRbxthumbWithTypeSizeAndOptionsFunction (copy), LoadableImage (copy)
	local Thumbnail = UseNotificationCardStateModule("thumbnail")
	
	if Thumbnail == nil or #Thumbnail == 0 then
		return nil
	end
	local ThumbnailEntry = Thumbnail[1]
	
	if ThumbnailEntry == nil then
		return nil
	elseif not EnableStreamAvatarImageUrlThumbnail and ThumbnailEntry.idType == TypeModule.SENDERThumbnailTypeEnum.AvatarImageUrl then
		return nil
	else
		local UseStyleResult = UseStyleFunction()
		
		if ThumbnailEntry.idType == TypeModule.SENDERThumbnailTypeEnum.Icon then
			return if ThumbnailEntry.id == ConstantsModule.SafetyThumbnailId then React.createElement("Frame", {
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				Size = UDim2.fromScale(1, 1),
				SizeConstraint = Enum.SizeConstraint.RelativeXX
			}, {
				Icon = React.createElement(ImageSetLabel, {
					LayoutOrder = 1,
					BackgroundTransparency = 1,
					Size = UDim2.fromScale(1, 1),
					AnchorPoint = Vector2.new(0.5, 0.5),
					Position = UDim2.fromScale(0.5, 0.5),
					Image = IconsCommonSafety,
					ImageColor3 = UseStyleResult.Theme.IconDefault.Color
				})
			}) else React.createElement("Frame", {
				BackgroundTransparency = 0,
				BorderSizePixel = 0,
				Size = UDim2.fromScale(1, 1),
				SizeConstraint = Enum.SizeConstraint.RelativeXX,
				BackgroundColor3 = UseStyleResult.Tokens.Color.System.Emphasis.Color3
			}, {
				UICorner = React.createElement("UICorner", { CornerRadius = UDim.new(0, 11) }),
				Icon = React.createElement(ImageSetLabel, {
					LayoutOrder = 1,
					BackgroundTransparency = 1,
					Size = UDim2.fromScale(0.75, 0.75),
					AnchorPoint = Vector2.new(0.5, 0.5),
					Position = UDim2.fromScale(0.5, 0.5),
					Image = IconsLogoBlock,
					ImageColor3 = UseStyleResult.Tokens.Color.Extended.White.White_100.Color3
				})
			})
		else
			local config = {
				BackgroundTransparency = 0,
				showFailedStateWhenLoadingFailed = true,
				useShimmerAnimationWhileLoading = true,
				ZIndex = 1,
				BackgroundColor3 = UseStyleResult.Theme.BackgroundDefault.Color,
				Image = if EnableStreamAvatarImageUrlThumbnail and v14(ThumbnailEntry.idType) == UserLibConstants.RbxthumbTypes.AvatarImageUrl then ThumbnailEntry.id else GetRbxthumbWithTypeSizeAndOptionsFunction(ThumbnailEntry.id, v14(ThumbnailEntry.idType), 150),
				Size = UDim2.fromScale(1, 1),
				cornerRadius = if IsIdTypeMatch then UDim.new(0.5, 0) else UDim.new(0, 8)
			}
			local IsIdTypeMatch: boolean = ThumbnailEntry.idType == TypeModule.SENDERThumbnailTypeEnum.User or EnableStreamAvatarImageUrlThumbnail and ThumbnailEntry.idType == TypeModule.SENDERThumbnailTypeEnum.AvatarImageUrl
			
			return React.createElement("Frame", {
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				Size = UDim2.fromScale(1, 1),
				SizeConstraint = Enum.SizeConstraint.RelativeXX
			}, { Thumbnail = React.createElement(LoadableImage, config) })
		end
	end
end