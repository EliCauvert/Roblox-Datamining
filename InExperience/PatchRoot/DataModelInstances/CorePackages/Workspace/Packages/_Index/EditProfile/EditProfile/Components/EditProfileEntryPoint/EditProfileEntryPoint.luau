local editProfile = script:FindFirstAncestor("EditProfile")
local parent = editProfile.Parent
local reactModule = require(parent.React)
local UIBloxModule = require(parent.UIBlox)
local userLibModule = require(parent.UserLib)
local focusNavigationUtilsModule = require(parent.FocusNavigationUtils)
local useFocusGuiObject = require(parent.ReactFocusNavigation).useFocusGuiObject
local loadableImage = UIBloxModule.App.Loading.LoadableImage
local imageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local images = UIBloxModule.App.ImageSet.Images
local useStyle = UIBloxModule.Core.Style.useStyle
local editProfileTopBarModule = require(editProfile.Components.EditProfileTopBar)
local editTextButtonModule = require(editProfile.Components.EditTextButton)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local textKeysModule = require(editProfile.Common.TextKeys)
local _ = require(editProfile.Common.Types)
local constantsModule = require(editProfile.Common.Constants)
local useDisplayNameTextModule = require(editProfile.Hooks.useDisplayNameText)
local getStandardSizeAvatarHeadShotRbxthumb = userLibModule.Utils.getStandardSizeAvatarHeadShotRbxthumb
local styledTextLabel = UIBloxModule.App.Text.StyledTextLabel
local verticalScrollView = UIBloxModule.App.Container.VerticalScrollView
local userProfileSettingsNetworkingModule = require(editProfile.Networking.UserProfileSettingsNetworking)
local useDispatch = require(parent.RoactUtils).Hooks.RoactRodux.useDispatch
local foundationModule = require(parent.Foundation)
local button = foundationModule.Button
local buttonSize = foundationModule.Enums.ButtonSize
local useLastInputMode = focusNavigationUtilsModule.useLastInputMode
local useUserExperiment = require(parent.RoactAppExperiment).useUserExperiment
local fFlagEditProfileBackgroundEnabled = require(parent.SharedFlags).FFlagEditProfileBackgroundEnabled
local fFlagAXEnableProfileTab = require(parent.SharedFlags).FFlagAXEnableProfileTab
local useNavigation = require(parent.Navigation).useNavigation
local editProfileBackgroundViewportModule = require(editProfile.Components.EditProfileBackgroundViewport)
local fFlagEditProfileFixFocusNavigationModule = require(editProfile.Flags.FFlagEditProfileFixFocusNavigation)
local fFlagEditProfileNavigateToAvatarModule = require(editProfile.Flags.FFlagEditProfileNavigateToAvatar)
local fStringEditProfileToAvatarLayerNameModule = require(editProfile.Flags.FStringEditProfileToAvatarLayerName)
local socialNetworksInEditProfileIXPModule = require(editProfile.Flags.SocialNetworksInEditProfileIXP)
local editProfileScrollable = game:DefineFastFlag("EditProfileScrollable", false)
local fFlagMoveInExperienceModeToEditProfile = require(parent.SharedFlags).FFlagMoveInExperienceModeToEditProfile
local universalAppPolicyModule = require(parent.UniversalAppPolicy)
local char = utf8.char(57346)

return function(p0) --[[ line: 94 | named "EditProfileEntryPoint" ]]
	-- upvalues: fFlagEditProfileBackgroundEnabled (ref), useNavigation (ref), useLastInputMode (ref), useFocusGuiObject (ref), useUserExperiment (ref), fStringEditProfileToAvatarLayerNameModule (ref), socialNetworksInEditProfileIXPModule (ref), universalAppPolicyModule (ref), useStyle (ref), useLocalization (ref), textKeysModule (ref), fFlagMoveInExperienceModeToEditProfile (ref), useDispatch (ref), char (ref), useDisplayNameTextModule (ref), reactModule (ref), userProfileSettingsNetworkingModule (ref), constantsModule (ref), imageSetLabel (ref), images (ref), fFlagEditProfileFixFocusNavigationModule (ref), editTextButtonModule (ref), fFlagAXEnableProfileTab (ref), editProfileScrollable (ref), editProfileTopBarModule (ref), fFlagEditProfileNavigateToAvatarModule (ref), editProfileBackgroundViewportModule (ref), foundationModule (ref), button (ref), buttonSize (ref), loadableImage (ref), getStandardSizeAvatarHeadShotRbxthumb (ref), styledTextLabel (ref), verticalScrollView (ref)
	local var46
	local var20 = if fFlagEditProfileBackgroundEnabled then useNavigation() else nil
	local var21 = useLastInputMode()
	local var22 = useFocusGuiObject()
	local var23 = useUserExperiment({ fStringEditProfileToAvatarLayerNameModule }, function(p1) --[[ line: 98 ]]
		-- upvalues: fStringEditProfileToAvatarLayerNameModule (copy)
		return (p1[fStringEditProfileToAvatarLayerNameModule] or {}).profile_picture_on
	end)
	local fFlagSocialNetworksInEditProfileIXPSetupEnabled = socialNetworksInEditProfileIXPModule.GetFFlagSocialNetworksInEditProfileIXPSetupEnabled()
	local var25 = socialNetworksInEditProfileIXPModule.useGetExperimentVariant({ isExposureEnabled = true })
	local var26 = var25 and var25 ~= socialNetworksInEditProfileIXPModule.Variants.Control
	local var27 = universalAppPolicyModule.useAppPolicy(function(p2) --[[ line: 108 ]]
		return p2.getExcludeUsernameUpdateModeration()
	end)
	local var28 = useStyle()
	local theme = var28.Theme
	local font = var28.Font
	local var29 = if fFlagMoveInExperienceModeToEditProfile then useDispatch() else nil
	local var30 = useLocalization({
		About = textKeysModule.About,
		AboutModalCaption = textKeysModule.AboutModalCaption,
		AboutPlaceholder = textKeysModule.AboutPlaceholder,
		Username = textKeysModule.Username,
		UsernameCaption = {
			textKeysModule.UsernameDescription,
			icon = char,
			price = useLocalization({ thousand = textKeysModule.UsernamePrice }).thousand
		},
		EditBackground = if fFlagEditProfileBackgroundEnabled then textKeysModule.EditBackground else nil,
		SocialNetworks = if fFlagSocialNetworksInEditProfileIXPSetupEnabled and var26 then textKeysModule.SocialNetworks else nil,
		SocialNetworksCaption = if fFlagSocialNetworksInEditProfileIXPSetupEnabled and var26 and (p0.socialInfo and p0.socialInfo.visibility) then textKeysModule[p0.socialInfo.visibility] else nil
	})
	local var31 = useDisplayNameTextModule()
	local var32 = if fFlagMoveInExperienceModeToEditProfile then reactModule.useCallback(function() --[[ line: 142 ]]
		-- upvalues: var29 (ref), userProfileSettingsNetworkingModule (copy), p0 (ref)
		var29(userProfileSettingsNetworkingModule.SetUserProfileSettings.API({
			isInExperienceNameEnabled = not p0.isInExperienceNameEnabled
		})):andThen(function(p3) --[[ line: 145 ]]
			-- upvalues: p0 (copy)
			if p3.responseBody.successfullyUpdated then
				p0.onToggleInExperienceMode()
			end
		end)
	end, {
		p0.onToggleInExperienceMode,
		p0.isInExperienceNameEnabled,
		userProfileSettingsNetworkingModule.SetUserProfileSettings
	}) else nil
	local var33 = false
	local var34 = if fFlagSocialNetworksInEditProfileIXPSetupEnabled then reactModule.useMemo(function() --[[ line: 161 ]]
		-- upvalues: p0 (ref), constantsModule (copy), reactModule (copy), theme (ref), imageSetLabel (copy), images (copy), var33 (write)
		local t = {}
		
		if p0.socialInfo and p0.socialInfo.socialLinks then
			for i, v in ipairs(constantsModule.SocialMediaOrder) do
				t[v] = reactModule.createElement("ImageButton", {
					LayoutOrder = i,
					BackgroundTransparency = 0,
					Size = UDim2.new(0, 40, 0, 40),
					BackgroundColor3 = theme.BackgroundUIDefault.Color,
					[reactModule.Event.Activated] = if p0.openEditSocialLinksModal then function() --[[ line: 171 ]]
						-- upvalues: p0 (copy), i (ref)
						p0.openEditSocialLinksModal(i)
					end else nil
				}, {
					UICorner = reactModule.createElement("UICorner", { CornerRadius = UDim.new(0, 8) }),
					Icon = reactModule.createElement(imageSetLabel, {
						BackgroundTransparency = 1,
						Image = images[constantsModule.SocialMediaIcons[v]],
						ImageColor3 = theme.IconEmphasis.Color,
						ImageTransparency = if p0.socialInfo.socialLinks[v] then 0 else 0.5,
						Size = UDim2.new(0, 28, 0, 28),
						Position = UDim2.new(0, 6, 0, 6)
					})
				})
				
				if p0.socialInfo.socialLinks[v] then
					var33 = true
				end
			end
		end
		return t
	end, { p0.socialInfo, theme, p0.openEditSocialLinksModal }) else nil
	local var35 = if fFlagEditProfileFixFocusNavigationModule then reactModule.useCallback(function(p4) --[[ line: 200 ]]
		-- upvalues: var21 (ref), var22 (ref)
		if p4 and var21 == "Focus" then
			var22(p4)
		end
	end, {}) else nil
	local var36 = if var27 then nil else reactModule.createElement(editTextButtonModule, {
		layoutOrder = 2,
		expandSizing = false,
		transparentText = false,
		shouldShimmerName = p0.shouldShimmerName,
		title = var30.Username,
		description = var30.UsernameCaption,
		placeHolderText = "@" .. p0.username,
		localUserId = p0.localUserId,
		onActivated = p0.navigateToEditUsername
	})
	local fullBleed = fFlagAXEnableProfileTab and p0.fullBleed
	local createElement = reactModule.createElement
	local var38 = "Frame"
	local t = {
		BackgroundColor3 = var28.Theme.BackgroundDefault.Color,
		BackgroundTransparency = var28.Theme.BackgroundDefault.Transparency,
		Size = UDim2.new(1, 0, 1, 0),
		AutomaticSize = if editProfileScrollable then Enum.AutomaticSize.Y else nil,
		Position = if fullBleed then UDim2.fromScale(0, 0) else UDim2.fromScale(1, 0),
		AnchorPoint = if fullBleed then Vector2.new(0, 0) else Vector2.new(1, 0)
	}
	local t_1 = {
		SizeConstraint = reactModule.createElement("UISizeConstraint", {
			MaxSize = if fullBleed then Vector2.new(1e999, 1e999) else Vector2.new(640, 1e999)
		}),
		Layout = reactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical,
			HorizontalAlignment = Enum.HorizontalAlignment.Center,
			SortOrder = Enum.SortOrder.LayoutOrder,
			Padding = UDim.new(0, 24)
		}),
		TopPadding = reactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 0, 20)
		}),
		TopBar = reactModule.createElement(editProfileTopBarModule, { layoutOrder = 1, onClose = p0.onClose }),
		ProfilePicture = if fFlagEditProfileNavigateToAvatarModule or var23 then if fFlagEditProfileBackgroundEnabled then reactModule.createElement("Frame", {
			LayoutOrder = 2,
			BackgroundTransparency = 1,
			AutomaticSize = Enum.AutomaticSize.X,
			Size = UDim2.new(1, 0, 0, 200)
		}, {
			Bar = reactModule.createElement("Frame", {
				LayoutOrder = 1,
				ZIndex = 1,
				BackgroundTransparency = 1,
				Size = UDim2.new(1, 0, 0, 150)
			}, {
				ProfileBackgroundBanner = reactModule.createElement(editProfileBackgroundViewportModule, { height = 150 }),
				EditBackgroundButton = reactModule.createElement(foundationModule.View, {
					tag = "position-center-center anchor-center-center auto-xy",
					ZIndex = 2
				}, {
					Button = reactModule.createElement(button, {
						text = var30.EditBackground,
						onActivated = function() --[[ line: 275 ]]
							-- upvalues: var20 (ref), p0 (ref)
							var20.navigate(p0.profileScreens.EditProfileBackground)
						end,
						variant = foundationModule.Enums.ButtonVariant.SubEmphasis,
						size = buttonSize.Small
					})
				}),
				Picture = reactModule.createElement("ImageButton", {
					AnchorPoint = Vector2.new(0, 0.5),
					Position = UDim2.new(0, 24, 1, 0),
					Size = UDim2.new(0, 100, 0, 100),
					BackgroundTransparency = 0,
					BorderSizePixel = 10,
					ZIndex = 2,
					[reactModule.Event.Activated] = p0.openEditProfilePicture
				}, {
					UICorner = reactModule.createElement("UICorner", { CornerRadius = UDim.new(0.5, 0) }),
					UserAvatar = reactModule.createElement(loadableImage, {
						useShimmerAnimationWhileLoading = true,
						shouldHandleReloads = true,
						ZIndex = 2,
						Size = UDim2.new(1, 0, 1, 0),
						cornerRadius = UDim.new(0.5, 0),
						Image = getStandardSizeAvatarHeadShotRbxthumb(p0.localUserId),
						BackgroundColor3 = theme.PlaceHolder.Color,
						BackgroundTransparency = theme.PlaceHolder.Transparency
					}),
					Button = reactModule.createElement("ImageButton", {
						Size = UDim2.new(0, 32, 0, 32),
						AnchorPoint = Vector2.new(0.5, 1),
						Position = UDim2.new(0.5, 35, 1, 0),
						BackgroundTransparency = 0,
						BackgroundColor3 = theme.BackgroundUIDefault.Color,
						ZIndex = 3,
						[reactModule.Event.Activated] = p0.openEditProfilePicture
					}, {
						UICorner = reactModule.createElement("UICorner", { CornerRadius = UDim.new(0.5, 0) }),
						Icon = reactModule.createElement(imageSetLabel, {
							BackgroundTransparency = 1,
							ZIndex = 3,
							AnchorPoint = Vector2.new(0.5, 0.5),
							Image = images["icons/actions/edit/edit"],
							ImageColor3 = theme.IconEmphasis.Color,
							Size = UDim2.new(0, 22, 0, 22),
							Position = UDim2.fromScale(0.5, 0.5)
						})
					})
				})
			})
		}) else reactModule.createElement("Frame", {
			LayoutOrder = 2,
			BackgroundTransparency = 1,
			AutomaticSize = Enum.AutomaticSize.X,
			Size = UDim2.new(1, 0, 0, 100)
		}, {
			Picture = reactModule.createElement("ImageButton", {
				AnchorPoint = Vector2.new(0.5, 0.5),
				Position = UDim2.fromScale(0.5, 0.5),
				LayoutOrder = 1,
				Size = UDim2.new(0, 100, 0, 100),
				BackgroundTransparency = 1,
				BorderSizePixel = 10,
				[reactModule.Event.Activated] = p0.openEditProfilePicture
			}, {
				UICorner = reactModule.createElement("UICorner", { CornerRadius = UDim.new(0.5, 0) }),
				UserAvatar = reactModule.createElement(loadableImage, {
					useShimmerAnimationWhileLoading = true,
					shouldHandleReloads = true,
					Size = UDim2.new(1, 0, 1, 0),
					cornerRadius = UDim.new(0.5, 0),
					Image = getStandardSizeAvatarHeadShotRbxthumb(p0.localUserId),
					BackgroundColor3 = theme.PlaceHolder.Color,
					BackgroundTransparency = theme.PlaceHolder.Transparency
				})
			}),
			Button = reactModule.createElement("ImageButton", {
				Size = UDim2.new(0, 36, 0, 36),
				AnchorPoint = Vector2.new(0.5, 1),
				Position = UDim2.new(0.5, 80, 1, 0),
				BackgroundTransparency = theme.UIMuted.Transparency,
				BackgroundColor3 = theme.UIMuted.Color,
				[reactModule.Event.Activated] = p0.openEditProfilePicture
			}, {
				UICorner = reactModule.createElement("UICorner", { CornerRadius = UDim.new(0, 4) }),
				Icon = reactModule.createElement(imageSetLabel, {
					BackgroundTransparency = 1,
					AnchorPoint = Vector2.new(0.5, 0.5),
					Image = images["icons/menu/profilepicture_large"],
					ImageColor3 = theme.IconEmphasis.Color,
					Size = UDim2.new(0, 28, 0, 28),
					Position = UDim2.fromScale(0.5, 0.5)
				})
			})
		}) else nil
	}
	local createElement_1 = reactModule.createElement
	local var41 = "Frame"
	local t_2 = {
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		LayoutOrder = 3,
		AutomaticSize = Enum.AutomaticSize.Y,
		Size = UDim2.new(1, -48, 0, 0)
	}
	local t_3 = {
		Layout = reactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical,
			HorizontalAlignment = Enum.HorizontalAlignment.Center,
			SortOrder = Enum.SortOrder.LayoutOrder,
			Padding = UDim.new(0, 24)
		}),
		DisplayNameButton = reactModule.createElement(editTextButtonModule, {
			layoutOrder = 1,
			expandSizing = false,
			transparentText = false,
			shouldShimmerName = p0.shouldShimmerName,
			title = var31.displayNameTitle,
			description = var31.displayNameCaption,
			placeHolderText = p0.displayName,
			localUserId = p0.localUserId,
			onActivated = p0.openDisplayNameModal,
			forwardRef = var35
		}),
		UsernameButton = var36,
		Divider = reactModule.createElement("Frame", {
			LayoutOrder = 3,
			BorderSizePixel = 0,
			BackgroundColor3 = var28.Theme.Divider.Color,
			BackgroundTransparency = var28.Theme.Divider.Transparency,
			Size = UDim2.new(1, 0, 0, 1)
		})
	}
	local createElement_2 = reactModule.createElement
	local var44 = editTextButtonModule
	local t_4 = {
		layoutOrder = 4,
		shouldShimmerName = false,
		expandSizing = true,
		title = var30.About,
		description = var30.AboutModalCaption,
		placeHolderText = if p0.description == nil or p0.description == "" then var30.AboutPlaceholder else p0.description,
		localUserId = p0.localUserId,
		onActivated = p0.openEditDescription
	}
	
	if p0.description then
		var46 = p0.description == ""
	end
	local var47
	t_4.transparentText = var46
	t_3.AboutMeButton = createElement_2(var44, t_4)
	t_3.Divider2 = if fFlagSocialNetworksInEditProfileIXPSetupEnabled and var26 and not p0.isUnder13 then reactModule.createElement("Frame", {
		BorderSizePixel = 0,
		LayoutOrder = if fFlagMoveInExperienceModeToEditProfile then 8 else 5,
		BackgroundColor3 = var28.Theme.Divider.Color,
		BackgroundTransparency = var28.Theme.Divider.Transparency,
		Size = UDim2.new(1, 0, 0, 1)
	}) else nil
	
	if fFlagSocialNetworksInEditProfileIXPSetupEnabled and var26 and (p0.socialInfo and p0.socialInfo.socialLinks) and not p0.isUnder13 then
		var47 = reactModule.createElement
		local var48 = "Frame"
		local t_5 = {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			LayoutOrder = if fFlagMoveInExperienceModeToEditProfile then 9 else 6,
			AutomaticSize = Enum.AutomaticSize.Y,
			Size = UDim2.new(1, 0, 0, 0)
		}
		local t_6 = {
			Layout = reactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Vertical,
				HorizontalAlignment = Enum.HorizontalAlignment.Left,
				SortOrder = Enum.SortOrder.LayoutOrder,
				Padding = UDim.new(0, 12)
			}),
			UIPadding = reactModule.createElement("UIPadding", { PaddingBottom = UDim.new(0, 20) }),
			Title = reactModule.createElement(styledTextLabel, {
				layoutOrder = 1,
				text = var30.SocialNetworks,
				fontStyle = font.Header2,
				colorStyle = theme.TextEmphasis
			})
		}
		local var51 = nil
		t_6.Description = var51
		t_6.NetworkIcons = reactModule.createElement("Frame", {
			LayoutOrder = 3,
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 0, 40)
		}, {
			Layout = reactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Horizontal,
				SortOrder = Enum.SortOrder.LayoutOrder,
				Padding = UDim.new(0, 12)
			}),
			SocialNetworks = reactModule.createElement(reactModule.Fragment, {}, var34),
			Padding = reactModule.createElement("Frame", {
				LayoutOrder = 6,
				BackgroundTransparency = 1,
				Size = UDim2.new(1, -318, 0, 40)
			}),
			PencilIcon = reactModule.createElement("ImageButton", {
				LayoutOrder = 7,
				BackgroundTransparency = 0,
				Size = UDim2.new(0, 40, 0, 40),
				BackgroundColor3 = var28.Theme.BackgroundDefault.Color,
				BorderSizePixel = 0,
				[reactModule.Event.Activated] = if p0.openEditSocialLinksModal then function() --[[ line: 511 ]]
					-- upvalues: p0 (ref)
					p0.openEditSocialLinksModal(-1)
				end else nil
			}, {
				UICorner = reactModule.createElement("UICorner", { CornerRadius = UDim.new(0, 8) }),
				Icon = reactModule.createElement(imageSetLabel, {
					BackgroundTransparency = 1,
					Image = images["icons/actions/edit/edit"],
					ImageColor3 = theme.IconEmphasis.Color,
					Size = UDim2.new(0, 28, 0, 28),
					Position = UDim2.new(0, 6, 0, 6)
				})
			})
		})
		var47 = var47(var48, t_5, t_6)
	else
		var47 = nil
	end
	t_3.SocialNetworksButton = var47
	t_3.Divider3 = if fFlagMoveInExperienceModeToEditProfile and p0.canSeeInExperienceMode then reactModule.createElement("Frame", {
		LayoutOrder = 5,
		BorderSizePixel = 0,
		BackgroundColor3 = var28.Theme.Divider.Color,
		BackgroundTransparency = var28.Theme.Divider.Transparency,
		Size = UDim2.new(1, 0, 0, 1)
	}) else nil
	t_3.InExperienceModeSection = if fFlagMoveInExperienceModeToEditProfile and p0.canSeeInExperienceMode then reactModule.createElement("Frame", {
		LayoutOrder = 6,
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		AutomaticSize = Enum.AutomaticSize.Y,
		Size = UDim2.new(1, 0, 0, 0)
	}, {
		Layout = reactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical,
			SortOrder = Enum.SortOrder.LayoutOrder,
			Padding = UDim.new(0, 20)
		}),
		reactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			LayoutOrder = 1,
			AutomaticSize = Enum.AutomaticSize.Y,
			Size = UDim2.new(1, 0, 0, 0)
		}, {
			Layout = reactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Horizontal,
				HorizontalFlex = Enum.UIFlexAlignment.SpaceBetween,
				VerticalAlignment = Enum.VerticalAlignment.Center,
				SortOrder = Enum.SortOrder.LayoutOrder
			}),
			Title = reactModule.createElement("TextLabel", {
				BackgroundTransparency = 1,
				Text = "In-Experience Mode",
				Size = UDim2.fromOffset(0, 0),
				TextYAlignment = Enum.TextYAlignment.Center,
				TextXAlignment = Enum.TextXAlignment.Left,
				TextSize = font.BaseSize * font.Body.RelativeSize,
				AutomaticSize = Enum.AutomaticSize.XY,
				Font = font.Header2.Font,
				TextColor3 = theme.TextEmphasis.Color
			}),
			InExperienceNameToggleButton = reactModule.createElement(button, {
				LayoutOrder = 2,
				text = if p0.isInExperienceNameEnabled then "Stop" else "Start",
				onActivated = var32,
				size = buttonSize.XSmall
			})
		}),
		InExperienceModeButton = reactModule.createElement(editTextButtonModule, {
			layoutOrder = 2,
			description = "When in-experience mode is on, this temporary Name will replace your Name in most experiences.",
			transparentText = true,
			expandSizing = true,
			shouldShimmerName = false,
			placeHolderText = p0.inExperienceName or "",
			localUserId = p0.localUserId
		}),
		BottomPadding = reactModule.createElement("UIPadding", { PaddingBottom = UDim.new(0, 24) })
	}) else nil
	t_1.Content = createElement_1(var41, t_2, t_3)
	createElement = createElement(var38, t, t_1)
	
	return if editProfileScrollable then reactModule.createElement(verticalScrollView, {
		useAutomaticCanvasSize = true,
		canvasSizeY = UDim.new(),
		elasticBehavior = Enum.ElasticBehavior.Never
	}, { createElement }) else createElement
end