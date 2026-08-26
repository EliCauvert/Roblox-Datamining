local friendsLanding = script:FindFirstAncestor("FriendsLanding")
local parent = friendsLanding.Parent
local dependenciesModule = require(friendsLanding.dependencies)
local react = dependenciesModule.React
local roact = dependenciesModule.Roact
local t = dependenciesModule.t
local withStyle = dependenciesModule.UIBlox.Style.withStyle
local withLocalization = dependenciesModule.withLocalization
local userProfilesModule = require(parent.UserProfiles)
local userPresenceTextModule = require(friendsLanding.Friends.userPresenceText)
local userPresenceIconModule = require(friendsLanding.Friends.userPresenceIcon)
local getCorrectUserPresenceModule = require(friendsLanding.Friends.getCorrectUserPresence)
local memoize = dependenciesModule.memoize
local createRelevancyInfoModule = require(script.Parent.createRelevancyInfo)
local socialCommonModule = require(parent.SocialCommon)
local buttonTypes = require(parent.UserList).Enums.ButtonTypes
local buttonVariant = require(parent.Foundation).Enums.ButtonVariant
local friendTileWithTrustedIndicatorModule = require(script.Parent.FriendTileWithTrustedIndicator)
local fFlagFriendsPageAlwaysOpenPPV = require(parent.SharedFlags).FFlagFriendsPageAlwaysOpenPPV
local fFlagFriendsPageUserListEnabled = require(parent.SharedFlags).FFlagFriendsPageUserListEnabled
local fFlagFriendsPageViewBtnEnabled = require(parent.SharedFlags).FFlagFriendsPageViewBtnEnabled
local fFlagEnableBlackbirdCheck = require(parent.SharedFlags).FFlagEnableBlackbirdCheck
local fFlagFriendsPageUnifiedOpenProfileLogic = require(parent.SharedFlags).FFlagFriendsPageUnifiedOpenProfileLogic
local friendTile = roact.PureComponent:extend("FriendTile")

local var1 = function()
	return function() end
end

friendTile.validateProps = t.strictInterface({
	user = t.table,
	index = t.number,
	openPlayerProfileHandle = t.optional(t.callback),
	pageLoadingTimeReport = t.optional(t.callback),
	createRow = t.optional(t.callback),
	selected = t.optional(t.boolean),
	focusGuiObject = t.optional(t.callback),
	userProfile = t.optional(t.table),
	trustedConnection = t.optional(t.boolean),
	isRobloxSubscriber = t.optional(t.boolean),
	isLuobu = t.optional(t.boolean),
	buttons = t.optional(t.array(t.strictInterface({
		icon = t.optional(t.string),
		onActivated = t.optional(t.callback),
		isSecondary = t.optional(t.boolean),
		isDisabled = t.optional(t.boolean)
	}))),
	openPlayerProfile = t.optional(t.callback),
	isPlayerContextualMenuEnabled = t.optional(t.boolean)
})
friendTile.defaultProps = {
	isLuobu = false,
	index = 1,
	buttons = nil,
	isPlayerContextualMenuEnabled = false,
	trustedConnection = false,
	user = { username = "" },
	openPlayerProfile = var1
}

function friendTile.init(p1)
	-- upvalues: memoize (ref), createRelevancyInfoModule (ref), roact (ref), fFlagFriendsPageAlwaysOpenPPV (ref), fFlagFriendsPageUnifiedOpenProfileLogic (ref), fFlagFriendsPageUserListEnabled (ref), socialCommonModule (ref)
	p1.state = { isFirstRender = true }
	p1.makeRelevancyInfo = memoize(createRelevancyInfoModule)
	p1.playerTileRef = roact.createRef()
	p1.openPlayerProfile = if fFlagFriendsPageAlwaysOpenPPV or fFlagFriendsPageUnifiedOpenProfileLogic then nil elseif p1.props.isPlayerContextualMenuEnabled then function(_, _)
		-- upvalues: p1 (ref)
		return p1.props.openPlayerProfile(p1.props.user)
	end else function(p2, p3)
		-- upvalues: p1 (ref)
		local user = p1.props.user
		
		return if p2 and p3 then p1.props.openPlayerProfile(user.id, p1.props.index, user, p2, p3) else p1.props.openPlayerProfile(user.id, p1.props.index, user)
	end
	p1.openPlayerProfileForRelevancyInfo = if fFlagFriendsPageAlwaysOpenPPV or fFlagFriendsPageUnifiedOpenProfileLogic then nil else function(p2, p3)
		-- upvalues: p1 (ref)
		return function()
			-- upvalues: p1 (copy), p2 (ref), p3 (ref)
			return p1.openPlayerProfile(p2, p3)
		end
	end
	
	function p0.checkAndSetSelected()
		-- upvalues: p1 (ref)
		if p1.props.selected and p1.props.focusGuiObject then
			local value = p1.playerTileRef:getValue()
			
			if value then
				p1.props.focusGuiObject(value)
			end
		end
	end
	
	p1.getPresenceType = if fFlagFriendsPageUserListEnabled then function(p2)
		-- upvalues: socialCommonModule (copy)
		return string.gsub(tostring(p2 or ""), "PresenceType%.", "") or socialCommonModule.Enums.PresenceTypes.Offline
	end else nil
	p1.openProfilePeekViewHandle = if fFlagFriendsPageUserListEnabled or fFlagFriendsPageUnifiedOpenProfileLogic then function()
		-- upvalues: p1 (ref), fFlagFriendsPageUnifiedOpenProfileLogic (copy)
		return p1.props.openPlayerProfileHandle(p1.props.user.id, p1.props.index, if fFlagFriendsPageUnifiedOpenProfileLogic then p1.props.user else nil)
	end else nil
end

function friendTile.didMount(p1)
	if p1.props.pageLoadingTimeReport then
		p1.props.pageLoadingTimeReport()
	end
	p1.checkAndSetSelected()
end

function friendTile.render(p1)
	-- upvalues: getCorrectUserPresenceModule (ref), userPresenceTextModule (ref), userPresenceIconModule (ref), withStyle (ref), withLocalization (ref), fFlagFriendsPageUserListEnabled (ref), fFlagFriendsPageAlwaysOpenPPV (ref), fFlagFriendsPageUnifiedOpenProfileLogic (ref), fFlagFriendsPageViewBtnEnabled (ref), buttonTypes (ref), buttonVariant (ref), userProfilesModule (ref), react (ref), friendTileWithTrustedIndicatorModule (ref), fFlagEnableBlackbirdCheck (ref)
	local user = p1.props.user
	local var2 = getCorrectUserPresenceModule(user)
	local var3 = userPresenceTextModule[var2]
	local var4 = userPresenceIconModule[var2]
	local absoluteSize = nil
	local absolutePosition = nil
	local value = p1.playerTileRef:getValue()
	
	if value then
		absoluteSize = value.AbsoluteSize
		absolutePosition = value.AbsolutePosition
	else
		p1:setState({ isFirstRender = false })
	end
	return withStyle(function(p2)
		-- upvalues: withLocalization (copy), var3 (ref), fFlagFriendsPageUserListEnabled (copy), p1 (ref), user (ref), var4 (ref), fFlagFriendsPageAlwaysOpenPPV (copy), fFlagFriendsPageUnifiedOpenProfileLogic (copy), absoluteSize (write), absolutePosition (write), var2 (ref), fFlagFriendsPageViewBtnEnabled (copy), buttonTypes (copy), buttonVariant (copy), userProfilesModule (copy), react (copy), friendTileWithTrustedIndicatorModule (copy), fFlagEnableBlackbirdCheck (copy)
		return withLocalization({
			accountDeletedText = "Feature.Friends.Action.AccountDeleted",
			trustedText = "Feature.Friends.TrustedConnection.Label.Trusted",
			presenceText = var3
		})(function(p3)
			-- upvalues: fFlagFriendsPageUserListEnabled (copy), p1 (copy), user (copy), var4 (copy), fFlagFriendsPageAlwaysOpenPPV (copy), fFlagFriendsPageUnifiedOpenProfileLogic (copy), absoluteSize (copy), absolutePosition (copy), p2 (ref), var2 (copy), fFlagFriendsPageViewBtnEnabled (copy), buttonTypes (copy), buttonVariant (copy), userProfilesModule (copy), react (copy), friendTileWithTrustedIndicatorModule (copy), fFlagEnableBlackbirdCheck (copy)
			local presenceText = p3.presenceText or nil
			local accountDeletedText = p3.accountDeletedText
			
			if fFlagFriendsPageUserListEnabled then
				local makeRelevancyInfo = p1.makeRelevancyInfo
				makeRelevancyInfo = makeRelevancyInfo(user, presenceText, var4, if fFlagFriendsPageAlwaysOpenPPV or fFlagFriendsPageUnifiedOpenProfileLogic then nil else p1.openPlayerProfileForRelevancyInfo(absoluteSize, absolutePosition), p2.Theme, p1.props.index, p1.props.isLuobu, p2.Font, accountDeletedText, true)
				
				return p1.props.createRow({
					onRowActivated = p1.openProfilePeekViewHandle,
					contextualInfo = makeRelevancyInfo and {
						text = makeRelevancyInfo.text,
						icon = makeRelevancyInfo.icon
					},
					presence = p1.getPresenceType(var2),
					primaryCta = if fFlagFriendsPageViewBtnEnabled then {
						minWidth = 64,
						maxWidth = 90,
						type = buttonTypes.View,
						onActivated = p1.openProfilePeekViewHandle,
						variant = buttonVariant.Standard
					} else nil
				})
			end
			local combinedName = nil
			local var5 = nil
			
			if p1.props.userProfile then
				combinedName = p1.props.userProfile.names.combinedName
				var5 = userProfilesModule.Formatters.formatUsername(p1.props.userProfile.names.username)
				user.isDeleted = p1.props.userProfile.isDeleted
			end
			local var6
			local var7 = combinedName or user.displayName
			local var8 = var5 or "@" .. user.username
			
			if combinedName then
				var6 = p1.makeRelevancyInfo
				var6 = var6(user, presenceText, var4, if fFlagFriendsPageAlwaysOpenPPV or fFlagFriendsPageUnifiedOpenProfileLogic then nil else p1.openPlayerProfileForRelevancyInfo(absoluteSize, absolutePosition), p2.Theme, p1.props.index, p1.props.isLuobu, p2.Font, accountDeletedText, true)
			else
				var6 = nil
			end
			return react.createElement(friendTileWithTrustedIndicatorModule, {
				user = user,
				userPresence = var2,
				title = var7,
				subtitle = var8,
				relevancyInfo = var6,
				index = p1.props.index,
				openPlayerProfile = if fFlagFriendsPageUnifiedOpenProfileLogic then p1.openProfilePeekViewHandle elseif fFlagFriendsPageAlwaysOpenPPV then p1.props.openPlayerProfile(user.id, p1.props.index) else p1.openPlayerProfile(absoluteSize, absolutePosition, var7, var8, var6),
				playerTileRef = p1.playerTileRef,
				buttons = p1.props.buttons,
				isTrustedConnection = p1.props.trustedConnection,
				isVerified = p1.props.userProfile and p1.props.userProfile.isVerified,
				isRobloxSubscriber = if fFlagEnableBlackbirdCheck then p1.props.isRobloxSubscriber else nil
			})
		end)
	end)
end

return friendTile