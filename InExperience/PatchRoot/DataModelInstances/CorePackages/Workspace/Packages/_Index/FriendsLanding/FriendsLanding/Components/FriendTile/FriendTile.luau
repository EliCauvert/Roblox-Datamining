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

local var10 = function()
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
	openPlayerProfile = var10
}

function friendTile.init(p0)
	-- upvalues: memoize (ref), createRelevancyInfoModule (ref), roact (ref), fFlagFriendsPageAlwaysOpenPPV (ref), fFlagFriendsPageUnifiedOpenProfileLogic (ref), fFlagFriendsPageUserListEnabled (ref), socialCommonModule (ref)
	p0.state = { isFirstRender = true }
	p0.makeRelevancyInfo = memoize(createRelevancyInfoModule)
	p0.playerTileRef = roact.createRef()
	p0.openPlayerProfile = if fFlagFriendsPageAlwaysOpenPPV or fFlagFriendsPageUnifiedOpenProfileLogic then nil elseif p0.props.isPlayerContextualMenuEnabled then function(_, _)
		-- upvalues: p0 (ref)
		return p0.props.openPlayerProfile(p0.props.user)
	end else function(p1, p2)
		-- upvalues: p0 (ref)
		local user = p0.props.user
		
		return if p1 and p2 then p0.props.openPlayerProfile(user.id, p0.props.index, user, p1, p2) else p0.props.openPlayerProfile(user.id, p0.props.index, user)
	end
	p0.openPlayerProfileForRelevancyInfo = if fFlagFriendsPageAlwaysOpenPPV or fFlagFriendsPageUnifiedOpenProfileLogic then nil else function(p3, p4)
		-- upvalues: p0 (ref)
		return function()
			-- upvalues: p0 (copy), p3 (ref), p4 (ref)
			return p0.openPlayerProfile(p3, p4)
		end
	end
	
	function p0.checkAndSetSelected()
		-- upvalues: p0 (ref)
		if p0.props.selected and p0.props.focusGuiObject then
			local value = p0.playerTileRef:getValue()
			
			if value then
				p0.props.focusGuiObject(value)
			end
		end
	end
	
	p0.getPresenceType = if fFlagFriendsPageUserListEnabled then function(p5)
		-- upvalues: socialCommonModule (copy)
		return string.gsub(tostring(p5 or ""), "PresenceType%.", "") or socialCommonModule.Enums.PresenceTypes.Offline
	end else nil
	p0.openProfilePeekViewHandle = if fFlagFriendsPageUserListEnabled or fFlagFriendsPageUnifiedOpenProfileLogic then function()
		-- upvalues: p0 (ref), fFlagFriendsPageUnifiedOpenProfileLogic (copy)
		return p0.props.openPlayerProfileHandle(p0.props.user.id, p0.props.index, if fFlagFriendsPageUnifiedOpenProfileLogic then p0.props.user else nil)
	end else nil
end

function friendTile.didMount(p6)
	if p6.props.pageLoadingTimeReport then
		p6.props.pageLoadingTimeReport()
	end
	p6.checkAndSetSelected()
end

function friendTile.render(p7)
	-- upvalues: getCorrectUserPresenceModule (ref), userPresenceTextModule (ref), userPresenceIconModule (ref), withStyle (ref), withLocalization (ref), fFlagFriendsPageUserListEnabled (ref), fFlagFriendsPageAlwaysOpenPPV (ref), fFlagFriendsPageUnifiedOpenProfileLogic (ref), fFlagFriendsPageViewBtnEnabled (ref), buttonTypes (ref), buttonVariant (ref), userProfilesModule (ref), react (ref), friendTileWithTrustedIndicatorModule (ref), fFlagEnableBlackbirdCheck (ref)
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
	return withStyle(function(p8)
		-- upvalues: withLocalization (copy), var13 (ref), fFlagFriendsPageUserListEnabled (copy), p7 (ref), user (ref), var14 (ref), fFlagFriendsPageAlwaysOpenPPV (copy), fFlagFriendsPageUnifiedOpenProfileLogic (copy), absoluteSize (write), absolutePosition (write), var12 (ref), fFlagFriendsPageViewBtnEnabled (copy), buttonTypes (copy), buttonVariant (copy), userProfilesModule (copy), react (copy), friendTileWithTrustedIndicatorModule (copy), fFlagEnableBlackbirdCheck (copy)
		return withLocalization({
			accountDeletedText = "Feature.Friends.Action.AccountDeleted",
			trustedText = "Feature.Friends.TrustedConnection.Label.Trusted",
			presenceText = var13
		})(function(p9)
			-- upvalues: fFlagFriendsPageUserListEnabled (copy), p7 (copy), user (copy), var14 (copy), fFlagFriendsPageAlwaysOpenPPV (copy), fFlagFriendsPageUnifiedOpenProfileLogic (copy), absoluteSize (copy), absolutePosition (copy), p8 (ref), var12 (copy), fFlagFriendsPageViewBtnEnabled (copy), buttonTypes (copy), buttonVariant (copy), userProfilesModule (copy), react (copy), friendTileWithTrustedIndicatorModule (copy), fFlagEnableBlackbirdCheck (copy)
			local presenceText = p9.presenceText or nil
			local accountDeletedText = p9.accountDeletedText
			
			if fFlagFriendsPageUserListEnabled then
				local makeRelevancyInfo = p7.makeRelevancyInfo
				makeRelevancyInfo = makeRelevancyInfo(user, presenceText, var14, if fFlagFriendsPageAlwaysOpenPPV or fFlagFriendsPageUnifiedOpenProfileLogic then nil else p7.openPlayerProfileForRelevancyInfo(absoluteSize, absolutePosition), p8.Theme, p7.props.index, p7.props.isLuobu, p8.Font, accountDeletedText, true)
				
				return p7.props.createRow({
					onRowActivated = p7.openProfilePeekViewHandle,
					contextualInfo = makeRelevancyInfo and {
						text = makeRelevancyInfo.text,
						icon = makeRelevancyInfo.icon
					},
					presence = p7.getPresenceType(var12),
					primaryCta = if fFlagFriendsPageViewBtnEnabled then {
						minWidth = 64,
						maxWidth = 90,
						type = buttonTypes.View,
						onActivated = p7.openProfilePeekViewHandle,
						variant = buttonVariant.Standard
					} else nil
				})
			end
			local combinedName = nil
			local var17 = nil
			
			if p7.props.userProfile then
				combinedName = p7.props.userProfile.names.combinedName
				var17 = userProfilesModule.Formatters.formatUsername(p7.props.userProfile.names.username)
				user.isDeleted = p7.props.userProfile.isDeleted
			end
			local var20
			local var18 = combinedName or user.displayName
			local var19 = var17 or "@" .. user.username
			
			if combinedName then
				var20 = p7.makeRelevancyInfo
				var20 = var20(user, presenceText, var14, if fFlagFriendsPageAlwaysOpenPPV or fFlagFriendsPageUnifiedOpenProfileLogic then nil else p7.openPlayerProfileForRelevancyInfo(absoluteSize, absolutePosition), p8.Theme, p7.props.index, p7.props.isLuobu, p8.Font, accountDeletedText, true)
			else
				var20 = nil
			end
			return react.createElement(friendTileWithTrustedIndicatorModule, {
				user = user,
				userPresence = var12,
				title = var18,
				subtitle = var19,
				relevancyInfo = var20,
				index = p7.props.index,
				openPlayerProfile = if fFlagFriendsPageUnifiedOpenProfileLogic then p7.openProfilePeekViewHandle elseif fFlagFriendsPageAlwaysOpenPPV then p7.props.openPlayerProfile(user.id, p7.props.index) else p7.openPlayerProfile(absoluteSize, absolutePosition, var18, var19, var20),
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