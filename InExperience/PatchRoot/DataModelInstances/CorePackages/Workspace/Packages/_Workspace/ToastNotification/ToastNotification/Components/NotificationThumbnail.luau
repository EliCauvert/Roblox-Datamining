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
local constants = require(parent_1.NotificationsCommon).constants
local sharedFlagsModule = require(parent_1.SharedFlags)
local toastNotificationHelperModule = require(parent.utils.toastNotificationHelper)
local images = UIBlox.App.ImageSet.Images
local imageSetLabel = UIBlox.Core.ImageSet.ImageSetLabel
local var4 = images["icons/graphic/logomark-gradient_xlarge"]
local safety = images["icons/common/safety"]
local getFFlagEnableToastIconSupport = sharedFlagsModule.GetFFlagEnableToastIconSupport
local useNotificationCardStateModule = require(context.useNotificationCardState)

local var6 = function(p0) --[[ line: 30 ]]
	-- upvalues: typeModule (ref), userLibConstants (ref)
	return if p0 == typeModule.SENDERThumbnailTypeEnum.Game then userLibConstants.RbxthumbTypes.GameIcon elseif p0 == typeModule.SENDERThumbnailTypeEnum.User then userLibConstants.RbxthumbTypes.AvatarHeadShot elseif p0 == typeModule.SENDERThumbnailTypeEnum.Group then userLibConstants.RbxthumbTypes.GroupIcon elseif p0 == typeModule.SENDERThumbnailTypeEnum.Asset then userLibConstants.RbxthumbTypes.Asset elseif p0 == typeModule.SENDERThumbnailTypeEnum.Bundle then userLibConstants.RbxthumbTypes.BundleThumbnail else userLibConstants.RbxthumbTypes.GameIcon
end

local var7 = if toastNotificationHelperModule.isUserThumbnail then toastNotificationHelperModule.isUserThumbnail else function(p1) --[[ line: 48 ]]
	-- upvalues: typeModule (ref)
	return p1.idType == typeModule.SENDERThumbnailTypeEnum.User
end

return function() --[[ line: 52 ]]
	-- upvalues: useNotificationCardStateModule (ref), useStyle (ref), var7 (ref), getRbxthumbWithTypeSizeAndOptions (ref), var6 (ref), getFFlagEnableToastIconSupport (ref), typeModule (ref), constants (ref), react (ref), imageSetLabel (ref), safety (ref), var4 (ref), imagePile (ref), loadableImage (ref)
	local var8 = useNotificationCardStateModule("thumbnail")
	
	if var8 == nil or #var8 == 0 then
		return nil
	end
	local var9 = useStyle()
	local t = {}
	local var11 = false
	
	for i, v in ipairs(var8) do
		if not var7(v) then
			var11 = true
		end
		t[tostring(v.id)] = getRbxthumbWithTypeSizeAndOptions(v.id, var6(v.idType), 150)
	end
	local t_1 = {}
	
	if getFFlagEnableToastIconSupport() then
		local var13 = var8[1]
		
		if var13.idType == typeModule.SENDERThumbnailTypeEnum.Icon then
			return if var13.id == constants.SafetyThumbnailId then react.createElement("Frame", {
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
					ImageColor3 = var9.Theme.IconDefault.Color
				})
			}) else react.createElement("Frame", {
				BackgroundTransparency = 0,
				BorderSizePixel = 0,
				Size = UDim2.fromScale(1, 1),
				SizeConstraint = Enum.SizeConstraint.RelativeXX,
				BackgroundColor3 = var9.Tokens.Color.Extended.Black.Black_100.Color3
			}, {
				UICorner = react.createElement("UICorner", { CornerRadius = UDim.new(0, 8) }),
				Icon = react.createElement(imageSetLabel, {
					LayoutOrder = 1,
					BackgroundTransparency = 1,
					Size = UDim2.fromScale(0.8, 0.8),
					AnchorPoint = Vector2.new(0.5, 0.5),
					Position = UDim2.fromScale(0.5, 0.5),
					Image = var4
				})
			})
		elseif var11 then
			local var14 = var8[1]
			
			return if var14 == nil then nil else react.createElement("Frame", {
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
					Image = getRbxthumbWithTypeSizeAndOptions(var14.id, var6(var14.idType), 150),
					Size = UDim2.fromScale(1, 1),
					cornerRadius = if var7(var14) then UDim.new(0.5, 0) else UDim.new(0, 8)
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
			imageBorderColor = var9.Theme.BackgroundUIDefault.Color,
			imageBorderThickness = if #t_1 > 1 then 2 else 0
		})
	end
end