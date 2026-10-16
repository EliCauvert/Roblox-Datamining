local ContactImporter = script:FindFirstAncestor("ContactImporter")
local Parent = ContactImporter.Parent
local DependenciesModule = require(ContactImporter.dependencies)
local UseAppPolicyFunction = require(Parent.UniversalAppPolicy).useAppPolicy
local UseDispatchFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useDispatch
local Roact = DependenciesModule.Roact
local React = DependenciesModule.React
local UIBlox = DependenciesModule.UIBlox
local UseLocalizationFunction = DependenciesModule.useLocalization
local UseStyleFunction = DependenciesModule.useStyle
local FullPageModal = UIBlox.App.Dialog.Modal.FullPageModal
local ButtonType = UIBlox.App.Button.Enum.ButtonType
local StyledTextLabel = UIBlox.App.Text.StyledTextLabel
local HorizontalPageMargin = UIBlox.App.Container.HorizontalPageMargin
local SectionList = DependenciesModule.SectionList
local TextKeysModule = require(ContactImporter.Common.TextKeys)
local ContactsListEntryModule = require(ContactImporter.ContactsList.Components.ContactsListEntry)
local ContactsListInviteEntryModule = require(ContactImporter.ContactsList.Components.ContactsListInviteEntry)
local ContactsEmptyListModule = require(ContactImporter.ContactsList.Components.ContactsEmptyList)
local ContactsUploadErrorModalModule = require(ContactImporter.ContactsList.Components.ContactsUploadErrorModal)
local ContactsGlimmerModule = require(ContactImporter.ContactsList.Components.ContactsGlimmer)
local ContactsSyncWarningMessageModule = require(ContactImporter.ContactsList.Components.ContactsSyncWarningMessage)
local EventNames = require(ContactImporter.Analytics).EventNames
local _ = require(ContactImporter.Common.LocalTypes)
local ContactsListSearchBarModule = require(ContactImporter.ContactsList.Components.ContactsListSearchBar)
local Dash = DependenciesModule.Dash
local FoundationModule = require(Parent.Foundation)
local InputLabel = FoundationModule.InputLabel
local InputLabelSize = FoundationModule.Enums.InputLabelSize
local AppPage = require(Parent.RobloxAppEnums).AppPage
local NavigateDownFunction = require(Parent.NavigationRodux).Thunks.NavigateDown
local FFlagSignalsNavP3Dispatch = require(Parent.SharedFlags).FFlagSignalsNavP3Dispatch
local NavigationCommands = if FFlagSignalsNavP3Dispatch then require(Parent.RobloxAppNavigation).NavigationCommands else nil
local ContactImportButtonsIXPModule = require(ContactImporter.Flags.ContactImportButtonsIXP)
local ContactImportButtonsExperimentEnabled = game:DefineFastFlag("ContactImportButtonsExperimentEnabled", false)
local FFlagAddFriendsBannersNewUIIXP = require(Parent.SharedFlags).FFlagAddFriendsBannersNewUI_IXP
local IXPService = game:GetService("IXPService")
local UprankContactsWithEmojiFunction = require(ContactImporter.Utils).uprankContactsWithEmoji
local FFlagContactsListEmojiSortingModule = require(ContactImporter.Flags.FFlagContactsListEmojiSorting)
local ContactsListEmojiSortingIxpEnabled = game:DefineFastFlag("ContactsListEmojiSortingIxpEnabled", false)
local ContactsListEmojiSortingIxpLayer = game:DefineFastString("ContactsListEmojiSortingIxpLayer", "Social.ContactListEmojiSorting")
local FFlagQRCodeCopyUpdates = require(Parent.SharedFlags).FFlagQRCodeCopyUpdates
local FStringCanAccessTrustedContactsAmpFeature = require(Parent.SharedFlags).FStringCanAccessTrustedContactsAmpFeature
local FStringIsUserInTcEligibleCountryAmpFeature = require(Parent.SharedFlags).FStringIsUserInTcEligibleCountryAmpFeature
local FFlagTCPolicyCheckRedirect = require(Parent.SharedFlags).FFlagTCPolicyCheckRedirect
local FStringCanAccessTrustedContactsAmpNameSpace = require(Parent.SharedFlags).FStringCanAccessTrustedContactsAmpNameSpace
local AmpApiProvider = require(Parent.AmpUpsell).AmpApiProvider
local AmpEnums = require(Parent.AmpUpsell).AmpEnums
local UserInputService = DependenciesModule.UserInputService

return function(p1) --[[ Line: 97 | Named "ContactsList" ]]
	-- upvalues: UseAppPolicyFunction (copy), UseStyleFunction (copy), UseDispatchFunction (copy), UseLocalizationFunction (copy), TextKeysModule (copy), ContactImportButtonsExperimentEnabled (copy), ContactImportButtonsIXPModule (copy), Dash (copy), EventNames (copy), React (copy), AppPage (copy), FFlagSignalsNavP3Dispatch (copy), NavigationCommands (copy), NavigateDownFunction (copy), FFlagContactsListEmojiSortingModule (copy), UprankContactsWithEmojiFunction (copy), ContactsListEmojiSortingIxpEnabled (copy), IXPService (copy), ContactsListEmojiSortingIxpLayer (copy), FFlagQRCodeCopyUpdates (copy), FFlagTCPolicyCheckRedirect (copy), FStringIsUserInTcEligibleCountryAmpFeature (copy), FStringCanAccessTrustedContactsAmpFeature (copy), AmpApiProvider (copy), FStringCanAccessTrustedContactsAmpNameSpace (copy), AmpEnums (copy), Roact (copy), ContactsListEntryModule (copy), ContactsListInviteEntryModule (copy), StyledTextLabel (copy), ButtonType (copy), UserInputService (copy), FFlagAddFriendsBannersNewUIIXP (copy), ContactsSyncWarningMessageModule (copy), SectionList (copy), ContactsEmptyListModule (copy), InputLabel (copy), InputLabelSize (copy), ContactsListSearchBarModule (copy), ContactsGlimmerModule (copy), ContactsUploadErrorModalModule (copy), FullPageModal (copy), HorizontalPageMargin (copy)
	local UseAppPolicyResult = UseAppPolicyFunction(function(p2) --[[ Line: 98 ]]
		return p2.getWebViewSupport()
	end)
	local UseStyleResult = UseStyleFunction()
	local UseDispatchResult = UseDispatchFunction()
	local UseLocalizationResult = UseLocalizationFunction({
		learnMore = "Feature.Chat.Action.LearnMore",
		fromContactsText = TextKeysModule.ON_ROBLOX,
		inviteToRobloxText = TextKeysModule.INVITE_TO_ROBLOX,
		contactsListBlurb = TextKeysModule.CONTACTS_LIST_DESCRIPTION,
		contactsListTFEducationBlurb = TextKeysModule.ADD_CONTACTS_AS_TRUSTED_FRIENDS_DESCRIPTION,
		connectWithFriends = TextKeysModule.CONTACTS_LIST_TITLE,
		closeModal = TextKeysModule.CLOSE_MODAL,
		goToAddFriends = TextKeysModule.GO_TO_ADD_FRIENDS,
		searchContacts = TextKeysModule.SEARCH_CONTACTS
	})
	local UseIsRemoveCloseButtonExperimentEnabledResult = if ContactImportButtonsExperimentEnabled then ContactImportButtonsIXPModule.useIsRemoveCloseButtonExperimentEnabled({ isExposureEnabled = true }) else false
	
	local function v48(p2, FilterResult, FilterResult1) --[[ Line: 120 ]]
		-- upvalues: Dash (upval)
		Dash.append(p2, FilterResult, if #FilterResult == 0 then nil else { { isSectionDivider = true } }, FilterResult1)
	end
	
	local function OnActivated() --[[ Line: 125 ]]
		-- upvalues: p1 (copy), EventNames (upval)
		p1.closeModal(EventNames.CloseContactListButton)
	end
	
	local function OnCloseClicked() --[[ Line: 129 ]]
		-- upvalues: p1 (copy), EventNames (upval)
		p1.closeModal(EventNames.CloseContactListCross)
	end
	
	local UseResult = React.useCallback(function() --[[ Line: 133 ]]
		-- upvalues: AppPage (upval), FFlagSignalsNavP3Dispatch (upval), NavigationCommands (upval), UseDispatchResult (copy), NavigateDownFunction (upval)
		local config = {
			detail = "https://en.help.roblox.com/hc/en-us/articles/37725513985812",
			name = AppPage.GenericWebPage,
			extraProps = { title = "" }
		}
		
		if FFlagSignalsNavP3Dispatch then
			NavigationCommands.down(NavigationCommands.fromLegacyPage(config))
			
			return
		else
			UseDispatchResult(NavigateDownFunction(config, nil))
		end
	end, { UseDispatchResult })
	local UseStateResult, UseStateResult2 = React.useState("")
	
	local function _(p2) --[[ Line: 150 ]]
		-- upvalues: Dash (upval), UseStateResult (copy)
		return Dash.filter(p2, function(p3): boolean --[[ Line: 151 ]]
			-- upvalues: UseStateResult (upval)
			return if p3.contactName == nil then string.find(string.lower(p3.contactName or ""), string.lower(UseStateResult)) ~= nil else not p3.contactName:match("^%s*$") and string.find(string.lower(p3.contactName or ""), string.lower(UseStateResult)) ~= nil
		end)
	end
	
	local UseMemoResult = if FFlagContactsListEmojiSortingModule then React.useMemo(function() --[[ Line: 165 ]]
		-- upvalues: UprankContactsWithEmojiFunction (upval), p1 (copy)
		return UprankContactsWithEmojiFunction(p1.matchedContacts)
	end, { p1.matchedContacts }) else nil
	local UseMemoResult1 = if FFlagContactsListEmojiSortingModule then React.useMemo(function() --[[ Line: 170 ]]
		-- upvalues: UprankContactsWithEmojiFunction (upval), p1 (copy)
		return UprankContactsWithEmojiFunction(p1.deviceContacts)
	end, { p1.deviceContacts }) else nil
	local FilterResult = if FFlagContactsListEmojiSortingModule then Dash.filter(UseMemoResult, function(p2): boolean --[[ Line: 151 ]]
		-- upvalues: UseStateResult (copy)
		return if p2.contactName == nil then string.find(string.lower(p2.contactName or ""), string.lower(UseStateResult)) ~= nil else not p2.contactName:match("^%s*$") and string.find(string.lower(p2.contactName or ""), string.lower(UseStateResult)) ~= nil
	end) else Dash.filter(p1.matchedContacts, function(p2): boolean --[[ Line: 151 ]]
		-- upvalues: UseStateResult (copy)
		return if p2.contactName == nil then string.find(string.lower(p2.contactName or ""), string.lower(UseStateResult)) ~= nil else not p2.contactName:match("^%s*$") and string.find(string.lower(p2.contactName or ""), string.lower(UseStateResult)) ~= nil
	end)
	local FilterResult1 = if FFlagContactsListEmojiSortingModule then Dash.filter(UseMemoResult1, function(p2): boolean --[[ Line: 151 ]]
		-- upvalues: UseStateResult (copy)
		return if p2.contactName == nil then string.find(string.lower(p2.contactName or ""), string.lower(UseStateResult)) ~= nil else not p2.contactName:match("^%s*$") and string.find(string.lower(p2.contactName or ""), string.lower(UseStateResult)) ~= nil
	end) else Dash.filter(p1.deviceContacts, function(p2): boolean --[[ Line: 151 ]]
		-- upvalues: UseStateResult (copy)
		return if p2.contactName == nil then string.find(string.lower(p2.contactName or ""), string.lower(UseStateResult)) ~= nil else not p2.contactName:match("^%s*$") and string.find(string.lower(p2.contactName or ""), string.lower(UseStateResult)) ~= nil
	end)
	
	if ContactsListEmojiSortingIxpEnabled then
		React.useEffect(function() --[[ Line: 185 ]]
			-- upvalues: IXPService (upval), ContactsListEmojiSortingIxpLayer (upval)
			IXPService:LogFlagLinkedUserLayerExposure(ContactsListEmojiSortingIxpLayer)
		end, {})
	end
	local UseStateResult1, UseStateResult2_1 = React.useState(false)
	
	if FFlagQRCodeCopyUpdates then
		React.useEffect(function() --[[ Line: 193 ]]
			-- upvalues: FFlagTCPolicyCheckRedirect (upval), FStringIsUserInTcEligibleCountryAmpFeature (upval), FStringCanAccessTrustedContactsAmpFeature (upval), AmpApiProvider (upval), FStringCanAccessTrustedContactsAmpNameSpace (upval), AmpEnums (upval), UseStateResult2_1 (copy)
			if AmpApiProvider.upsellFeatureAccess(if FFlagTCPolicyCheckRedirect then FStringIsUserInTcEligibleCountryAmpFeature else FStringCanAccessTrustedContactsAmpFeature, {}, FStringCanAccessTrustedContactsAmpNameSpace).access == AmpEnums.AccessResponseEnum.Granted then
				UseStateResult2_1(true)
			end
		end)
	end
	local t = {}
	v48(t, FilterResult, FilterResult1)
	local List = {}
	
	if #FilterResult > 0 then
		table.insert(List, {
			data = FilterResult,
			title = UseLocalizationResult.fromContactsText,
			sectionNumber = #List + 1
		})
	end
	if #FilterResult1 > 0 then
		table.insert(List, {
			data = FilterResult1,
			title = UseLocalizationResult.inviteToRobloxText,
			sectionNumber = #List + 1
		})
	end
	local _ = function(): boolean --[[ Line: 223 ]]
		-- upvalues: p1 (copy)
		return #p1.matchedContacts + #p1.deviceContacts == 0
	end
	
	local function RenderItem(p2) --[[ Line: 227 ]]
		-- upvalues: Roact (upval), UseStyleResult (copy), ContactsListEntryModule (upval), UseLocalizationResult (copy), p1 (copy), ContactsListInviteEntryModule (upval)
		local Item = p2.item
		
		if Item.isSectionDivider then
			local IsNotIndexMatch = p2.index ~= 1
			
			return Roact.createElement("Frame", {
				BackgroundTransparency = 1,
				Size = UDim2.new(1, 0, 0, 24)
			}, {
				divider = Roact.createElement("Frame", {
					BorderSizePixel = 0,
					Size = UDim2.new(1, 0, 0, 1),
					Position = UDim2.new(0, 0, if IsNotIndexMatch then 0.5 else 0.5, 0),
					BackgroundColor3 = UseStyleResult.Theme.Divider.Color,
					BackgroundTransparency = UseStyleResult.Theme.Divider.Transparency
				})
			})
		else
			return if Item.isMatchedContact then Roact.createElement(ContactsListEntryModule, {
				hasDivider = true,
				contactName = Item.contactName,
				contactId = Item.contactId,
				contextualInfo = UseLocalizationResult.fromContactsText,
				hasSentRequest = Item.hasSentRequest,
				requestFriendship = p1.requestFriendship,
				openProfilePeekView = p1.openProfilePeekView,
				headshotThumbnailUrl = Item.headshotThumbnailUrl,
				avatarThumbnailUrl = Item.avatarThumbnailUrl
			}) else Roact.createElement(ContactsListInviteEntryModule, {
				hasDivider = true,
				contactName = Item.contactName,
				deviceContactId = Item.deviceContactId,
				phoneNumber = Item.phoneNumber,
				hasSentRequest = Item.hasSentRequest
			})
		end
	end
	
	local function v65(p2) --[[ Line: 266 ]]
		-- upvalues: Roact (upval), StyledTextLabel (upval), UseStyleResult (copy)
		return if p2.section then Roact.createElement("Frame", { BackgroundTransparency = 1, Size = UDim2.new(1, 0, 0, 0) }, {
			layout = Roact.createElement("UIListLayout", {
				SortOrder = Enum.SortOrder.LayoutOrder,
				FillDirection = Enum.FillDirection.Vertical
			}),
			padding = if p2.section.sectionNumber == 1 then nil else Roact.createElement("Frame", {
				BackgroundTransparency = 1,
				LayoutOrder = 1,
				Size = UDim2.new(1, 0, 0, 24)
			}),
			Roact.createElement("Frame", {
				LayoutOrder = 2,
				BackgroundTransparency = 1,
				Size = UDim2.new(1, 0, 0, 24)
			}, {
				sectionHeaderTextLabel = Roact.createElement(StyledTextLabel, {
					fontStyle = UseStyleResult.Font.Header2,
					colorStyle = UseStyleResult.Theme.TextDefault,
					text = p2.section.title or ""
				})
			})
		}) else Roact.createElement("Frame", {
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 0, 24)
		}, {
			divider = Roact.createElement("Frame", {
				BorderSizePixel = 0,
				Size = UDim2.new(1, 0, 0, 1),
				Position = UDim2.new(0, 0, 0.5, 0),
				BackgroundColor3 = UseStyleResult.Theme.Divider.Color,
				BackgroundTransparency = UseStyleResult.Theme.Divider.Transparency
			})
		})
	end
	
	local function v66(p2) --[[ Line: 311 ]]
		-- upvalues: p1 (copy), ButtonType (upval), Dash (upval), UseIsRemoveCloseButtonExperimentEnabledResult (copy), OnActivated (copy)
		if p1.isFetching then
			return {
				{
					buttonType = ButtonType.PrimarySystem,
					props = { isLoading = true, onActivated = Dash.noop }
				}
			}
		elseif p1.showAddFriendsButton and #p1.matchedContacts + #p1.deviceContacts == 0 then
			return if UseIsRemoveCloseButtonExperimentEnabledResult then {
				{
					buttonType = ButtonType.PrimarySystem,
					props = {
						onActivated = p1.onAddFriendsActivated,
						text = p2.goToAddFriends
					}
				}
			} else {
				{
					buttonType = ButtonType.PrimarySystem,
					props = {
						onActivated = p1.onAddFriendsActivated,
						text = p2.goToAddFriends
					}
				},
				{
					buttonType = ButtonType.Secondary,
					props = { onActivated = OnActivated, text = p2.closeModal }
				}
			}
		else
			return if UseIsRemoveCloseButtonExperimentEnabledResult then {} else {
				{
					buttonType = ButtonType.PrimarySystem,
					props = { onActivated = OnActivated, text = p2.closeModal }
				}
			}
		end
	end
	
	local Y = UserInputService.StatusBarSize.Y
	local UseIsVisibleResult = if FFlagAddFriendsBannersNewUIIXP then ContactsSyncWarningMessageModule.useIsVisible() else nil
	local config = {
		layout = Roact.createElement("UIListLayout", {
			HorizontalAlignment = Enum.HorizontalAlignment.Center,
			SortOrder = Enum.SortOrder.LayoutOrder,
			FillDirection = Enum.FillDirection.Vertical
		}),
		contactsSyncWarning = if FFlagAddFriendsBannersNewUIIXP and UseIsVisibleResult then React.createElement(ContactsSyncWarningMessageModule.Component, { layoutOrder = -1 }) else nil
	}
	local Ref = React.createRef()
	local config1 = {
		layout = Roact.createElement("UIListLayout", {
			HorizontalAlignment = Enum.HorizontalAlignment.Center,
			SortOrder = Enum.SortOrder.LayoutOrder,
			FillDirection = Enum.FillDirection.Vertical
		}),
		contactsSyncWarning = if FFlagAddFriendsBannersNewUIIXP and UseIsVisibleResult then React.createElement(ContactsSyncWarningMessageModule.Component, { layoutOrder = -1 }) else nil,
		spacer1 = if FFlagAddFriendsBannersNewUIIXP and UseIsVisibleResult then nil else Roact.createElement("Frame", {
			BackgroundTransparency = 1,
			LayoutOrder = 1,
			Size = UDim2.new(1, 0, 0, 24)
		}),
		descriptionFrame = if FFlagAddFriendsBannersNewUIIXP and UseIsVisibleResult then nil else Roact.createElement("Frame", {
			BackgroundTransparency = 1,
			LayoutOrder = 2,
			Size = UDim2.new(1, 0, 0, 80)
		}, {
			textLayout = Roact.createElement("UIListLayout", {
				HorizontalAlignment = if FFlagQRCodeCopyUpdates and UseStateResult1 then Enum.HorizontalAlignment.Left else Enum.HorizontalAlignment.Center,
				VerticalAlignment = Enum.VerticalAlignment.Center,
				SortOrder = Enum.SortOrder.LayoutOrder
			}),
			descriptionText = Roact.createElement(StyledTextLabel, {
				lineHeight = 1,
				layoutOrder = 1,
				text = if FFlagQRCodeCopyUpdates and UseStateResult1 then UseLocalizationResult.contactsListTFEducationBlurb else UseLocalizationResult.contactsListBlurb,
				automaticSize = Enum.AutomaticSize.Y,
				colorStyle = UseStyleResult.Theme.TextDefault,
				fontStyle = UseStyleResult.Font.Body,
				size = UDim2.new(1, 0, 0, 0),
				maxSize = Vector2.new(0, 80),
				textXAlignment = if FFlagQRCodeCopyUpdates and UseStateResult1 then Enum.TextXAlignment.Left else Enum.TextXAlignment.Center,
				textYAlignment = Enum.TextYAlignment.Center
			}),
			LearnMoreWebLink = UseAppPolicyResult and React.createElement(InputLabel, {
				LayoutOrder = 2,
				tag = "auto-y size-full-0",
				RichText = true,
				Text = `<u>{UseLocalizationResult.learnMore}</u>`,
				size = InputLabelSize.Large,
				onActivated = UseResult
			})
		}),
		spacer2 = if FFlagAddFriendsBannersNewUIIXP and UseIsVisibleResult then nil else Roact.createElement("Frame", {
			BackgroundTransparency = 1,
			LayoutOrder = 3,
			Size = UDim2.new(1, 0, 0, 24)
		}),
		searchBarContainer = Roact.createElement(ContactsListSearchBarModule, {
			height = 36,
			layoutOrder = 4,
			textChangeCallback = function(p2) --[[ Line: 387 ]]
				-- upvalues: UseStateResult2 (copy)
				UseStateResult2(p2)
			end
		}),
		spacer4 = Roact.createElement("Frame", {
			BackgroundTransparency = 1,
			LayoutOrder = 7,
			Size = UDim2.new(1, 0, 0, 16)
		}),
		contactsList = if #t == 0 then Roact.createElement(ContactsEmptyListModule, {
			layoutOrder = 8,
			errorTextKey = TextKeysModule.NO_RESULTS
		}) else Roact.createElement(SectionList, {
			initialNumToRender = 15,
			ref = Ref,
			sections = List,
			renderSectionHeader = if #FilterResult > 0 then v65 else nil,
			renderItem = RenderItem,
			CanvasSize = UDim2.new(1, 0, 0, #t * 73),
			contentContainerStyle = { BackgroundTransparency = 1, BorderSizePixel = 0 },
			style = {
				BackgroundTransparency = 1,
				ScrollBarThickness = 0,
				LayoutOrder = 8,
				Size = UDim2.new(1, 0, 1, -80 - (if UseIsRemoveCloseButtonExperimentEnabledResult then 0 else 48) - 36 - 16),
				ElasticBehavior = Enum.ElasticBehavior.Always
			}
		})
	}
	
	if p1.isFetching then
		for _, LayoutOrder in { 1, 2, 3 } do
			config["glimmer" .. LayoutOrder] = Roact.createElement(ContactsGlimmerModule, { layoutOrder = LayoutOrder })
		end
	elseif p1.hasUploadError and #p1.matchedContacts + #p1.deviceContacts == 0 then
		config.errorModal = Roact.createElement(ContactsUploadErrorModalModule)
	elseif #p1.matchedContacts + #p1.deviceContacts == 0 then
		config.emptyList = Roact.createElement(ContactsEmptyListModule)
	else
		config = config1
	end
	return Roact.createElement(FullPageModal, {
		marginSize = 0,
		title = UseLocalizationResult.connectWithFriends,
		screenSize = p1.screenSize,
		distanceFromTop = Y,
		onCloseClicked = OnCloseClicked,
		buttonStackProps = {
			buttons = v66(UseLocalizationResult),
			buttonHeight = if UseIsRemoveCloseButtonExperimentEnabledResult then 0 else 48,
			forcedFillDirection = Enum.FillDirection.Vertical
		}
	}, {
		hpm = Roact.createElement(HorizontalPageMargin, {
			backgroundTransparency = 1,
			size = UDim2.new(1, 0, 1, 0),
			position = UDim2.new(0, 0, 0, 0)
		}, {
			contentFrame = Roact.createElement("Frame", { BackgroundTransparency = 1, Size = UDim2.fromScale(1, 1) }, config),
			gradientFrame = Roact.createElement("Frame", {
				BackgroundTransparency = 0,
				BorderSizePixel = 0,
				ZIndex = 2,
				Position = UDim2.new(0, 0, 1, if UseIsRemoveCloseButtonExperimentEnabledResult then 0 else -24),
				Size = UDim2.new(1, 0, 0, 24),
				BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			}, {
				gradient = Roact.createElement("UIGradient", {
					Rotation = 270,
					Color = ColorSequence.new({
						ColorSequenceKeypoint.new(0, UseStyleResult.Theme.BackgroundUIDefault.Color),
						ColorSequenceKeypoint.new(1, UseStyleResult.Theme.BackgroundUIDefault.Color)
					}),
					Transparency = NumberSequence.new({
						NumberSequenceKeypoint.new(0, 0),
						NumberSequenceKeypoint.new(1, 1)
					})
				})
			})
		})
	})
end