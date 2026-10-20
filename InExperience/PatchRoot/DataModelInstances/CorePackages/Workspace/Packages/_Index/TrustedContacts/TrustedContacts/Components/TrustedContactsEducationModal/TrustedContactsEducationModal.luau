local Parent = script:FindFirstAncestor("TrustedContacts").Parent
local ReactModule = require(Parent.React)
local UIBloxModule = require(Parent.UIBlox)
local PartialPageModal = UIBloxModule.App.Dialog.Modal.PartialPageModal
local ButtonType = UIBloxModule.App.Button.Enum.ButtonType
local UseScreenSizeFunction = require(Parent.RobloxAppHooks).useScreenSize
local UseNavigationFunction = require(Parent.Navigation).useNavigation
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local AppPage = require(Parent.RobloxAppEnums).AppPage
local FoundationModule = require(Parent.Foundation)
local Skeleton = FoundationModule.Skeleton
local Text = FoundationModule.Text
local Icon = FoundationModule.Icon
local IconSize = FoundationModule.Enums.IconSize
local UseTokensFunction = FoundationModule.Hooks.useTokens
local AmpApiProvider = require(Parent.AmpUpsell).AmpApiProvider
local AccessResponseEnum = require(Parent.AmpUpsell).AmpEnums.AccessResponseEnum
local AnalyticsModule = require(script.Parent.Parent.Parent.Analytics)
local UseTCAnalyticsFunction = AnalyticsModule.useTCAnalytics
local EventNames = AnalyticsModule.EventNames
local FStringCanAccessTrustedContactsAmpNameSpace = require(Parent.SharedFlags).FStringCanAccessTrustedContactsAmpNameSpace
local FStringIsVerified18PlusAmpFeature = require(Parent.SharedFlags).FStringIsVerified18PlusAmpFeature
local FFlagCreateConnectionsHub = require(Parent.SharedFlags).FFlagCreateConnectionsHub
local ConsoleFriendsPageNavigation = game:DefineFastFlag("ConsoleFriendsPageNavigation", false)

local function TextWithIcon(p1)
	-- upvalues: ReactModule (copy), Icon (copy), IconSize (copy), Text (copy)
	return ReactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		AutomaticSize = Enum.AutomaticSize.Y,
		Size = UDim2.fromScale(1, 0),
		LayoutOrder = p1.layoutOrder
	}, {
		UIListLayout = ReactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Horizontal,
			SortOrder = Enum.SortOrder.LayoutOrder,
			Padding = UDim.new(0, p1.iconPadding),
			HorizontalAlignment = Enum.HorizontalAlignment.Left,
			VerticalAlignment = Enum.VerticalAlignment.Center
		}),
		Icon = ReactModule.createElement(Icon, { LayoutOrder = 1, name = p1.icon, size = IconSize.Small }),
		Text = ReactModule.createElement(Text, {
			tag = "auto-y grow size-full-0 text-align-x-left text-wrap",
			LayoutOrder = 2,
			Text = p1.text
		})
	})
end

return function(_)
	-- upvalues: UseScreenSizeFunction (copy), UseNavigationFunction (copy), UseTokensFunction (copy), ReactModule (copy), AccessResponseEnum (copy), AmpApiProvider (copy), FStringIsVerified18PlusAmpFeature (copy), FStringCanAccessTrustedContactsAmpNameSpace (copy), UseTCAnalyticsFunction (copy), EventNames (copy), FFlagCreateConnectionsHub (copy), AppPage (copy), ConsoleFriendsPageNavigation (copy), UseLocalizationFunction (copy), PartialPageModal (copy), ButtonType (copy), Skeleton (copy), Text (copy), TextWithIcon (copy)
	local UseScreenSizeResult = UseScreenSizeFunction()
	local UseNavigationResult = UseNavigationFunction()
	local UseTokensResult = UseTokensFunction()
	local UseStateResult, UseStateResult2 = ReactModule.useState(AccessResponseEnum.Pending)
	ReactModule.useEffect(function()
		-- upvalues: AmpApiProvider (upval), FStringIsVerified18PlusAmpFeature (upval), FStringCanAccessTrustedContactsAmpNameSpace (upval), UseStateResult2 (copy)
		UseStateResult2(AmpApiProvider.upsellFeatureAccess(FStringIsVerified18PlusAmpFeature, {}, FStringCanAccessTrustedContactsAmpNameSpace).access)
	end, {})
	local FireAnalyticsEventFunction = UseTCAnalyticsFunction().fireAnalyticsEvent
	ReactModule.useEffect(function()
		-- upvalues: FireAnalyticsEventFunction (copy), EventNames (upval)
		FireAnalyticsEventFunction(EventNames.TCEducationModalSeen)
	end, {})
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: FireAnalyticsEventFunction (copy), EventNames (upval), UseNavigationResult (copy)
		FireAnalyticsEventFunction(EventNames.TCEducationCloseClicked)
		UseNavigationResult.pop()
	end, { UseNavigationResult })
	local UseResult1 = ReactModule.useCallback(function()
		-- upvalues: FireAnalyticsEventFunction (copy), EventNames (upval), UseNavigationResult (copy)
		FireAnalyticsEventFunction(EventNames.TCEducationGotItClicked)
		UseNavigationResult.pop()
	end, { UseNavigationResult })
	local UseResult2 = ReactModule.useCallback(function()
		-- upvalues: FireAnalyticsEventFunction (copy), EventNames (upval), FFlagCreateConnectionsHub (upval), UseNavigationResult (copy), AppPage (upval), ConsoleFriendsPageNavigation (upval)
		FireAnalyticsEventFunction(EventNames.TCEducationManageConnectionsClicked)
		
		if FFlagCreateConnectionsHub then
			UseNavigationResult.navigate(AppPage.CoHubMyConnections)
			
			return
		end
		if ConsoleFriendsPageNavigation then
			UseNavigationResult.navigate(AppPage.ViewFriends)
			
			return
		else
			UseNavigationResult.replace(AppPage.ViewFriends)
		end
	end, { UseNavigationResult })
	local FeatureFriendsTCEducationTitle = UseLocalizationFunction({
		title = "Feature.Friends.TCEducation.Title",
		textIntro = "Feature.Friends.TFEducation.Modal.TextIntro",
		textIntro18Plus = "Feature.Friends.TFEducation.Modal.TextIntro.EighteenPlus",
		textChatWithoutFilters = "Feature.Friends.TCFeature.ChatWithoutFilters",
		textPartyVoice = "Feature.Friends.TCFeature.PartyVoice",
		textAndMore = "Feature.Friends.TCFeature.AndMore",
		textOutro = "Feature.Friends.TFEducation.Modal.TextOutro",
		textOutro18Plus = "Feature.Friends.TFEducation.Modal.TextOutro.EighteenPlus",
		buttonManage = "Feature.Avatar.Heading.Manage",
		buttonGotIt = "Feature.Friends.Button.GotIt"
	})
	
	return ReactModule.createElement(PartialPageModal, {
		title = FeatureFriendsTCEducationTitle.title,
		screenSize = UseScreenSizeResult,
		onCloseClicked = UseResult,
		buttonStackProps = {
			buttons = {
				{
					buttonType = ButtonType.PrimaryContextual,
					props = {
						onActivated = UseResult1,
						text = FeatureFriendsTCEducationTitle.buttonGotIt
					}
				},
				{
					buttonType = ButtonType.Secondary,
					props = {
						onActivated = UseResult2,
						text = FeatureFriendsTCEducationTitle.buttonManage
					}
				}
			},
			forcedFillDirection = Enum.FillDirection.Horizontal
		}
	}, {
		ViewContainer = ReactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			AutomaticSize = Enum.AutomaticSize.Y,
			Size = UDim2.fromScale(1, 0)
		}, {
			UIListLayout = ReactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Vertical,
				SortOrder = Enum.SortOrder.LayoutOrder,
				HorizontalAlignment = Enum.HorizontalAlignment.Center
			}),
			TextContainer = ReactModule.createElement("Frame", {
				LayoutOrder = 2,
				BackgroundTransparency = 1,
				AutomaticSize = Enum.AutomaticSize.Y,
				Size = UDim2.fromScale(1, 0)
			}, {
				UIListLayout = ReactModule.createElement("UIListLayout", {
					FillDirection = Enum.FillDirection.Vertical,
					SortOrder = Enum.SortOrder.LayoutOrder,
					Padding = UDim.new(0, UseTokensResult.Padding.Large),
					HorizontalAlignment = Enum.HorizontalAlignment.Center
				}),
				OuterPadding = ReactModule.createElement("UIPadding", {
					PaddingTop = UDim.new(0, UseTokensResult.Padding.Medium),
					PaddingBottom = UDim.new(0, UseTokensResult.Padding.Large)
				}),
				ConnectTextIntro = if UseStateResult == AccessResponseEnum.Pending then ReactModule.createElement(Skeleton, { LayoutOrder = 1, Size = UDim2.new(1, 0, 0, 30) }) else ReactModule.createElement(Text, {
					LayoutOrder = 1,
					tag = "auto-y grow size-full-0 text-align-x-left text-wrap",
					Text = if UseStateResult == AccessResponseEnum.Granted then FeatureFriendsTCEducationTitle.textIntro18Plus else FeatureFriendsTCEducationTitle.textIntro
				}),
				ConnectOptionText1 = ReactModule.createElement(TextWithIcon, {
					layoutOrder = 2,
					icon = "icons/menu/platformChatOff_small",
					text = FeatureFriendsTCEducationTitle.textChatWithoutFilters,
					iconPadding = UseTokensResult.Padding.Medium
				}),
				ConnectOptionText2 = ReactModule.createElement(TextWithIcon, {
					layoutOrder = 3,
					icon = "icons/controls/microphone_small",
					text = FeatureFriendsTCEducationTitle.textPartyVoice,
					iconPadding = UseTokensResult.Padding.Medium
				}),
				ConnectOptionText3 = ReactModule.createElement(TextWithIcon, {
					layoutOrder = 4,
					icon = "icons/actions/edit/add_small",
					text = FeatureFriendsTCEducationTitle.textAndMore,
					iconPadding = UseTokensResult.Padding.Medium
				}),
				ConnectTextOutro = if UseStateResult == AccessResponseEnum.Pending then ReactModule.createElement(Skeleton, { LayoutOrder = 5, Size = UDim2.new(1, 0, 0, 60) }) else ReactModule.createElement(Text, {
					LayoutOrder = 5,
					tag = "auto-y grow size-full-0 text-align-x-left text-wrap",
					Text = if UseStateResult == AccessResponseEnum.Granted then FeatureFriendsTCEducationTitle.textOutro18Plus else FeatureFriendsTCEducationTitle.textOutro
				})
			})
		})
	})
end