local corePackagesService = game:GetService("CorePackages")
local robloxGui = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local reactModule = require(corePackagesService.Packages.React)
local sounds = require(corePackagesService.Workspace.Packages.SoundManager).Sounds
local soundGroups = require(corePackagesService.Workspace.Packages.SoundManager).SoundGroups
local soundManager = require(corePackagesService.Workspace.Packages.SoundManager).SoundManager
local userProfilesModule = require(corePackagesService.Workspace.Packages.UserProfiles)
local contactList = robloxGui.Modules.ContactList
local dependenciesModule = require(contactList.dependencies)
local useDispatch = dependenciesModule.Hooks.useDispatch
local useSelector = dependenciesModule.Hooks.useSelector
local getStandardSizeAvatarHeadShotRbxthumb = dependenciesModule.getStandardSizeAvatarHeadShotRbxthumb
local getPresencesFromUserIds = dependenciesModule.NetworkingPresence.GetPresencesFromUserIds
local useLocalization = dependenciesModule.Hooks.useLocalization
local presenceType = dependenciesModule.RoduxPresence.Enums.PresenceType
local UIBlox = dependenciesModule.UIBlox
local controlState = UIBlox.Core.Control.Enum.ControlState
local playerContext = UIBlox.App.Indicator.PlayerContext
local images = UIBlox.App.ImageSet.Images
local interactable = UIBlox.Core.Control.Interactable
local imageSetLabel = UIBlox.Core.ImageSet.ImageSetLabel
local useStyle = UIBlox.Core.Style.useStyle
local openOrUpdateCFMModule = require(contactList.Actions.OpenOrUpdateCFM)
local useAnalyticsModule = require(contactList.Analytics.useAnalytics)
local eventNamesEnumModule = require(contactList.Analytics.EventNamesEnum)
local useStartCallCallbackModule = require(contactList.Hooks.useStartCallCallback)
local pagesModule = require(contactList.Enums.Pages)
local random = Random.new()
local vector2 = Vector2.new(24, 12)

return function(p0) --[[ line: 61 | named "FriendListItem" ]]
	-- upvalues: useAnalyticsModule (ref), useStyle (ref), useDispatch (ref), useLocalization (ref), reactModule (ref), getPresencesFromUserIds (ref), useSelector (ref), controlState (ref), soundManager (ref), sounds (ref), random (ref), soundGroups (ref), getStandardSizeAvatarHeadShotRbxthumb (ref), useStartCallCallbackModule (ref), images (ref), presenceType (ref), playerContext (ref), eventNamesEnumModule (ref), pagesModule (ref), openOrUpdateCFMModule (ref), interactable (ref), vector2 (ref), userProfilesModule (ref), imageSetLabel (ref)
	local var12 = useAnalyticsModule()
	local var13 = useStyle()
	local theme = var13.Theme
	local font = var13.Font
	local var14 = useDispatch()
	local t = {
		userId = p0.userId,
		userName = p0.userName,
		combinedName = p0.combinedName
	}
	local var16 = useLocalization({
		offlineStatusLabel = "InGame.Presence.Label.Offline",
		onlineStatusLabel = "InGame.Presence.Label.Online",
		studioStatusLabel = "InGame.Presence.Label.RobloxStudio"
	})
	reactModule.useEffect(function() --[[ line: 81 ]]
		-- upvalues: p0 (ref), var14 (ref), getPresencesFromUserIds (copy)
		if p0.userPresenceType == nil then
			var14(getPresencesFromUserIds.API({ p0.userId }))
		end
	end, { p0.userId, p0.userPresenceType })
	local var17 = useSelector(reactModule.useCallback(function(p1) --[[ line: 87 ]]
		-- upvalues: p0 (ref)
		return p1.Presence.byUserId[tostring(p0.userId)]
	end, { p0.userId }))
	local var18 = useSelector(reactModule.useCallback(function(p2) --[[ line: 92 ]]
		return p2.Navigation.currentTag
	end, {}))
	local var19 = useSelector(reactModule.useCallback(function(p3) --[[ line: 97 ]]
		return p3.Navigation.currentPage
	end, {}))
	local backgroundDefault, backgroundDefault_1 = reactModule.useState("BackgroundDefault")
	local var22 = reactModule.useCallback(function(_, p4) --[[ line: 103 ]]
		-- upvalues: controlState (copy), backgroundDefault_1 (ref), soundManager (copy), sounds (copy), random (copy), soundGroups (copy)
		if p4 == controlState.Pressed then
			backgroundDefault_1("BackgroundOnPress")
			
			return
		elseif p4 == controlState.Hover then
			backgroundDefault_1("BackgroundOnHover")
			soundManager:PlaySound(sounds.Hover.Name, {
				Volume = 0.5 + random:NextNumber(-0.25, 0.25),
				PlaybackSpeed = 1 + random:NextNumber(-0.5, 0.5)
			}, soundGroups.Iris)
			
			return
		end
		backgroundDefault_1("BackgroundDefault")
	end, {})
	local var23 = getStandardSizeAvatarHeadShotRbxthumb(tostring(p0.userId))
	local var24 = useStartCallCallbackModule(var18, p0.userId, p0.combinedName, p0.dismissCallback, {
		searchQueryString = p0.searchQueryString,
		itemListIndex = p0.itemListIndex,
		isSuggestedUser = p0.isSuggestedUser,
		page = var19
	})
	local var25 = reactModule.useCallback(function() --[[ line: 184 ]]
		-- upvalues: var12 (ref), eventNamesEnumModule (copy), t (ref), p0 (ref), pagesModule (copy), var14 (ref), openOrUpdateCFMModule (copy)
		var12.fireEvent(eventNamesEnumModule.PhoneBookPlayerMenuOpened, {
			eventTimestampMs = os.time() * 1000,
			friendUserId = t.userId,
			searchQueryString = p0.searchQueryString,
			itemListIndex = p0.itemListIndex,
			isSuggestedUser = p0.isSuggestedUser,
			page = pagesModule.FriendList
		})
		var14(openOrUpdateCFMModule(t))
	end, {
		t.userId,
		p0.searchQueryString,
		p0.itemListIndex,
		p0.isSuggestedUser
	})
	
	return reactModule.createElement(interactable, {
		Position = UDim2.fromOffset(0, 0),
		Size = UDim2.new(1, 0, 0, 68 + vector2.Y * 2),
		BackgroundColor3 = theme[backgroundDefault].Color,
		BackgroundTransparency = theme[backgroundDefault].Transparency,
		BorderSizePixel = 0,
		LayoutOrder = p0.layoutOrder,
		onStateChanged = var22,
		AutoButtonColor = false,
		[reactModule.Event.Activated] = var24
	}, {
		UIPadding = reactModule.createElement("UIPadding", {
			PaddingLeft = UDim.new(0, vector2.X),
			PaddingTop = UDim.new(0, vector2.Y)
		}),
		ProfileImage = reactModule.createElement("ImageButton", {
			Size = UDim2.fromOffset(68, 68),
			Image = var23,
			[reactModule.Event.MouseButton2Up] = var25,
			[reactModule.Event.TouchTap] = var25,
			AutoButtonColor = false
		}, {
			UICorner = reactModule.createElement("UICorner", { CornerRadius = UDim.new(1, 0) })
		}),
		Content = reactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Position = UDim2.new(0, 80, 0, 0),
			Size = UDim2.new(1, -(116 + vector2.X), 1, -vector2.Y)
		}, {
			UIListLayout = reactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Vertical,
				SortOrder = Enum.SortOrder.LayoutOrder
			}),
			NameContent = reactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				LayoutOrder = 1,
				Size = UDim2.new(1, 0, 0, 0),
				AutomaticSize = Enum.AutomaticSize.Y
			}, {
				UIListLayout = reactModule.createElement("UIListLayout", {
					FillDirection = Enum.FillDirection.Vertical,
					Padding = UDim.new(0, 4),
					SortOrder = Enum.SortOrder.LayoutOrder
				}),
				UIPadding = reactModule.createElement("UIPadding", { PaddingBottom = UDim.new(0, 6) }),
				CombinedName = reactModule.createElement("TextLabel", {
					BackgroundTransparency = 1,
					BorderSizePixel = 0,
					LayoutOrder = 1,
					Size = UDim2.new(1, 0, 0, 20),
					Font = font.Header2.Font,
					Text = p0.combinedName,
					TextColor3 = theme.TextEmphasis.Color,
					TextSize = font.BaseSize * font.Header2.RelativeSize,
					TextTransparency = theme.TextEmphasis.Transparency,
					TextTruncate = Enum.TextTruncate.AtEnd,
					TextXAlignment = Enum.TextXAlignment.Left
				}),
				Username = reactModule.createElement("TextLabel", {
					BackgroundTransparency = 1,
					BorderSizePixel = 0,
					LayoutOrder = 2,
					Size = UDim2.new(1, 0, 0, 14),
					Font = font.CaptionBody.Font,
					Text = userProfilesModule.Formatters.formatUsername(p0.userName),
					TextColor3 = theme.TextDefault.Color,
					TextSize = font.BaseSize * font.CaptionBody.RelativeSize,
					TextTransparency = theme.TextDefault.Transparency,
					TextTruncate = Enum.TextTruncate.AtEnd,
					TextXAlignment = Enum.TextXAlignment.Left
				})
			}),
			PlayerContext = reactModule.useMemo(function() --[[ line: 127 ]]
				-- upvalues: images (copy), var13 (ref), var16 (ref), var17 (ref), p0 (ref), presenceType (copy), theme (ref), reactModule (copy), playerContext (copy), var24 (ref)
				local userPresenceType, lastLocation
				local circle26Stroke3 = images["component_assets/circle_26_stroke_3"]
				local color = var13.Theme.OfflineStatus.Color
				local transparency = var13.Theme.OfflineStatus.Transparency
				local var26 = 12
				local offlineStatusLabel = var16.offlineStatusLabel
				local textMuted = var13.Theme.TextMuted
				local _ = nil
				local _ = nil
				
				if var17 then
					userPresenceType = var17.userPresenceType
					lastLocation = var17.lastLocation
				else
					userPresenceType = if p0.userPresenceType then presenceType[p0.userPresenceType] else presenceType.Offline
					lastLocation = p0.lastLocation or ""
				end
				if userPresenceType == presenceType.Online then
					circle26Stroke3 = images["component_assets/circle_16"]
					color = var13.Theme.OnlineStatus.Color
					transparency = var13.Theme.OnlineStatus.Transparency
					offlineStatusLabel = var16.onlineStatusLabel
					textMuted = var13.Theme.TextMuted
					var26 = 12
				elseif userPresenceType == presenceType.InGame then
					circle26Stroke3 = images["icons/menu/games_small"]
					color = var13.Theme.IconEmphasis.Color
					transparency = var13.Theme.IconEmphasis.Transparency
					offlineStatusLabel = lastLocation
					textMuted = theme.TextEmphasis
					var26 = 16
				elseif userPresenceType == presenceType.InStudio then
					circle26Stroke3 = images["icons/logo/studiologo_small"]
					color = var13.Theme.TextDefault.Color
					transparency = var13.Theme.TextDefault.Transparency
					offlineStatusLabel = var16.studioStatusLabel
					textMuted = var13.Theme.TextMuted
					var26 = 16
				end
				return reactModule.createElement(playerContext, {
					layoutOrder = 2,
					textHeight = 24,
					fontStyle = var13.Font.CaptionBody,
					icon = circle26Stroke3,
					iconColor = color,
					iconSize = UDim2.fromOffset(var26, var26),
					iconTransparency = transparency,
					onActivated = var24,
					text = offlineStatusLabel,
					textColorStyle = textMuted
				})
			end, {
				var17,
				var13,
				var16.offlineStatusLabel,
				var16.onlineStatusLabel,
				var16.studioStatusLabel
			})
		}),
		CallIcon = reactModule.createElement(imageSetLabel, {
			BackgroundTransparency = 1,
			Image = "rbxassetid://15239343417",
			Position = UDim2.new(1, (-vector2.X) - 4, 0.5, -vector2.Y / 2),
			Size = UDim2.fromOffset(24, 24),
			AnchorPoint = Vector2.new(1, 0.5),
			ImageColor3 = theme.ContextualPrimaryDefault.Color,
			ImageTransparency = theme.ContextualPrimaryDefault.Transparency
		}),
		Divider = p0.showDivider and reactModule.createElement("Frame", {
			BorderSizePixel = 0,
			Position = UDim2.new(0, 0, 1, -1),
			Size = UDim2.new(1, 0, 0, 1),
			BackgroundColor3 = theme.Divider.Color,
			BackgroundTransparency = theme.Divider.Transparency
		}) or nil
	})
end