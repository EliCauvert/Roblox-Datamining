game:DefineFastFlag("EnableShopGiftCardsURL", false)

return function(p0) --[[ line: 3 ]]
	local function _() --[[ line: 4 | named "isQQ" ]]
		-- upvalues: p0 (ref)
		return string.find(p0.fromString("corp:")(), "qq.com")
	end
	
	return {
		catalog = p0.fromString("www:catalog"),
		buildersClub = p0.fromString("www:mobile-app-upgrades/native-ios/bc"),
		trades = p0.fromString("www:trades"),
		profile = p0.fromString("www:users/profile"),
		friends = p0.fromString("www:users/friends"),
		groups = p0.fromString("www:my/communities"),
		inventory = p0.fromString("www:users/inventory"),
		messages = p0.fromString("www:my/messages"),
		feed = p0.fromString("www:feeds/inapp"),
		develop = p0.fromString("www:develop"),
		creatorHub = p0.fromString("create:"),
		blog = p0.fromString("blog:"),
		giftCards = function(p1) --[[ line: 21 ]]
			-- upvalues: p0 (ref)
			return p0.fromString(if game:GetFastFlag("EnableShopGiftCardsURL") then "www:shopgiftcards?ref={source}" else "www:giftcards?ref={source}")({ source = p1 or "" })
		end,
		giftCardsWithRedeem = function(p2, p3) --[[ line: 29 ]]
			-- upvalues: p0 (ref)
			return if p3 and p3 ~= "" then p0.fromString("www:giftcards-" .. p3 .. "?ref={source}")({ source = p2 }) else p0.fromString("www:shopgiftcards?ref={source}")({ source = p2 })
		end,
		redeem = p0.fromString("www:redeem"),
		amazonStore = p0.fromString("https://www.amazon.com/roblox"),
		help = p0.fromString(if string.find(p0.fromString("corp:")(), "qq.com") then "corp:faq" else "www:help"),
		safetyDashboard = {
			main = p0.fromString("www:safety-dashboard?t_source={source|app}"),
			violation = p0.fromString("www:safety-dashboard?vid={id}&t_source={source|app}"),
			violations = p0.fromString("www:safety-dashboard?view=violations&t_source={source|app}")
		},
		appealsPortal = {
			main = p0.fromString("www:report-appeals?t_source={source|app}"),
			violation = p0.fromString("www:report-appeals?vid={id}&t_source={source|app}")
		},
		supportCenter = {
			main = p0.fromString("www:support-center"),
			ticket = p0.fromString("www:support-center#!/tickets/{universeId}/{ticketId}")
		},
		email = {
			getSetEmail = p0.fromString("accountSettings:v1/email"),
			sendVerificationEmail = p0.fromString("accountSettings:v1/email/verify")
		},
		about = {
			us = function(p4) --[[ line: 62 ]]
				-- upvalues: p0 (ref)
				return p0.fromString("www:info/about-us?locale={localeCode}")({ localeCode = p4 or "" })
			end,
			careers = function(p5) --[[ line: 66 ]]
				-- upvalues: p0 (ref)
				return if string.find(p0.fromString("corp:")(), "qq.com") then p0.fromString("corp:careers.html") else p0.fromString("www:info/jobs?locale={localeCode}")({ localeCode = p5 or "" })
			end,
			parents = function(p6) --[[ line: 74 ]]
				-- upvalues: p0 (ref)
				return p0.fromString("www:info/parents?locale={localeCode}")({ localeCode = p6 or "" })
			end,
			terms = function(p7) --[[ line: 78 ]]
				-- upvalues: p0 (ref)
				return if string.find(p0.fromString("corp:")(), "qq.com") and p7.useGameQQUrls then p0.fromString("https://game.qq.com/contract.shtml")() else p0.fromString("www:info/terms")()
			end,
			privacy = function(p8) --[[ line: 85 ]]
				-- upvalues: p0 (ref)
				return if string.find(p0.fromString("corp:")(), "qq.com") and p8.useGameQQUrls then p0.fromString("https://game.qq.com/privacy_guide.shtml")() else p0.fromString("www:info/privacy")()
			end,
			guidelines = p0.fromString("www:info/community-guidelines"),
			support = p0.fromString("www:support")
		},
		settings = {
			account = p0.fromString("www:my/account#!/info"),
			security = p0.fromString("www:my/account#!/security"),
			privacy = p0.fromString("www:my/account#!/privacy"),
			parentalControls = p0.fromString("www:my/account#!/parental-controls"),
			billing = p0.fromString("www:my/account#!/billing"),
			subscriptions = p0.fromString("www:my/account#!/subscriptions"),
			robux = p0.fromString("www:my/account#!/robux"),
			notifications = p0.fromString("www:my/account#!/notifications"),
			appPermissions = p0.fromString("www:my/account#!/app-permissions"),
			screentimeSettings = p0.fromString("www:my/account#!/privacy/Screentime"),
			blockedExperiencesSettings = p0.fromString("www:my/account#!/privacy/ContentRestrictions/BlockedExperiences"),
			blockedUsersSettings = p0.fromString("www:my/account#!/privacy/BlockedUsers"),
			experienceChatSettings = p0.fromString("www:my/account#!/privacy/Communication/ExperienceChat"),
			partySettings = p0.fromString("www:my/account#!/privacy/Communication/Party"),
			partySettingsV2 = p0.fromString("www:my/account#!/privacy/Communication/PartyAndPartyChat"),
			communicationSettings = p0.fromString("www:my/account#!/privacy/Communication"),
			voiceSettings = p0.fromString("www:my/account#!/privacy/Communication/Voice"),
			tradingInventorySettings = p0.fromString("www:my/account#!/privacy/TradingAndInventory"),
			friendsContactsSettings = p0.fromString("www:my/account#!/privacy/FriendsAndContacts"),
			privateServerSettings = p0.fromString("www:my/account#!/privacy/VisibilityAndPrivateServers/PrivateServerPrivacy"),
			visibilitySettings = p0.fromString("www:my/account#!/privacy/VisibilityAndPrivateServers/Visibility")
		},
		tencent = {
			childrenPrivacyGuide = p0.fromString("https://game.qq.com/privacy_guide_children.shtml"),
			luobuRiderTerms = p0.fromString("https://roblox.qq.com/web201904/newsdetail.html?newsid=12429812"),
			reputationInfo = p0.fromString("https://gamecredit.qq.com/static/games/index.htm"),
			luobuThirdPartyDataUse = p0.fromString("https://game.qq.com/zlkdatasys/privacy_SDK.html")
		},
		idVerification = {
			verify = p0.fromString("www:id-verification/verify"),
			getAge = p0.fromString("apis:age-verification-service/v1/age-verification/get-verified-age")
		},
		notifications = {
			clearUnread = p0.fromString("notifications:stream-notifications/clear-unread"),
			unreadCount = p0.fromString("notifications:stream-notifications/unread-count")
		},
		securityAlert = p0.fromString("www:security-feedback?payload={payload}&username={username}"),
		securityAlertWithChannel = p0.fromString("www:security-feedback?payload={payload}&username={username}&channel={channel}")
	}
end