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
local fFlagFriendsPageViewBtnWidth = require(parent.SharedFlags).FFlagFriendsPageViewBtnWidth
local friendTile = roact.PureComponent:extend("FriendTile")

local var10 = function() --[[ line: 38 ]]
	return function() --[[ line: 39 ]] end
end

friendTile.validateProps = t.strictInterface({
	user = t.table,
	index = t.number,
	openPlayerProfile = t.optional(t.callback),
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
	isPlayerContextualMenuEnabled = t.optional(t.boolean)
})
friendTile.defaultProps = {
	isLuobu = false,
	index = 1,
	buttons = nil,
	isPlayerContextualMenuEnabled = false,
	trustedConnection = false,
	user = { username = "" },
	openPlayerProfile = var10
}

function friendTile.init(p0) --[[ line: 82 ]]
	-- upvalues: memoize (ref), createRelevancyInfoModule (ref), roact (ref), fFlagFriendsPageAlwaysOpenPPV (ref), fFlagFriendsPageUserListEnabled (ref), socialCommonModule (ref)
	p0.state = { isFirstRender = true }
	p0.makeRelevancyInfo = memoize(createRelevancyInfoModule)
	p0.playerTileRef = roact.createRef()
	p0.openPlayerProfile = if fFlagFriendsPageAlwaysOpenPPV then nil elseif p0.props.isPlayerContextualMenuEnabled then function(_, _) --[[ line: 89 ]]
		-- upvalues: p0 (ref)
		return p0.props.openPlayerProfile(p0.props.user)
	end else function(p1, p2) --[[ line: 93 ]]
		-- upvalues: p0 (ref)
		local user = p0.props.user
		
		return if p1 and p2 then p0.props.openPlayerProfile(user.id, p0.props.index, user, p1, p2) else p0.props.openPlayerProfile(user.id, p0.props.index, user)
	end
	p0.openPlayerProfileForRelevancyInfo = if fFlagFriendsPageAlwaysOpenPPV then nil else function(p3, p4) --[[ line: 104 ]]
		-- upvalues: p0 (ref)
		return function() --[[ line: 105 ]]
			-- upvalues: p0 (copy), p3 (ref), p4 (ref)
			return p0.openPlayerProfile(p3, p4)
		end
	end
	
	function p0.checkAndSetSelected() --[[ line: 110 ]]
		-- upvalues: p0 (ref)
		if p0.props.selected and p0.props.focusGuiObject then
			local value = p0.playerTileRef:getValue()
			
			if value then
				p0.props.focusGuiObject(value)
			end
		end
	end
	
	p0.getPresenceType = if fFlagFriendsPageUserListEnabled then function(p5) --[[ line: 120 ]]
		-- upvalues: socialCommonModule (copy)
		return string.gsub(tostring(p5 or ""), "PresenceType%.", "") or socialCommonModule.Enums.PresenceTypes.Offline
	end else nil
	p0.openProfilePeekViewHandle = if fFlagFriendsPageUserListEnabled then function() --[[ line: 127 ]]
		-- upvalues: p0 (ref)
		return p0.props.openPlayerProfileHandle(p0.props.user.id, p0.props.index)
	end else nil
end

function friendTile.didMount(p6) --[[ line: 133 ]]
	if p6.props.pageLoadingTimeReport then
		p6.props.pageLoadingTimeReport()
	end
	p6.checkAndSetSelected()
end

function friendTile.render(p7) --[[ line: 141 ]]
	-- upvalues: getCorrectUserPresenceModule (ref), userPresenceTextModule (ref), userPresenceIconModule (ref), withStyle (ref), withLocalization (ref), fFlagFriendsPageUserListEnabled (ref), fFlagFriendsPageAlwaysOpenPPV (ref), fFlagFriendsPageViewBtnEnabled (ref), buttonTypes (ref), buttonVariant (ref), fFlagFriendsPageViewBtnWidth (ref), userProfilesModule (ref), react (ref), friendTileWithTrustedIndicatorModule (ref), fFlagEnableBlackbirdCheck (ref)
	local user = p7.props.user
	local var12 = getCorrectUserPresenceModule(user)
	local var13 = userPresenceTextModule[var12]
	local var14 = userPresenceIconModule[var12]
	local absoluteSize = nil
	local absolutePosition = nil
	local value = p7.playerTileRef:getValue()
	
	if value then
		absoluteSize = value.AbsoluteSize
		absolutePosition = value.AbsolutePosition
	else
		p7:setState({ isFirstRender = false })
	end
	return withStyle(function(p8) --[[ line: 159 ]]
		-- upvalues: withLocalization (copy), var13 (ref), fFlagFriendsPageUserListEnabled (copy), p7 (ref), user (ref), var14 (ref), fFlagFriendsPageAlwaysOpenPPV (copy), absoluteSize (write), absolutePosition (write), var12 (ref), fFlagFriendsPageViewBtnEnabled (copy), buttonTypes (copy), buttonVariant (copy), fFlagFriendsPageViewBtnWidth (copy), userProfilesModule (copy), react (copy), friendTileWithTrustedIndicatorModule (copy), fFlagEnableBlackbirdCheck (copy)
		return withLocalization({
			accountDeletedText = "Feature.Friends.Action.AccountDeleted",
			trustedText = "Feature.Friends.TrustedConnection.Label.Trusted",
			presenceText = var13
		})(function(p9) --[[ line: 164 ]]
			-- upvalues: fFlagFriendsPageUserListEnabled (copy), p7 (copy), user (copy), var14 (copy), fFlagFriendsPageAlwaysOpenPPV (copy), absoluteSize (copy), absolutePosition (copy), p8 (ref), var12 (copy), fFlagFriendsPageViewBtnEnabled (copy), buttonTypes (copy), buttonVariant (copy), fFlagFriendsPageViewBtnWidth (copy), userProfilesModule (copy), react (copy), friendTileWithTrustedIndicatorModule (copy), fFlagEnableBlackbirdCheck (copy)
			local presenceText = p9.presenceText or nil
			local accountDeletedText = p9.accountDeletedText
			
			if fFlagFriendsPageUserListEnabled then
				local var17 = p7.makeRelevancyInfo(user, presenceText, var14, if fFlagFriendsPageAlwaysOpenPPV then nil else p7.openPlayerProfileForRelevancyInfo(absoluteSize, absolutePosition), p8.Theme, p7.props.index, p7.props.isLuobu, p8.Font, accountDeletedText, true)
				
				return p7.props.createRow({
					onRowActivated = p7.openProfilePeekViewHandle,
					contextualInfo = var17 and { text = var17.text, icon = var17.icon },
					presence = p7.getPresenceType(var12),
					primaryCta = if fFlagFriendsPageViewBtnEnabled then {
						type = buttonTypes.View,
						onActivated = p7.openProfilePeekViewHandle,
						variant = buttonVariant.Standard,
						minWidth = if fFlagFriendsPageViewBtnWidth then 64 else nil,
						maxWidth = if fFlagFriendsPageViewBtnWidth then 90 else nil
					} else nil
				})
			end
			local combinedName = nil
			local var18 = nil
			
			if p7.props.userProfile then
				combinedName = p7.props.userProfile.names.combinedName
				var18 = userProfilesModule.Formatters.formatUsername(p7.props.userProfile.names.username)
				user.isDeleted = p7.props.userProfile.isDeleted
			end
			local var19 = combinedName or user.displayName
			local var20 = var18 or "@" .. user.username
			local var21 = if not combinedName then nil else p7.makeRelevancyInfo(user, presenceText, var14, if fFlagFriendsPageAlwaysOpenPPV then nil else p7.openPlayerProfileForRelevancyInfo(absoluteSize, absolutePosition), p8.Theme, p7.props.index, p7.props.isLuobu, p8.Font, accountDeletedText, true)
			
			return react.createElement(friendTileWithTrustedIndicatorModule, {
				user = user,
				userPresence = var12,
				title = var19,
				subtitle = var20,
				relevancyInfo = var21,
				index = p7.props.index,
				openPlayerProfile = if fFlagFriendsPageAlwaysOpenPPV then p7.props.openPlayerProfile(user.id, p7.props.index) else p7.openPlayerProfile(absoluteSize, absolutePosition, var19, var20, var21),
				playerTileRef = p7.playerTileRef,
				buttons = p7.props.buttons,
				isTrustedConnection = p7.props.trustedConnection,
				isVerified = p7.props.userProfile and p7.props.userProfile.isVerified,
				isRobloxSubscriber = if fFlagEnableBlackbirdCheck then p7.props.isRobloxSubscriber else nil
			})
		end)
	end)
end

return friendTile