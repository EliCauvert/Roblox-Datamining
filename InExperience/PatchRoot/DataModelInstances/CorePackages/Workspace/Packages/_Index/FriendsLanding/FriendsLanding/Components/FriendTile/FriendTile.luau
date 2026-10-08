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
local fFlagFriendsPageUserListEnabled = require(parent.SharedFlags).FFlagFriendsPageUserListEnabled
local fFlagFriendsPageViewBtnEnabled = require(parent.SharedFlags).FFlagFriendsPageViewBtnEnabled
local fFlagEnableBlackbirdCheck = require(parent.SharedFlags).FFlagEnableBlackbirdCheck
local fFlagFriendsPageUserListCtaEnabledModule = require(friendsLanding.Flags.FFlagFriendsPageUserListCtaEnabled)
local friendTile = roact.PureComponent:extend("FriendTile")
friendTile.validateProps = t.strictInterface({
	user = t.table,
	index = t.number,
	openPlayerProfileHandle = t.callback,
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
	})))
})
friendTile.defaultProps = {
	isLuobu = false,
	index = 1,
	buttons = nil,
	trustedConnection = false,
	user = { username = "" },
	openPlayerProfileHandle = function() end
}

function friendTile.init(p1)
	-- upvalues: memoize (ref), createRelevancyInfoModule (ref), roact (ref), fFlagFriendsPageUserListEnabled (ref), socialCommonModule (ref)
	p1.state = { isFirstRender = true }
	p1.makeRelevancyInfo = memoize(createRelevancyInfoModule)
	p1.playerTileRef = roact.createRef()
	
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
	
	function p0.openProfilePeekViewHandle()
		-- upvalues: p1 (ref)
		return p1.props.openPlayerProfileHandle(p1.props.user.id, p1.props.index, p1.props.user)
	end
end

function friendTile.didMount(p1)
	if p1.props.pageLoadingTimeReport then
		p1.props.pageLoadingTimeReport()
	end
	p1.checkAndSetSelected()
end

function friendTile.render(p1)
	-- upvalues: getCorrectUserPresenceModule (ref), userPresenceTextModule (ref), userPresenceIconModule (ref), withStyle (ref), withLocalization (ref), fFlagFriendsPageUserListEnabled (ref), fFlagFriendsPageUserListCtaEnabledModule (ref), fFlagFriendsPageViewBtnEnabled (ref), buttonTypes (ref), buttonVariant (ref), userProfilesModule (ref), react (ref), friendTileWithTrustedIndicatorModule (ref), fFlagEnableBlackbirdCheck (ref)
	local user = p1.props.user
	local var1 = getCorrectUserPresenceModule(user)
	local var2 = userPresenceTextModule[var1]
	local var3 = userPresenceIconModule[var1]
	
	if not p1.playerTileRef:getValue() then
		p1:setState({ isFirstRender = false })
	end
	return withStyle(function(p2)
		-- upvalues: withLocalization (copy), var2 (ref), fFlagFriendsPageUserListEnabled (copy), p1 (ref), user (ref), var3 (ref), var1 (ref), fFlagFriendsPageUserListCtaEnabledModule (copy), fFlagFriendsPageViewBtnEnabled (copy), buttonTypes (copy), buttonVariant (copy), userProfilesModule (copy), react (copy), friendTileWithTrustedIndicatorModule (copy), fFlagEnableBlackbirdCheck (copy)
		return withLocalization({
			accountDeletedText = "Feature.Friends.Action.AccountDeleted",
			trustedText = "Feature.Friends.TrustedConnection.Label.Trusted",
			presenceText = var2
		})(function(p3)
			-- upvalues: fFlagFriendsPageUserListEnabled (copy), p1 (copy), user (copy), var3 (copy), p2 (ref), var1 (copy), fFlagFriendsPageUserListCtaEnabledModule (copy), fFlagFriendsPageViewBtnEnabled (copy), buttonTypes (copy), buttonVariant (copy), userProfilesModule (copy), react (copy), friendTileWithTrustedIndicatorModule (copy), fFlagEnableBlackbirdCheck (copy)
			local presenceText = p3.presenceText or nil
			local accountDeletedText = p3.accountDeletedText
			
			if fFlagFriendsPageUserListEnabled then
				local var4 = p1.makeRelevancyInfo(user, presenceText, var3, nil, p2.Theme, p1.props.index, p1.props.isLuobu, p2.Font, accountDeletedText, true)
				
				return p1.props.createRow({
					onRowActivated = p1.openProfilePeekViewHandle,
					contextualInfo = var4 and { text = var4.text, icon = var4.icon },
					presence = p1.getPresenceType(var1),
					primaryCta = if fFlagFriendsPageUserListCtaEnabledModule then nil elseif fFlagFriendsPageViewBtnEnabled then {
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
			return react.createElement(friendTileWithTrustedIndicatorModule, {
				user = user,
				userPresence = var1,
				title = combinedName or user.displayName,
				subtitle = var5 or "@" .. user.username,
				relevancyInfo = if not combinedName then nil else p1.makeRelevancyInfo(user, presenceText, var3, nil, p2.Theme, p1.props.index, p1.props.isLuobu, p2.Font, accountDeletedText, true),
				index = p1.props.index,
				openPlayerProfile = p1.openProfilePeekViewHandle,
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