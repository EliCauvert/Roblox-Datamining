local CorePackages = game:GetService("CorePackages")
local ReactModule = require(CorePackages.Packages.React)
local Sounds = require(CorePackages.Workspace.Packages.SoundManager).Sounds
local SoundGroups = require(CorePackages.Workspace.Packages.SoundManager).SoundGroups
local SoundManager = require(CorePackages.Workspace.Packages.SoundManager).SoundManager
local UserProfilesModule = require(CorePackages.Workspace.Packages.UserProfiles)
local ContactList = game:GetService("CoreGui"):WaitForChild("RobloxGui").Modules.ContactList
local DependenciesModule = require(ContactList.dependencies)
local UseDispatchFunction = DependenciesModule.Hooks.useDispatch
local UseSelectorFunction = DependenciesModule.Hooks.useSelector
local GetStandardSizeAvatarHeadShotRbxthumbFunction = DependenciesModule.getStandardSizeAvatarHeadShotRbxthumb
local GetPresencesFromUserIds = DependenciesModule.NetworkingPresence.GetPresencesFromUserIds
local UseLocalizationFunction = DependenciesModule.Hooks.useLocalization
local PresenceType = DependenciesModule.RoduxPresence.Enums.PresenceType
local UIBlox = DependenciesModule.UIBlox
local ControlState = UIBlox.Core.Control.Enum.ControlState
local PlayerContext = UIBlox.App.Indicator.PlayerContext
local Images = UIBlox.App.ImageSet.Images
local Interactable = UIBlox.Core.Control.Interactable
local ImageSetLabel = UIBlox.Core.ImageSet.ImageSetLabel
local UseStyleFunction = UIBlox.Core.Style.useStyle
local OpenOrUpdateCFMModule = require(ContactList.Actions.OpenOrUpdateCFM)
local UseAnalyticsModule = require(ContactList.Analytics.useAnalytics)
local EventNamesEnumModule = require(ContactList.Analytics.EventNamesEnum)
local UseStartCallCallbackModule = require(ContactList.Hooks.useStartCallCallback)
local PagesModule = require(ContactList.Enums.Pages)
local _Random = Random.new()
local _Vector2 = Vector2.new(24, 12)

return function(p1)
	-- upvalues: UseAnalyticsModule (copy), UseStyleFunction (copy), UseDispatchFunction (copy), UseLocalizationFunction (copy), ReactModule (copy), GetPresencesFromUserIds (copy), UseSelectorFunction (copy), ControlState (copy), SoundManager (copy), Sounds (copy), _Random (copy), SoundGroups (copy), GetStandardSizeAvatarHeadShotRbxthumbFunction (copy), UseStartCallCallbackModule (copy), Images (copy), PresenceType (copy), PlayerContext (copy), EventNamesEnumModule (copy), PagesModule (copy), OpenOrUpdateCFMModule (copy), Interactable (copy), _Vector2 (copy), UserProfilesModule (copy), ImageSetLabel (copy)
	local UseAnalyticsModuleResult = UseAnalyticsModule()
	local UseStyleResult = UseStyleFunction()
	local Theme = UseStyleResult.Theme
	local UseStyleResultFont = UseStyleResult.Font
	local UseDispatchResult = UseDispatchFunction()
	local config = {
		userId = p1.userId,
		userName = p1.userName,
		combinedName = p1.combinedName
	}
	local UseLocalizationResult = UseLocalizationFunction({
		offlineStatusLabel = "InGame.Presence.Label.Offline",
		onlineStatusLabel = "InGame.Presence.Label.Online",
		studioStatusLabel = "InGame.Presence.Label.RobloxStudio"
	})
	ReactModule.useEffect(function()
		-- upvalues: p1 (copy), UseDispatchResult (copy), GetPresencesFromUserIds (upval)
		if p1.userPresenceType == nil then
			UseDispatchResult(GetPresencesFromUserIds.API({ p1.userId }))
		end
	end, { p1.userId, p1.userPresenceType })
	local UseSelectorResult = UseSelectorFunction((ReactModule.useCallback(function(p2)
		-- upvalues: p1 (copy)
		return p2.Presence.byUserId[tostring(p1.userId)]
	end, { p1.userId })))
	local UseSelectorResult1 = UseSelectorFunction((ReactModule.useCallback(function(p2)
		return p2.Navigation.currentTag
	end, {})))
	local UseSelectorResult2 = UseSelectorFunction((ReactModule.useCallback(function(p2)
		return p2.Navigation.currentPage
	end, {})))
	local BackgroundDefault, BackgroundDefault2 = ReactModule.useState("BackgroundDefault")
	local UseResult = ReactModule.useCallback(function(_, Hover)
		-- upvalues: ControlState (upval), BackgroundDefault2 (copy), SoundManager (upval), Sounds (upval), _Random (upval), SoundGroups (upval)
		if Hover == ControlState.Pressed then
			BackgroundDefault2("BackgroundOnPress")
			
			return
		end
		if Hover == ControlState.Hover then
			BackgroundDefault2("BackgroundOnHover")
			SoundManager:PlaySound(Sounds.Hover.Name, {
				Volume = 0.5 + _Random:NextNumber(-0.25, 0.25),
				PlaybackSpeed = 1 + _Random:NextNumber(-0.5, 0.5)
			}, SoundGroups.Iris)
			
			return
		else
			BackgroundDefault2("BackgroundDefault")
		end
	end, {})
	local StandardSizeAvatarHeadShotRbxthumb = GetStandardSizeAvatarHeadShotRbxthumbFunction((tostring(p1.userId)))
	local UseStartCallCallbackModuleResult = UseStartCallCallbackModule(UseSelectorResult1, p1.userId, p1.combinedName, p1.dismissCallback, {
		searchQueryString = p1.searchQueryString,
		itemListIndex = p1.itemListIndex,
		isSuggestedUser = p1.isSuggestedUser,
		page = UseSelectorResult2
	})
	local UseResult1 = ReactModule.useCallback(function()
		-- upvalues: UseAnalyticsModuleResult (copy), EventNamesEnumModule (upval), config (copy), p1 (copy), PagesModule (upval), UseDispatchResult (copy), OpenOrUpdateCFMModule (upval)
		UseAnalyticsModuleResult.fireEvent(EventNamesEnumModule.PhoneBookPlayerMenuOpened, {
			eventTimestampMs = os.time() * 1000,
			friendUserId = config.userId,
			searchQueryString = p1.searchQueryString,
			itemListIndex = p1.itemListIndex,
			isSuggestedUser = p1.isSuggestedUser,
			page = PagesModule.FriendList
		})
		UseDispatchResult(OpenOrUpdateCFMModule(config))
	end, {
		config.userId,
		p1.searchQueryString,
		p1.itemListIndex,
		p1.isSuggestedUser
	})
	
	return ReactModule.createElement(Interactable, {
		Position = UDim2.fromOffset(0, 0),
		Size = UDim2.new(1, 0, 0, 68 + _Vector2.Y * 2),
		BackgroundColor3 = Theme[BackgroundDefault].Color,
		BackgroundTransparency = Theme[BackgroundDefault].Transparency,
		BorderSizePixel = 0,
		LayoutOrder = p1.layoutOrder,
		onStateChanged = UseResult,
		AutoButtonColor = false,
		[ReactModule.Event.Activated] = UseStartCallCallbackModuleResult
	}, {
		UIPadding = ReactModule.createElement("UIPadding", {
			PaddingLeft = UDim.new(0, _Vector2.X),
			PaddingTop = UDim.new(0, _Vector2.Y)
		}),
		ProfileImage = ReactModule.createElement("ImageButton", {
			Size = UDim2.fromOffset(68, 68),
			Image = StandardSizeAvatarHeadShotRbxthumb,
			[ReactModule.Event.MouseButton2Up] = UseResult1,
			[ReactModule.Event.TouchTap] = UseResult1,
			AutoButtonColor = false
		}, {
			UICorner = ReactModule.createElement("UICorner", { CornerRadius = UDim.new(1, 0) })
		}),
		Content = ReactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Position = UDim2.new(0, 80, 0, 0),
			Size = UDim2.new(1, -(116 + _Vector2.X), 1, -_Vector2.Y)
		}, {
			UIListLayout = ReactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Vertical,
				SortOrder = Enum.SortOrder.LayoutOrder
			}),
			NameContent = ReactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				LayoutOrder = 1,
				Size = UDim2.new(1, 0, 0, 0),
				AutomaticSize = Enum.AutomaticSize.Y
			}, {
				UIListLayout = ReactModule.createElement("UIListLayout", {
					FillDirection = Enum.FillDirection.Vertical,
					Padding = UDim.new(0, 4),
					SortOrder = Enum.SortOrder.LayoutOrder
				}),
				UIPadding = ReactModule.createElement("UIPadding", { PaddingBottom = UDim.new(0, 6) }),
				CombinedName = ReactModule.createElement("TextLabel", {
					BackgroundTransparency = 1,
					BorderSizePixel = 0,
					LayoutOrder = 1,
					Size = UDim2.new(1, 0, 0, 20),
					Font = UseStyleResultFont.Header2.Font,
					Text = p1.combinedName,
					TextColor3 = Theme.TextEmphasis.Color,
					TextSize = UseStyleResultFont.BaseSize * UseStyleResultFont.Header2.RelativeSize,
					TextTransparency = Theme.TextEmphasis.Transparency,
					TextTruncate = Enum.TextTruncate.AtEnd,
					TextXAlignment = Enum.TextXAlignment.Left
				}),
				Username = ReactModule.createElement("TextLabel", {
					BackgroundTransparency = 1,
					BorderSizePixel = 0,
					LayoutOrder = 2,
					Size = UDim2.new(1, 0, 0, 14),
					Font = UseStyleResultFont.CaptionBody.Font,
					Text = UserProfilesModule.Formatters.formatUsername(p1.userName),
					TextColor3 = Theme.TextDefault.Color,
					TextSize = UseStyleResultFont.BaseSize * UseStyleResultFont.CaptionBody.RelativeSize,
					TextTransparency = Theme.TextDefault.Transparency,
					TextTruncate = Enum.TextTruncate.AtEnd,
					TextXAlignment = Enum.TextXAlignment.Left
				})
			}),
			PlayerContext = ReactModule.useMemo(function()
				-- upvalues: Images (upval), UseStyleResult (copy), UseLocalizationResult (copy), UseSelectorResult (copy), p1 (copy), PresenceType (upval), Theme (copy), ReactModule (upval), PlayerContext (upval), UseStartCallCallbackModuleResult (copy)
				local ComponentAssetsCircle26Stroke3 = Images["component_assets/circle_26_stroke_3"]
				local Color = UseStyleResult.Theme.OfflineStatus.Color
				local Transparency = UseStyleResult.Theme.OfflineStatus.Transparency
				local XOffset = 12
				local OfflineStatusLabel = UseLocalizationResult.offlineStatusLabel
				local TextMuted = UseStyleResult.Theme.TextMuted
				local LastLocation = nil
				local UserPresenceType = nil
				
				if UseSelectorResult then
					UserPresenceType = UseSelectorResult.userPresenceType
					LastLocation = UseSelectorResult.lastLocation
				else
					UserPresenceType = if p1.userPresenceType then PresenceType[p1.userPresenceType] else PresenceType.Offline
					LastLocation = p1.lastLocation or ""
				end
				if UserPresenceType == PresenceType.Online then
					ComponentAssetsCircle26Stroke3 = Images["component_assets/circle_16"]
					Color = UseStyleResult.Theme.OnlineStatus.Color
					Transparency = UseStyleResult.Theme.OnlineStatus.Transparency
					OfflineStatusLabel = UseLocalizationResult.onlineStatusLabel
					TextMuted = UseStyleResult.Theme.TextMuted
					XOffset = 12
				elseif UserPresenceType == PresenceType.InGame then
					ComponentAssetsCircle26Stroke3 = Images["icons/menu/games_small"]
					Color = UseStyleResult.Theme.IconEmphasis.Color
					Transparency = UseStyleResult.Theme.IconEmphasis.Transparency
					OfflineStatusLabel = LastLocation
					TextMuted = Theme.TextEmphasis
					XOffset = 16
				elseif UserPresenceType == PresenceType.InStudio then
					ComponentAssetsCircle26Stroke3 = Images["icons/logo/studiologo_small"]
					Color = UseStyleResult.Theme.TextDefault.Color
					Transparency = UseStyleResult.Theme.TextDefault.Transparency
					OfflineStatusLabel = UseLocalizationResult.studioStatusLabel
					TextMuted = UseStyleResult.Theme.TextMuted
					XOffset = 16
				end
				return ReactModule.createElement(PlayerContext, {
					layoutOrder = 2,
					textHeight = 24,
					fontStyle = UseStyleResult.Font.CaptionBody,
					icon = ComponentAssetsCircle26Stroke3,
					iconColor = Color,
					iconSize = UDim2.fromOffset(XOffset, XOffset),
					iconTransparency = Transparency,
					onActivated = UseStartCallCallbackModuleResult,
					text = OfflineStatusLabel,
					textColorStyle = TextMuted
				})
			end, {
				UseSelectorResult,
				UseStyleResult,
				UseLocalizationResult.offlineStatusLabel,
				UseLocalizationResult.onlineStatusLabel,
				UseLocalizationResult.studioStatusLabel
			})
		}),
		CallIcon = ReactModule.createElement(ImageSetLabel, {
			BackgroundTransparency = 1,
			Image = "rbxassetid://15239343417",
			Position = UDim2.new(1, -_Vector2.X - 4, 0.5, -_Vector2.Y / 2),
			Size = UDim2.fromOffset(24, 24),
			AnchorPoint = Vector2.new(1, 0.5),
			ImageColor3 = Theme.ContextualPrimaryDefault.Color,
			ImageTransparency = Theme.ContextualPrimaryDefault.Transparency
		}),
		Divider = p1.showDivider and ReactModule.createElement("Frame", {
			BorderSizePixel = 0,
			Position = UDim2.new(0, 0, 1, -1),
			Size = UDim2.new(1, 0, 0, 1),
			BackgroundColor3 = Theme.Divider.Color,
			BackgroundTransparency = Theme.Divider.Transparency
		}) or nil
	})
end