local Parent = script:FindFirstAncestor("FlyoutSidePanel").Parent
local ReactModule = require(Parent.React)
local BuilderIconsModule = require(Parent.BuilderIcons)
local FoundationModule = require(Parent.Foundation)
local UseTokensFunction = FoundationModule.Hooks.useTokens
local LoadableImage = require(Parent.UIBlox).App.Loading.LoadableImage
local UseSelectorFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useSelector
local GetStandardSizeAvatarHeadShotRbxthumbFunction = require(Parent.UserLib).Utils.getStandardSizeAvatarHeadShotRbxthumb

return function()
	-- upvalues: UseTokensFunction (copy), UseSelectorFunction (copy), ReactModule (copy), GetStandardSizeAvatarHeadShotRbxthumbFunction (copy), FoundationModule (copy), BuilderIconsModule (copy), LoadableImage (copy)
	local UseTokensResult = UseTokensFunction()
	local UseSelectorResult = UseSelectorFunction(function(p1)
		return p1.Users[p1.LocalUserId]
	end)
	
	return ReactModule.createElement(FoundationModule.Icon, {
		tag = "position-center-center anchor-center-center content-emphasis align-y-center",
		name = BuilderIconsModule.Icon.ThreeHorizontalBarsWrappingRight,
		size = UseTokensResult.Size.Size_800
	}, {
		UserAvatar = ReactModule.createElement(LoadableImage, {
			useShimmerAnimationWhileLoading = true,
			shouldHandleReloads = true,
			AnchorPoint = Vector2.new(0, 0.5),
			Position = UDim2.new(0, UseTokensResult.Size.Size_50, 0.5, 0),
			Size = UDim2.new(0, UseTokensResult.Size.Size_400, 0, UseTokensResult.Size.Size_400),
			BackgroundColor3 = UseTokensResult.Color.Common.Shimmer.Color3,
			BackgroundTransparency = UseTokensResult.Color.Common.Shimmer.Transparency,
			Image = ReactModule.useMemo(function()
				-- upvalues: UseSelectorResult (copy), GetStandardSizeAvatarHeadShotRbxthumbFunction (upval)
				return if UseSelectorResult and UseSelectorResult.id then GetStandardSizeAvatarHeadShotRbxthumbFunction(UseSelectorResult.id) else nil
			end, { UseSelectorResult }),
			cornerRadius = UDim.new(0.5, 0)
		})
	})
end