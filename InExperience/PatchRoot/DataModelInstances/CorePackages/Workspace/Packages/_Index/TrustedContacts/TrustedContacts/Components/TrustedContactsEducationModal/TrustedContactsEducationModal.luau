local parent = script:FindFirstAncestor("TrustedContacts").Parent
local reactModule = require(parent.React)
local UIBloxModule = require(parent.UIBlox)
local partialPageModal = UIBloxModule.App.Dialog.Modal.PartialPageModal
local buttonType = UIBloxModule.App.Button.Enum.ButtonType
local useScreenSize = require(parent.RobloxAppHooks).useScreenSize
local useNavigation = require(parent.Navigation).useNavigation
local useLocalization = require(parent.Localization).Hooks.useLocalization
local appPage = require(parent.RobloxAppEnums).AppPage
local foundationModule = require(parent.Foundation)
local skeleton = foundationModule.Skeleton
local text = foundationModule.Text
local icon = foundationModule.Icon
local iconSize = foundationModule.Enums.IconSize
local useTokens = foundationModule.Hooks.useTokens
local ampApiProvider = require(parent.AmpUpsell).AmpApiProvider
local accessResponseEnum = require(parent.AmpUpsell).AmpEnums.AccessResponseEnum
local analyticsModule = require(script.Parent.Parent.Parent.Analytics)
local useTCAnalytics = analyticsModule.useTCAnalytics
local eventNames = analyticsModule.EventNames
local fStringCanAccessTrustedContactsAmpNameSpace = require(parent.SharedFlags).FStringCanAccessTrustedContactsAmpNameSpace
local fStringIsVerified18PlusAmpFeature = require(parent.SharedFlags).FStringIsVerified18PlusAmpFeature
local fFlagCreateConnectionsHub = require(parent.SharedFlags).FFlagCreateConnectionsHub
local consoleFriendsPageNavigation = game:DefineFastFlag("ConsoleFriendsPageNavigation", false)
local fFlagConnectionsToFriendsRename = require(parent.SharedFlags).FFlagConnectionsToFriendsRename

local function TextWithIcon(p1)
	-- upvalues: reactModule (ref), icon (ref), iconSize (ref), text (ref)
	return reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		AutomaticSize = Enum.AutomaticSize.Y,
		Size = UDim2.fromScale(1, 0),
		LayoutOrder = p1.layoutOrder
	}, {
		UIListLayout = reactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Horizontal,
			SortOrder = Enum.SortOrder.LayoutOrder,
			Padding = UDim.new(0, p1.iconPadding),
			HorizontalAlignment = Enum.HorizontalAlignment.Left,
			VerticalAlignment = Enum.VerticalAlignment.Center
		}),
		Icon = reactModule.createElement(icon, { LayoutOrder = 1, name = p1.icon, size = iconSize.Small }),
		Text = reactModule.createElement(text, {
			tag = "auto-y grow size-full-0 text-align-x-left text-wrap",
			LayoutOrder = 2,
			Text = p1.text
		})
	})
end

return function(_)
	-- upvalues: useScreenSize (ref), useNavigation (ref), useTokens (ref), reactModule (ref), accessResponseEnum (ref), ampApiProvider (ref), fStringIsVerified18PlusAmpFeature (ref), fStringCanAccessTrustedContactsAmpNameSpace (ref), useTCAnalytics (ref), eventNames (ref), fFlagCreateConnectionsHub (ref), appPage (ref), consoleFriendsPageNavigation (ref), useLocalization (ref), fFlagConnectionsToFriendsRename (ref), partialPageModal (ref), buttonType (ref), skeleton (ref), text (ref), TextWithIcon (ref)
	local var1 = useScreenSize()
	local var2 = useNavigation()
	local var3 = useTokens()
	local var4, var5 = reactModule.useState(accessResponseEnum.Pending)
	reactModule.useEffect(function()
		-- upvalues: ampApiProvider (copy), fStringIsVerified18PlusAmpFeature (copy), fStringCanAccessTrustedContactsAmpNameSpace (copy), var5 (ref)
		var5(ampApiProvider.upsellFeatureAccess(fStringIsVerified18PlusAmpFeature, {}, fStringCanAccessTrustedContactsAmpNameSpace).access)
	end, {})
	local fireAnalyticsEvent = useTCAnalytics().fireAnalyticsEvent
	reactModule.useEffect(function()
		-- upvalues: fireAnalyticsEvent (ref), eventNames (copy)
		fireAnalyticsEvent(eventNames.TCEducationModalSeen)
	end, {})
	local var6 = useLocalization({
		title = "Feature.Friends.TCEducation.Title",
		textChatWithoutFilters = "Feature.Friends.TCFeature.ChatWithoutFilters",
		textPartyVoice = "Feature.Friends.TCFeature.PartyVoice",
		textAndMore = "Feature.Friends.TCFeature.AndMore",
		buttonManage = "Feature.Avatar.Heading.Manage",
		buttonGotIt = "Feature.Friends.Button.GotIt",
		textIntro = if fFlagConnectionsToFriendsRename then "Feature.Friends.TFEducation.Modal.TextIntro" else "Feature.Friends.TCEducation.Modal.TextIntro",
		textIntro18Plus = if fFlagConnectionsToFriendsRename then "Feature.Friends.TFEducation.Modal.TextIntro.EighteenPlus" else "Feature.Friends.TCEducation.Modal.TextIntro.EighteenPlus",
		textOutro = if fFlagConnectionsToFriendsRename then "Feature.Friends.TFEducation.Modal.TextOutro" else "Feature.Friends.TCEducation.Modal.TextOutro",
		textOutro18Plus = if fFlagConnectionsToFriendsRename then "Feature.Friends.TFEducation.Modal.TextOutro.EighteenPlus" else "Feature.Friends.TCEducation.Modal.TextOutro.EighteenPlus"
	})
	
	return reactModule.createElement(partialPageModal, {
		title = var6.title,
		screenSize = var1,
		onCloseClicked = reactModule.useCallback(function()
			-- upvalues: fireAnalyticsEvent (ref), eventNames (copy), var2 (ref)
			fireAnalyticsEvent(eventNames.TCEducationCloseClicked)
			var2.pop()
		end, { var2 }),
		buttonStackProps = {
			buttons = {
				{
					buttonType = buttonType.PrimaryContextual,
					props = {
						onActivated = reactModule.useCallback(function()
							-- upvalues: fireAnalyticsEvent (ref), eventNames (copy), var2 (ref)
							fireAnalyticsEvent(eventNames.TCEducationGotItClicked)
							var2.pop()
						end, { var2 }),
						text = var6.buttonGotIt
					}
				},
				{
					buttonType = buttonType.Secondary,
					props = {
						onActivated = reactModule.useCallback(function()
							-- upvalues: fireAnalyticsEvent (ref), eventNames (copy), fFlagCreateConnectionsHub (copy), var2 (ref), appPage (copy), consoleFriendsPageNavigation (copy)
							fireAnalyticsEvent(eventNames.TCEducationManageConnectionsClicked)
							
							if fFlagCreateConnectionsHub then
								var2.navigate(appPage.CoHubMyConnections)
								
								return
							elseif consoleFriendsPageNavigation then
								var2.navigate(appPage.ViewFriends)
								
								return
							end
							var2.replace(appPage.ViewFriends)
						end, { var2 }),
						text = var6.buttonManage
					}
				}
			},
			forcedFillDirection = Enum.FillDirection.Horizontal
		}
	}, {
		ViewContainer = reactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			AutomaticSize = Enum.AutomaticSize.Y,
			Size = UDim2.fromScale(1, 0)
		}, {
			UIListLayout = reactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Vertical,
				SortOrder = Enum.SortOrder.LayoutOrder,
				HorizontalAlignment = Enum.HorizontalAlignment.Center
			}),
			TextContainer = reactModule.createElement("Frame", {
				LayoutOrder = 2,
				BackgroundTransparency = 1,
				AutomaticSize = Enum.AutomaticSize.Y,
				Size = UDim2.fromScale(1, 0)
			}, {
				UIListLayout = reactModule.createElement("UIListLayout", {
					FillDirection = Enum.FillDirection.Vertical,
					SortOrder = Enum.SortOrder.LayoutOrder,
					Padding = UDim.new(0, var3.Padding.Large),
					HorizontalAlignment = Enum.HorizontalAlignment.Center
				}),
				OuterPadding = reactModule.createElement("UIPadding", {
					PaddingTop = UDim.new(0, var3.Padding.Medium),
					PaddingBottom = UDim.new(0, var3.Padding.Large)
				}),
				ConnectTextIntro = if var4 == accessResponseEnum.Pending then reactModule.createElement(skeleton, { LayoutOrder = 1, Size = UDim2.new(1, 0, 0, 30) }) else reactModule.createElement(text, {
					LayoutOrder = 1,
					tag = "auto-y grow size-full-0 text-align-x-left text-wrap",
					Text = if var4 == accessResponseEnum.Granted then var6.textIntro18Plus else var6.textIntro
				}),
				ConnectOptionText1 = reactModule.createElement(TextWithIcon, {
					layoutOrder = 2,
					icon = "icons/menu/platformChatOff_small",
					text = var6.textChatWithoutFilters,
					iconPadding = var3.Padding.Medium
				}),
				ConnectOptionText2 = reactModule.createElement(TextWithIcon, {
					layoutOrder = 3,
					icon = "icons/controls/microphone_small",
					text = var6.textPartyVoice,
					iconPadding = var3.Padding.Medium
				}),
				ConnectOptionText3 = reactModule.createElement(TextWithIcon, {
					layoutOrder = 4,
					icon = "icons/actions/edit/add_small",
					text = var6.textAndMore,
					iconPadding = var3.Padding.Medium
				}),
				ConnectTextOutro = if var4 == accessResponseEnum.Pending then reactModule.createElement(skeleton, { LayoutOrder = 5, Size = UDim2.new(1, 0, 0, 60) }) else reactModule.createElement(text, {
					LayoutOrder = 5,
					tag = "auto-y grow size-full-0 text-align-x-left text-wrap",
					Text = if var4 == accessResponseEnum.Granted then var6.textOutro18Plus else var6.textOutro
				})
			})
		})
	})
end