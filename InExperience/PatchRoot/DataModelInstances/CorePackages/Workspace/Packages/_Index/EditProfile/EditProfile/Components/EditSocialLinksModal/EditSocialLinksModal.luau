local EditProfile = script:FindFirstAncestor("EditProfile")
local Parent = EditProfile.Parent
local ReactModule = require(Parent.React)
local UIBloxModule = require(Parent.UIBlox)
local FoundationModule = require(Parent.Foundation)
local NormalizeFontFaceFunction = FoundationModule.Utility.normalizeFontFace
local FoundationFontFaceMigration = FoundationModule.Utility.Flags.FoundationFontFaceMigration
local UseStyleFunction = UIBloxModule.Core.Style.useStyle
local EditSocialNetworksItemModule = require(EditProfile.Components.EditSocialNetworksItem)
local DropdownMenu = UIBloxModule.App.Menu.DropdownMenu
local VerticalScrollView = UIBloxModule.App.Container.VerticalScrollView
local InteractiveAlert = UIBloxModule.App.Dialog.Alert.InteractiveAlert
local ButtonType = UIBloxModule.App.Button.Enum.ButtonType
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local TextKeysModule = require(EditProfile.Common.TextKeys)
local UseScreenSizeFunction = require(Parent.RobloxAppHooks).useScreenSize
local UseNavigationPropsFunction = require(Parent.RobloxAppNavigation).useNavigationProps
local ConstantsModule = require(EditProfile.Common.Constants)
local _ = require(EditProfile.Common.Types)
local SocialNetworksInEditProfileIXPModule = require(EditProfile.Flags.SocialNetworksInEditProfileIXP)
local FFlagEditProfileFixFocusNavigationModule = require(EditProfile.Flags.FFlagEditProfileFixFocusNavigation)
local FocusNavigatorWrapperModule = require(EditProfile.Utils.FocusNavigatorWrapper)

return function(p1) --[[ Line: 44 ]]
	-- upvalues: ReactModule (copy), ConstantsModule (copy), UseLocalizationFunction (copy), TextKeysModule (copy), UseNavigationPropsFunction (copy), SocialNetworksInEditProfileIXPModule (copy), UseStyleFunction (copy), UseScreenSizeFunction (copy), FFlagEditProfileFixFocusNavigationModule (copy), FocusNavigatorWrapperModule (copy), VerticalScrollView (copy), InteractiveAlert (copy), EditSocialNetworksItemModule (copy), FoundationFontFaceMigration (copy), NormalizeFontFaceFunction (copy), DropdownMenu (copy), ButtonType (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(p1.socialNetworks.facebook)
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(p1.socialNetworks.twitter)
	local UseStateResult3, UseStateResult2_2 = ReactModule.useState(p1.socialNetworks.youtube)
	local UseStateResult4, UseStateResult2_3 = ReactModule.useState(p1.socialNetworks.twitch)
	local UseStateResult5, UseStateResult2_4 = ReactModule.useState(p1.socialNetworks.guilded)
	local UseStateResult6, UseStateResult2_5 = ReactModule.useState(p1.socialNetworksVisbility)
	local UseStateResult7, UseStateResult2_6 = ReactModule.useState(0)
	local IsUseStateResultMatch = UseStateResult6 == ConstantsModule.VisibilitySettings.NoOne
	local UseLocalizationResult = UseLocalizationFunction({
		cancelButtonText = TextKeysModule.CancelButtonText,
		saveButtonText = TextKeysModule.SaveButtonText,
		socialNetworks = TextKeysModule.SocialNetworks,
		Facebook = TextKeysModule.Facebook,
		X = TextKeysModule.X,
		YouTube = TextKeysModule.YouTube,
		Twitch = TextKeysModule.Twitch,
		Guilded = TextKeysModule.Guilded,
		FacebookExample = TextKeysModule.FacebookExample,
		TwitterExample = TextKeysModule.TwitterExample,
		YouTubeExample = TextKeysModule.YouTubeExample,
		TwitchExample = TextKeysModule.TwitchExample,
		GuildedExample = TextKeysModule.GuildedExample,
		AllUsers = TextKeysModule.AllUsersDropDown,
		Friends = TextKeysModule.FriendsDropDown,
		NoOne = TextKeysModule.NoOneDropDown,
		FriendsFollowingAndFollowers = TextKeysModule.FriendsFollowingAndFollowersDropDown,
		FriendsAndFollowing = TextKeysModule.FriendsAndFollowingDropDown,
		VisibleTo = TextKeysModule.VisibleTo
	})
	local UseNavigationPropsResult = UseNavigationPropsFunction(function(_, p2) --[[ Line: 74 ]]
		return { focusOn = p2.focusOn }
	end)
	local UseGetExperimentVariantResult = SocialNetworksInEditProfileIXPModule.useGetExperimentVariant({ isExposureEnabled = true })
	local UseStyleResult = UseStyleFunction()
	local UseStyleResultFont = UseStyleResult.Font
	local Theme = UseStyleResult.Theme
	local ScaledBaseSize = UseStyleResultFont.BaseSize * UseStyleResultFont.Body.RelativeSize
	local UseScreenSizeResult = UseScreenSizeFunction()
	
	local function onSave() --[[ Line: 88 ]]
		-- upvalues: p1 (copy), UseStateResult6 (copy), UseStateResult (copy), UseStateResult1 (copy), UseStateResult3 (copy), UseStateResult4 (copy), UseStateResult5 (copy)
		p1.saveOnActivated(UseStateResult6, UseStateResult, UseStateResult1, UseStateResult3, UseStateResult4, UseStateResult5)
	end
	
	local UseResult = ReactModule.useCallback(function(p2) --[[ Line: 92 ]]
		-- upvalues: UseStateResult2_5 (copy)
		UseStateResult2_5(p2)
	end, {})
	
	return if FFlagEditProfileFixFocusNavigationModule then FocusNavigatorWrapperModule({ onClose = p1.cancelOnActivated }, {
		ReactModule.createElement(VerticalScrollView, {
			useAutomaticCanvasSize = true,
			canvasSizeY = UDim.new(),
			elasticBehavior = Enum.ElasticBehavior.Never
		}, {
			ReactModule.createElement(InteractiveAlert, {
				title = UseLocalizationResult.socialNetworks,
				screenSize = UseScreenSizeResult,
				anchorPoint = Vector2.new(0.5, 0),
				position = UDim2.new(0.5, 0, 0, 30 + UseStateResult7),
				middleContent = function() --[[ Line: 110 ]]
					-- upvalues: ReactModule (upval), EditSocialNetworksItemModule (upval), UseStateResult2 (copy), UseLocalizationResult (copy), UseStateResult (copy), UseGetExperimentVariantResult (copy), SocialNetworksInEditProfileIXPModule (upval), UseNavigationPropsResult (copy), IsUseStateResultMatch (copy), UseStateResult2_6 (copy), UseStateResult2_1 (copy), UseStateResult1 (copy), UseStateResult2_2 (copy), UseStateResult3 (copy), UseStateResult2_3 (copy), UseStateResult4 (copy), UseStateResult2_4 (copy), UseStateResult5 (copy), FoundationFontFaceMigration (upval), UseStyleResultFont (copy), NormalizeFontFaceFunction (upval), UseStyleResult (copy), ScaledBaseSize (copy), Theme (copy), DropdownMenu (upval), UseStateResult6 (copy), UseResult (copy), UseScreenSizeResult (copy), ConstantsModule (upval)
					return ReactModule.createElement("Frame", {
						BackgroundTransparency = 1,
						AutomaticSize = Enum.AutomaticSize.XY
					}, {
						UIListLayout = ReactModule.createElement("UIListLayout", {
							FillDirection = Enum.FillDirection.Vertical,
							VerticalAlignment = Enum.VerticalAlignment.Center,
							HorizontalAlignment = Enum.HorizontalAlignment.Left,
							SortOrder = Enum.SortOrder.LayoutOrder
						}),
						Facebook = ReactModule.createElement(EditSocialNetworksItemModule, {
							textChanged = UseStateResult2,
							networkTitle = UseLocalizationResult.Facebook,
							initialText = UseStateResult,
							placeholderText = UseLocalizationResult.FacebookExample,
							layoutOrder = if UseGetExperimentVariantResult == SocialNetworksInEditProfileIXPModule.Variants.VisibilityLast then 1 else 2,
							focusOn = UseNavigationPropsResult.focusOn == 1,
							isVisibilityNoOne = IsUseStateResultMatch,
							setKeyboardOffset = UseStateResult2_6
						}),
						Twitter = ReactModule.createElement(EditSocialNetworksItemModule, {
							textChanged = UseStateResult2_1,
							networkTitle = UseLocalizationResult.X,
							initialText = UseStateResult1,
							placeholderText = UseLocalizationResult.TwitterExample,
							layoutOrder = if UseGetExperimentVariantResult == SocialNetworksInEditProfileIXPModule.Variants.VisibilityLast then 2 else 3,
							focusOn = UseNavigationPropsResult.focusOn == 2,
							isVisibilityNoOne = IsUseStateResultMatch,
							setKeyboardOffset = UseStateResult2_6
						}),
						YouTube = ReactModule.createElement(EditSocialNetworksItemModule, {
							textChanged = UseStateResult2_2,
							networkTitle = UseLocalizationResult.YouTube,
							initialText = UseStateResult3,
							placeholderText = UseLocalizationResult.YouTubeExample,
							layoutOrder = if UseGetExperimentVariantResult == SocialNetworksInEditProfileIXPModule.Variants.VisibilityLast then 3 else 4,
							focusOn = UseNavigationPropsResult.focusOn == 3,
							isVisibilityNoOne = IsUseStateResultMatch,
							setKeyboardOffset = UseStateResult2_6
						}),
						Twitch = ReactModule.createElement(EditSocialNetworksItemModule, {
							textChanged = UseStateResult2_3,
							networkTitle = UseLocalizationResult.Twitch,
							initialText = UseStateResult4,
							placeholderText = UseLocalizationResult.TwitchExample,
							layoutOrder = if UseGetExperimentVariantResult == SocialNetworksInEditProfileIXPModule.Variants.VisibilityLast then 4 else 5,
							focusOn = UseNavigationPropsResult.focusOn == 4,
							isVisibilityNoOne = IsUseStateResultMatch,
							setKeyboardOffset = UseStateResult2_6
						}),
						Guilded = ReactModule.createElement(EditSocialNetworksItemModule, {
							textChanged = UseStateResult2_4,
							networkTitle = UseLocalizationResult.Guilded,
							initialText = UseStateResult5,
							placeholderText = UseLocalizationResult.GuildedExample,
							layoutOrder = if UseGetExperimentVariantResult == SocialNetworksInEditProfileIXPModule.Variants.VisibilityLast then 5 else 6,
							focusOn = UseNavigationPropsResult.focusOn == 5,
							isVisibilityNoOne = IsUseStateResultMatch,
							setKeyboardOffset = UseStateResult2_6
						}),
						Visibility = ReactModule.createElement("Frame", {
							BackgroundTransparency = 1,
							ZIndex = 2,
							Size = UDim2.new(1, 0, 0, 0),
							AutomaticSize = Enum.AutomaticSize.Y,
							LayoutOrder = if UseGetExperimentVariantResult == SocialNetworksInEditProfileIXPModule.Variants.VisibilityLast then 6 else 1
						}, {
							UIListLayout = ReactModule.createElement("UIListLayout", {
								FillDirection = Enum.FillDirection.Vertical,
								SortOrder = Enum.SortOrder.LayoutOrder,
								Padding = UDim.new(0, 12)
							}),
							NetworkLabel = ReactModule.createElement("TextLabel", {
								LayoutOrder = -1,
								BackgroundTransparency = 1,
								RichText = true,
								ZIndex = 0,
								Font = if FoundationFontFaceMigration then nil else UseStyleResultFont.Body.Font,
								FontFace = if FoundationFontFaceMigration then NormalizeFontFaceFunction(UseStyleResult.Tokens.Typography.BodyLarge.Font) else nil,
								Text = UseLocalizationResult.VisibleTo,
								TextSize = ScaledBaseSize,
								TextColor3 = Theme.TextDefault.Color,
								AutomaticSize = Enum.AutomaticSize.XY
							}),
							Dropdown = ReactModule.createElement(DropdownMenu, {
								dropdownMenuListPositionFixed = true,
								showDropShadow = true,
								placeholder = UseLocalizationResult[UseStateResult6],
								onChange = UseResult,
								screenSize = Vector2.new(math.clamp(UseScreenSizeResult.X - 48, 272, 400) - 48, 640),
								height = UDim.new(0, ScaledBaseSize + 20),
								cellDatas = {
									{
										text = UseLocalizationResult.AllUsers,
										key = ConstantsModule.VisibilitySettings.AllUsers
									},
									{
										text = UseLocalizationResult.FriendsFollowingAndFollowers,
										key = ConstantsModule.VisibilitySettings.FriendsFollowingAndFollowers
									},
									{
										text = UseLocalizationResult.FriendsAndFollowing,
										key = ConstantsModule.VisibilitySettings.FriendsAndFollowing
									},
									{
										text = UseLocalizationResult.Friends,
										key = ConstantsModule.VisibilitySettings.Friends
									},
									{
										text = UseLocalizationResult.NoOne,
										key = ConstantsModule.VisibilitySettings.NoOne
									}
								},
								defaultKey = UseStateResult6
							})
						})
					})
				end,
				buttonStackInfo = {
					buttonHeight = 48,
					marginBetween = 6,
					buttons = {
						{
							buttonType = ButtonType.Secondary,
							props = {
								onActivated = p1.cancelOnActivated,
								text = UseLocalizationResult.cancelButtonText
							}
						},
						{
							buttonType = ButtonType.PrimarySystem,
							props = {
								onActivated = onSave,
								text = UseLocalizationResult.saveButtonText
							}
						}
					},
					forcedFillDirection = Enum.FillDirection.Horizontal
				}
			})
		})
	}) else ReactModule.createElement(VerticalScrollView, {
		useAutomaticCanvasSize = true,
		canvasSizeY = UDim.new(),
		elasticBehavior = Enum.ElasticBehavior.Never
	}, {
		ReactModule.createElement(InteractiveAlert, {
			title = UseLocalizationResult.socialNetworks,
			screenSize = UseScreenSizeResult,
			anchorPoint = Vector2.new(0.5, 0),
			position = UDim2.new(0.5, 0, 0, 30 + UseStateResult7),
			middleContent = function() --[[ Line: 296 ]]
				-- upvalues: ReactModule (upval), EditSocialNetworksItemModule (upval), UseStateResult2 (copy), UseLocalizationResult (copy), UseStateResult (copy), UseGetExperimentVariantResult (copy), SocialNetworksInEditProfileIXPModule (upval), UseNavigationPropsResult (copy), IsUseStateResultMatch (copy), UseStateResult2_6 (copy), UseStateResult2_1 (copy), UseStateResult1 (copy), UseStateResult2_2 (copy), UseStateResult3 (copy), UseStateResult2_3 (copy), UseStateResult4 (copy), UseStateResult2_4 (copy), UseStateResult5 (copy), FoundationFontFaceMigration (upval), UseStyleResultFont (copy), NormalizeFontFaceFunction (upval), UseStyleResult (copy), ScaledBaseSize (copy), Theme (copy), DropdownMenu (upval), UseStateResult6 (copy), UseResult (copy), UseScreenSizeResult (copy), ConstantsModule (upval)
				return ReactModule.createElement("Frame", {
					BackgroundTransparency = 1,
					AutomaticSize = Enum.AutomaticSize.XY
				}, {
					UIListLayout = ReactModule.createElement("UIListLayout", {
						FillDirection = Enum.FillDirection.Vertical,
						VerticalAlignment = Enum.VerticalAlignment.Center,
						HorizontalAlignment = Enum.HorizontalAlignment.Left,
						SortOrder = Enum.SortOrder.LayoutOrder
					}),
					Facebook = ReactModule.createElement(EditSocialNetworksItemModule, {
						textChanged = UseStateResult2,
						networkTitle = UseLocalizationResult.Facebook,
						initialText = UseStateResult,
						placeholderText = UseLocalizationResult.FacebookExample,
						layoutOrder = if UseGetExperimentVariantResult == SocialNetworksInEditProfileIXPModule.Variants.VisibilityLast then 1 else 2,
						focusOn = UseNavigationPropsResult.focusOn == 1,
						isVisibilityNoOne = IsUseStateResultMatch,
						setKeyboardOffset = UseStateResult2_6
					}),
					Twitter = ReactModule.createElement(EditSocialNetworksItemModule, {
						textChanged = UseStateResult2_1,
						networkTitle = UseLocalizationResult.X,
						initialText = UseStateResult1,
						placeholderText = UseLocalizationResult.TwitterExample,
						layoutOrder = if UseGetExperimentVariantResult == SocialNetworksInEditProfileIXPModule.Variants.VisibilityLast then 2 else 3,
						focusOn = UseNavigationPropsResult.focusOn == 2,
						isVisibilityNoOne = IsUseStateResultMatch,
						setKeyboardOffset = UseStateResult2_6
					}),
					YouTube = ReactModule.createElement(EditSocialNetworksItemModule, {
						textChanged = UseStateResult2_2,
						networkTitle = UseLocalizationResult.YouTube,
						initialText = UseStateResult3,
						placeholderText = UseLocalizationResult.YouTubeExample,
						layoutOrder = if UseGetExperimentVariantResult == SocialNetworksInEditProfileIXPModule.Variants.VisibilityLast then 3 else 4,
						focusOn = UseNavigationPropsResult.focusOn == 3,
						isVisibilityNoOne = IsUseStateResultMatch,
						setKeyboardOffset = UseStateResult2_6
					}),
					Twitch = ReactModule.createElement(EditSocialNetworksItemModule, {
						textChanged = UseStateResult2_3,
						networkTitle = UseLocalizationResult.Twitch,
						initialText = UseStateResult4,
						placeholderText = UseLocalizationResult.TwitchExample,
						layoutOrder = if UseGetExperimentVariantResult == SocialNetworksInEditProfileIXPModule.Variants.VisibilityLast then 4 else 5,
						focusOn = UseNavigationPropsResult.focusOn == 4,
						isVisibilityNoOne = IsUseStateResultMatch,
						setKeyboardOffset = UseStateResult2_6
					}),
					Guilded = ReactModule.createElement(EditSocialNetworksItemModule, {
						textChanged = UseStateResult2_4,
						networkTitle = UseLocalizationResult.Guilded,
						initialText = UseStateResult5,
						placeholderText = UseLocalizationResult.GuildedExample,
						layoutOrder = if UseGetExperimentVariantResult == SocialNetworksInEditProfileIXPModule.Variants.VisibilityLast then 5 else 6,
						focusOn = UseNavigationPropsResult.focusOn == 5,
						isVisibilityNoOne = IsUseStateResultMatch,
						setKeyboardOffset = UseStateResult2_6
					}),
					Visibility = ReactModule.createElement("Frame", {
						BackgroundTransparency = 1,
						ZIndex = 2,
						Size = UDim2.new(1, 0, 0, 0),
						AutomaticSize = Enum.AutomaticSize.Y,
						LayoutOrder = if UseGetExperimentVariantResult == SocialNetworksInEditProfileIXPModule.Variants.VisibilityLast then 6 else 1
					}, {
						UIListLayout = ReactModule.createElement("UIListLayout", {
							FillDirection = Enum.FillDirection.Vertical,
							SortOrder = Enum.SortOrder.LayoutOrder,
							Padding = UDim.new(0, 12)
						}),
						NetworkLabel = ReactModule.createElement("TextLabel", {
							LayoutOrder = -1,
							BackgroundTransparency = 1,
							RichText = true,
							ZIndex = 0,
							Font = if FoundationFontFaceMigration then nil else UseStyleResultFont.Body.Font,
							FontFace = if FoundationFontFaceMigration then NormalizeFontFaceFunction(UseStyleResult.Tokens.Typography.BodyLarge.Font) else nil,
							Text = UseLocalizationResult.VisibleTo,
							TextSize = ScaledBaseSize,
							TextColor3 = Theme.TextDefault.Color,
							AutomaticSize = Enum.AutomaticSize.XY
						}),
						Dropdown = ReactModule.createElement(DropdownMenu, {
							dropdownMenuListPositionFixed = true,
							showDropShadow = true,
							placeholder = UseLocalizationResult[UseStateResult6],
							onChange = UseResult,
							screenSize = Vector2.new(math.clamp(UseScreenSizeResult.X - 48, 272, 400) - 48, 640),
							height = UDim.new(0, ScaledBaseSize + 20),
							cellDatas = {
								{
									text = UseLocalizationResult.AllUsers,
									key = ConstantsModule.VisibilitySettings.AllUsers
								},
								{
									text = UseLocalizationResult.FriendsFollowingAndFollowers,
									key = ConstantsModule.VisibilitySettings.FriendsFollowingAndFollowers
								},
								{
									text = UseLocalizationResult.FriendsAndFollowing,
									key = ConstantsModule.VisibilitySettings.FriendsAndFollowing
								},
								{
									text = UseLocalizationResult.Friends,
									key = ConstantsModule.VisibilitySettings.Friends
								},
								{
									text = UseLocalizationResult.NoOne,
									key = ConstantsModule.VisibilitySettings.NoOne
								}
							},
							defaultKey = UseStateResult6
						})
					})
				})
			end,
			buttonStackInfo = {
				buttonHeight = 48,
				marginBetween = 6,
				buttons = {
					{
						buttonType = ButtonType.Secondary,
						props = {
							onActivated = p1.cancelOnActivated,
							text = UseLocalizationResult.cancelButtonText
						}
					},
					{
						buttonType = ButtonType.PrimarySystem,
						props = {
							onActivated = onSave,
							text = UseLocalizationResult.saveButtonText
						}
					}
				},
				forcedFillDirection = Enum.FillDirection.Horizontal
			}
		})
	})
end