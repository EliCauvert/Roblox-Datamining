local flyoutSidePanel = script:FindFirstAncestor("FlyoutSidePanel")
local parent = flyoutSidePanel.Parent
local reactModule = require(parent.React)
local builderIconsModule = require(parent.BuilderIcons)
local foundationModule = require(parent.Foundation)
local useTokens = foundationModule.Hooks.useTokens
local loadableImage = require(parent.UIBlox).App.Loading.LoadableImage
local useSelector = require(parent.RoactUtils).Hooks.RoactRodux.useSelector
local getStandardSizeAvatarHeadShotRbxthumb = require(parent.UserLib).Utils.getStandardSizeAvatarHeadShotRbxthumb
local fFlagFlyoutAlternateEntryPointUseProfileFrameThumbnailModule = require(flyoutSidePanel.Flags.FFlagFlyoutAlternateEntryPointUseProfileFrameThumbnail)

return function()
	-- upvalues: useTokens (ref), useSelector (ref), reactModule (ref), getStandardSizeAvatarHeadShotRbxthumb (ref), fFlagFlyoutAlternateEntryPointUseProfileFrameThumbnailModule (ref), foundationModule (ref), builderIconsModule (ref), loadableImage (ref)
	local var1 = useTokens()
	local var2 = useSelector(function(p1)
		return p1.Users[p1.LocalUserId]
	end)
	
	return reactModule.createElement(foundationModule.Icon, {
		tag = "position-center-center anchor-center-center content-emphasis align-y-center",
		name = builderIconsModule.Icon.ThreeHorizontalBarsWrappingRight,
		size = var1.Size.Size_800
	}, {
		UserAvatar = reactModule.createElement(loadableImage, {
			useShimmerAnimationWhileLoading = true,
			shouldHandleReloads = true,
			AnchorPoint = Vector2.new(0, 0.5),
			Position = UDim2.new(0, var1.Size.Size_50, 0.5, 0),
			Size = UDim2.new(0, var1.Size.Size_400, 0, var1.Size.Size_400),
			BackgroundColor3 = var1.Color.Common.Shimmer.Color3,
			BackgroundTransparency = var1.Color.Common.Shimmer.Transparency,
			Image = reactModule.useMemo(function()
				-- upvalues: var2 (ref), getStandardSizeAvatarHeadShotRbxthumb (copy), fFlagFlyoutAlternateEntryPointUseProfileFrameThumbnailModule (copy)
				return if var2 and var2.id then getStandardSizeAvatarHeadShotRbxthumb(var2.id, fFlagFlyoutAlternateEntryPointUseProfileFrameThumbnailModule) else nil
			end, { var2 }),
			cornerRadius = UDim.new(0.5, 0)
		})
	})
end