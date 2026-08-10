local parent = script:FindFirstAncestor("FlyoutSidePanel").Parent
local reactModule = require(parent.React)
local builderIconsModule = require(parent.BuilderIcons)
local foundationModule = require(parent.Foundation)
local useTokens = foundationModule.Hooks.useTokens
local loadableImage = require(parent.UIBlox).App.Loading.LoadableImage
local useSelector = require(parent.RoactUtils).Hooks.RoactRodux.useSelector
local getStandardSizeAvatarHeadShotRbxthumb = require(parent.UserLib).Utils.getStandardSizeAvatarHeadShotRbxthumb

return function() --[[ line: 14 | named "FlyoutAlternateEntryPoint" ]]
	-- upvalues: useTokens (ref), useSelector (ref), reactModule (ref), getStandardSizeAvatarHeadShotRbxthumb (ref), foundationModule (ref), builderIconsModule (ref), loadableImage (ref)
	local var3 = useTokens()
	local var4 = useSelector(function(p0) --[[ line: 16 ]]
		return p0.Users[p0.LocalUserId]
	end)
	
	return reactModule.createElement(foundationModule.Icon, {
		tag = "position-center-center anchor-center-center content-emphasis align-y-center",
		name = builderIconsModule.Icon.ThreeHorizontalBarsWrappingRight,
		size = var3.Size.Size_800
	}, {
		UserAvatar = reactModule.createElement(loadableImage, {
			useShimmerAnimationWhileLoading = true,
			shouldHandleReloads = true,
			AnchorPoint = Vector2.new(0, 0.5),
			Position = UDim2.new(0, var3.Size.Size_50, 0.5, 0),
			Size = UDim2.new(0, var3.Size.Size_400, 0, var3.Size.Size_400),
			BackgroundColor3 = var3.Color.Common.Shimmer.Color3,
			BackgroundTransparency = var3.Color.Common.Shimmer.Transparency,
			Image = reactModule.useMemo(function() --[[ line: 19 ]]
				-- upvalues: var4 (ref), getStandardSizeAvatarHeadShotRbxthumb (copy)
				return if var4 and var4.id then getStandardSizeAvatarHeadShotRbxthumb(var4.id) else nil
			end, { var4 }),
			cornerRadius = UDim.new(0.5, 0)
		})
	})
end