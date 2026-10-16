local Players = game:GetService("Players")
local Parent = script:FindFirstAncestor("SplitPane").Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local ResponsiveModule = require(Parent.Responsive)
local View = FoundationModule.View
local Icon = FoundationModule.Icon
local Image = FoundationModule.Image
local Skeleton = FoundationModule.Skeleton
local Text = FoundationModule.Text
local FoundationProvider = FoundationModule.FoundationProvider
local IconName = FoundationModule.Enums.IconName
local ColorMode = FoundationModule.Enums.ColorMode
local UseTokensFunction = FoundationModule.Hooks.useTokens
local UsePreferencesFunction = FoundationModule.Hooks.usePreferences
local UseDeviceTypeFunction = require(Parent.RobloxAppHooks).useDeviceType
local UseDeviceInsetsFunction = ResponsiveModule.useDeviceInsets
local UsePreferredInputFunction = ResponsiveModule.usePreferredInput
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local UseSignalStateFunction = require(Parent.SignalsReact).useSignalState
local UseAppPolicyFunction = require(Parent.UniversalAppPolicy).useAppPolicy
local LocalUserIdStore = require(Parent.LocalUserIdStore).LocalUserIdStore
local GetStandardSizeAvatarHeadShotRbxthumbFunction = require(Parent.UserLib).Utils.getStandardSizeAvatarHeadShotRbxthumb
local UseAssetFetchStatusFunction = require(Parent.RoactUtils).Hooks.useAssetFetchStatus
local VerifiedBadgeModule = require(Parent.VerifiedBadges.VerifiedBadge)

local function noOp() --[[ Line: 42 ]] end

local function TourProfileChip(p1) --[[ Line: 46 ]]
	-- upvalues: UseTokensFunction (copy), UseAssetFetchStatusFunction (copy), ReactModule (copy), View (copy), Skeleton (copy), FoundationModule (copy), Image (copy), Text (copy), VerifiedBadgeModule (copy), Icon (copy), IconName (copy)
	local UseTokensResult = UseTokensFunction()
	local IsUseAssetFetchStatusResultMatch = UseAssetFetchStatusFunction(p1.thumbnail) == Enum.AssetFetchStatus.Success
	
	return ReactModule.createElement(View, {
		tag = "row align-y-center gap-medium size-0-1000 auto-x padding-xsmall radius-medium",
		testId = "split-pane-educational-tour--profile-chip",
		LayoutOrder = p1.layoutOrder
	}, {
		AvatarThumbnail = ReactModule.createElement(View, {
			tag = "size-1000-1000 radius-circle",
			LayoutOrder = 1,
			backgroundStyle = UseTokensResult.Color.Common.Shimmer
		}, {
			ThumbnailShimmer = if p1.isUserLoaded and IsUseAssetFetchStatusResultMatch then nil else ReactModule.createElement(Skeleton, {
				ZIndex = 1,
				radius = FoundationModule.Enums.Radius.Circle
			}),
			Thumbnail = ReactModule.createElement(Image, {
				tag = "size-full radius-circle",
				ZIndex = 2,
				Image = p1.thumbnail
			})
		}),
		TextStack = ReactModule.createElement(View, { tag = "auto-xy", LayoutOrder = 2 }, {
			DisplayNameRow = ReactModule.createElement(View, {
				tag = "row align-y-center gap-small auto-xy",
				LayoutOrder = 1
			}, {
				DisplayNameShimmer = if p1.isUserLoaded then nil else ReactModule.createElement(Skeleton, {
					radius = FoundationModule.Enums.Radius.Small,
					Size = UDim2.fromOffset(UseTokensResult.Size.Size_3000, UseTokensResult.Size.Size_300)
				}),
				DisplayNameText = if p1.isUserLoaded then ReactModule.createElement(Text, {
					tag = "auto-xy content-inverse-emphasis",
					LayoutOrder = 1,
					fontStyle = UseTokensResult.Typography.TitleLarge,
					Text = p1.name
				}) else nil,
				VerifiedBadge = if p1.isUserLoaded and p1.isVerified then ReactModule.createElement(VerifiedBadgeModule, {
					LayoutOrder = 2,
					size = FoundationModule.Enums.IconSize.Large
				}) else nil,
				SubscriberBadge = if p1.isUserLoaded and p1.showSubscriberBadge then ReactModule.createElement(Icon, {
					LayoutOrder = 3,
					name = IconName.RobloxPlus,
					size = FoundationModule.Enums.IconSize.Small,
					style = UseTokensResult.Inverse.Content.Emphasis
				}) else nil
			})
		})
	})
end

local ForwardRefResult = ReactModule.forwardRef(function(Frame, Ref) --[[ Line: 117 ]]
	-- upvalues: UseTokensFunction (copy), ReactModule (copy), View (copy), Icon (copy)
	local UseTokensResult = UseTokensFunction()
	local ActionOverMedia = if Frame.usesOverMediaStyle then UseTokensResult.Color.ActionOverMedia else UseTokensResult.Color.ActionUtility
	
	return ReactModule.createElement(View, {
		tag = "row align-x-center align-y-center",
		ref = Ref,
		Size = UDim2.fromOffset(UseTokensResult.Size.Size_1000, UseTokensResult.Size.Size_1000),
		cornerRadius = UDim.new(0, if Frame.isCircular then UseTokensResult.Radius.Circle else UseTokensResult.Radius.Medium),
		backgroundStyle = ActionOverMedia.Background,
		stroke = if ActionOverMedia.Border == nil then nil else {
			Color = ActionOverMedia.Border.Color3,
			Transparency = ActionOverMedia.Border.Transparency
		},
		testId = Frame.testId,
		LayoutOrder = Frame.LayoutOrder
	}, {
		Icon = ReactModule.createElement(Icon, {
			LayoutOrder = 1,
			name = Frame.icon,
			size = UseTokensResult.Size.Size_600,
			style = ActionOverMedia.Foreground
		})
	})
end)
local ForwardRefResult1 = ReactModule.forwardRef(function(Frame, Ref) --[[ Line: 150 ]]
	-- upvalues: UseTokensFunction (copy), ReactModule (copy), View (copy), Text (copy)
	local UseTokensResult = UseTokensFunction()
	local ActionOverMedia = UseTokensResult.Color.ActionOverMedia
	
	return ReactModule.createElement(View, {
		tag = "row align-x-center align-y-center gap-small padding-medium clip",
		ref = Ref,
		AutomaticSize = Enum.AutomaticSize.X,
		Size = UDim2.fromOffset(0, UseTokensResult.Size.Size_1000),
		cornerRadius = UDim.new(0, UseTokensResult.Radius.Medium),
		backgroundStyle = ActionOverMedia.Background,
		stroke = if ActionOverMedia.Border == nil then nil else {
			Color = ActionOverMedia.Border.Color3,
			Transparency = ActionOverMedia.Border.Transparency
		},
		testId = Frame.testId,
		LayoutOrder = Frame.LayoutOrder
	}, {
		Label = ReactModule.createElement(Text, {
			tag = "shrink size-0-full auto-x text-label-medium text-truncate-end",
			LayoutOrder = 1,
			Text = Frame.text,
			textStyle = ActionOverMedia.Foreground
		})
	})
end)

local function _(Player: Player) --[[ Line: 187 | Named "getHasRobloxSubscription" ]]
	if Player == nil then
		return false
	else
		local Success, Result = pcall(function(): boolean --[[ Line: 192 ]]
			-- upvalues: Player (copy)
			return Player.HasRobloxSubscription == true
		end)
		
		return Success and Result
	end
end

return function(p1) --[[ Line: 205 | Named "TourOwnedSupportPaneChrome" ]]
	-- upvalues: UseTokensFunction (copy), UseDeviceTypeFunction (copy), UsePreferencesFunction (copy), UseDeviceInsetsFunction (copy), UsePreferredInputFunction (copy), ResponsiveModule (copy), UseLocalizationFunction (copy), UseSignalStateFunction (copy), LocalUserIdStore (copy), Players (copy), UseAppPolicyFunction (copy), ReactModule (copy), noOp (copy), View (copy), FoundationProvider (copy), ColorMode (copy), TourProfileChip (copy), GetStandardSizeAvatarHeadShotRbxthumbFunction (copy), ForwardRefResult (copy), IconName (copy), ForwardRefResult1 (copy)
	local UseTokensResult = UseTokensFunction()
	local UseDeviceTypeResult = UseDeviceTypeFunction()
	local UsePreferencesResult = UsePreferencesFunction()
	local UseDeviceInsetsResult = UseDeviceInsetsFunction()
	local IsUsePreferredInputResultMatch = UsePreferredInputFunction() == ResponsiveModule.Input.Directional
	local UseLocalizationResult = UseLocalizationFunction({
		editAvatarButtonText = "Feature.SplitPane.EditAvatarButtonText"
	})
	local UseSignalStateResult = UseSignalStateFunction(LocalUserIdStore.getCurrentUserId)
	local LocalPlayer = Players.LocalPlayer
	local IsNotUseSignalStateResultMatch: boolean = LocalPlayer ~= nil and UseSignalStateResult ~= ""
	local ShowSubscriberBadge = nil
	
	if LocalPlayer == nil then
		ShowSubscriberBadge = false
	else
		local Success, Result = pcall(function(): boolean --[[ Line: 192 ]]
			-- upvalues: LocalPlayer (copy)
			return LocalPlayer.HasRobloxSubscription == true
		end)
		ShowSubscriberBadge = Success and Result
	end
	local UseAppPolicyResult = UseAppPolicyFunction(function(p2) --[[ Line: 219 ]]
		return p2.getShowDisplayName()
	end)
	
	local function _(ColorMode) --[[ Line: 223 | Named "scopedStyle" ]]
		-- upvalues: UseDeviceTypeResult (copy), UsePreferencesResult (copy)
		return {
			colorMode = ColorMode,
			device = UseDeviceTypeResult,
			preferences = UsePreferencesResult
		}
	end
	
	return ReactModule.createElement("Frame", {
		Name = "TourOwnedSupportPaneChrome",
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		ZIndex = 2,
		Position = UDim2.fromOffset(p1.supportPaneRect.Min.X, p1.supportPaneRect.Min.Y),
		Size = UDim2.fromOffset(p1.supportPaneRect.Max.X - p1.supportPaneRect.Min.X, p1.supportPaneRect.Max.Y - p1.supportPaneRect.Min.Y)
	}, {
		InputSink = ReactModule.createElement("TextButton", {
			Name = "InputSink",
			Size = UDim2.fromScale(1, 1),
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			AutoButtonColor = false,
			Active = true,
			Selectable = false,
			Text = "",
			ZIndex = 2,
			[ReactModule.Event.Activated] = noOp
		}),
		Vignette = ReactModule.createElement("Frame", {
			Name = "Vignette",
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			ZIndex = 3,
			Position = UDim2.fromOffset(0, -UseDeviceInsetsResult.top),
			Size = UDim2.new(1, UseDeviceInsetsResult.right, 1, UseDeviceInsetsResult.top + UseDeviceInsetsResult.bottom)
		}, {
			TopScrim = ReactModule.createElement("Frame", {
				BackgroundTransparency = 0.1,
				BorderSizePixel = 0,
				Size = UDim2.new(1, 0, 0, 158),
				BackgroundColor3 = Color3.fromRGB(0, 0, 0)
			}, {
				Gradient = ReactModule.createElement("UIGradient", {
					Rotation = 90,
					Transparency = NumberSequence.new({
						NumberSequenceKeypoint.new(0, 0),
						NumberSequenceKeypoint.new(1, 1)
					})
				})
			}),
			BottomScrim = ReactModule.createElement("Frame", {
				BackgroundTransparency = 0.3,
				BorderSizePixel = 0,
				Position = UDim2.new(0, 0, 1, 0),
				AnchorPoint = Vector2.new(0, 1),
				Size = UDim2.new(1, 0, 0, 158),
				BackgroundColor3 = Color3.fromRGB(0, 0, 0)
			}, {
				Gradient = ReactModule.createElement("UIGradient", {
					Rotation = 90,
					Transparency = NumberSequence.new({
						NumberSequenceKeypoint.new(0, 1),
						NumberSequenceKeypoint.new(1, 0)
					})
				})
			})
		}),
		Content = ReactModule.createElement(View, {
			tag = "size-full-full margin-x-medium padding-y-small",
			ZIndex = 4
		}, {
			BottomPaneTooltipAnchor = ReactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				ref = p1.onBottomPaneTooltipAnchorInstanceChanged,
				Position = UDim2.new(0, 0, 1, UseTokensResult.Padding.Small),
				AnchorPoint = Vector2.new(0, 1),
				Size = UDim2.new(1, 0, 0, 1)
			}),
			GamepadStepTwoTooltipAnchor = if IsUsePreferredInputResultMatch then ReactModule.createElement("Frame", {
				Name = "GamepadStepTwoTooltipAnchor",
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				ref = p1.onGamepadStepTwoTooltipAnchorInstanceChanged,
				Position = UDim2.new(0.5, 0, 1, -16),
				AnchorPoint = Vector2.new(0.5, 0),
				Size = UDim2.fromOffset(1, 1)
			}) else nil,
			GamepadFinalTooltipAnchor = if IsUsePreferredInputResultMatch then ReactModule.createElement("Frame", {
				Name = "GamepadFinalTooltipAnchor",
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				ref = p1.onGamepadFinalTooltipAnchorInstanceChanged,
				Position = UDim2.new(0.5, 0, 0.6912442396313364, 0),
				AnchorPoint = Vector2.new(0.5, 0),
				Size = UDim2.fromOffset(1, 1)
			}) else nil,
			OverMediaScope = ReactModule.createElement(View, { Size = UDim2.fromScale(1, 1) }, {
				OverMediaProvider = ReactModule.createElement(FoundationProvider, {
					colorMode = ColorMode.Light,
					device = UseDeviceTypeResult,
					preferences = UsePreferencesResult
				}, {
					TopArea = ReactModule.createElement(View, {
						tag = "row align-y-center anchor-top-center size-full-1200",
						Position = UDim2.new(0.5, 0, 0, p1.topInset),
						padding = if IsUsePreferredInputResultMatch then nil else { right = UDim.new(0, -UseTokensResult.Padding.Small) }
					}, {
						ProfileChip = ReactModule.createElement(TourProfileChip, {
							layoutOrder = 1,
							isUserLoaded = IsNotUseSignalStateResultMatch,
							thumbnail = if IsNotUseSignalStateResultMatch then GetStandardSizeAvatarHeadShotRbxthumbFunction(UseSignalStateResult) else nil,
							name = if LocalPlayer then if UseAppPolicyResult then LocalPlayer.DisplayName else LocalPlayer.Name else nil,
							isVerified = if LocalPlayer then LocalPlayer.HasVerifiedBadge else nil,
							showSubscriberBadge = ShowSubscriberBadge
						}),
						Spacer = ReactModule.createElement(View, { tag = "grow auto-y", LayoutOrder = 2 }),
						CollapseButton = if IsUsePreferredInputResultMatch then nil else ReactModule.createElement(View, { LayoutOrder = 3, AutomaticSize = Enum.AutomaticSize.XY }, {
							DarkScope = ReactModule.createElement(FoundationProvider, {
								colorMode = ColorMode.Dark,
								device = UseDeviceTypeResult,
								preferences = UsePreferencesResult
							}, {
								CollapseButton = ReactModule.createElement(ForwardRefResult, {
									testId = "split-pane-educational-tour--collapse",
									LayoutOrder = 3,
									ref = p1.onTopRightControlInstanceChanged,
									icon = IconName.RectangleRightPaneChevronRight
								})
							})
						}),
						TopEditAvatarButton = if IsUsePreferredInputResultMatch then ReactModule.createElement(ForwardRefResult1, {
							testId = "split-pane-educational-tour--top-edit-avatar",
							LayoutOrder = 3,
							ref = p1.onTopRightControlInstanceChanged,
							text = UseLocalizationResult.editAvatarButtonText
						}) else nil
					})
				})
			}),
			MiddleAreaScope = if IsUsePreferredInputResultMatch then nil else ReactModule.createElement(View, { Size = UDim2.fromScale(1, 1) }, {
				LightScope = ReactModule.createElement(FoundationProvider, {
					colorMode = ColorMode.Light,
					device = UseDeviceTypeResult,
					preferences = UsePreferencesResult
				}, {
					MiddleArea = ReactModule.createElement(View, {
						tag = "row position-center-center anchor-center-center size-full-1000"
					}, {
						Spacer = ReactModule.createElement(View, { tag = "grow auto-y", LayoutOrder = 1 }),
						RightChevron = ReactModule.createElement(ForwardRefResult, {
							testId = "split-pane-educational-tour--next-avatar",
							isCircular = true,
							usesOverMediaStyle = true,
							LayoutOrder = 3,
							icon = IconName.ChevronLargeRight
						})
					})
				})
			}),
			BottomAreaScope = if IsUsePreferredInputResultMatch then nil else ReactModule.createElement(View, { Size = UDim2.fromScale(1, 1) }, {
				LightScope = ReactModule.createElement(FoundationProvider, {
					colorMode = ColorMode.Light,
					device = UseDeviceTypeResult,
					preferences = UsePreferencesResult
				}, {
					BottomArea = ReactModule.createElement(View, {
						tag = "row align-x-center position-bottom-center anchor-bottom-center size-full-1200 padding-bottom-small"
					}, {
						EditAvatarButton = ReactModule.createElement(ForwardRefResult1, {
							testId = "split-pane-educational-tour--edit-avatar",
							text = UseLocalizationResult.editAvatarButtonText
						})
					})
				})
			})
		})
	})
end