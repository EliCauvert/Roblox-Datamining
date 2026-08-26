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

return function(p1)
	-- upvalues: reactModule (ref), constantsModule (ref), useLocalization (ref), textKeysModule (ref), useNavigationProps (ref), socialNetworksInEditProfileIXPModule (ref), useStyle (ref), useScreenSize (ref), fFlagEditProfileFixFocusNavigationModule (ref), focusNavigatorWrapperModule (ref), verticalScrollView (ref), interactiveAlert (ref), editSocialNetworksItemModule (ref), dropdownMenu (ref), buttonType (ref)
	local var1, var2 = reactModule.useState(p1.socialNetworks.facebook)
	local var3, var4 = reactModule.useState(p1.socialNetworks.twitter)
	local var5, var6 = reactModule.useState(p1.socialNetworks.youtube)
	local var7, var8 = reactModule.useState(p1.socialNetworks.twitch)
	local var9, var10 = reactModule.useState(p1.socialNetworks.guilded)
	local var11, var12 = reactModule.useState(p1.socialNetworksVisbility)
	local var13, var14 = reactModule.useState(0)
	local var15 = var11 == constantsModule.VisibilitySettings.NoOne
	local var16 = useLocalization({
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
	local var17 = useNavigationProps(function(_, p2)
		return { focusOn = p2.focusOn }
	end)
	local var18 = socialNetworksInEditProfileIXPModule.useGetExperimentVariant({ isExposureEnabled = true })
	local var19 = useStyle()
	local font = var19.Font
	local theme = var19.Theme
	local var20 = font.BaseSize * font.Body.RelativeSize
	local var21 = useScreenSize()
	
	local function onSave()
		-- upvalues: p1 (ref), var11 (ref), var1 (ref), var3 (ref), var5 (ref), var7 (ref), var9 (ref)
		p1.saveOnActivated(var11, var1, var3, var5, var7, var9)
	end
	
	local var22 = reactModule.useCallback(function(p2)
		-- upvalues: var12 (ref)
		var12(p2)
	end, {})
	
	return if fFlagEditProfileFixFocusNavigationModule then focusNavigatorWrapperModule({ onClose = p1.cancelOnActivated }, {
		reactModule.createElement(verticalScrollView, {
			useAutomaticCanvasSize = true,
			canvasSizeY = UDim.new(),
			elasticBehavior = Enum.ElasticBehavior.Never
		}, {
			reactModule.createElement(interactiveAlert, {
				title = var16.socialNetworks,
				screenSize = var21,
				anchorPoint = Vector2.new(0.5, 0),
				position = UDim2.new(0.5, 0, 0, 30 + var13),
				middleContent = function()
					-- upvalues: reactModule (copy), editSocialNetworksItemModule (copy), var2 (ref), var16 (ref), var1 (ref), var18 (ref), socialNetworksInEditProfileIXPModule (copy), var17 (ref), var15 (ref), var14 (ref), var4 (ref), var3 (ref), var6 (ref), var5 (ref), var8 (ref), var7 (ref), var10 (ref), var9 (ref), font (ref), var20 (ref), theme (ref), dropdownMenu (copy), var11 (ref), var22 (ref), var21 (ref), constantsModule (copy)
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
							textChanged = var2,
							networkTitle = var16.Facebook,
							initialText = var1,
							placeholderText = var16.FacebookExample,
							layoutOrder = if var18 == socialNetworksInEditProfileIXPModule.Variants.VisibilityLast then 1 else 2,
							focusOn = var17.focusOn == 1,
							isVisibilityNoOne = var15,
							setKeyboardOffset = var14
						}),
						Twitter = reactModule.createElement(editSocialNetworksItemModule, {
							textChanged = var4,
							networkTitle = var16.X,
							initialText = var3,
							placeholderText = var16.TwitterExample,
							layoutOrder = if var18 == socialNetworksInEditProfileIXPModule.Variants.VisibilityLast then 2 else 3,
							focusOn = var17.focusOn == 2,
							isVisibilityNoOne = var15,
							setKeyboardOffset = var14
						}),
						YouTube = reactModule.createElement(editSocialNetworksItemModule, {
							textChanged = var6,
							networkTitle = var16.YouTube,
							initialText = var5,
							placeholderText = var16.YouTubeExample,
							layoutOrder = if var18 == socialNetworksInEditProfileIXPModule.Variants.VisibilityLast then 3 else 4,
							focusOn = var17.focusOn == 3,
							isVisibilityNoOne = var15,
							setKeyboardOffset = var14
						}),
						Twitch = reactModule.createElement(editSocialNetworksItemModule, {
							textChanged = var8,
							networkTitle = var16.Twitch,
							initialText = var7,
							placeholderText = var16.TwitchExample,
							layoutOrder = if var18 == socialNetworksInEditProfileIXPModule.Variants.VisibilityLast then 4 else 5,
							focusOn = var17.focusOn == 4,
							isVisibilityNoOne = var15,
							setKeyboardOffset = var14
						}),
						Guilded = reactModule.createElement(editSocialNetworksItemModule, {
							textChanged = var10,
							networkTitle = var16.Guilded,
							initialText = var9,
							placeholderText = var16.GuildedExample,
							layoutOrder = if var18 == socialNetworksInEditProfileIXPModule.Variants.VisibilityLast then 5 else 6,
							focusOn = var17.focusOn == 5,
							isVisibilityNoOne = var15,
							setKeyboardOffset = var14
						}),
						Visibility = reactModule.createElement("Frame", {
							BackgroundTransparency = 1,
							ZIndex = 2,
							Size = UDim2.new(1, 0, 0, 0),
							AutomaticSize = Enum.AutomaticSize.Y,
							LayoutOrder = if var18 == socialNetworksInEditProfileIXPModule.Variants.VisibilityLast then 6 else 1
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
								Text = var16.VisibleTo,
								TextSize = var20,
								TextColor3 = theme.TextDefault.Color,
								AutomaticSize = Enum.AutomaticSize.XY
							}),
							Dropdown = reactModule.createElement(dropdownMenu, {
								dropdownMenuListPositionFixed = true,
								showDropShadow = true,
								placeholder = var16[var11],
								onChange = var22,
								screenSize = Vector2.new(math.clamp(var21.X - 48, 272, 400) - 48, 640),
								height = UDim.new(0, var20 + 20),
								cellDatas = {
									{
										text = var16.AllUsers,
										key = constantsModule.VisibilitySettings.AllUsers
									},
									{
										text = var16.FriendsFollowingAndFollowers,
										key = constantsModule.VisibilitySettings.FriendsFollowingAndFollowers
									},
									{
										text = var16.FriendsAndFollowing,
										key = constantsModule.VisibilitySettings.FriendsAndFollowing
									},
									{
										text = var16.Friends,
										key = constantsModule.VisibilitySettings.Friends
									},
									{
										text = var16.NoOne,
										key = constantsModule.VisibilitySettings.NoOne
									}
								},
								defaultKey = var11
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
								onActivated = p1.cancelOnActivated,
								text = var16.cancelButtonText
							}
						},
						{
							buttonType = buttonType.PrimarySystem,
							props = { onActivated = onSave, text = var16.saveButtonText }
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
			title = var16.socialNetworks,
			screenSize = var21,
			anchorPoint = Vector2.new(0.5, 0),
			position = UDim2.new(0.5, 0, 0, 30 + var13),
			middleContent = function()
				-- upvalues: reactModule (copy), editSocialNetworksItemModule (copy), var2 (ref), var16 (ref), var1 (ref), var18 (ref), socialNetworksInEditProfileIXPModule (copy), var17 (ref), var15 (ref), var14 (ref), var4 (ref), var3 (ref), var6 (ref), var5 (ref), var8 (ref), var7 (ref), var10 (ref), var9 (ref), font (ref), var20 (ref), theme (ref), dropdownMenu (copy), var11 (ref), var22 (ref), var21 (ref), constantsModule (copy)
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
						textChanged = var2,
						networkTitle = var16.Facebook,
						initialText = var1,
						placeholderText = var16.FacebookExample,
						layoutOrder = if var18 == socialNetworksInEditProfileIXPModule.Variants.VisibilityLast then 1 else 2,
						focusOn = var17.focusOn == 1,
						isVisibilityNoOne = var15,
						setKeyboardOffset = var14
					}),
					Twitter = reactModule.createElement(editSocialNetworksItemModule, {
						textChanged = var4,
						networkTitle = var16.X,
						initialText = var3,
						placeholderText = var16.TwitterExample,
						layoutOrder = if var18 == socialNetworksInEditProfileIXPModule.Variants.VisibilityLast then 2 else 3,
						focusOn = var17.focusOn == 2,
						isVisibilityNoOne = var15,
						setKeyboardOffset = var14
					}),
					YouTube = reactModule.createElement(editSocialNetworksItemModule, {
						textChanged = var6,
						networkTitle = var16.YouTube,
						initialText = var5,
						placeholderText = var16.YouTubeExample,
						layoutOrder = if var18 == socialNetworksInEditProfileIXPModule.Variants.VisibilityLast then 3 else 4,
						focusOn = var17.focusOn == 3,
						isVisibilityNoOne = var15,
						setKeyboardOffset = var14
					}),
					Twitch = reactModule.createElement(editSocialNetworksItemModule, {
						textChanged = var8,
						networkTitle = var16.Twitch,
						initialText = var7,
						placeholderText = var16.TwitchExample,
						layoutOrder = if var18 == socialNetworksInEditProfileIXPModule.Variants.VisibilityLast then 4 else 5,
						focusOn = var17.focusOn == 4,
						isVisibilityNoOne = var15,
						setKeyboardOffset = var14
					}),
					Guilded = reactModule.createElement(editSocialNetworksItemModule, {
						textChanged = var10,
						networkTitle = var16.Guilded,
						initialText = var9,
						placeholderText = var16.GuildedExample,
						layoutOrder = if var18 == socialNetworksInEditProfileIXPModule.Variants.VisibilityLast then 5 else 6,
						focusOn = var17.focusOn == 5,
						isVisibilityNoOne = var15,
						setKeyboardOffset = var14
					}),
					Visibility = reactModule.createElement("Frame", {
						BackgroundTransparency = 1,
						ZIndex = 2,
						Size = UDim2.new(1, 0, 0, 0),
						AutomaticSize = Enum.AutomaticSize.Y,
						LayoutOrder = if var18 == socialNetworksInEditProfileIXPModule.Variants.VisibilityLast then 6 else 1
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
							Text = var16.VisibleTo,
							TextSize = var20,
							TextColor3 = theme.TextDefault.Color,
							AutomaticSize = Enum.AutomaticSize.XY
						}),
						Dropdown = reactModule.createElement(dropdownMenu, {
							dropdownMenuListPositionFixed = true,
							showDropShadow = true,
							placeholder = var16[var11],
							onChange = var22,
							screenSize = Vector2.new(math.clamp(var21.X - 48, 272, 400) - 48, 640),
							height = UDim.new(0, var20 + 20),
							cellDatas = {
								{
									text = var16.AllUsers,
									key = constantsModule.VisibilitySettings.AllUsers
								},
								{
									text = var16.FriendsFollowingAndFollowers,
									key = constantsModule.VisibilitySettings.FriendsFollowingAndFollowers
								},
								{
									text = var16.FriendsAndFollowing,
									key = constantsModule.VisibilitySettings.FriendsAndFollowing
								},
								{
									text = var16.Friends,
									key = constantsModule.VisibilitySettings.Friends
								},
								{
									text = var16.NoOne,
									key = constantsModule.VisibilitySettings.NoOne
								}
							},
							defaultKey = var11
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
							onActivated = p1.cancelOnActivated,
							text = var16.cancelButtonText
						}
					},
					{
						buttonType = buttonType.PrimarySystem,
						props = { onActivated = onSave, text = var16.saveButtonText }
					}
				},
				forcedFillDirection = Enum.FillDirection.Horizontal
			}
		})
	})
end