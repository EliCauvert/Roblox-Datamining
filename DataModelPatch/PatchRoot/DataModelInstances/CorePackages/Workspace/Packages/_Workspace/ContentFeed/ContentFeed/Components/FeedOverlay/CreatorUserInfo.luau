local Parent = script.Parent.Parent.Parent.Parent
local ReactModule = require(Parent.React)
local UserLibModule = require(Parent.UserLib)
local FoundationModule = require(Parent.Foundation)
local UIBloxModule = require(Parent.UIBlox)
local GetDeepValueFunction = require(Parent.LuaSocialLibrariesDeps).SocialLibraries.config({}).Dictionary.getDeepValue
local GetRbxthumbWithTypeSizeAndOptionsFunction = UserLibModule.Utils.getRbxthumbWithTypeSizeAndOptions
local LoadableImage = UIBloxModule.App.Loading.LoadableImage
local Skeleton = FoundationModule.Skeleton
local Text = FoundationModule.Text
local View = FoundationModule.View
local UseSelectorFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useSelector
local UseStyleFunction = UIBloxModule.Core.Style.useStyle
local AvatarHeadShot = UserLibModule.Utils.Constants.RbxthumbTypes.AvatarHeadShot

return function(p1)
	-- upvalues: UseStyleFunction (copy), UseSelectorFunction (copy), GetDeepValueFunction (copy), ReactModule (copy), View (copy), LoadableImage (copy), GetRbxthumbWithTypeSizeAndOptionsFunction (copy), AvatarHeadShot (copy), Text (copy), Skeleton (copy)
	local UseStyleResult = UseStyleFunction()
	local UseSelectorResult = UseSelectorFunction(function(p2)
		-- upvalues: GetDeepValueFunction (upval), p1 (copy)
		return GetDeepValueFunction(p2, "Users.byUserId." .. tostring(p1.creatorUserId) .. ".username")
	end)
	
	return ReactModule.createElement(View, {
		tag = "align-x-left align-y-center auto-y bg-action-subtle gap-small row size-full-0",
		LayoutOrder = p1.layoutOrder
	}, {
		CreatorThumbnail = ReactModule.createElement(LoadableImage, {
			LayoutOrder = 1,
			useShimmerAnimationWhileLoading = true,
			BackgroundColor3 = UseStyleResult.Theme.PlaceHolder.Color,
			BackgroundTransparency = UseStyleResult.Theme.PlaceHolder.Transparency,
			cornerRadius = UDim.new(0, 30),
			Image = GetRbxthumbWithTypeSizeAndOptionsFunction(tostring(p1.creatorUserId), AvatarHeadShot, 150, true),
			ScaleType = Enum.ScaleType.Fit,
			Size = UDim2.fromOffset(30, 30)
		}),
		CreatorUsername = if UseSelectorResult then ReactModule.createElement(Text, {
			LayoutOrder = 2,
			tag = "auto-y content-action-emphasis grow text-align-x-left text-align-y-top text-title-large text-truncate-end",
			ZIndex = 2,
			Text = UseSelectorResult
		}) else nil,
		ShimmerPanel = if UseSelectorResult then nil else ReactModule.createElement(Skeleton, { LayoutOrder = 2, Size = UDim2.fromOffset(160, 16) })
	})
end