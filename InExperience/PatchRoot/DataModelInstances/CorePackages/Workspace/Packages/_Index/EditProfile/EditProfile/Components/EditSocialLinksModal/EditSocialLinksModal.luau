local editProfile = script:FindFirstAncestor("EditProfile")
local parent = editProfile.Parent
local reactModule = require(parent.React)
local UIBloxModule = require(parent.UIBlox)
local useStyle = UIBloxModule.Core.Style.useStyle
local editSocialNetworksItemModule = require(editProfile.Components.EditSocialNetworksItem)
local dropdownMenu = UIBloxModule.App.Menu.DropdownMenu
local verticalScrollView = UIBloxModule.App.Container.VerticalScrollView
local interactiveAlert = UIBloxModule.App.Dialog.Alert.InteractiveAlert
local buttonType = UIBloxModule.App.Button.Enum.ButtonType
local useLocalization = require(parent.Localization).Hooks.useLocalization
local textKeysModule = require(editProfile.Common.TextKeys)
local useScreenSize = require(parent.RobloxAppHooks).useScreenSize
local useNavigationProps = require(parent.RobloxAppNavigation).useNavigationProps
local constantsModule = require(editProfile.Common.Constants)
local _ = require(editProfile.Common.Types)
local socialNetworksInEditProfileIXPModule = require(editProfile.Flags.SocialNetworksInEditProfileIXP)
local fFlagEditProfileFixFocusNavigationModule = require(editProfile.Flags.FFlagEditProfileFixFocusNavigation)
local focusNavigatorWrapperModule = require(editProfile.Utils.FocusNavigatorWrapper)

return function(p0)
	-- upvalues: reactModule (ref), constantsModule (ref), useLocalization (ref), textKeysModule (ref), useNavigationProps (ref), socialNetworksInEditProfileIXPModule (ref), useStyle (ref), useScreenSize (ref), fFlagEditProfileFixFocusNavigationModule (ref), focusNavigatorWrapperModule (ref), verticalScrollView (ref), interactiveAlert (ref), editSocialNetworksItemModule (ref), dropdownMenu (ref), buttonType (ref)
	local var9, var10 = reactModule.useState(p0.socialNetworks.facebook)
	local var11, var12 = reactModule.useState(p0.socialNetworks.twitter)
	local var13, var14 = reactModule.useState(p0.socialNetworks.youtube)
	local var15, var16 = reactModule.useState(p0.socialNetworks.twitch)
	local var17, var18 = reactModule.useState(p0.socialNetworks.guilded)
	local var19, var20 = reactModule.useState(p0.socialNetworksVisbility)
	local var21, var22 = reactModule.useState(0)
	local var23 = var19 == constantsModule.VisibilitySettings.NoOne
	local var24 = useLocalization({
		cancelButtonText = textKeysModule.CancelButtonText,
		saveButtonText = textKeysModule.SaveButtonText,
		socialNetworks = textKeysModule.SocialNetworks,
		Facebook = textKeysModule.Facebook,
		X = textKeysModule.X,
		YouTube = textKeysModule.YouTube,
		Twitch = textKeysModule.Twitch,
		Guilded = textKeysModule.Guilded,
		FacebookExample = textKeysModule.FacebookExample,
		TwitterExample = textKeysModule.TwitterExample,
		YouTubeExample = textKeysModule.YouTubeExample,
		TwitchExample = textKeysModule.TwitchExample,
		GuildedExample = textKeysModule.GuildedExample,
		AllUsers = textKeysModule.AllUsersDropDown,
		Friends = textKeysModule.FriendsDropDown,
		NoOne = textKeysModule.NoOneDropDown,
		FriendsFollowingAndFollowers = textKeysModule.FriendsFollowingAndFollowersDropDown,
		FriendsAndFollowing = textKeysModule.FriendsAndFollowingDropDown,
		VisibleTo = textKeysModule.VisibleTo
	})
	local var25 = useNavigationProps(function(_, p1)
		return { focusOn = p1.focusOn }
	end)
	local var26 = socialNetworksInEditProfileIXPModule.useGetExperimentVariant({ isExposureEnabled = true })
	local var27 = useStyle()
	local font = var27.Font
	local theme = var27.Theme
	local var28 = font.BaseSize * font.Body.RelativeSize
	local var29 = useScreenSize()
	
	local function onSave()
		-- upvalues: p0 (ref), var19 (ref), var9 (ref), var11 (ref), var13 (ref), var15 (ref), var17 (ref)
		p0.saveOnActivated(var19, var9, var11, var13, var15, var17)
	end
	
	local var31 = reactModule.useCallback(function(p2)
		-- upvalues: var20 (ref)
		var20(p2)
	end, {})
	
	return if fFlagEditProfileFixFocusNavigationModule then focusNavigatorWrapperModule({ onClose = p0.cancelOnActivated }, {
		reactModule.createElement(verticalScrollView, {
			useAutomaticCanvasSize = true,
			canvasSizeY = UDim.new(),
			elasticBehavior = Enum.ElasticBehavior.Never
		}, {
			reactModule.createElement(interactiveAlert, {
				title = var24.socialNetworks,
				screenSize = var29,
				anchorPoint = Vector2.new(0.5, 0),
				position = UDim2.new(0.5, 0, 0, 30 + var21),
				middleContent = function()
					-- upvalues: reactModule (copy), editSocialNetworksItemModule (copy), var10 (ref), var24 (ref), var9 (ref), var26 (ref), socialNetworksInEditProfileIXPModule (copy), var25 (ref), var23 (ref), var22 (ref), var12 (ref), var11 (ref), var14 (ref), var13 (ref), var16 (ref), var15 (ref), var18 (ref), var17 (ref), font (ref), var28 (ref), theme (ref), dropdownMenu (copy), var19 (ref), var31 (ref), var29 (ref), constantsModule (copy)
					return reactModule.createElement("Frame", {
						BackgroundTransparency = 1,
						AutomaticSize = Enum.AutomaticSize.XY
					}, {
						UIListLayout = reactModule.createElement("UIListLayout", {
							FillDirection = Enum.FillDirection.Vertical,
							VerticalAlignment = Enum.VerticalAlignment.Center,
							HorizontalAlignment = Enum.HorizontalAlignment.Left,
							SortOrder = Enum.SortOrder.LayoutOrder
						}),
						Facebook = reactModule.createElement(editSocialNetworksItemModule, {
							textChanged = var10,
							networkTitle = var24.Facebook,
							initialText = var9,
							placeholderText = var24.FacebookExample,
							layoutOrder = if var26 == socialNetworksInEditProfileIXPModule.Variants.VisibilityLast then 1 else 2,
							focusOn = var25.focusOn == 1,
							isVisibilityNoOne = var23,
							setKeyboardOffset = var22
						}),
						Twitter = reactModule.createElement(editSocialNetworksItemModule, {
							textChanged = var12,
							networkTitle = var24.X,
							initialText = var11,
							placeholderText = var24.TwitterExample,
							layoutOrder = if var26 == socialNetworksInEditProfileIXPModule.Variants.VisibilityLast then 2 else 3,
							focusOn = var25.focusOn == 2,
							isVisibilityNoOne = var23,
							setKeyboardOffset = var22
						}),
						YouTube = reactModule.createElement(editSocialNetworksItemModule, {
							textChanged = var14,
							networkTitle = var24.YouTube,
							initialText = var13,
							placeholderText = var24.YouTubeExample,
							layoutOrder = if var26 == socialNetworksInEditProfileIXPModule.Variants.VisibilityLast then 3 else 4,
							focusOn = var25.focusOn == 3,
							isVisibilityNoOne = var23,
							setKeyboardOffset = var22
						}),
						Twitch = reactModule.createElement(editSocialNetworksItemModule, {
							textChanged = var16,
							networkTitle = var24.Twitch,
							initialText = var15,
							placeholderText = var24.TwitchExample,
							layoutOrder = if var26 == socialNetworksInEditProfileIXPModule.Variants.VisibilityLast then 4 else 5,
							focusOn = var25.focusOn == 4,
							isVisibilityNoOne = var23,
							setKeyboardOffset = var22
						}),
						Guilded = reactModule.createElement(editSocialNetworksItemModule, {
							textChanged = var18,
							networkTitle = var24.Guilded,
							initialText = var17,
							placeholderText = var24.GuildedExample,
							layoutOrder = if var26 == socialNetworksInEditProfileIXPModule.Variants.VisibilityLast then 5 else 6,
							focusOn = var25.focusOn == 5,
							isVisibilityNoOne = var23,
							setKeyboardOffset = var22
						}),
						Visibility = reactModule.createElement("Frame", {
							BackgroundTransparency = 1,
							ZIndex = 2,
							Size = UDim2.new(1, 0, 0, 0),
							AutomaticSize = Enum.AutomaticSize.Y,
							LayoutOrder = if var26 == socialNetworksInEditProfileIXPModule.Variants.VisibilityLast then 6 else 1
						}, {
							UIListLayout = reactModule.createElement("UIListLayout", {
								FillDirection = Enum.FillDirection.Vertical,
								SortOrder = Enum.SortOrder.LayoutOrder,
								Padding = UDim.new(0, 12)
							}),
							NetworkLabel = reactModule.createElement("TextLabel", {
								LayoutOrder = -1,
								BackgroundTransparency = 1,
								RichText = true,
								ZIndex = 0,
								Font = font.Body.Font,
								Text = var24.VisibleTo,
								TextSize = var28,
								TextColor3 = theme.TextDefault.Color,
								AutomaticSize = Enum.AutomaticSize.XY
							}),
							Dropdown = reactModule.createElement(dropdownMenu, {
								dropdownMenuListPositionFixed = true,
								showDropShadow = true,
								placeholder = var24[var19],
								onChange = var31,
								screenSize = Vector2.new(math.clamp(var29.X - 48, 272, 400) - 48, 640),
								height = UDim.new(0, var28 + 20),
								cellDatas = {
									{
										text = var24.AllUsers,
										key = constantsModule.VisibilitySettings.AllUsers
									},
									{
										text = var24.FriendsFollowingAndFollowers,
										key = constantsModule.VisibilitySettings.FriendsFollowingAndFollowers
									},
									{
										text = var24.FriendsAndFollowing,
										key = constantsModule.VisibilitySettings.FriendsAndFollowing
									},
									{
										text = var24.Friends,
										key = constantsModule.VisibilitySettings.Friends
									},
									{
										text = var24.NoOne,
										key = constantsModule.VisibilitySettings.NoOne
									}
								},
								defaultKey = var19
							})
						})
					})
				end,
				buttonStackInfo = {
					buttonHeight = 48,
					marginBetween = 6,
					buttons = {
						{
							buttonType = buttonType.Secondary,
							props = {
								onActivated = p0.cancelOnActivated,
								text = var24.cancelButtonText
							}
						},
						{
							buttonType = buttonType.PrimarySystem,
							props = { onActivated = onSave, text = var24.saveButtonText }
						}
					},
					forcedFillDirection = Enum.FillDirection.Horizontal
				}
			})
		})
	}) else reactModule.createElement(verticalScrollView, {
		useAutomaticCanvasSize = true,
		canvasSizeY = UDim.new(),
		elasticBehavior = Enum.ElasticBehavior.Never
	}, {
		reactModule.createElement(interactiveAlert, {
			title = var24.socialNetworks,
			screenSize = var29,
			anchorPoint = Vector2.new(0.5, 0),
			position = UDim2.new(0.5, 0, 0, 30 + var21),
			middleContent = function()
				-- upvalues: reactModule (copy), editSocialNetworksItemModule (copy), var10 (ref), var24 (ref), var9 (ref), var26 (ref), socialNetworksInEditProfileIXPModule (copy), var25 (ref), var23 (ref), var22 (ref), var12 (ref), var11 (ref), var14 (ref), var13 (ref), var16 (ref), var15 (ref), var18 (ref), var17 (ref), font (ref), var28 (ref), theme (ref), dropdownMenu (copy), var19 (ref), var31 (ref), var29 (ref), constantsModule (copy)
				return reactModule.createElement("Frame", {
					BackgroundTransparency = 1,
					AutomaticSize = Enum.AutomaticSize.XY
				}, {
					UIListLayout = reactModule.createElement("UIListLayout", {
						FillDirection = Enum.FillDirection.Vertical,
						VerticalAlignment = Enum.VerticalAlignment.Center,
						HorizontalAlignment = Enum.HorizontalAlignment.Left,
						SortOrder = Enum.SortOrder.LayoutOrder
					}),
					Facebook = reactModule.createElement(editSocialNetworksItemModule, {
						textChanged = var10,
						networkTitle = var24.Facebook,
						initialText = var9,
						placeholderText = var24.FacebookExample,
						layoutOrder = if var26 == socialNetworksInEditProfileIXPModule.Variants.VisibilityLast then 1 else 2,
						focusOn = var25.focusOn == 1,
						isVisibilityNoOne = var23,
						setKeyboardOffset = var22
					}),
					Twitter = reactModule.createElement(editSocialNetworksItemModule, {
						textChanged = var12,
						networkTitle = var24.X,
						initialText = var11,
						placeholderText = var24.TwitterExample,
						layoutOrder = if var26 == socialNetworksInEditProfileIXPModule.Variants.VisibilityLast then 2 else 3,
						focusOn = var25.focusOn == 2,
						isVisibilityNoOne = var23,
						setKeyboardOffset = var22
					}),
					YouTube = reactModule.createElement(editSocialNetworksItemModule, {
						textChanged = var14,
						networkTitle = var24.YouTube,
						initialText = var13,
						placeholderText = var24.YouTubeExample,
						layoutOrder = if var26 == socialNetworksInEditProfileIXPModule.Variants.VisibilityLast then 3 else 4,
						focusOn = var25.focusOn == 3,
						isVisibilityNoOne = var23,
						setKeyboardOffset = var22
					}),
					Twitch = reactModule.createElement(editSocialNetworksItemModule, {
						textChanged = var16,
						networkTitle = var24.Twitch,
						initialText = var15,
						placeholderText = var24.TwitchExample,
						layoutOrder = if var26 == socialNetworksInEditProfileIXPModule.Variants.VisibilityLast then 4 else 5,
						focusOn = var25.focusOn == 4,
						isVisibilityNoOne = var23,
						setKeyboardOffset = var22
					}),
					Guilded = reactModule.createElement(editSocialNetworksItemModule, {
						textChanged = var18,
						networkTitle = var24.Guilded,
						initialText = var17,
						placeholderText = var24.GuildedExample,
						layoutOrder = if var26 == socialNetworksInEditProfileIXPModule.Variants.VisibilityLast then 5 else 6,
						focusOn = var25.focusOn == 5,
						isVisibilityNoOne = var23,
						setKeyboardOffset = var22
					}),
					Visibility = reactModule.createElement("Frame", {
						BackgroundTransparency = 1,
						ZIndex = 2,
						Size = UDim2.new(1, 0, 0, 0),
						AutomaticSize = Enum.AutomaticSize.Y,
						LayoutOrder = if var26 == socialNetworksInEditProfileIXPModule.Variants.VisibilityLast then 6 else 1
					}, {
						UIListLayout = reactModule.createElement("UIListLayout", {
							FillDirection = Enum.FillDirection.Vertical,
							SortOrder = Enum.SortOrder.LayoutOrder,
							Padding = UDim.new(0, 12)
						}),
						NetworkLabel = reactModule.createElement("TextLabel", {
							LayoutOrder = -1,
							BackgroundTransparency = 1,
							RichText = true,
							ZIndex = 0,
							Font = font.Body.Font,
							Text = var24.VisibleTo,
							TextSize = var28,
							TextColor3 = theme.TextDefault.Color,
							AutomaticSize = Enum.AutomaticSize.XY
						}),
						Dropdown = reactModule.createElement(dropdownMenu, {
							dropdownMenuListPositionFixed = true,
							showDropShadow = true,
							placeholder = var24[var19],
							onChange = var31,
							screenSize = Vector2.new(math.clamp(var29.X - 48, 272, 400) - 48, 640),
							height = UDim.new(0, var28 + 20),
							cellDatas = {
								{
									text = var24.AllUsers,
									key = constantsModule.VisibilitySettings.AllUsers
								},
								{
									text = var24.FriendsFollowingAndFollowers,
									key = constantsModule.VisibilitySettings.FriendsFollowingAndFollowers
								},
								{
									text = var24.FriendsAndFollowing,
									key = constantsModule.VisibilitySettings.FriendsAndFollowing
								},
								{
									text = var24.Friends,
									key = constantsModule.VisibilitySettings.Friends
								},
								{
									text = var24.NoOne,
									key = constantsModule.VisibilitySettings.NoOne
								}
							},
							defaultKey = var19
						})
					})
				})
			end,
			buttonStackInfo = {
				buttonHeight = 48,
				marginBetween = 6,
				buttons = {
					{
						buttonType = buttonType.Secondary,
						props = {
							onActivated = p0.cancelOnActivated,
							text = var24.cancelButtonText
						}
					},
					{
						buttonType = buttonType.PrimarySystem,
						props = { onActivated = onSave, text = var24.saveButtonText }
					}
				},
				forcedFillDirection = Enum.FillDirection.Horizontal
			}
		})
	})
end