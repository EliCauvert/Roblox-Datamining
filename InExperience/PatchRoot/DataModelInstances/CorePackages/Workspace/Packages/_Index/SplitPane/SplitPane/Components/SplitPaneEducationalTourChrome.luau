local playersService = game:GetService("Players")
local parent = script:FindFirstAncestor("SplitPane").Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local robloxAppHooksModule = require(parent.RobloxAppHooks)
local responsiveModule = require(parent.Responsive)
local userLibModule = require(parent.UserLib)
local view = foundationModule.View
local icon = foundationModule.Icon
local image = foundationModule.Image
local skeleton = foundationModule.Skeleton
local text = foundationModule.Text
local foundationProvider = foundationModule.FoundationProvider
local iconName = foundationModule.Enums.IconName
local colorMode = foundationModule.Enums.ColorMode
local useTokens = foundationModule.Hooks.useTokens
local usePreferences = foundationModule.Hooks.usePreferences
local useDeviceType = robloxAppHooksModule.useDeviceType
local useDeviceInsets = responsiveModule.useDeviceInsets
local usePreferredInput = responsiveModule.usePreferredInput
local useLocalization = require(parent.Localization).Hooks.useLocalization
local useSignalState = require(parent.SignalsReact).useSignalState
local useAppPolicy = require(parent.UniversalAppPolicy).useAppPolicy
local localUserIdStore = require(parent.LocalUserIdStore).LocalUserIdStore
local getStandardSizeAvatarHeadShotRbxthumb = userLibModule.Utils.getStandardSizeAvatarHeadShotRbxthumb
local useAssetFetchStatus = require(parent.RoactUtils).Hooks.useAssetFetchStatus
local verifiedBadgeModule = require(parent.VerifiedBadges.VerifiedBadge)

local function noOp() end

local function TourProfileChip(p1)
	-- upvalues: useTokens (ref), useAssetFetchStatus (ref), reactModule (ref), view (ref), skeleton (ref), foundationModule (ref), image (ref), text (ref), verifiedBadgeModule (ref), icon (ref), iconName (ref)
	local var1 = useTokens()
	
	return reactModule.createElement(view, {
		tag = "row align-y-center gap-medium size-0-1000 auto-x padding-xsmall radius-medium",
		testId = "split-pane-educational-tour--profile-chip",
		LayoutOrder = p1.layoutOrder
	}, {
		AvatarThumbnail = reactModule.createElement(view, {
			tag = "size-1000-1000 radius-circle",
			LayoutOrder = 1,
			backgroundStyle = var1.Color.Common.Shimmer
		}, {
			ThumbnailShimmer = if p1.isUserLoaded and useAssetFetchStatus(p1.thumbnail) == Enum.AssetFetchStatus.Success then nil else reactModule.createElement(skeleton, {
				ZIndex = 1,
				radius = foundationModule.Enums.Radius.Circle
			}),
			Thumbnail = reactModule.createElement(image, {
				tag = "size-full radius-circle",
				ZIndex = 2,
				Image = p1.thumbnail
			})
		}),
		TextStack = reactModule.createElement(view, { tag = "auto-xy", LayoutOrder = 2 }, {
			DisplayNameRow = reactModule.createElement(view, {
				tag = "row align-y-center gap-small auto-xy",
				LayoutOrder = 1
			}, {
				DisplayNameShimmer = if not p1.isUserLoaded then reactModule.createElement(skeleton, {
					radius = foundationModule.Enums.Radius.Small,
					Size = UDim2.fromOffset(var1.Size.Size_3000, var1.Size.Size_300)
				}) else nil,
				DisplayNameText = if p1.isUserLoaded then reactModule.createElement(text, {
					tag = "auto-xy content-inverse-emphasis",
					LayoutOrder = 1,
					fontStyle = var1.Typography.TitleLarge,
					Text = p1.name
				}) else nil,
				VerifiedBadge = if p1.isUserLoaded and p1.isVerified then reactModule.createElement(verifiedBadgeModule, {
					LayoutOrder = 2,
					size = foundationModule.Enums.IconSize.Large
				}) else nil,
				SubscriberBadge = if p1.isUserLoaded and p1.showSubscriberBadge then reactModule.createElement(icon, {
					LayoutOrder = 3,
					name = iconName.RobloxPlus,
					size = foundationModule.Enums.IconSize.Small,
					style = var1.Inverse.Content.Emphasis
				}) else nil
			})
		})
	})
end

local var1 = reactModule.forwardRef(function(p1, p2)
	-- upvalues: useTokens (ref), reactModule (ref), view (ref), icon (ref)
	local var2 = useTokens()
	local var3 = if p1.usesOverMediaStyle then var2.Color.ActionOverMedia else var2.Color.ActionUtility
	
	return reactModule.createElement(view, {
		tag = "row align-x-center align-y-center",
		ref = p2,
		Size = UDim2.fromOffset(var2.Size.Size_1000, var2.Size.Size_1000),
		cornerRadius = UDim.new(0, if p1.isCircular then var2.Radius.Circle else var2.Radius.Medium),
		backgroundStyle = var3.Background,
		stroke = if var3.Border ~= nil then nil else {
			Color = var3.Border.Color3,
			Transparency = var3.Border.Transparency
		},
		testId = p1.testId,
		LayoutOrder = p1.LayoutOrder
	}, {
		Icon = reactModule.createElement(icon, {
			LayoutOrder = 1,
			name = p1.icon,
			size = var2.Size.Size_600,
			style = var3.Foreground
		})
	})
end)
local var2 = reactModule.forwardRef(function(p1, p2)
	-- upvalues: useTokens (ref), reactModule (ref), view (ref), text (ref)
	local var3 = useTokens()
	local actionOverMedia = var3.Color.ActionOverMedia
	
	return reactModule.createElement(view, {
		tag = "row align-x-center align-y-center gap-small padding-medium clip",
		ref = p2,
		AutomaticSize = Enum.AutomaticSize.X,
		Size = UDim2.fromOffset(0, var3.Size.Size_1000),
		cornerRadius = UDim.new(0, var3.Radius.Medium),
		backgroundStyle = actionOverMedia.Background,
		stroke = if actionOverMedia.Border ~= nil then nil else {
			Color = actionOverMedia.Border.Color3,
			Transparency = actionOverMedia.Border.Transparency
		},
		testId = p1.testId,
		LayoutOrder = p1.LayoutOrder
	}, {
		Label = reactModule.createElement(text, {
			tag = "shrink size-0-full auto-x text-label-medium text-truncate-end",
			LayoutOrder = 1,
			Text = p1.text,
			textStyle = actionOverMedia.Foreground
		})
	})
end)

local function _(p1)
	if p1 == nil then
		return false
	end
	local ok, status = pcall(function()
		-- upvalues: p1 (ref)
		return p1.HasRobloxSubscription == true
	end)
	
	return ok and status
end

return function(p1)
	-- upvalues: useTokens (ref), useDeviceType (ref), usePreferences (ref), useDeviceInsets (ref), usePreferredInput (ref), responsiveModule (ref), useLocalization (ref), useSignalState (ref), localUserIdStore (ref), playersService (ref), useAppPolicy (ref), reactModule (ref), noOp (ref), view (ref), foundationProvider (ref), colorMode (ref), TourProfileChip (ref), getStandardSizeAvatarHeadShotRbxthumb (ref), var1 (ref), iconName (ref), var2 (ref)
	local var3
	local var4 = useTokens()
	local var5 = useDeviceType()
	local var6 = usePreferences()
	local var7 = useDeviceInsets()
	local var8 = usePreferredInput() == responsiveModule.Input.Directional
	local var9 = useLocalization({
		editAvatarButtonText = "Feature.SplitPane.EditAvatarButtonText"
	})
	local var10 = useSignalState(localUserIdStore.getCurrentUserId)
	local localPlayer = playersService.LocalPlayer
	local var11 = localPlayer ~= nil and var10 ~= ""
	
	if localPlayer == nil then
		var3 = false
	else
		local ok, status = pcall(function()
			-- upvalues: localPlayer (ref)
			return localPlayer.HasRobloxSubscription == true
		end)
		var3 = ok and status
	end
	local function _(p2)
		-- upvalues: var5 (ref), var6 (ref)
		return { colorMode = p2, device = var5, preferences = var6 }
	end
	
	return reactModule.createElement("Frame", {
		Name = "TourOwnedSupportPaneChrome",
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		ZIndex = 2,
		Position = UDim2.fromOffset(p1.supportPaneRect.Min.X, p1.supportPaneRect.Min.Y),
		Size = UDim2.fromOffset(p1.supportPaneRect.Max.X - p1.supportPaneRect.Min.X, p1.supportPaneRect.Max.Y - p1.supportPaneRect.Min.Y)
	}, {
		InputSink = reactModule.createElement("TextButton", {
			Name = "InputSink",
			Size = UDim2.fromScale(1, 1),
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			AutoButtonColor = false,
			Active = true,
			Selectable = false,
			Text = "",
			ZIndex = 2,
			[reactModule.Event.Activated] = noOp
		}),
		Vignette = reactModule.createElement("Frame", {
			Name = "Vignette",
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			ZIndex = 3,
			Position = UDim2.fromOffset(0, -var7.top),
			Size = UDim2.new(1, var7.right, 1, var7.top + var7.bottom)
		}, {
			TopScrim = reactModule.createElement("Frame", {
				BackgroundTransparency = 0.1,
				BorderSizePixel = 0,
				Size = UDim2.new(1, 0, 0, 158),
				BackgroundColor3 = Color3.fromRGB(0, 0, 0)
			}, {
				Gradient = reactModule.createElement("UIGradient", {
					Rotation = 90,
					Transparency = NumberSequence.new({
						NumberSequenceKeypoint.new(0, 0),
						NumberSequenceKeypoint.new(1, 1)
					})
				})
			}),
			BottomScrim = reactModule.createElement("Frame", {
				BackgroundTransparency = 0.3,
				BorderSizePixel = 0,
				Position = UDim2.new(0, 0, 1, 0),
				AnchorPoint = Vector2.new(0, 1),
				Size = UDim2.new(1, 0, 0, 158),
				BackgroundColor3 = Color3.fromRGB(0, 0, 0)
			}, {
				Gradient = reactModule.createElement("UIGradient", {
					Rotation = 90,
					Transparency = NumberSequence.new({
						NumberSequenceKeypoint.new(0, 1),
						NumberSequenceKeypoint.new(1, 0)
					})
				})
			})
		}),
		Content = reactModule.createElement(view, {
			tag = "size-full-full margin-x-medium padding-y-small",
			ZIndex = 4
		}, {
			BottomPaneTooltipAnchor = reactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				ref = p1.onBottomPaneTooltipAnchorInstanceChanged,
				Position = UDim2.new(0, 0, 1, var4.Padding.Small),
				AnchorPoint = Vector2.new(0, 1),
				Size = UDim2.new(1, 0, 0, 1)
			}),
			GamepadStepTwoTooltipAnchor = if var8 then reactModule.createElement("Frame", {
				Name = "GamepadStepTwoTooltipAnchor",
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				ref = p1.onGamepadStepTwoTooltipAnchorInstanceChanged,
				Position = UDim2.new(0.5, 0, 1, -16),
				AnchorPoint = Vector2.new(0.5, 0),
				Size = UDim2.fromOffset(1, 1)
			}) else nil,
			GamepadFinalTooltipAnchor = if var8 then reactModule.createElement("Frame", {
				Name = "GamepadFinalTooltipAnchor",
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				ref = p1.onGamepadFinalTooltipAnchorInstanceChanged,
				Position = UDim2.new(0.5, 0, 0.691244239631, 0),
				AnchorPoint = Vector2.new(0.5, 0),
				Size = UDim2.fromOffset(1, 1)
			}) else nil,
			OverMediaScope = reactModule.createElement(view, { Size = UDim2.fromScale(1, 1) }, {
				OverMediaProvider = reactModule.createElement(foundationProvider, {
					colorMode = colorMode.Light,
					device = var5,
					preferences = var6
				}, {
					TopArea = reactModule.createElement(view, {
						tag = "row align-y-center anchor-top-center size-full-1200",
						Position = UDim2.new(0.5, 0, 0, p1.topInset),
						padding = if not var8 then { right = UDim.new(0, -var4.Padding.Small) } else nil
					}, {
						ProfileChip = reactModule.createElement(TourProfileChip, {
							layoutOrder = 1,
							isUserLoaded = var11,
							thumbnail = if var11 then getStandardSizeAvatarHeadShotRbxthumb(var10) else nil,
							name = if localPlayer then if useAppPolicy(function(p2)
								return p2.getShowDisplayName()
							end) then localPlayer.DisplayName else localPlayer.Name else nil,
							isVerified = if localPlayer then localPlayer.HasVerifiedBadge else nil,
							showSubscriberBadge = var3
						}),
						Spacer = reactModule.createElement(view, { tag = "grow auto-y", LayoutOrder = 2 }),
						CollapseButton = if not var8 then reactModule.createElement(view, { LayoutOrder = 3, AutomaticSize = Enum.AutomaticSize.XY }, {
							DarkScope = reactModule.createElement(foundationProvider, {
								colorMode = colorMode.Dark,
								device = var5,
								preferences = var6
							}, {
								CollapseButton = reactModule.createElement(var1, {
									testId = "split-pane-educational-tour--collapse",
									LayoutOrder = 3,
									ref = p1.onTopRightControlInstanceChanged,
									icon = iconName.RectangleRightPaneChevronRight
								})
							})
						}) else nil,
						TopEditAvatarButton = if var8 then reactModule.createElement(var2, {
							testId = "split-pane-educational-tour--top-edit-avatar",
							LayoutOrder = 3,
							ref = p1.onTopRightControlInstanceChanged,
							text = var9.editAvatarButtonText
						}) else nil
					})
				})
			}),
			MiddleAreaScope = if not var8 then reactModule.createElement(view, { Size = UDim2.fromScale(1, 1) }, {
				LightScope = reactModule.createElement(foundationProvider, {
					colorMode = colorMode.Light,
					device = var5,
					preferences = var6
				}, {
					MiddleArea = reactModule.createElement(view, {
						tag = "row position-center-center anchor-center-center size-full-1000"
					}, {
						Spacer = reactModule.createElement(view, { tag = "grow auto-y", LayoutOrder = 1 }),
						RightChevron = reactModule.createElement(var1, {
							testId = "split-pane-educational-tour--next-avatar",
							isCircular = true,
							usesOverMediaStyle = true,
							LayoutOrder = 3,
							icon = iconName.ChevronLargeRight
						})
					})
				})
			}) else nil,
			BottomAreaScope = if not var8 then reactModule.createElement(view, { Size = UDim2.fromScale(1, 1) }, {
				LightScope = reactModule.createElement(foundationProvider, {
					colorMode = colorMode.Light,
					device = var5,
					preferences = var6
				}, {
					BottomArea = reactModule.createElement(view, {
						tag = "row align-x-center position-bottom-center anchor-bottom-center size-full-1200 padding-bottom-small"
					}, {
						EditAvatarButton = reactModule.createElement(var2, {
							testId = "split-pane-educational-tour--edit-avatar",
							text = var9.editAvatarButtonText
						})
					})
				})
			}) else nil
		})
	})
end