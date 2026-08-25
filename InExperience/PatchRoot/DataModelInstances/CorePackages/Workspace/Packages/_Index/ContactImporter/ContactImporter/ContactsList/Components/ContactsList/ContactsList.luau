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
local var11 = if fFlagSignalsNavP3Dispatch then require(parent.RobloxAppNavigation).NavigationCommands else nil
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

return function(p0)
	-- upvalues: useAppPolicy (ref), useStyle (ref), useDispatch (ref), useLocalization (ref), textKeysModule (ref), fFlagQRCodeCopyUpdates (ref), fFlagConnectionsToFriendsRename (ref), contactImportButtonsExperimentEnabled (ref), contactImportButtonsIXPModule (ref), dash (ref), eventNames (ref), react (ref), appPage (ref), fFlagSignalsNavP3Dispatch (ref), var11 (ref), navigateDown (ref), fFlagContactsListEmojiSortingModule (ref), uprankContactsWithEmoji (ref), contactsListEmojiSortingIxpEnabled (ref), IXPService (ref), contactsListEmojiSortingIxpLayer (ref), fFlagTCPolicyCheckRedirect (ref), fStringIsUserInTcEligibleCountryAmpFeature (ref), fStringCanAccessTrustedContactsAmpFeature (ref), ampApiProvider (ref), fStringCanAccessTrustedContactsAmpNameSpace (ref), ampEnums (ref), roact (ref), contactsListEntryModule (ref), contactsListInviteEntryModule (ref), styledTextLabel (ref), buttonType (ref), userInputService (ref), fFlagAddFriendsBannersNewUIIXP (ref), contactsSyncWarningMessageModule (ref), sectionList (ref), contactsEmptyListModule (ref), inputLabel (ref), inputLabelSize (ref), contactsListSearchBarModule (ref), contactsGlimmerModule (ref), contactsUploadErrorModalModule (ref), fullPageModal (ref), horizontalPageMargin (ref)
	local var18 = useAppPolicy(function(p1)
		return p1.getWebViewSupport()
	end)
	local var19 = useStyle()
	local var20 = useDispatch()
	local var21 = useLocalization({
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
	local var22 = if contactImportButtonsExperimentEnabled then contactImportButtonsIXPModule.useIsRemoveCloseButtonExperimentEnabled({ isExposureEnabled = true }) else false
	
	local var23 = function(p2, p3, p4)
		-- upvalues: dash (copy)
		dash.append(p2, p3, if #p3 ~= 0 then nil else { { isSectionDivider = true } }, p4)
	end
	
	local var24 = function()
		-- upvalues: p0 (ref), eventNames (copy)
		p0.closeModal(eventNames.CloseContactListButton)
	end
	
	local var25 = function()
		-- upvalues: p0 (ref), eventNames (copy)
		p0.closeModal(eventNames.CloseContactListCross)
	end
	
	local var26 = react.useCallback(function()
		-- upvalues: appPage (copy), fFlagSignalsNavP3Dispatch (copy), var11 (copy), var20 (ref), navigateDown (copy)
		local t = {
			detail = "https://en.help.roblox.com/hc/en-us/articles/37725513985812",
			name = appPage.GenericWebPage,
			extraProps = { title = "" }
		}
		
		if fFlagSignalsNavP3Dispatch then
			var11.down(var11.fromLegacyPage(t))
			
			return
		end
		var20(navigateDown(t, nil))
	end, { var20 })
	local var27, var28 = react.useState("")
	
	local _ = function(p5)
		-- upvalues: dash (copy), var27 (ref)
		return dash.filter(p5, function(p6)
			-- upvalues: var27 (copy)
			return if p6.contactName == nil then string.find(string.lower(p6.contactName or ""), string.lower(var27)) ~= nil elseif p6.contactName:match("^%s*$") then false else string.find(string.lower(p6.contactName or ""), string.lower(var27)) ~= nil
		end)
	end
	
	local var29 = if fFlagContactsListEmojiSortingModule then react.useMemo(function()
		-- upvalues: uprankContactsWithEmoji (copy), p0 (ref)
		return uprankContactsWithEmoji(p0.matchedContacts)
	end, { p0.matchedContacts }) else nil
	local var30 = if fFlagContactsListEmojiSortingModule then react.useMemo(function()
		-- upvalues: uprankContactsWithEmoji (copy), p0 (ref)
		return uprankContactsWithEmoji(p0.deviceContacts)
	end, { p0.deviceContacts }) else nil
	local _ = {}
	local _ = {}
	local var31 = if fFlagContactsListEmojiSortingModule then dash.filter(var29, function(p8)
		-- upvalues: var27 (ref)
		return if p8.contactName == nil then string.find(string.lower(p8.contactName or ""), string.lower(var27)) ~= nil elseif p8.contactName:match("^%s*$") then false else string.find(string.lower(p8.contactName or ""), string.lower(var27)) ~= nil
	end) else dash.filter(p0.matchedContacts, function(p7)
		-- upvalues: var27 (ref)
		return if p7.contactName == nil then string.find(string.lower(p7.contactName or ""), string.lower(var27)) ~= nil elseif p7.contactName:match("^%s*$") then false else string.find(string.lower(p7.contactName or ""), string.lower(var27)) ~= nil
	end)
	local var32 = if fFlagContactsListEmojiSortingModule then dash.filter(var30, function(p10)
		-- upvalues: var27 (ref)
		return if p10.contactName == nil then string.find(string.lower(p10.contactName or ""), string.lower(var27)) ~= nil elseif p10.contactName:match("^%s*$") then false else string.find(string.lower(p10.contactName or ""), string.lower(var27)) ~= nil
	end) else dash.filter(p0.deviceContacts, function(p9)
		-- upvalues: var27 (ref)
		return if p9.contactName == nil then string.find(string.lower(p9.contactName or ""), string.lower(var27)) ~= nil elseif p9.contactName:match("^%s*$") then false else string.find(string.lower(p9.contactName or ""), string.lower(var27)) ~= nil
	end)
	
	if contactsListEmojiSortingIxpEnabled then
		react.useEffect(function()
			-- upvalues: IXPService (copy), contactsListEmojiSortingIxpLayer (copy)
			IXPService:LogFlagLinkedUserLayerExposure(contactsListEmojiSortingIxpLayer)
		end, {})
	end
	local var33, var34 = react.useState(false)
	
	if fFlagQRCodeCopyUpdates then
		react.useEffect(function()
			-- upvalues: fFlagTCPolicyCheckRedirect (copy), fStringIsUserInTcEligibleCountryAmpFeature (copy), fStringCanAccessTrustedContactsAmpFeature (copy), ampApiProvider (copy), fStringCanAccessTrustedContactsAmpNameSpace (copy), ampEnums (copy), var34 (ref)
			if ampApiProvider.upsellFeatureAccess(if fFlagTCPolicyCheckRedirect then fStringIsUserInTcEligibleCountryAmpFeature else fStringCanAccessTrustedContactsAmpFeature, {}, fStringCanAccessTrustedContactsAmpNameSpace).access == ampEnums.AccessResponseEnum.Granted then
				var34(true)
			end
		end)
	end
	local t = {}
	var23(t, var31, var32)
	local t_1 = {}
	
	if #var31 > 0 then
		table.insert(t_1, {
			data = var31,
			title = var21.fromContactsText,
			sectionNumber = #t_1 + 1
		})
	end
	if #var32 > 0 then
		table.insert(t_1, {
			data = var32,
			title = var21.inviteToRobloxText,
			sectionNumber = #t_1 + 1
		})
	end
	local createElement
	local _ = function()
		-- upvalues: p0 (ref)
		return #p0.matchedContacts + #p0.deviceContacts == 0
	end
	
	local var37 = function(p11)
		-- upvalues: roact (copy), var19 (ref), contactsListEntryModule (copy), var21 (ref), p0 (ref), contactsListInviteEntryModule (copy)
		local item = p11.item
		
		return if item.isSectionDivider then roact.createElement("Frame", {
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 0, 24)
		}, {
			divider = roact.createElement("Frame", {
				BorderSizePixel = 0,
				Size = UDim2.new(1, 0, 0, 1),
				Position = UDim2.new(0, 0, if p11.index ~= 1 then 0.5 else 0.5, 0),
				BackgroundColor3 = var19.Theme.Divider.Color,
				BackgroundTransparency = var19.Theme.Divider.Transparency
			})
		}) elseif item.isMatchedContact then roact.createElement(contactsListEntryModule, {
			hasDivider = true,
			contactName = item.contactName,
			contactId = item.contactId,
			contextualInfo = var21.fromContactsText,
			hasSentRequest = item.hasSentRequest,
			requestFriendship = p0.requestFriendship,
			openProfilePeekView = p0.openProfilePeekView,
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
	
	local var38 = function(p12)
		-- upvalues: roact (copy), styledTextLabel (copy), var19 (ref)
		return if p12.section then roact.createElement("Frame", { BackgroundTransparency = 1, Size = UDim2.new(1, 0, 0, 0) }, {
			layout = roact.createElement("UIListLayout", {
				SortOrder = Enum.SortOrder.LayoutOrder,
				FillDirection = Enum.FillDirection.Vertical
			}),
			padding = if p12.section.sectionNumber ~= 1 then nil else roact.createElement("Frame", {
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
					fontStyle = var19.Font.Header2,
					colorStyle = var19.Theme.TextDefault,
					text = p12.section.title or ""
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
				BackgroundColor3 = var19.Theme.Divider.Color,
				BackgroundTransparency = var19.Theme.Divider.Transparency
			})
		})
	end
	
	local var39 = function(p13)
		-- upvalues: p0 (ref), buttonType (copy), dash (copy), var22 (ref), var24 (ref)
		return if p0.isFetching then {
			{
				buttonType = buttonType.PrimarySystem,
				props = { isLoading = true, onActivated = dash.noop }
			}
		} elseif p0.showAddFriendsButton and #p0.matchedContacts + #p0.deviceContacts == 0 then if var22 then {
			{
				buttonType = buttonType.PrimarySystem,
				props = {
					onActivated = p0.onAddFriendsActivated,
					text = p13.goToAddFriends
				}
			}
		} else {
			{
				buttonType = buttonType.PrimarySystem,
				props = {
					onActivated = p0.onAddFriendsActivated,
					text = p13.goToAddFriends
				}
			},
			{
				buttonType = buttonType.Secondary,
				props = { onActivated = var24, text = p13.closeModal }
			}
		} elseif var22 then {} else {
			{
				buttonType = buttonType.PrimarySystem,
				props = { onActivated = var24, text = p13.closeModal }
			}
		}
	end
	
	local y = userInputService.StatusBarSize.Y
	local var40 = if fFlagAddFriendsBannersNewUIIXP then contactsSyncWarningMessageModule.useIsVisible() else nil
	local t_2 = {
		layout = roact.createElement("UIListLayout", {
			HorizontalAlignment = Enum.HorizontalAlignment.Center,
			SortOrder = Enum.SortOrder.LayoutOrder,
			FillDirection = Enum.FillDirection.Vertical
		}),
		contactsSyncWarning = if fFlagAddFriendsBannersNewUIIXP and var40 then react.createElement(contactsSyncWarningMessageModule.Component, { layoutOrder = -1 }) else nil
	}
	
	local var42 = function(p14)
		-- upvalues: var28 (ref)
		var28(p14)
	end
	
	local var43 = if #t ~= 0 then roact.createElement(contactsEmptyListModule, {
		layoutOrder = 8,
		errorTextKey = textKeysModule.NO_RESULTS
	}) else roact.createElement(sectionList, {
		initialNumToRender = 15,
		ref = react.createRef(),
		sections = t_1,
		renderSectionHeader = if #var31 > 0 then var38 else nil,
		renderItem = var37,
		CanvasSize = UDim2.new(1, 0, 0, #t * 73),
		contentContainerStyle = { BackgroundTransparency = 1, BorderSizePixel = 0 },
		style = {
			BackgroundTransparency = 1,
			ScrollBarThickness = 0,
			LayoutOrder = 8,
			Size = UDim2.new(1, 0, 1, -80 - (if var22 then 0 else 48) - 36 - 16),
			ElasticBehavior = Enum.ElasticBehavior.Always
		}
	})
	local t_3 = {
		layout = roact.createElement("UIListLayout", {
			HorizontalAlignment = Enum.HorizontalAlignment.Center,
			SortOrder = Enum.SortOrder.LayoutOrder,
			FillDirection = Enum.FillDirection.Vertical
		}),
		contactsSyncWarning = if fFlagAddFriendsBannersNewUIIXP and var40 then react.createElement(contactsSyncWarningMessageModule.Component, { layoutOrder = -1 }) else nil,
		spacer1 = if fFlagAddFriendsBannersNewUIIXP and var40 then nil else roact.createElement("Frame", {
			BackgroundTransparency = 1,
			LayoutOrder = 1,
			Size = UDim2.new(1, 0, 0, 24)
		})
	}
	
	if fFlagAddFriendsBannersNewUIIXP and var40 then
		createElement = nil
	else
		createElement = roact.createElement
		createElement = createElement("Frame", {
			BackgroundTransparency = 1,
			LayoutOrder = 2,
			Size = UDim2.new(1, 0, 0, 80)
		}, {
			textLayout = roact.createElement("UIListLayout", {
				HorizontalAlignment = if fFlagQRCodeCopyUpdates and var33 then Enum.HorizontalAlignment.Left else Enum.HorizontalAlignment.Center,
				VerticalAlignment = Enum.VerticalAlignment.Center,
				SortOrder = Enum.SortOrder.LayoutOrder
			}),
			descriptionText = roact.createElement(styledTextLabel, {
				lineHeight = 1,
				layoutOrder = 1,
				text = if fFlagQRCodeCopyUpdates and var33 then if fFlagConnectionsToFriendsRename then var21.contactsListTFEducationBlurb else var21.contactsListTCEducationBlurb else var21.contactsListBlurb,
				automaticSize = Enum.AutomaticSize.Y,
				colorStyle = var19.Theme.TextDefault,
				fontStyle = var19.Font.Body,
				size = UDim2.new(1, 0, 0, 0),
				maxSize = Vector2.new(0, 80),
				textXAlignment = if fFlagQRCodeCopyUpdates and var33 then Enum.TextXAlignment.Left else Enum.TextXAlignment.Center,
				textYAlignment = Enum.TextYAlignment.Center
			}),
			LearnMoreWebLink = var18 and react.createElement(inputLabel, {
				LayoutOrder = 2,
				tag = "auto-y size-full-0",
				RichText = true,
				Text = `<u>{var21.learnMore}</u>`,
				size = inputLabelSize.Large,
				onActivated = var26
			})
		})
	end
	t_3.descriptionFrame = createElement
	t_3.spacer2 = if fFlagAddFriendsBannersNewUIIXP and var40 then nil else roact.createElement("Frame", {
		BackgroundTransparency = 1,
		LayoutOrder = 3,
		Size = UDim2.new(1, 0, 0, 24)
	})
	t_3.searchBarContainer = roact.createElement(contactsListSearchBarModule, { height = 36, layoutOrder = 4, textChangeCallback = var42 })
	t_3.spacer4 = roact.createElement("Frame", {
		BackgroundTransparency = 1,
		LayoutOrder = 7,
		Size = UDim2.new(1, 0, 0, 16)
	})
	t_3.contactsList = var43
	
	if p0.isFetching then
		for i, v in { 1, 2, 3 } do
			t_2["glimmer" .. v] = roact.createElement(contactsGlimmerModule, { layoutOrder = v })
		end
	elseif p0.hasUploadError and #p0.matchedContacts + #p0.deviceContacts == 0 then
		t_2.errorModal = roact.createElement(contactsUploadErrorModalModule)
	elseif #p0.matchedContacts + #p0.deviceContacts == 0 then
		t_2.emptyList = roact.createElement(contactsEmptyListModule)
	else
		t_2 = t_3
	end
	return roact.createElement(fullPageModal, {
		marginSize = 0,
		title = var21.connectWithFriends,
		screenSize = p0.screenSize,
		distanceFromTop = y,
		onCloseClicked = var25,
		buttonStackProps = {
			buttons = var39(var21),
			buttonHeight = if var22 then 0 else 48,
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
				Position = UDim2.new(0, 0, 1, if var22 then 0 else -24),
				Size = UDim2.new(1, 0, 0, 24),
				BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			}, {
				gradient = roact.createElement("UIGradient", {
					Rotation = 270,
					Color = ColorSequence.new({
						ColorSequenceKeypoint.new(0, var19.Theme.BackgroundUIDefault.Color),
						ColorSequenceKeypoint.new(1, var19.Theme.BackgroundUIDefault.Color)
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