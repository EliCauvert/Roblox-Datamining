local contactImporter = script:FindFirstAncestor("ContactImporter")
local parent = contactImporter.Parent
local dependenciesModule = require(contactImporter.dependencies)
local useAppPolicy = require(parent.UniversalAppPolicy).useAppPolicy
local useDispatch = require(parent.RoactUtils).Hooks.RoactRodux.useDispatch
local roact = dependenciesModule.Roact
local react = dependenciesModule.React
local UIBlox = dependenciesModule.UIBlox
local useLocalization = dependenciesModule.useLocalization
local useStyle = dependenciesModule.useStyle
local fullPageModal = UIBlox.App.Dialog.Modal.FullPageModal
local buttonType = UIBlox.App.Button.Enum.ButtonType
local styledTextLabel = UIBlox.App.Text.StyledTextLabel
local horizontalPageMargin = UIBlox.App.Container.HorizontalPageMargin
local sectionList = dependenciesModule.SectionList
local textKeysModule = require(contactImporter.Common.TextKeys)
local contactsListEntryModule = require(contactImporter.ContactsList.Components.ContactsListEntry)
local contactsListInviteEntryModule = require(contactImporter.ContactsList.Components.ContactsListInviteEntry)
local contactsEmptyListModule = require(contactImporter.ContactsList.Components.ContactsEmptyList)
local contactsUploadErrorModalModule = require(contactImporter.ContactsList.Components.ContactsUploadErrorModal)
local contactsGlimmerModule = require(contactImporter.ContactsList.Components.ContactsGlimmer)
local contactsSyncWarningMessageModule = require(contactImporter.ContactsList.Components.ContactsSyncWarningMessage)
local eventNames = require(contactImporter.Analytics).EventNames
local _ = require(contactImporter.Common.LocalTypes)
local contactsListSearchBarModule = require(contactImporter.ContactsList.Components.ContactsListSearchBar)
local dash = dependenciesModule.Dash
local foundationModule = require(parent.Foundation)
local inputLabel = foundationModule.InputLabel
local inputLabelSize = foundationModule.Enums.InputLabelSize
local appPage = require(parent.RobloxAppEnums).AppPage
local navigateDown = require(parent.NavigationRodux).Thunks.NavigateDown
local fFlagSignalsNavP3Dispatch = require(parent.SharedFlags).FFlagSignalsNavP3Dispatch
local var1 = if fFlagSignalsNavP3Dispatch then require(parent.RobloxAppNavigation).NavigationCommands else nil
local contactImportButtonsIXPModule = require(contactImporter.Flags.ContactImportButtonsIXP)
local contactImportButtonsExperimentEnabled = game:DefineFastFlag("ContactImportButtonsExperimentEnabled", false)
local fFlagAddFriendsBannersNewUIIXP = require(parent.SharedFlags).FFlagAddFriendsBannersNewUI_IXP
local IXPService = game:GetService("IXPService")
local uprankContactsWithEmoji = require(contactImporter.Utils).uprankContactsWithEmoji
local fFlagContactsListEmojiSortingModule = require(contactImporter.Flags.FFlagContactsListEmojiSorting)
local contactsListEmojiSortingIxpEnabled = game:DefineFastFlag("ContactsListEmojiSortingIxpEnabled", false)
local contactsListEmojiSortingIxpLayer = game:DefineFastString("ContactsListEmojiSortingIxpLayer", "Social.ContactListEmojiSorting")
local fFlagQRCodeCopyUpdates = require(parent.SharedFlags).FFlagQRCodeCopyUpdates
local fFlagConnectionsToFriendsRename = require(parent.SharedFlags).FFlagConnectionsToFriendsRename
local fStringCanAccessTrustedContactsAmpFeature = require(parent.SharedFlags).FStringCanAccessTrustedContactsAmpFeature
local fStringIsUserInTcEligibleCountryAmpFeature = require(parent.SharedFlags).FStringIsUserInTcEligibleCountryAmpFeature
local fFlagTCPolicyCheckRedirect = require(parent.SharedFlags).FFlagTCPolicyCheckRedirect
local fStringCanAccessTrustedContactsAmpNameSpace = require(parent.SharedFlags).FStringCanAccessTrustedContactsAmpNameSpace
local ampApiProvider = require(parent.AmpUpsell).AmpApiProvider
local ampEnums = require(parent.AmpUpsell).AmpEnums
local userInputService = dependenciesModule.UserInputService

return function(p1)
	-- upvalues: useAppPolicy (ref), useStyle (ref), useDispatch (ref), useLocalization (ref), textKeysModule (ref), fFlagQRCodeCopyUpdates (ref), fFlagConnectionsToFriendsRename (ref), contactImportButtonsExperimentEnabled (ref), contactImportButtonsIXPModule (ref), dash (ref), eventNames (ref), react (ref), appPage (ref), fFlagSignalsNavP3Dispatch (ref), var1 (ref), navigateDown (ref), fFlagContactsListEmojiSortingModule (ref), uprankContactsWithEmoji (ref), contactsListEmojiSortingIxpEnabled (ref), IXPService (ref), contactsListEmojiSortingIxpLayer (ref), fFlagTCPolicyCheckRedirect (ref), fStringIsUserInTcEligibleCountryAmpFeature (ref), fStringCanAccessTrustedContactsAmpFeature (ref), ampApiProvider (ref), fStringCanAccessTrustedContactsAmpNameSpace (ref), ampEnums (ref), roact (ref), contactsListEntryModule (ref), contactsListInviteEntryModule (ref), styledTextLabel (ref), buttonType (ref), userInputService (ref), fFlagAddFriendsBannersNewUIIXP (ref), contactsSyncWarningMessageModule (ref), sectionList (ref), contactsEmptyListModule (ref), inputLabel (ref), inputLabelSize (ref), contactsListSearchBarModule (ref), contactsGlimmerModule (ref), contactsUploadErrorModalModule (ref), fullPageModal (ref), horizontalPageMargin (ref)
	local var2 = useAppPolicy(function(p2)
		return p2.getWebViewSupport()
	end)
	local var3 = useStyle()
	local var4 = useDispatch()
	local var5 = useLocalization({
		learnMore = "Feature.Chat.Action.LearnMore",
		fromContactsText = textKeysModule.ON_ROBLOX,
		inviteToRobloxText = textKeysModule.INVITE_TO_ROBLOX,
		contactsListBlurb = textKeysModule.CONTACTS_LIST_DESCRIPTION,
		contactsListTCEducationBlurb = if fFlagQRCodeCopyUpdates then textKeysModule.ADD_CONTACTS_AS_TRUSTED_CONNECTION_DESCRIPTION else nil,
		contactsListTFEducationBlurb = if fFlagConnectionsToFriendsRename then textKeysModule.ADD_CONTACTS_AS_TRUSTED_FRIENDS_DESCRIPTION else nil,
		connectWithFriends = textKeysModule.CONTACTS_LIST_TITLE,
		closeModal = textKeysModule.CLOSE_MODAL,
		goToAddFriends = textKeysModule.GO_TO_ADD_FRIENDS,
		searchContacts = textKeysModule.SEARCH_CONTACTS
	})
	local var6 = if contactImportButtonsExperimentEnabled then contactImportButtonsIXPModule.useIsRemoveCloseButtonExperimentEnabled({ isExposureEnabled = true }) else false
	
	local var7 = function(p2, p3, p4)
		-- upvalues: dash (copy)
		dash.append(p2, p3, if #p3 ~= 0 then nil else { { isSectionDivider = true } }, p4)
	end
	
	local var8 = function()
		-- upvalues: p1 (ref), eventNames (copy)
		p1.closeModal(eventNames.CloseContactListButton)
	end
	
	local var9 = function()
		-- upvalues: p1 (ref), eventNames (copy)
		p1.closeModal(eventNames.CloseContactListCross)
	end
	
	local var10 = react.useCallback(function()
		-- upvalues: appPage (copy), fFlagSignalsNavP3Dispatch (copy), var1 (copy), var4 (ref), navigateDown (copy)
		local t = {
			detail = "https://en.help.roblox.com/hc/en-us/articles/37725513985812",
			name = appPage.GenericWebPage,
			extraProps = { title = "" }
		}
		
		if fFlagSignalsNavP3Dispatch then
			var1.down(var1.fromLegacyPage(t))
			
			return
		end
		var4(navigateDown(t, nil))
	end, { var4 })
	local var11, var12 = react.useState("")
	
	local _ = function(p2)
		-- upvalues: dash (copy), var11 (ref)
		return dash.filter(p2, function(p3)
			-- upvalues: var11 (copy)
			return if p3.contactName == nil then string.find(string.lower(p3.contactName or ""), string.lower(var11)) ~= nil elseif p3.contactName:match("^%s*$") then false else string.find(string.lower(p3.contactName or ""), string.lower(var11)) ~= nil
		end)
	end
	
	local var13 = if fFlagContactsListEmojiSortingModule then react.useMemo(function()
		-- upvalues: uprankContactsWithEmoji (copy), p1 (ref)
		return uprankContactsWithEmoji(p1.matchedContacts)
	end, { p1.matchedContacts }) else nil
	local var14 = if fFlagContactsListEmojiSortingModule then react.useMemo(function()
		-- upvalues: uprankContactsWithEmoji (copy), p1 (ref)
		return uprankContactsWithEmoji(p1.deviceContacts)
	end, { p1.deviceContacts }) else nil
	local _ = {}
	local _ = {}
	local var15 = if fFlagContactsListEmojiSortingModule then dash.filter(var13, function(p2)
		-- upvalues: var11 (ref)
		return if p2.contactName == nil then string.find(string.lower(p2.contactName or ""), string.lower(var11)) ~= nil elseif p2.contactName:match("^%s*$") then false else string.find(string.lower(p2.contactName or ""), string.lower(var11)) ~= nil
	end) else dash.filter(p1.matchedContacts, function(p2)
		-- upvalues: var11 (ref)
		return if p2.contactName == nil then string.find(string.lower(p2.contactName or ""), string.lower(var11)) ~= nil elseif p2.contactName:match("^%s*$") then false else string.find(string.lower(p2.contactName or ""), string.lower(var11)) ~= nil
	end)
	local var16 = if fFlagContactsListEmojiSortingModule then dash.filter(var14, function(p2)
		-- upvalues: var11 (ref)
		return if p2.contactName == nil then string.find(string.lower(p2.contactName or ""), string.lower(var11)) ~= nil elseif p2.contactName:match("^%s*$") then false else string.find(string.lower(p2.contactName or ""), string.lower(var11)) ~= nil
	end) else dash.filter(p1.deviceContacts, function(p2)
		-- upvalues: var11 (ref)
		return if p2.contactName == nil then string.find(string.lower(p2.contactName or ""), string.lower(var11)) ~= nil elseif p2.contactName:match("^%s*$") then false else string.find(string.lower(p2.contactName or ""), string.lower(var11)) ~= nil
	end)
	
	if contactsListEmojiSortingIxpEnabled then
		react.useEffect(function()
			-- upvalues: IXPService (copy), contactsListEmojiSortingIxpLayer (copy)
			IXPService:LogFlagLinkedUserLayerExposure(contactsListEmojiSortingIxpLayer)
		end, {})
	end
	local var17, var18 = react.useState(false)
	
	if fFlagQRCodeCopyUpdates then
		react.useEffect(function()
			-- upvalues: fFlagTCPolicyCheckRedirect (copy), fStringIsUserInTcEligibleCountryAmpFeature (copy), fStringCanAccessTrustedContactsAmpFeature (copy), ampApiProvider (copy), fStringCanAccessTrustedContactsAmpNameSpace (copy), ampEnums (copy), var18 (ref)
			if ampApiProvider.upsellFeatureAccess(if fFlagTCPolicyCheckRedirect then fStringIsUserInTcEligibleCountryAmpFeature else fStringCanAccessTrustedContactsAmpFeature, {}, fStringCanAccessTrustedContactsAmpNameSpace).access == ampEnums.AccessResponseEnum.Granted then
				var18(true)
			end
		end)
	end
	local t = {}
	var7(t, var15, var16)
	local t_1 = {}
	
	if #var15 > 0 then
		table.insert(t_1, {
			data = var15,
			title = var5.fromContactsText,
			sectionNumber = #t_1 + 1
		})
	end
	if #var16 > 0 then
		table.insert(t_1, {
			data = var16,
			title = var5.inviteToRobloxText,
			sectionNumber = #t_1 + 1
		})
	end
	local createElement
	local _ = function()
		-- upvalues: p1 (ref)
		return #p1.matchedContacts + #p1.deviceContacts == 0
	end
	
	local var19 = function(p2)
		-- upvalues: roact (copy), var3 (ref), contactsListEntryModule (copy), var5 (ref), p1 (ref), contactsListInviteEntryModule (copy)
		local item = p2.item
		
		return if item.isSectionDivider then roact.createElement("Frame", {
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 0, 24)
		}, {
			divider = roact.createElement("Frame", {
				BorderSizePixel = 0,
				Size = UDim2.new(1, 0, 0, 1),
				Position = UDim2.new(0, 0, if p2.index ~= 1 then 0.5 else 0.5, 0),
				BackgroundColor3 = var3.Theme.Divider.Color,
				BackgroundTransparency = var3.Theme.Divider.Transparency
			})
		}) elseif item.isMatchedContact then roact.createElement(contactsListEntryModule, {
			hasDivider = true,
			contactName = item.contactName,
			contactId = item.contactId,
			contextualInfo = var5.fromContactsText,
			hasSentRequest = item.hasSentRequest,
			requestFriendship = p1.requestFriendship,
			openProfilePeekView = p1.openProfilePeekView,
			headshotThumbnailUrl = item.headshotThumbnailUrl,
			avatarThumbnailUrl = item.avatarThumbnailUrl
		}) else roact.createElement(contactsListInviteEntryModule, {
			hasDivider = true,
			contactName = item.contactName,
			deviceContactId = item.deviceContactId,
			phoneNumber = item.phoneNumber,
			hasSentRequest = item.hasSentRequest
		})
	end
	
	local var20 = function(p2)
		-- upvalues: roact (copy), styledTextLabel (copy), var3 (ref)
		return if p2.section then roact.createElement("Frame", { BackgroundTransparency = 1, Size = UDim2.new(1, 0, 0, 0) }, {
			layout = roact.createElement("UIListLayout", {
				SortOrder = Enum.SortOrder.LayoutOrder,
				FillDirection = Enum.FillDirection.Vertical
			}),
			padding = if p2.section.sectionNumber ~= 1 then nil else roact.createElement("Frame", {
				BackgroundTransparency = 1,
				LayoutOrder = 1,
				Size = UDim2.new(1, 0, 0, 24)
			}),
			roact.createElement("Frame", {
				LayoutOrder = 2,
				BackgroundTransparency = 1,
				Size = UDim2.new(1, 0, 0, 24)
			}, {
				sectionHeaderTextLabel = roact.createElement(styledTextLabel, {
					fontStyle = var3.Font.Header2,
					colorStyle = var3.Theme.TextDefault,
					text = p2.section.title or ""
				})
			})
		}) else roact.createElement("Frame", {
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 0, 24)
		}, {
			divider = roact.createElement("Frame", {
				BorderSizePixel = 0,
				Size = UDim2.new(1, 0, 0, 1),
				Position = UDim2.new(0, 0, 0.5, 0),
				BackgroundColor3 = var3.Theme.Divider.Color,
				BackgroundTransparency = var3.Theme.Divider.Transparency
			})
		})
	end
	
	local var21 = function(p2)
		-- upvalues: p1 (ref), buttonType (copy), dash (copy), var6 (ref), var8 (ref)
		return if p1.isFetching then {
			{
				buttonType = buttonType.PrimarySystem,
				props = { isLoading = true, onActivated = dash.noop }
			}
		} elseif p1.showAddFriendsButton and #p1.matchedContacts + #p1.deviceContacts == 0 then if var6 then {
			{
				buttonType = buttonType.PrimarySystem,
				props = {
					onActivated = p1.onAddFriendsActivated,
					text = p2.goToAddFriends
				}
			}
		} else {
			{
				buttonType = buttonType.PrimarySystem,
				props = {
					onActivated = p1.onAddFriendsActivated,
					text = p2.goToAddFriends
				}
			},
			{
				buttonType = buttonType.Secondary,
				props = { onActivated = var8, text = p2.closeModal }
			}
		} elseif var6 then {} else {
			{
				buttonType = buttonType.PrimarySystem,
				props = { onActivated = var8, text = p2.closeModal }
			}
		}
	end
	
	local y = userInputService.StatusBarSize.Y
	local var22 = if fFlagAddFriendsBannersNewUIIXP then contactsSyncWarningMessageModule.useIsVisible() else nil
	local t_2 = {
		layout = roact.createElement("UIListLayout", {
			HorizontalAlignment = Enum.HorizontalAlignment.Center,
			SortOrder = Enum.SortOrder.LayoutOrder,
			FillDirection = Enum.FillDirection.Vertical
		}),
		contactsSyncWarning = if fFlagAddFriendsBannersNewUIIXP and var22 then react.createElement(contactsSyncWarningMessageModule.Component, { layoutOrder = -1 }) else nil
	}
	
	local var23 = function(p2)
		-- upvalues: var12 (ref)
		var12(p2)
	end
	
	local var24 = if #t ~= 0 then roact.createElement(contactsEmptyListModule, {
		layoutOrder = 8,
		errorTextKey = textKeysModule.NO_RESULTS
	}) else roact.createElement(sectionList, {
		initialNumToRender = 15,
		ref = react.createRef(),
		sections = t_1,
		renderSectionHeader = if #var15 > 0 then var20 else nil,
		renderItem = var19,
		CanvasSize = UDim2.new(1, 0, 0, #t * 73),
		contentContainerStyle = { BackgroundTransparency = 1, BorderSizePixel = 0 },
		style = {
			BackgroundTransparency = 1,
			ScrollBarThickness = 0,
			LayoutOrder = 8,
			Size = UDim2.new(1, 0, 1, -80 - (if var6 then 0 else 48) - 36 - 16),
			ElasticBehavior = Enum.ElasticBehavior.Always
		}
	})
	local t_3 = {
		layout = roact.createElement("UIListLayout", {
			HorizontalAlignment = Enum.HorizontalAlignment.Center,
			SortOrder = Enum.SortOrder.LayoutOrder,
			FillDirection = Enum.FillDirection.Vertical
		}),
		contactsSyncWarning = if fFlagAddFriendsBannersNewUIIXP and var22 then react.createElement(contactsSyncWarningMessageModule.Component, { layoutOrder = -1 }) else nil,
		spacer1 = if fFlagAddFriendsBannersNewUIIXP and var22 then nil else roact.createElement("Frame", {
			BackgroundTransparency = 1,
			LayoutOrder = 1,
			Size = UDim2.new(1, 0, 0, 24)
		})
	}
	
	if fFlagAddFriendsBannersNewUIIXP and var22 then
		createElement = nil
	else
		createElement = roact.createElement
		createElement = createElement("Frame", {
			BackgroundTransparency = 1,
			LayoutOrder = 2,
			Size = UDim2.new(1, 0, 0, 80)
		}, {
			textLayout = roact.createElement("UIListLayout", {
				HorizontalAlignment = if fFlagQRCodeCopyUpdates and var17 then Enum.HorizontalAlignment.Left else Enum.HorizontalAlignment.Center,
				VerticalAlignment = Enum.VerticalAlignment.Center,
				SortOrder = Enum.SortOrder.LayoutOrder
			}),
			descriptionText = roact.createElement(styledTextLabel, {
				lineHeight = 1,
				layoutOrder = 1,
				text = if fFlagQRCodeCopyUpdates and var17 then if fFlagConnectionsToFriendsRename then var5.contactsListTFEducationBlurb else var5.contactsListTCEducationBlurb else var5.contactsListBlurb,
				automaticSize = Enum.AutomaticSize.Y,
				colorStyle = var3.Theme.TextDefault,
				fontStyle = var3.Font.Body,
				size = UDim2.new(1, 0, 0, 0),
				maxSize = Vector2.new(0, 80),
				textXAlignment = if fFlagQRCodeCopyUpdates and var17 then Enum.TextXAlignment.Left else Enum.TextXAlignment.Center,
				textYAlignment = Enum.TextYAlignment.Center
			}),
			LearnMoreWebLink = var2 and react.createElement(inputLabel, {
				LayoutOrder = 2,
				tag = "auto-y size-full-0",
				RichText = true,
				Text = `<u>{var5.learnMore}</u>`,
				size = inputLabelSize.Large,
				onActivated = var10
			})
		})
	end
	t_3.descriptionFrame = createElement
	t_3.spacer2 = if fFlagAddFriendsBannersNewUIIXP and var22 then nil else roact.createElement("Frame", {
		BackgroundTransparency = 1,
		LayoutOrder = 3,
		Size = UDim2.new(1, 0, 0, 24)
	})
	t_3.searchBarContainer = roact.createElement(contactsListSearchBarModule, { height = 36, layoutOrder = 4, textChangeCallback = var23 })
	t_3.spacer4 = roact.createElement("Frame", {
		BackgroundTransparency = 1,
		LayoutOrder = 7,
		Size = UDim2.new(1, 0, 0, 16)
	})
	t_3.contactsList = var24
	
	if p1.isFetching then
		for i, v in { 1, 2, 3 } do
			t_2["glimmer" .. v] = roact.createElement(contactsGlimmerModule, { layoutOrder = v })
		end
	elseif p1.hasUploadError and #p1.matchedContacts + #p1.deviceContacts == 0 then
		t_2.errorModal = roact.createElement(contactsUploadErrorModalModule)
	elseif #p1.matchedContacts + #p1.deviceContacts == 0 then
		t_2.emptyList = roact.createElement(contactsEmptyListModule)
	else
		t_2 = t_3
	end
	return roact.createElement(fullPageModal, {
		marginSize = 0,
		title = var5.connectWithFriends,
		screenSize = p1.screenSize,
		distanceFromTop = y,
		onCloseClicked = var9,
		buttonStackProps = {
			buttons = var21(var5),
			buttonHeight = if var6 then 0 else 48,
			forcedFillDirection = Enum.FillDirection.Vertical
		}
	}, {
		hpm = roact.createElement(horizontalPageMargin, {
			backgroundTransparency = 1,
			size = UDim2.new(1, 0, 1, 0),
			position = UDim2.new(0, 0, 0, 0)
		}, {
			contentFrame = roact.createElement("Frame", { BackgroundTransparency = 1, Size = UDim2.fromScale(1, 1) }, t_2),
			gradientFrame = roact.createElement("Frame", {
				BackgroundTransparency = 0,
				BorderSizePixel = 0,
				ZIndex = 2,
				Position = UDim2.new(0, 0, 1, if var6 then 0 else -24),
				Size = UDim2.new(1, 0, 0, 24),
				BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			}, {
				gradient = roact.createElement("UIGradient", {
					Rotation = 270,
					Color = ColorSequence.new({
						ColorSequenceKeypoint.new(0, var3.Theme.BackgroundUIDefault.Color),
						ColorSequenceKeypoint.new(1, var3.Theme.BackgroundUIDefault.Color)
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