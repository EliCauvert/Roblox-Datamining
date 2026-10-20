local Parent = script.Parent.Parent
local DependenciesModule = require(Parent.dependencies)
local ImagePile = DependenciesModule.AppBlox.ImagePile
local React = DependenciesModule.React
local UIBlox = DependenciesModule.UIBlox
local LoadableImage = UIBlox.App.Loading.LoadableImage
local UseStyleFunction = UIBlox.Core.Style.useStyle
local TypeModule = require(Parent.type)
local GetRbxthumbWithTypeSizeAndOptionsFunction = DependenciesModule.getRbxthumbWithTypeSizeAndOptions
local UserLibConstants = DependenciesModule.UserLibConstants
local Parent1 = Parent.Parent
local NotificationsCommonModule = require(Parent1.NotificationsCommon)
local Constants = NotificationsCommonModule.constants
local ToastNotificationHelperModule = require(Parent.utils.toastNotificationHelper)
local Images = UIBlox.App.ImageSet.Images
local ImageSetLabel = UIBlox.Core.ImageSet.ImageSetLabel
local IconsGraphicLogomarkGradientXlarge = Images["icons/graphic/logomark-gradient_xlarge"]
local IconsCommonSafety = Images["icons/common/safety"]
local GetFFlagEnableToastIconSupportFunction = require(Parent1.SharedFlags).GetFFlagEnableToastIconSupport
local FFlagNotificationThumbnailUseProfileFrameThumbnail = NotificationsCommonModule.FFlagNotificationThumbnailUseProfileFrameThumbnail
local UseNotificationCardStateModule = require(Parent.context.useNotificationCardState)

local function v18(IdType)
	-- upvalues: TypeModule (copy), UserLibConstants (copy)
	return if IdType == TypeModule.SENDERThumbnailTypeEnum.Game then UserLibConstants.RbxthumbTypes.GameIcon elseif IdType == TypeModule.SENDERThumbnailTypeEnum.User then UserLibConstants.RbxthumbTypes.AvatarHeadShot elseif IdType == TypeModule.SENDERThumbnailTypeEnum.Group then UserLibConstants.RbxthumbTypes.GroupIcon elseif IdType == TypeModule.SENDERThumbnailTypeEnum.Asset then UserLibConstants.RbxthumbTypes.Asset elseif IdType == TypeModule.SENDERThumbnailTypeEnum.Bundle then UserLibConstants.RbxthumbTypes.BundleThumbnail else UserLibConstants.RbxthumbTypes.GameIcon
end

local IsUserThumbnail = if ToastNotificationHelperModule.isUserThumbnail then ToastNotificationHelperModule.isUserThumbnail else function(p1): boolean
	-- upvalues: TypeModule (copy)
	return p1.idType == TypeModule.SENDERThumbnailTypeEnum.User
end

return function()
	-- upvalues: UseNotificationCardStateModule (copy), UseStyleFunction (copy), IsUserThumbnail (copy), FFlagNotificationThumbnailUseProfileFrameThumbnail (copy), GetRbxthumbWithTypeSizeAndOptionsFunction (copy), v18 (copy), GetFFlagEnableToastIconSupportFunction (copy), TypeModule (copy), Constants (copy), React (copy), ImageSetLabel (copy), IconsCommonSafety (copy), IconsGraphicLogomarkGradientXlarge (copy), ImagePile (copy), LoadableImage (copy)
	local Thumbnail = UseNotificationCardStateModule("thumbnail")
	
	if Thumbnail == nil or #Thumbnail == 0 then
		return nil
	end
	local UseStyleResult = UseStyleFunction()
	local Images = {}
	local Flag = false
	
	for _, value in ipairs(Thumbnail) do
		if not IsUserThumbnail(value) then
			Flag = true
		end
		Images[tostring(value.id)] = if FFlagNotificationThumbnailUseProfileFrameThumbnail then GetRbxthumbWithTypeSizeAndOptionsFunction(value.id, v18(value.idType), 150, nil, nil, IsUserThumbnail(value)) else GetRbxthumbWithTypeSizeAndOptionsFunction(value.id, v18(value.idType), 150)
	end
	local Images1 = {}
	
	if GetFFlagEnableToastIconSupportFunction() then
		local ThumbnailEntry = Thumbnail[1]
		
		if ThumbnailEntry.idType == TypeModule.SENDERThumbnailTypeEnum.Icon then
			return if ThumbnailEntry.id == Constants.SafetyThumbnailId then React.createElement("Frame", {
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
				BackgroundColor3 = UseStyleResult.Tokens.Color.Extended.Black.Black_100.Color3
			}, {
				UICorner = React.createElement("UICorner", { CornerRadius = UDim.new(0, 8) }),
				Icon = React.createElement(ImageSetLabel, {
					LayoutOrder = 1,
					BackgroundTransparency = 1,
					Size = UDim2.fromScale(0.8, 0.8),
					AnchorPoint = Vector2.new(0.5, 0.5),
					Position = UDim2.fromScale(0.5, 0.5),
					Image = IconsGraphicLogomarkGradientXlarge
				})
			})
		end
	end
	if Flag then
		local ThumbnailEntry = Thumbnail[1]
		
		if ThumbnailEntry == nil then
			return nil
		else
			local _UDim = UDim.new(0.5, 0)
			
			return React.createElement("Frame", {
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				Size = UDim2.fromScale(1, 1),
				SizeConstraint = Enum.SizeConstraint.RelativeXX
			}, {
				Thumbnail = React.createElement(LoadableImage, {
					BackgroundTransparency = 1,
					showFailedStateWhenLoadingFailed = true,
					useShimmerAnimationWhileLoading = true,
					ZIndex = 1,
					Image = if FFlagNotificationThumbnailUseProfileFrameThumbnail then GetRbxthumbWithTypeSizeAndOptionsFunction(ThumbnailEntry.id, v18(ThumbnailEntry.idType), 150, nil, nil, IsUserThumbnail(ThumbnailEntry)) else GetRbxthumbWithTypeSizeAndOptionsFunction(ThumbnailEntry.id, v18(ThumbnailEntry.idType), 150),
					Size = UDim2.fromScale(1, 1),
					cornerRadius = if IsUserThumbnail(ThumbnailEntry) then _UDim else UDim.new(0, 8)
				})
			})
		end
	else
		for _, image in Images do
			table.insert(Images1, {
				Image = image,
				BackgroundColor3 = Color3.fromRGB(101, 102, 104)
			})
		end
		return React.createElement(ImagePile, {
			images = Images1,
			imageBorderColor = UseStyleResult.Theme.BackgroundUIDefault.Color,
			imageBorderThickness = if #Images1 > 1 then 2 else 0
		})
	end
end