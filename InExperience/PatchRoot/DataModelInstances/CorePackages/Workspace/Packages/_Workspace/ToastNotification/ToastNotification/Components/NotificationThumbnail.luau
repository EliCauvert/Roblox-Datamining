local parent = script.Parent.Parent
local context = parent.context
local dependenciesModule = require(parent.dependencies)
local imagePile = dependenciesModule.AppBlox.ImagePile
local react = dependenciesModule.React
local UIBlox = dependenciesModule.UIBlox
local loadableImage = UIBlox.App.Loading.LoadableImage
local useStyle = UIBlox.Core.Style.useStyle
local typeModule = require(parent.type)
local getRbxthumbWithTypeSizeAndOptions = dependenciesModule.getRbxthumbWithTypeSizeAndOptions
local userLibConstants = dependenciesModule.UserLibConstants
local parent_1 = parent.Parent
local notificationsCommonModule = require(parent_1.NotificationsCommon)
local constants = notificationsCommonModule.constants
local sharedFlagsModule = require(parent_1.SharedFlags)
local toastNotificationHelperModule = require(parent.utils.toastNotificationHelper)
local images = UIBlox.App.ImageSet.Images
local imageSetLabel = UIBlox.Core.ImageSet.ImageSetLabel
local var1 = images["icons/graphic/logomark-gradient_xlarge"]
local safety = images["icons/common/safety"]
local getFFlagEnableToastIconSupport = sharedFlagsModule.GetFFlagEnableToastIconSupport
local fFlagNotificationThumbnailUseProfileFrameThumbnail = notificationsCommonModule.FFlagNotificationThumbnailUseProfileFrameThumbnail
local useNotificationCardStateModule = require(context.useNotificationCardState)

local var2 = function(p1)
	-- upvalues: typeModule (ref), userLibConstants (ref)
	return if p1 == typeModule.SENDERThumbnailTypeEnum.Game then userLibConstants.RbxthumbTypes.GameIcon elseif p1 == typeModule.SENDERThumbnailTypeEnum.User then userLibConstants.RbxthumbTypes.AvatarHeadShot elseif p1 == typeModule.SENDERThumbnailTypeEnum.Group then userLibConstants.RbxthumbTypes.GroupIcon elseif p1 == typeModule.SENDERThumbnailTypeEnum.Asset then userLibConstants.RbxthumbTypes.Asset elseif p1 == typeModule.SENDERThumbnailTypeEnum.Bundle then userLibConstants.RbxthumbTypes.BundleThumbnail else userLibConstants.RbxthumbTypes.GameIcon
end

local var3 = if toastNotificationHelperModule.isUserThumbnail then toastNotificationHelperModule.isUserThumbnail else function(p1)
	-- upvalues: typeModule (ref)
	return p1.idType == typeModule.SENDERThumbnailTypeEnum.User
end

return function()
	-- upvalues: useNotificationCardStateModule (ref), useStyle (ref), var3 (ref), fFlagNotificationThumbnailUseProfileFrameThumbnail (ref), getRbxthumbWithTypeSizeAndOptions (ref), var2 (ref), getFFlagEnableToastIconSupport (ref), typeModule (ref), constants (ref), react (ref), imageSetLabel (ref), safety (ref), var1 (ref), imagePile (ref), loadableImage (ref)
	local var4 = useNotificationCardStateModule("thumbnail")
	
	if var4 == nil or #var4 == 0 then
		return nil
	end
	local var5 = useStyle()
	local t = {}
	local var6 = false
	
	for i, v in ipairs(var4) do
		if not var3(v) then
			var6 = true
		end
		t[tostring(v.id)] = if fFlagNotificationThumbnailUseProfileFrameThumbnail then getRbxthumbWithTypeSizeAndOptions(v.id, var2(v.idType), 150, nil, nil, var3(v)) else getRbxthumbWithTypeSizeAndOptions(v.id, var2(v.idType), 150)
	end
	local t_1 = {}
	
	if getFFlagEnableToastIconSupport() then
		local var7 = var4[1]
		
		if var7.idType == typeModule.SENDERThumbnailTypeEnum.Icon then
			return if var7.id == constants.SafetyThumbnailId then react.createElement("Frame", {
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
					ImageColor3 = var5.Theme.IconDefault.Color
				})
			}) else react.createElement("Frame", {
				BackgroundTransparency = 0,
				BorderSizePixel = 0,
				Size = UDim2.fromScale(1, 1),
				SizeConstraint = Enum.SizeConstraint.RelativeXX,
				BackgroundColor3 = var5.Tokens.Color.Extended.Black.Black_100.Color3
			}, {
				UICorner = react.createElement("UICorner", { CornerRadius = UDim.new(0, 8) }),
				Icon = react.createElement(imageSetLabel, {
					LayoutOrder = 1,
					BackgroundTransparency = 1,
					Size = UDim2.fromScale(0.8, 0.8),
					AnchorPoint = Vector2.new(0.5, 0.5),
					Position = UDim2.fromScale(0.5, 0.5),
					Image = var1
				})
			})
		elseif var6 then
			local var8 = var4[1]
			
			return if var8 == nil then nil else react.createElement("Frame", {
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				Size = UDim2.fromScale(1, 1),
				SizeConstraint = Enum.SizeConstraint.RelativeXX
			}, {
				Thumbnail = react.createElement(loadableImage, {
					BackgroundTransparency = 1,
					showFailedStateWhenLoadingFailed = true,
					useShimmerAnimationWhileLoading = true,
					ZIndex = 1,
					Image = if fFlagNotificationThumbnailUseProfileFrameThumbnail then getRbxthumbWithTypeSizeAndOptions(var8.id, var2(var8.idType), 150, nil, nil, var3(var8)) else getRbxthumbWithTypeSizeAndOptions(var8.id, var2(var8.idType), 150),
					Size = UDim2.fromScale(1, 1),
					cornerRadius = if var3(var8) then UDim.new(0.5, 0) else UDim.new(0, 8)
				})
			})
		end
		for i_1, v_1 in t do
			table.insert(t_1, {
				Image = v_1,
				BackgroundColor3 = Color3.fromRGB(101, 102, 104)
			})
		end
		return react.createElement(imagePile, {
			images = t_1,
			imageBorderColor = var5.Theme.BackgroundUIDefault.Color,
			imageBorderThickness = if #t_1 > 1 then 2 else 0
		})
	end
end