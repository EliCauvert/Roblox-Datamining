local FriendsLanding = script:FindFirstAncestor("FriendsLanding")
local Parent = FriendsLanding.Parent
local DependenciesModule = require(FriendsLanding.dependencies)
local React = DependenciesModule.React
local Roact = DependenciesModule.Roact
local T = DependenciesModule.t
local WithStyleFunction = DependenciesModule.UIBlox.Style.withStyle
local WithLocalizationFunction = DependenciesModule.withLocalization
local UserProfilesModule = require(Parent.UserProfiles)
local UserPresenceTextModule = require(FriendsLanding.Friends.userPresenceText)
local UserPresenceIconModule = require(FriendsLanding.Friends.userPresenceIcon)
local GetCorrectUserPresenceModule = require(FriendsLanding.Friends.getCorrectUserPresence)
local MemoizeFunction = DependenciesModule.memoize
local CreateRelevancyInfoModule = require(script.Parent.createRelevancyInfo)
local SocialCommonModule = require(Parent.SocialCommon)
local ButtonTypes = require(Parent.UserList).Enums.ButtonTypes
local ButtonVariant = require(Parent.Foundation).Enums.ButtonVariant
local FriendTileWithTrustedIndicatorModule = require(script.Parent.FriendTileWithTrustedIndicator)
local FFlagFriendsPageUserListEnabled = require(Parent.SharedFlags).FFlagFriendsPageUserListEnabled
local FFlagFriendsPageViewBtnEnabled = require(Parent.SharedFlags).FFlagFriendsPageViewBtnEnabled
local FFlagEnableBlackbirdCheck = require(Parent.SharedFlags).FFlagEnableBlackbirdCheck
local FFlagFriendsPageUserListCtaEnabledModule = require(FriendsLanding.Flags.FFlagFriendsPageUserListCtaEnabled)
local FriendTile = Roact.PureComponent:extend("FriendTile")
FriendTile.validateProps = T.strictInterface({
	user = T.table,
	index = T.number,
	openPlayerProfileHandle = T.callback,
	pageLoadingTimeReport = T.optional(T.callback),
	createRow = T.optional(T.callback),
	selected = T.optional(T.boolean),
	focusGuiObject = T.optional(T.callback),
	userProfile = T.optional(T.table),
	trustedConnection = T.optional(T.boolean),
	isRobloxSubscriber = T.optional(T.boolean),
	isLuobu = T.optional(T.boolean),
	buttons = T.optional(T.array(T.strictInterface({
		icon = T.optional(T.string),
		onActivated = T.optional(T.callback),
		isSecondary = T.optional(T.boolean),
		isDisabled = T.optional(T.boolean)
	})))
})
FriendTile.defaultProps = {
	isLuobu = false,
	index = 1,
	buttons = nil,
	trustedConnection = false,
	user = { username = "" },
	openPlayerProfileHandle = function() --[[ Line: 65 ]] end
}

function FriendTile.init(p1) --[[ Line: 72 ]]
	-- upvalues: MemoizeFunction (copy), CreateRelevancyInfoModule (copy), Roact (copy), FFlagFriendsPageUserListEnabled (copy), SocialCommonModule (copy)
	p1.state = { isFirstRender = true }
	p1.makeRelevancyInfo = MemoizeFunction(CreateRelevancyInfoModule)
	p1.playerTileRef = Roact.createRef()
	
	function p1.checkAndSetSelected() --[[ Line: 77 ]]
		-- upvalues: p1 (copy)
		if p1.props.selected and p1.props.focusGuiObject then
			local Value = p1.playerTileRef:getValue()
			
			if Value then
				p1.props.focusGuiObject(Value)
			end
		end
	end
	
	p1.getPresenceType = if FFlagFriendsPageUserListEnabled then function(p2): string --[[ Line: 87 ]]
		-- upvalues: SocialCommonModule (upval)
		return string.gsub(tostring(p2 or ""), "PresenceType%.", "") or SocialCommonModule.Enums.PresenceTypes.Offline
	end else nil
	
	function p1.openProfilePeekViewHandle() --[[ Line: 93 ]]
		-- upvalues: p1 (copy)
		return p1.props.openPlayerProfileHandle(p1.props.user.id, p1.props.index, p1.props.user)
	end
end

function FriendTile.didMount(p1) --[[ Line: 98 ]]
	if p1.props.pageLoadingTimeReport then
		p1.props.pageLoadingTimeReport()
	end
	p1.checkAndSetSelected()
end

function FriendTile.render(p1) --[[ Line: 106 ]]
	-- upvalues: GetCorrectUserPresenceModule (copy), UserPresenceTextModule (copy), UserPresenceIconModule (copy), WithStyleFunction (copy), WithLocalizationFunction (copy), FFlagFriendsPageUserListEnabled (copy), FFlagFriendsPageUserListCtaEnabledModule (copy), FFlagFriendsPageViewBtnEnabled (copy), ButtonTypes (copy), ButtonVariant (copy), UserProfilesModule (copy), React (copy), FriendTileWithTrustedIndicatorModule (copy), FFlagEnableBlackbirdCheck (copy)
	local User = p1.props.user
	local CorrectUserPresenceModule = GetCorrectUserPresenceModule(User)
	local UserPresenceTextModuleEntry = UserPresenceTextModule[CorrectUserPresenceModule]
	local UserPresenceIconModuleEntry = UserPresenceIconModule[CorrectUserPresenceModule]
	
	if not p1.playerTileRef:getValue() then
		p1:setState({ isFirstRender = false })
	end
	return WithStyleFunction(function(p2) --[[ Line: 121 ]]
		-- upvalues: WithLocalizationFunction (upval), UserPresenceTextModuleEntry (copy), FFlagFriendsPageUserListEnabled (upval), p1 (copy), User (copy), UserPresenceIconModuleEntry (copy), CorrectUserPresenceModule (copy), FFlagFriendsPageUserListCtaEnabledModule (upval), FFlagFriendsPageViewBtnEnabled (upval), ButtonTypes (upval), ButtonVariant (upval), UserProfilesModule (upval), React (upval), FriendTileWithTrustedIndicatorModule (upval), FFlagEnableBlackbirdCheck (upval)
		return WithLocalizationFunction({
			accountDeletedText = "Feature.Friends.Action.AccountDeleted",
			trustedText = "Feature.Friends.TrustedConnection.Label.Trusted",
			presenceText = UserPresenceTextModuleEntry
		})(function(p3) --[[ Line: 126 ]]
			-- upvalues: FFlagFriendsPageUserListEnabled (upval), p1 (upval), User (upval), UserPresenceIconModuleEntry (upval), p2 (copy), CorrectUserPresenceModule (upval), FFlagFriendsPageUserListCtaEnabledModule (upval), FFlagFriendsPageViewBtnEnabled (upval), ButtonTypes (upval), ButtonVariant (upval), UserProfilesModule (upval), React (upval), FriendTileWithTrustedIndicatorModule (upval), FFlagEnableBlackbirdCheck (upval)
			local PresenceText = p3.presenceText or nil
			local AccountDeletedText = p3.accountDeletedText
			
			if FFlagFriendsPageUserListEnabled then
				local RelevancyInfo = p1.makeRelevancyInfo(User, PresenceText, UserPresenceIconModuleEntry, nil, p2.Theme, p1.props.index, p1.props.isLuobu, p2.Font, AccountDeletedText, true)
				
				return p1.props.createRow({
					onRowActivated = p1.openProfilePeekViewHandle,
					contextualInfo = RelevancyInfo and { text = RelevancyInfo.text, icon = RelevancyInfo.icon },
					presence = p1.getPresenceType(CorrectUserPresenceModule),
					primaryCta = if FFlagFriendsPageUserListCtaEnabledModule then nil elseif FFlagFriendsPageViewBtnEnabled then {
						minWidth = 64,
						maxWidth = 90,
						type = ButtonTypes.View,
						onActivated = p1.openProfilePeekViewHandle,
						variant = ButtonVariant.Standard
					} else nil
				})
			end
			local CombinedName = nil
			local FormatUsernameResult = nil
			
			if p1.props.userProfile then
				CombinedName = p1.props.userProfile.names.combinedName
				FormatUsernameResult = UserProfilesModule.Formatters.formatUsername(p1.props.userProfile.names.username)
				User.isDeleted = p1.props.userProfile.isDeleted
			end
			return React.createElement(FriendTileWithTrustedIndicatorModule, {
				user = User,
				userPresence = CorrectUserPresenceModule,
				title = if CombinedName then CombinedName else User.displayName,
				subtitle = if FormatUsernameResult then FormatUsernameResult else "@" .. User.username,
				relevancyInfo = if CombinedName then p1.makeRelevancyInfo(User, PresenceText, UserPresenceIconModuleEntry, nil, p2.Theme, p1.props.index, p1.props.isLuobu, p2.Font, AccountDeletedText, true) else nil,
				index = p1.props.index,
				openPlayerProfile = p1.openProfilePeekViewHandle,
				playerTileRef = p1.playerTileRef,
				buttons = p1.props.buttons,
				isTrustedConnection = p1.props.trustedConnection,
				isVerified = p1.props.userProfile and p1.props.userProfile.isVerified,
				isRobloxSubscriber = if FFlagEnableBlackbirdCheck then p1.props.isRobloxSubscriber else nil
			})
		end)
	end)
end

return FriendTile