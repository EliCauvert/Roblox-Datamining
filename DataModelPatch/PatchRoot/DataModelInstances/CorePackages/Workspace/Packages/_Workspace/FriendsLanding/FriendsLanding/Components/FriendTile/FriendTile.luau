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
local FFlagFriendsPageAlwaysOpenPPV = require(Parent.SharedFlags).FFlagFriendsPageAlwaysOpenPPV
local FFlagFriendsPageUserListEnabled = require(Parent.SharedFlags).FFlagFriendsPageUserListEnabled
local FFlagFriendsPageViewBtnEnabled = require(Parent.SharedFlags).FFlagFriendsPageViewBtnEnabled
local FFlagEnableBlackbirdCheck = require(Parent.SharedFlags).FFlagEnableBlackbirdCheck
local FFlagFriendsPageViewBtnWidth = require(Parent.SharedFlags).FFlagFriendsPageViewBtnWidth
local FriendTile = Roact.PureComponent:extend("FriendTile")

local function OpenPlayerProfile()
	return function() end
end

FriendTile.validateProps = T.strictInterface({
	user = T.table,
	index = T.number,
	openPlayerProfile = T.optional(T.callback),
	openPlayerProfileHandle = T.optional(T.callback),
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
	}))),
	isPlayerContextualMenuEnabled = T.optional(T.boolean)
})
FriendTile.defaultProps = {
	isLuobu = false,
	index = 1,
	buttons = nil,
	isPlayerContextualMenuEnabled = false,
	trustedConnection = false,
	user = { username = "" },
	openPlayerProfile = OpenPlayerProfile
}

function FriendTile.init(p1)
	-- upvalues: MemoizeFunction (copy), CreateRelevancyInfoModule (copy), Roact (copy), FFlagFriendsPageAlwaysOpenPPV (copy), FFlagFriendsPageUserListEnabled (copy), SocialCommonModule (copy)
	p1.state = { isFirstRender = true }
	p1.makeRelevancyInfo = MemoizeFunction(CreateRelevancyInfoModule)
	p1.playerTileRef = Roact.createRef()
	p1.openPlayerProfile = if FFlagFriendsPageAlwaysOpenPPV then nil elseif p1.props.isPlayerContextualMenuEnabled then function(_, _)
		-- upvalues: p1 (copy)
		return p1.props.openPlayerProfile(p1.props.user)
	end else function(p2, p3)
		-- upvalues: p1 (copy)
		local User = p1.props.user
		
		return if p2 and p3 then p1.props.openPlayerProfile(User.id, p1.props.index, User, p2, p3) else p1.props.openPlayerProfile(User.id, p1.props.index, User)
	end
	p1.openPlayerProfileForRelevancyInfo = if FFlagFriendsPageAlwaysOpenPPV then nil else function(p2, p3)
		-- upvalues: p1 (copy)
		return function()
			-- upvalues: p1 (upval), p2 (copy), p3 (copy)
			return p1.openPlayerProfile(p2, p3)
		end
	end
	
	function p1.checkAndSetSelected()
		-- upvalues: p1 (copy)
		if p1.props.selected and p1.props.focusGuiObject then
			local Value = p1.playerTileRef:getValue()
			
			if Value then
				p1.props.focusGuiObject(Value)
			end
		end
	end
	
	p1.getPresenceType = if FFlagFriendsPageUserListEnabled then function(p2): string
		-- upvalues: SocialCommonModule (upval)
		return string.gsub(tostring(p2 or ""), "PresenceType%.", "") or SocialCommonModule.Enums.PresenceTypes.Offline
	end else nil
	p1.openProfilePeekViewHandle = if FFlagFriendsPageUserListEnabled then function()
		-- upvalues: p1 (copy)
		return p1.props.openPlayerProfileHandle(p1.props.user.id, p1.props.index)
	end else nil
end

function FriendTile.didMount(p1)
	if p1.props.pageLoadingTimeReport then
		p1.props.pageLoadingTimeReport()
	end
	p1.checkAndSetSelected()
end

function FriendTile.render(p1)
	-- upvalues: GetCorrectUserPresenceModule (copy), UserPresenceTextModule (copy), UserPresenceIconModule (copy), WithStyleFunction (copy), WithLocalizationFunction (copy), FFlagFriendsPageUserListEnabled (copy), FFlagFriendsPageAlwaysOpenPPV (copy), FFlagFriendsPageViewBtnEnabled (copy), ButtonTypes (copy), ButtonVariant (copy), FFlagFriendsPageViewBtnWidth (copy), UserProfilesModule (copy), React (copy), FriendTileWithTrustedIndicatorModule (copy), FFlagEnableBlackbirdCheck (copy)
	local User = p1.props.user
	local CorrectUserPresenceModule = GetCorrectUserPresenceModule(User)
	local UserPresenceTextModuleEntry = UserPresenceTextModule[CorrectUserPresenceModule]
	local UserPresenceIconModuleEntry = UserPresenceIconModule[CorrectUserPresenceModule]
	local AbsoluteSize = nil
	local AbsolutePosition = nil
	local Value = p1.playerTileRef:getValue()
	
	if Value then
		AbsoluteSize = Value.AbsoluteSize
		AbsolutePosition = Value.AbsolutePosition
	else
		p1:setState({ isFirstRender = false })
	end
	return WithStyleFunction(function(p2)
		-- upvalues: WithLocalizationFunction (upval), UserPresenceTextModuleEntry (copy), FFlagFriendsPageUserListEnabled (upval), p1 (copy), User (copy), UserPresenceIconModuleEntry (copy), FFlagFriendsPageAlwaysOpenPPV (upval), AbsoluteSize (ref), AbsolutePosition (ref), CorrectUserPresenceModule (copy), FFlagFriendsPageViewBtnEnabled (upval), ButtonTypes (upval), ButtonVariant (upval), FFlagFriendsPageViewBtnWidth (upval), UserProfilesModule (upval), React (upval), FriendTileWithTrustedIndicatorModule (upval), FFlagEnableBlackbirdCheck (upval)
		return WithLocalizationFunction({
			accountDeletedText = "Feature.Friends.Action.AccountDeleted",
			trustedText = "Feature.Friends.TrustedConnection.Label.Trusted",
			presenceText = UserPresenceTextModuleEntry
		})(function(p3)
			-- upvalues: FFlagFriendsPageUserListEnabled (upval), p1 (upval), User (upval), UserPresenceIconModuleEntry (upval), FFlagFriendsPageAlwaysOpenPPV (upval), AbsoluteSize (upval), AbsolutePosition (upval), p2 (copy), CorrectUserPresenceModule (upval), FFlagFriendsPageViewBtnEnabled (upval), ButtonTypes (upval), ButtonVariant (upval), FFlagFriendsPageViewBtnWidth (upval), UserProfilesModule (upval), React (upval), FriendTileWithTrustedIndicatorModule (upval), FFlagEnableBlackbirdCheck (upval)
			local PresenceText = p3.presenceText or nil
			local AccountDeletedText = p3.accountDeletedText
			
			if FFlagFriendsPageUserListEnabled then
				local RelevancyInfo = p1.makeRelevancyInfo(User, PresenceText, UserPresenceIconModuleEntry, if FFlagFriendsPageAlwaysOpenPPV then nil else p1.openPlayerProfileForRelevancyInfo(AbsoluteSize, AbsolutePosition), p2.Theme, p1.props.index, p1.props.isLuobu, p2.Font, AccountDeletedText, true)
				
				return p1.props.createRow({
					onRowActivated = p1.openProfilePeekViewHandle,
					contextualInfo = RelevancyInfo and { text = RelevancyInfo.text, icon = RelevancyInfo.icon },
					presence = p1.getPresenceType(CorrectUserPresenceModule),
					primaryCta = if FFlagFriendsPageViewBtnEnabled then {
						type = ButtonTypes.View,
						onActivated = p1.openProfilePeekViewHandle,
						variant = ButtonVariant.Standard,
						minWidth = if FFlagFriendsPageViewBtnWidth then 64 else nil,
						maxWidth = if FFlagFriendsPageViewBtnWidth then 90 else nil
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
			local CombinedName1 = if CombinedName then CombinedName else User.displayName
			local FormatUsernameResult1 = if FormatUsernameResult then FormatUsernameResult else "@" .. User.username
			local RelevancyInfo = if CombinedName then p1.makeRelevancyInfo(User, PresenceText, UserPresenceIconModuleEntry, if FFlagFriendsPageAlwaysOpenPPV then nil else p1.openPlayerProfileForRelevancyInfo(AbsoluteSize, AbsolutePosition), p2.Theme, p1.props.index, p1.props.isLuobu, p2.Font, AccountDeletedText, true) else nil
			
			return React.createElement(FriendTileWithTrustedIndicatorModule, {
				user = User,
				userPresence = CorrectUserPresenceModule,
				title = CombinedName1,
				subtitle = FormatUsernameResult1,
				relevancyInfo = RelevancyInfo,
				index = p1.props.index,
				openPlayerProfile = if FFlagFriendsPageAlwaysOpenPPV then p1.props.openPlayerProfile(User.id, p1.props.index) else p1.openPlayerProfile(AbsoluteSize, AbsolutePosition, CombinedName1, FormatUsernameResult1, RelevancyInfo),
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