local EditProfile = script:FindFirstAncestor("EditProfile")
local Parent = EditProfile.Parent
local ReactModule = require(Parent.React)
local UIBloxModule = require(Parent.UIBlox)
local UseFocusGuiObjectFunction = require(Parent.ReactFocusNavigation).useFocusGuiObject
local LoadableImage = UIBloxModule.App.Loading.LoadableImage
local ImageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local Images = UIBloxModule.App.ImageSet.Images
local UseStyleFunction = UIBloxModule.Core.Style.useStyle
local EditProfileTopBarModule = require(EditProfile.Components.EditProfileTopBar)
local EditTextButtonModule = require(EditProfile.Components.EditTextButton)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local TextKeysModule = require(EditProfile.Common.TextKeys)
local _ = require(EditProfile.Common.Types)
local ConstantsModule = require(EditProfile.Common.Constants)
local UseDisplayNameTextModule = require(EditProfile.Hooks.useDisplayNameText)
local GetStandardSizeAvatarHeadShotRbxthumbFunction = require(Parent.UserLib).Utils.getStandardSizeAvatarHeadShotRbxthumb
local StyledTextLabel = UIBloxModule.App.Text.StyledTextLabel
local VerticalScrollView = UIBloxModule.App.Container.VerticalScrollView
local UserProfileSettingsNetworkingModule = require(EditProfile.Networking.UserProfileSettingsNetworking)
local UseDispatchFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useDispatch
local FoundationModule = require(Parent.Foundation)
local Button = FoundationModule.Button
local ButtonSize = FoundationModule.Enums.ButtonSize
local UseLastInputModeFunction = require(Parent.FocusNavigationUtils).useLastInputMode
local UseUserExperimentFunction = require(Parent.RoactAppExperiment).useUserExperiment
local FFlagEditProfileBackgroundEnabled = require(Parent.SharedFlags).FFlagEditProfileBackgroundEnabled
local FFlagAXEnableProfileTab = require(Parent.SharedFlags).FFlagAXEnableProfileTab
local UseNavigationFunction = require(Parent.Navigation).useNavigation
local EditProfileBackgroundViewportModule = require(EditProfile.Components.EditProfileBackgroundViewport)
local FFlagEditProfileFixFocusNavigationModule = require(EditProfile.Flags.FFlagEditProfileFixFocusNavigation)
local FFlagEditProfileNavigateToAvatarModule = require(EditProfile.Flags.FFlagEditProfileNavigateToAvatar)
local FStringEditProfileToAvatarLayerNameModule = require(EditProfile.Flags.FStringEditProfileToAvatarLayerName)
local SocialNetworksInEditProfileIXPModule = require(EditProfile.Flags.SocialNetworksInEditProfileIXP)
local EditProfileScrollable = game:DefineFastFlag("EditProfileScrollable", false)
local FFlagMoveInExperienceModeToEditProfile = require(Parent.SharedFlags).FFlagMoveInExperienceModeToEditProfile
local FFlagAuthSecExclusions = require(Parent.SharedFlags).FFlagAuthSecExclusions
local UniversalAppPolicyModule = require(Parent.UniversalAppPolicy)
local Character = utf8.char(57346)

return function(p1)
	-- upvalues: FFlagEditProfileBackgroundEnabled (copy), UseNavigationFunction (copy), UseLastInputModeFunction (copy), UseFocusGuiObjectFunction (copy), UseUserExperimentFunction (copy), FStringEditProfileToAvatarLayerNameModule (copy), SocialNetworksInEditProfileIXPModule (copy), FFlagAuthSecExclusions (copy), UniversalAppPolicyModule (copy), UseStyleFunction (copy), UseLocalizationFunction (copy), TextKeysModule (copy), FFlagMoveInExperienceModeToEditProfile (copy), UseDispatchFunction (copy), Character (copy), UseDisplayNameTextModule (copy), ReactModule (copy), UserProfileSettingsNetworkingModule (copy), ConstantsModule (copy), ImageSetLabel (copy), Images (copy), FFlagEditProfileFixFocusNavigationModule (copy), EditTextButtonModule (copy), FFlagAXEnableProfileTab (copy), EditProfileScrollable (copy), EditProfileTopBarModule (copy), FFlagEditProfileNavigateToAvatarModule (copy), EditProfileBackgroundViewportModule (copy), FoundationModule (copy), Button (copy), ButtonSize (copy), LoadableImage (copy), GetStandardSizeAvatarHeadShotRbxthumbFunction (copy), StyledTextLabel (copy), VerticalScrollView (copy)
	local UseNavigationResult = if FFlagEditProfileBackgroundEnabled then UseNavigationFunction() else nil
	local UseLastInputModeResult = UseLastInputModeFunction()
	local UseFocusGuiObjectResult = UseFocusGuiObjectFunction()
	local UseUserExperimentResult = UseUserExperimentFunction({ FStringEditProfileToAvatarLayerNameModule }, function(p2)
		-- upvalues: FStringEditProfileToAvatarLayerNameModule (upval)
		return (p2[FStringEditProfileToAvatarLayerNameModule] or {}).profile_picture_on
	end)
	local FFlagSocialNetworksInEditProfileIXPSetupEnabled = SocialNetworksInEditProfileIXPModule.GetFFlagSocialNetworksInEditProfileIXPSetupEnabled()
	local UseGetExperimentVariantResult = SocialNetworksInEditProfileIXPModule.useGetExperimentVariant({ isExposureEnabled = true })
	local IsNotUseGetExperimentVariantResultMatch: boolean = UseGetExperimentVariantResult and UseGetExperimentVariantResult ~= SocialNetworksInEditProfileIXPModule.Variants.Control
	local UseAppPolicyResult = if FFlagAuthSecExclusions then UniversalAppPolicyModule.useAppPolicy(function(p2)
		return p2.getExcludeUsernameUpdateModeration()
	end) else nil
	local UseStyleResult = UseStyleFunction()
	local Theme = UseStyleResult.Theme
	local UseStyleResultFont = UseStyleResult.Font
	local UseDispatchResult = if FFlagMoveInExperienceModeToEditProfile then UseDispatchFunction() else nil
	local UseLocalizationResult = UseLocalizationFunction({
		About = TextKeysModule.About,
		AboutModalCaption = TextKeysModule.AboutModalCaption,
		AboutPlaceholder = TextKeysModule.AboutPlaceholder,
		Username = TextKeysModule.Username,
		UsernameCaption = {
			TextKeysModule.UsernameDescription,
			icon = Character,
			price = UseLocalizationFunction({ thousand = TextKeysModule.UsernamePrice }).thousand
		},
		EditBackground = if FFlagEditProfileBackgroundEnabled then TextKeysModule.EditBackground else nil,
		SocialNetworks = if FFlagSocialNetworksInEditProfileIXPSetupEnabled and IsNotUseGetExperimentVariantResultMatch then TextKeysModule.SocialNetworks else nil,
		SocialNetworksCaption = if FFlagSocialNetworksInEditProfileIXPSetupEnabled and IsNotUseGetExperimentVariantResultMatch and p1.socialInfo and p1.socialInfo.visibility then TextKeysModule[p1.socialInfo.visibility] else nil
	})
	local UseDisplayNameTextModuleResult = UseDisplayNameTextModule()
	local UseResult = if FFlagMoveInExperienceModeToEditProfile then ReactModule.useCallback(function()
		-- upvalues: UseDispatchResult (copy), UserProfileSettingsNetworkingModule (upval), p1 (copy)
		UseDispatchResult(UserProfileSettingsNetworkingModule.SetUserProfileSettings.API({
			isInExperienceNameEnabled = not p1.isInExperienceNameEnabled
		})):andThen(function(Result)
			-- upvalues: p1 (upval)
			if Result.responseBody.successfullyUpdated then
				p1.onToggleInExperienceMode()
			end
		end)
	end, {
		p1.onToggleInExperienceMode,
		p1.isInExperienceNameEnabled,
		UserProfileSettingsNetworkingModule.SetUserProfileSettings
	}) else nil
	local Flag = false
	local UseMemoResult = if FFlagSocialNetworksInEditProfileIXPSetupEnabled then ReactModule.useMemo(function()
		-- upvalues: p1 (copy), ConstantsModule (upval), ReactModule (upval), Theme (copy), ImageSetLabel (upval), Images (upval), Flag (ref)
		local ImageButtons = {}
		
		if p1.socialInfo and p1.socialInfo.socialLinks then
			for LayoutOrder, value in ipairs(ConstantsModule.SocialMediaOrder) do
				ImageButtons[value] = ReactModule.createElement("ImageButton", {
					LayoutOrder = LayoutOrder,
					BackgroundTransparency = 0,
					Size = UDim2.new(0, 40, 0, 40),
					BackgroundColor3 = Theme.BackgroundUIDefault.Color,
					[ReactModule.Event.Activated] = if p1.openEditSocialLinksModal then function()
						-- upvalues: p1 (upval), LayoutOrder (copy)
						p1.openEditSocialLinksModal(LayoutOrder)
					end else nil
				}, {
					UICorner = ReactModule.createElement("UICorner", { CornerRadius = UDim.new(0, 8) }),
					Icon = ReactModule.createElement(ImageSetLabel, {
						BackgroundTransparency = 1,
						Image = Images[ConstantsModule.SocialMediaIcons[value]],
						ImageColor3 = Theme.IconEmphasis.Color,
						ImageTransparency = if p1.socialInfo.socialLinks[value] then 0 else 0.5,
						Size = UDim2.new(0, 28, 0, 28),
						Position = UDim2.new(0, 6, 0, 6)
					})
				})
				
				if p1.socialInfo.socialLinks[value] then
					Flag = true
				end
			end
		end
		return ImageButtons
	end, { p1.socialInfo, Theme, p1.openEditSocialLinksModal }) else nil
	local FullBleed = FFlagAXEnableProfileTab and p1.fullBleed
	local Frame = ReactModule.createElement("Frame", {
		BackgroundColor3 = UseStyleResult.Theme.BackgroundDefault.Color,
		BackgroundTransparency = UseStyleResult.Theme.BackgroundDefault.Transparency,
		Size = UDim2.new(1, 0, 1, 0),
		AutomaticSize = if EditProfileScrollable then Enum.AutomaticSize.Y else nil,
		Position = if FullBleed then UDim2.fromScale(0, 0) else UDim2.fromScale(1, 0),
		AnchorPoint = if FullBleed then Vector2.new(0, 0) else Vector2.new(1, 0)
	}, {
		SizeConstraint = ReactModule.createElement("UISizeConstraint", {
			MaxSize = if FullBleed then Vector2.new(1e999, 1e999) else Vector2.new(640, 1e999)
		}),
		Layout = ReactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical,
			HorizontalAlignment = Enum.HorizontalAlignment.Center,
			SortOrder = Enum.SortOrder.LayoutOrder,
			Padding = UDim.new(0, 24)
		}),
		TopPadding = ReactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 0, 20)
		}),
		TopBar = ReactModule.createElement(EditProfileTopBarModule, { layoutOrder = 1, onClose = p1.onClose }),
		ProfilePicture = if FFlagEditProfileNavigateToAvatarModule or UseUserExperimentResult then if FFlagEditProfileBackgroundEnabled then ReactModule.createElement("Frame", {
			LayoutOrder = 2,
			BackgroundTransparency = 1,
			AutomaticSize = Enum.AutomaticSize.X,
			Size = UDim2.new(1, 0, 0, 200)
		}, {
			Bar = ReactModule.createElement("Frame", {
				LayoutOrder = 1,
				ZIndex = 1,
				BackgroundTransparency = 1,
				Size = UDim2.new(1, 0, 0, 150)
			}, {
				ProfileBackgroundBanner = ReactModule.createElement(EditProfileBackgroundViewportModule, { height = 150 }),
				EditBackgroundButton = ReactModule.createElement(FoundationModule.View, {
					tag = "position-center-center anchor-center-center auto-xy",
					ZIndex = 2
				}, {
					Button = ReactModule.createElement(Button, {
						text = UseLocalizationResult.EditBackground,
						onActivated = function()
							-- upvalues: UseNavigationResult (copy), p1 (copy)
							UseNavigationResult.navigate(p1.profileScreens.EditProfileBackground)
						end,
						variant = FoundationModule.Enums.ButtonVariant.SubEmphasis,
						size = ButtonSize.Small
					})
				}),
				Picture = ReactModule.createElement("ImageButton", {
					AnchorPoint = Vector2.new(0, 0.5),
					Position = UDim2.new(0, 24, 1, 0),
					Size = UDim2.new(0, 100, 0, 100),
					BackgroundTransparency = 0,
					BorderSizePixel = 10,
					ZIndex = 2,
					[ReactModule.Event.Activated] = p1.openEditProfilePicture
				}, {
					UICorner = ReactModule.createElement("UICorner", { CornerRadius = UDim.new(0.5, 0) }),
					UserAvatar = ReactModule.createElement(LoadableImage, {
						useShimmerAnimationWhileLoading = true,
						shouldHandleReloads = true,
						ZIndex = 2,
						Size = UDim2.new(1, 0, 1, 0),
						cornerRadius = UDim.new(0.5, 0),
						Image = GetStandardSizeAvatarHeadShotRbxthumbFunction(p1.localUserId),
						BackgroundColor3 = Theme.PlaceHolder.Color,
						BackgroundTransparency = Theme.PlaceHolder.Transparency
					}),
					Button = ReactModule.createElement("ImageButton", {
						Size = UDim2.new(0, 32, 0, 32),
						AnchorPoint = Vector2.new(0.5, 1),
						Position = UDim2.new(0.5, 35, 1, 0),
						BackgroundTransparency = 0,
						BackgroundColor3 = Theme.BackgroundUIDefault.Color,
						ZIndex = 3,
						[ReactModule.Event.Activated] = p1.openEditProfilePicture
					}, {
						UICorner = ReactModule.createElement("UICorner", { CornerRadius = UDim.new(0.5, 0) }),
						Icon = ReactModule.createElement(ImageSetLabel, {
							BackgroundTransparency = 1,
							ZIndex = 3,
							AnchorPoint = Vector2.new(0.5, 0.5),
							Image = Images["icons/actions/edit/edit"],
							ImageColor3 = Theme.IconEmphasis.Color,
							Size = UDim2.new(0, 22, 0, 22),
							Position = UDim2.fromScale(0.5, 0.5)
						})
					})
				})
			})
		}) else ReactModule.createElement("Frame", {
			LayoutOrder = 2,
			BackgroundTransparency = 1,
			AutomaticSize = Enum.AutomaticSize.X,
			Size = UDim2.new(1, 0, 0, 100)
		}, {
			Picture = ReactModule.createElement("ImageButton", {
				AnchorPoint = Vector2.new(0.5, 0.5),
				Position = UDim2.fromScale(0.5, 0.5),
				LayoutOrder = 1,
				Size = UDim2.new(0, 100, 0, 100),
				BackgroundTransparency = 1,
				BorderSizePixel = 10,
				[ReactModule.Event.Activated] = p1.openEditProfilePicture
			}, {
				UICorner = ReactModule.createElement("UICorner", { CornerRadius = UDim.new(0.5, 0) }),
				UserAvatar = ReactModule.createElement(LoadableImage, {
					useShimmerAnimationWhileLoading = true,
					shouldHandleReloads = true,
					Size = UDim2.new(1, 0, 1, 0),
					cornerRadius = UDim.new(0.5, 0),
					Image = GetStandardSizeAvatarHeadShotRbxthumbFunction(p1.localUserId),
					BackgroundColor3 = Theme.PlaceHolder.Color,
					BackgroundTransparency = Theme.PlaceHolder.Transparency
				})
			}),
			Button = ReactModule.createElement("ImageButton", {
				Size = UDim2.new(0, 36, 0, 36),
				AnchorPoint = Vector2.new(0.5, 1),
				Position = UDim2.new(0.5, 80, 1, 0),
				BackgroundTransparency = Theme.UIMuted.Transparency,
				BackgroundColor3 = Theme.UIMuted.Color,
				[ReactModule.Event.Activated] = p1.openEditProfilePicture
			}, {
				UICorner = ReactModule.createElement("UICorner", { CornerRadius = UDim.new(0, 4) }),
				Icon = ReactModule.createElement(ImageSetLabel, {
					BackgroundTransparency = 1,
					AnchorPoint = Vector2.new(0.5, 0.5),
					Image = Images["icons/menu/profilepicture_large"],
					ImageColor3 = Theme.IconEmphasis.Color,
					Size = UDim2.new(0, 28, 0, 28),
					Position = UDim2.fromScale(0.5, 0.5)
				})
			})
		}) else nil,
		Content = ReactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			LayoutOrder = 3,
			AutomaticSize = Enum.AutomaticSize.Y,
			Size = UDim2.new(1, -48, 0, 0)
		}, {
			Layout = ReactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Vertical,
				HorizontalAlignment = Enum.HorizontalAlignment.Center,
				SortOrder = Enum.SortOrder.LayoutOrder,
				Padding = UDim.new(0, 24)
			}),
			DisplayNameButton = ReactModule.createElement(EditTextButtonModule, {
				layoutOrder = 1,
				expandSizing = false,
				transparentText = false,
				shouldShimmerName = p1.shouldShimmerName,
				title = UseDisplayNameTextModuleResult.displayNameTitle,
				description = UseDisplayNameTextModuleResult.displayNameCaption,
				placeHolderText = p1.displayName,
				localUserId = p1.localUserId,
				onActivated = p1.openDisplayNameModal,
				forwardRef = if FFlagEditProfileFixFocusNavigationModule then ReactModule.useCallback(function(p2)
					-- upvalues: UseLastInputModeResult (copy), UseFocusGuiObjectResult (copy)
					if p2 and UseLastInputModeResult == "Focus" then
						UseFocusGuiObjectResult(p2)
					end
				end, {}) else nil
			}),
			UsernameButton = if UseAppPolicyResult then nil else ReactModule.createElement(EditTextButtonModule, {
				layoutOrder = 2,
				expandSizing = false,
				transparentText = false,
				shouldShimmerName = p1.shouldShimmerName,
				title = UseLocalizationResult.Username,
				description = UseLocalizationResult.UsernameCaption,
				placeHolderText = "@" .. p1.username,
				localUserId = p1.localUserId,
				onActivated = p1.navigateToEditUsername
			}),
			Divider = ReactModule.createElement("Frame", {
				LayoutOrder = 3,
				BorderSizePixel = 0,
				BackgroundColor3 = UseStyleResult.Theme.Divider.Color,
				BackgroundTransparency = UseStyleResult.Theme.Divider.Transparency,
				Size = UDim2.new(1, 0, 0, 1)
			}),
			AboutMeButton = ReactModule.createElement(EditTextButtonModule, {
				layoutOrder = 4,
				shouldShimmerName = false,
				expandSizing = true,
				title = UseLocalizationResult.About,
				description = UseLocalizationResult.AboutModalCaption,
				placeHolderText = if p1.description == nil or p1.description == "" then UseLocalizationResult.AboutPlaceholder else p1.description,
				localUserId = p1.localUserId,
				onActivated = p1.openEditDescription,
				transparentText = not p1.description or p1.description == ""
			}),
			Divider2 = if FFlagSocialNetworksInEditProfileIXPSetupEnabled and IsNotUseGetExperimentVariantResultMatch and not p1.isUnder13 then ReactModule.createElement("Frame", {
				BorderSizePixel = 0,
				LayoutOrder = if FFlagMoveInExperienceModeToEditProfile then 8 else 5,
				BackgroundColor3 = UseStyleResult.Theme.Divider.Color,
				BackgroundTransparency = UseStyleResult.Theme.Divider.Transparency,
				Size = UDim2.new(1, 0, 0, 1)
			}) else nil,
			SocialNetworksButton = if FFlagSocialNetworksInEditProfileIXPSetupEnabled and IsNotUseGetExperimentVariantResultMatch and p1.socialInfo and p1.socialInfo.socialLinks and not p1.isUnder13 then ReactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				LayoutOrder = if FFlagMoveInExperienceModeToEditProfile then 9 else 6,
				AutomaticSize = Enum.AutomaticSize.Y,
				Size = UDim2.new(1, 0, 0, 0)
			}, {
				Layout = ReactModule.createElement("UIListLayout", {
					FillDirection = Enum.FillDirection.Vertical,
					HorizontalAlignment = Enum.HorizontalAlignment.Left,
					SortOrder = Enum.SortOrder.LayoutOrder,
					Padding = UDim.new(0, 12)
				}),
				UIPadding = ReactModule.createElement("UIPadding", { PaddingBottom = UDim.new(0, 20) }),
				Title = ReactModule.createElement(StyledTextLabel, {
					layoutOrder = 1,
					text = UseLocalizationResult.SocialNetworks,
					fontStyle = UseStyleResultFont.Header2,
					colorStyle = Theme.TextEmphasis
				}),
				Description = if Flag then ReactModule.createElement(StyledTextLabel, {
					layoutOrder = 2,
					lineHeight = 1,
					text = UseLocalizationResult.SocialNetworksCaption,
					fontStyle = UseStyleResultFont.CaptionBody,
					colorStyle = Theme.TextDefault,
					automaticSize = Enum.AutomaticSize.Y,
					size = UDim2.new(1, 0, 0, 0)
				}) else nil,
				NetworkIcons = ReactModule.createElement("Frame", {
					LayoutOrder = 3,
					BackgroundTransparency = 1,
					Size = UDim2.new(1, 0, 0, 40)
				}, {
					Layout = ReactModule.createElement("UIListLayout", {
						FillDirection = Enum.FillDirection.Horizontal,
						SortOrder = Enum.SortOrder.LayoutOrder,
						Padding = UDim.new(0, 12)
					}),
					SocialNetworks = ReactModule.createElement(ReactModule.Fragment, {}, UseMemoResult),
					Padding = ReactModule.createElement("Frame", {
						LayoutOrder = 6,
						BackgroundTransparency = 1,
						Size = UDim2.new(1, -318, 0, 40)
					}),
					PencilIcon = ReactModule.createElement("ImageButton", {
						LayoutOrder = 7,
						BackgroundTransparency = 0,
						Size = UDim2.new(0, 40, 0, 40),
						BackgroundColor3 = UseStyleResult.Theme.BackgroundDefault.Color,
						BorderSizePixel = 0,
						[ReactModule.Event.Activated] = if p1.openEditSocialLinksModal then function()
							-- upvalues: p1 (copy)
							p1.openEditSocialLinksModal(-1)
						end else nil
					}, {
						UICorner = ReactModule.createElement("UICorner", { CornerRadius = UDim.new(0, 8) }),
						Icon = ReactModule.createElement(ImageSetLabel, {
							BackgroundTransparency = 1,
							Image = Images["icons/actions/edit/edit"],
							ImageColor3 = Theme.IconEmphasis.Color,
							Size = UDim2.new(0, 28, 0, 28),
							Position = UDim2.new(0, 6, 0, 6)
						})
					})
				})
			}) else nil,
			Divider3 = if FFlagMoveInExperienceModeToEditProfile and p1.canSeeInExperienceMode then ReactModule.createElement("Frame", {
				LayoutOrder = 5,
				BorderSizePixel = 0,
				BackgroundColor3 = UseStyleResult.Theme.Divider.Color,
				BackgroundTransparency = UseStyleResult.Theme.Divider.Transparency,
				Size = UDim2.new(1, 0, 0, 1)
			}) else nil,
			InExperienceModeSection = if FFlagMoveInExperienceModeToEditProfile and p1.canSeeInExperienceMode then ReactModule.createElement("Frame", {
				LayoutOrder = 6,
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				AutomaticSize = Enum.AutomaticSize.Y,
				Size = UDim2.new(1, 0, 0, 0)
			}, {
				Layout = ReactModule.createElement("UIListLayout", {
					FillDirection = Enum.FillDirection.Vertical,
					SortOrder = Enum.SortOrder.LayoutOrder,
					Padding = UDim.new(0, 20)
				}),
				ReactModule.createElement("Frame", {
					BackgroundTransparency = 1,
					BorderSizePixel = 0,
					LayoutOrder = 1,
					AutomaticSize = Enum.AutomaticSize.Y,
					Size = UDim2.new(1, 0, 0, 0)
				}, {
					Layout = ReactModule.createElement("UIListLayout", {
						FillDirection = Enum.FillDirection.Horizontal,
						HorizontalFlex = Enum.UIFlexAlignment.SpaceBetween,
						VerticalAlignment = Enum.VerticalAlignment.Center,
						SortOrder = Enum.SortOrder.LayoutOrder
					}),
					Title = ReactModule.createElement("TextLabel", {
						BackgroundTransparency = 1,
						Text = "In-Experience Mode",
						Size = UDim2.fromOffset(0, 0),
						TextYAlignment = Enum.TextYAlignment.Center,
						TextXAlignment = Enum.TextXAlignment.Left,
						TextSize = UseStyleResultFont.BaseSize * UseStyleResultFont.Body.RelativeSize,
						AutomaticSize = Enum.AutomaticSize.XY,
						Font = UseStyleResultFont.Header2.Font,
						TextColor3 = Theme.TextEmphasis.Color
					}),
					InExperienceNameToggleButton = ReactModule.createElement(Button, {
						LayoutOrder = 2,
						text = if p1.isInExperienceNameEnabled then "Stop" else "Start",
						onActivated = UseResult,
						size = ButtonSize.XSmall
					})
				}),
				InExperienceModeButton = ReactModule.createElement(EditTextButtonModule, {
					layoutOrder = 2,
					description = "When in-experience mode is on, this temporary Name will replace your Name in most experiences.",
					transparentText = true,
					expandSizing = true,
					shouldShimmerName = false,
					placeHolderText = p1.inExperienceName or "",
					localUserId = p1.localUserId
				}),
				BottomPadding = ReactModule.createElement("UIPadding", { PaddingBottom = UDim.new(0, 24) })
			}) else nil
		})
	})
	
	return if EditProfileScrollable then ReactModule.createElement(VerticalScrollView, {
		useAutomaticCanvasSize = true,
		canvasSizeY = UDim.new(),
		elasticBehavior = Enum.ElasticBehavior.Never
	}, { Frame }) else Frame
end