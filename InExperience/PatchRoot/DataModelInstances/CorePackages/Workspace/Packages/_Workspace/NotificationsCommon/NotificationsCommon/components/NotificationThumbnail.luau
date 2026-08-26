local parent = script.Parent.Parent
local context = parent.context
local dependenciesModule = require(parent.dependencies)
local react = dependenciesModule.React
local UIBlox = dependenciesModule.UIBlox
local useStyle = UIBlox.Core.Style.useStyle
local loadableImage = UIBlox.App.Loading.LoadableImage
local typeModule = require(parent.type)
local getRbxthumbWithTypeSizeAndOptions = dependenciesModule.getRbxthumbWithTypeSizeAndOptions
local userLibConstants = dependenciesModule.UserLibConstants
local constantsModule = require(parent.constants)
local enableStreamAvatarImageUrlThumbnail = game:DefineFastFlag("EnableStreamAvatarImageUrlThumbnail", false)
local fFlagNotificationThumbnailUseProfileFrameThumbnailModule = require(parent.Flags.FFlagNotificationThumbnailUseProfileFrameThumbnail)
local images = UIBlox.App.ImageSet.Images
local imageSetLabel = UIBlox.Core.ImageSet.ImageSetLabel
local block = images["icons/logo/block"]
local safety = images["icons/common/safety"]
local useNotificationCardStateModule = require(context.useNotificationCardState)

local var1 = function(p1)
	-- upvalues: typeModule (ref), userLibConstants (ref), enableStreamAvatarImageUrlThumbnail (ref)
	return if p1 == typeModule.SENDERThumbnailTypeEnum.Game then userLibConstants.RbxthumbTypes.GameIcon elseif p1 == typeModule.SENDERThumbnailTypeEnum.User then userLibConstants.RbxthumbTypes.AvatarHeadShot elseif p1 == typeModule.SENDERThumbnailTypeEnum.Group then userLibConstants.RbxthumbTypes.GroupIcon elseif p1 == typeModule.SENDERThumbnailTypeEnum.Asset then userLibConstants.RbxthumbTypes.Asset elseif p1 == typeModule.SENDERThumbnailTypeEnum.Bundle then userLibConstants.RbxthumbTypes.BundleThumbnail elseif p1 == typeModule.SENDERThumbnailTypeEnum.GamePass then userLibConstants.RbxthumbTypes.GamePass elseif enableStreamAvatarImageUrlThumbnail and p1 == typeModule.SENDERThumbnailTypeEnum.AvatarImageUrl then userLibConstants.RbxthumbTypes.AvatarImageUrl else userLibConstants.RbxthumbTypes.GameIcon
end

local _ = function(p1)
	-- upvalues: typeModule (ref), enableStreamAvatarImageUrlThumbnail (ref)
	return if p1.idType ~= typeModule.SENDERThumbnailTypeEnum.User then enableStreamAvatarImageUrlThumbnail and p1.idType == typeModule.SENDERThumbnailTypeEnum.AvatarImageUrl else true
end

return function()
	-- upvalues: useNotificationCardStateModule (ref), enableStreamAvatarImageUrlThumbnail (ref), typeModule (ref), useStyle (ref), constantsModule (ref), react (ref), imageSetLabel (ref), safety (ref), block (ref), var1 (ref), userLibConstants (ref), fFlagNotificationThumbnailUseProfileFrameThumbnailModule (ref), getRbxthumbWithTypeSizeAndOptions (ref), loadableImage (ref)
	local var2 = useNotificationCardStateModule("thumbnail")
	
	if var2 == nil or #var2 == 0 then
		return nil
	end
	local var3 = var2[1]
	
	if var3 == nil then
		return nil
	elseif not enableStreamAvatarImageUrlThumbnail and var3.idType == typeModule.SENDERThumbnailTypeEnum.AvatarImageUrl then
		return nil
	end
	local var4 = useStyle()
	
	return if var3.idType == typeModule.SENDERThumbnailTypeEnum.Icon then if var3.id == constantsModule.SafetyThumbnailId then react.createElement("Frame", {
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		Size = UDim2.fromScale(1, 1),
		SizeConstraint = Enum.SizeConstraint.RelativeXX
	}, {
		Icon = react.createElement(imageSetLabel, {
			LayoutOrder = 1,
			BackgroundTransparency = 1,
			Size = UDim2.fromScale(1, 1),
			AnchorPoint = Vector2.new(0.5, 0.5),
			Position = UDim2.fromScale(0.5, 0.5),
			Image = safety,
			ImageColor3 = var4.Theme.IconDefault.Color
		})
	}) else react.createElement("Frame", {
		BackgroundTransparency = 0,
		BorderSizePixel = 0,
		Size = UDim2.fromScale(1, 1),
		SizeConstraint = Enum.SizeConstraint.RelativeXX,
		BackgroundColor3 = var4.Tokens.Color.System.Emphasis.Color3
	}, {
		UICorner = react.createElement("UICorner", { CornerRadius = UDim.new(0, 11) }),
		Icon = react.createElement(imageSetLabel, {
			LayoutOrder = 1,
			BackgroundTransparency = 1,
			Size = UDim2.fromScale(0.75, 0.75),
			AnchorPoint = Vector2.new(0.5, 0.5),
			Position = UDim2.fromScale(0.5, 0.5),
			Image = block,
			ImageColor3 = var4.Tokens.Color.Extended.White.White_100.Color3
		})
	}) else react.createElement("Frame", {
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		Size = UDim2.fromScale(1, 1),
		SizeConstraint = Enum.SizeConstraint.RelativeXX
	}, {
		Thumbnail = react.createElement(loadableImage, {
			BackgroundTransparency = 0,
			showFailedStateWhenLoadingFailed = true,
			useShimmerAnimationWhileLoading = true,
			ZIndex = 1,
			BackgroundColor3 = var4.Theme.BackgroundDefault.Color,
			Image = if enableStreamAvatarImageUrlThumbnail and var1(var3.idType) == userLibConstants.RbxthumbTypes.AvatarImageUrl then var3.id elseif fFlagNotificationThumbnailUseProfileFrameThumbnailModule then getRbxthumbWithTypeSizeAndOptions(var3.id, var1(var3.idType), 150, nil, nil, if var3.idType ~= typeModule.SENDERThumbnailTypeEnum.User then enableStreamAvatarImageUrlThumbnail and var3.idType == typeModule.SENDERThumbnailTypeEnum.AvatarImageUrl else true) else getRbxthumbWithTypeSizeAndOptions(var3.id, var1(var3.idType), 150),
			Size = UDim2.fromScale(1, 1),
			cornerRadius = if if var3.idType ~= typeModule.SENDERThumbnailTypeEnum.User then enableStreamAvatarImageUrlThumbnail and var3.idType == typeModule.SENDERThumbnailTypeEnum.AvatarImageUrl else true then UDim.new(0.5, 0) else UDim.new(0, 8)
		})
	})
end