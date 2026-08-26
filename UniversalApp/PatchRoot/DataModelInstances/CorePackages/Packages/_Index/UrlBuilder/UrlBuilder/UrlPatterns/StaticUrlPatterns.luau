game:DefineFastFlag("EnableShopGiftCardsURL", false)

return function(p1)
	local function _()
		-- upvalues: p1 (ref)
		return string.find(p1.fromString("corp:")(), "qq.com")
	end
	
	return {
		catalog = p1.fromString("www:catalog"),
		buildersClub = p1.fromString("www:mobile-app-upgrades/native-ios/bc"),
		trades = p1.fromString("www:trades"),
		profile = p1.fromString("www:users/profile"),
		friends = p1.fromString("www:users/friends"),
		groups = p1.fromString("www:my/communities"),
		inventory = p1.fromString("www:users/inventory"),
		messages = p1.fromString("www:my/messages"),
		feed = p1.fromString("www:feeds/inapp"),
		develop = p1.fromString("www:develop"),
		creatorHub = p1.fromString("create:"),
		blog = p1.fromString("blog:"),
		giftCards = function(p2)
			-- upvalues: p1 (ref)
			return p1.fromString(if game:GetFastFlag("EnableShopGiftCardsURL") then "www:shopgiftcards?ref={source}" else "www:giftcards?ref={source}")({ source = p2 or "" })
		end,
		giftCardsWithRedeem = function(p2, p3)
			-- upvalues: p1 (ref)
			return if p3 and p3 ~= "" then p1.fromString("www:giftcards-" .. p3 .. "?ref={source}")({ source = p2 }) else p1.fromString("www:shopgiftcards?ref={source}")({ source = p2 })
		end,
		redeem = p1.fromString("www:redeem"),
		amazonStore = p1.fromString("https://www.amazon.com/roblox"),
		help = p1.fromString(if string.find(p1.fromString("corp:")(), "qq.com") then "corp:faq" else "www:help"),
		safetyDashboard = {
			main = p1.fromString("www:safety-dashboard?t_source={source|app}"),
			violation = p1.fromString("www:safety-dashboard?vid={id}&t_source={source|app}"),
			violations = p1.fromString("www:safety-dashboard?view=violations&t_source={source|app}")
		},
		appealsPortal = {
			main = p1.fromString("www:report-appeals?t_source={source|app}"),
			violation = p1.fromString("www:report-appeals?vid={id}&t_source={source|app}")
		},
		supportCenter = {
			main = p1.fromString("www:support-center"),
			ticket = p1.fromString("www:support-center#!/tickets/{universeId}/{ticketId}")
		},
		email = {
			getSetEmail = p1.fromString("accountSettings:v1/email"),
			sendVerificationEmail = p1.fromString("accountSettings:v1/email/verify")
		},
		about = {
			us = function(p2)
				-- upvalues: p1 (ref)
				return p1.fromString("www:info/about-us?locale={localeCode}")({ localeCode = p2 or "" })
			end,
			careers = function(p2)
				-- upvalues: p1 (ref)
				return if string.find(p1.fromString("corp:")(), "qq.com") then p1.fromString("corp:careers.html") else p1.fromString("www:info/jobs?locale={localeCode}")({ localeCode = p2 or "" })
			end,
			parents = function(p2)
				-- upvalues: p1 (ref)
				return p1.fromString("www:info/parents?locale={localeCode}")({ localeCode = p2 or "" })
			end,
			terms = function(p2)
				-- upvalues: p1 (ref)
				return if string.find(p1.fromString("corp:")(), "qq.com") and p2.useGameQQUrls then p1.fromString("https://game.qq.com/contract.shtml")() else p1.fromString("www:info/terms")()
			end,
			privacy = function(p2)
				-- upvalues: p1 (ref)
				return if string.find(p1.fromString("corp:")(), "qq.com") and p2.useGameQQUrls then p1.fromString("https://game.qq.com/privacy_guide.shtml")() else p1.fromString("www:info/privacy")()
			end,
			guidelines = p1.fromString("www:info/community-guidelines"),
			support = p1.fromString("www:support")
		},
		settings = {
			account = p1.fromString("www:my/account#!/info"),
			security = p1.fromString("www:my/account#!/security"),
			privacy = p1.fromString("www:my/account#!/privacy"),
			parentalControls = p1.fromString("www:my/account#!/parental-controls"),
			billing = p1.fromString("www:my/account#!/billing"),
			subscriptions = p1.fromString("www:my/account#!/subscriptions"),
			robux = p1.fromString("www:my/account#!/robux"),
			notifications = p1.fromString("www:my/account#!/notifications"),
			appPermissions = p1.fromString("www:my/account#!/app-permissions"),
			screentimeSettings = p1.fromString("www:my/account#!/privacy/Screentime"),
			blockedExperiencesSettings = p1.fromString("www:my/account#!/privacy/ContentRestrictions/BlockedExperiences"),
			blockedUsersSettings = p1.fromString("www:my/account#!/privacy/BlockedUsers"),
			experienceChatSettings = p1.fromString("www:my/account#!/privacy/Communication/ExperienceChat"),
			partySettings = p1.fromString("www:my/account#!/privacy/Communication/Party"),
			partySettingsV2 = p1.fromString("www:my/account#!/privacy/Communication/PartyAndPartyChat"),
			communicationSettings = p1.fromString("www:my/account#!/privacy/Communication"),
			voiceSettings = p1.fromString("www:my/account#!/privacy/Communication/Voice"),
			tradingInventorySettings = p1.fromString("www:my/account#!/privacy/TradingAndInventory"),
			friendsContactsSettings = p1.fromString("www:my/account#!/privacy/FriendsAndContacts"),
			privateServerSettings = p1.fromString("www:my/account#!/privacy/VisibilityAndPrivateServers/PrivateServerPrivacy"),
			visibilitySettings = p1.fromString("www:my/account#!/privacy/VisibilityAndPrivateServers/Visibility")
		},
		tencent = {
			childrenPrivacyGuide = p1.fromString("https://game.qq.com/privacy_guide_children.shtml"),
			luobuRiderTerms = p1.fromString("https://roblox.qq.com/web201904/newsdetail.html?newsid=12429812"),
			reputationInfo = p1.fromString("https://gamecredit.qq.com/static/games/index.htm"),
			luobuThirdPartyDataUse = p1.fromString("https://game.qq.com/zlkdatasys/privacy_SDK.html")
		},
		idVerification = {
			verify = p1.fromString("www:id-verification/verify"),
			getAge = p1.fromString("apis:age-verification-service/v1/age-verification/get-verified-age")
		},
		notifications = {
			clearUnread = p1.fromString("notifications:stream-notifications/clear-unread"),
			unreadCount = p1.fromString("notifications:stream-notifications/unread-count")
		},
		securityAlert = p1.fromString("www:security-feedback?payload={payload}&username={username}"),
		securityAlertWithChannel = p1.fromString("www:security-feedback?payload={payload}&username={username}&channel={channel}")
	}
end