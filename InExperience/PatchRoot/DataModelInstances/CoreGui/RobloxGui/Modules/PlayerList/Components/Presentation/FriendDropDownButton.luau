local CorePackages = game:GetService("CorePackages")
local RbxAnalyticsService = game:GetService("RbxAnalyticsService")
local LocalizationService = game:GetService("LocalizationService")
local RoactModule = require(CorePackages.Packages.Roact)
local TModule = require(CorePackages.Packages.t)
local Localization = require(CorePackages.Workspace.Packages.InExperienceLocales).Localization
local DropDownButtonAnimatorModule = require(script.Parent.DropDownButtonAnimator)
local Images = require(CorePackages.Packages.UIBlox).App.ImageSet.Images
local RobloxTranslatorModule = require(CorePackages.Workspace.Packages.RobloxTranslator)
local LocalPlayer = game:GetService("Players").LocalPlayer
local FriendDropDownButton = RoactModule.PureComponent:extend("FriendDropDownButton")
FriendDropDownButton.validateProps = TModule.strictInterface({
	layoutOrder = TModule.integer,
	playerRelationship = TModule.strictInterface({
		isBlocked = TModule.boolean,
		friendStatus = TModule.enum(Enum.FriendStatus),
		isFollowing = TModule.boolean,
		isFollower = TModule.boolean
	}),
	selectedPlayer = TModule.optional(TModule.instanceIsA("Player")),
	dropDownOpen = TModule.boolean,
	requestFriendship = TModule.callback,
	contentVisible = TModule.optional(TModule.boolean)
})

local function getFriendTextAndIcon(FriendStatus) --[[ Line: 41 ]]
	-- upvalues: Images (copy), Localization (copy), LocalizationService (copy), RobloxTranslatorModule (copy)
	local IconsActionsFriendsFriendAdd = Images["icons/actions/friends/friendAdd"]
	local IconsActionsFriendsFriendRemove = Images["icons/actions/friends/friendRemove"]
	local NewLocalization = Localization.new(LocalizationService.RobloxLocaleId)
	
	if FriendStatus == Enum.FriendStatus.Friend then
		return NewLocalization:Format("Feature.Friends.Action.Unfriend"), IconsActionsFriendsFriendRemove
	elseif FriendStatus == Enum.FriendStatus.Unknown or FriendStatus == Enum.FriendStatus.NotFriend then
		return NewLocalization:Format("Feature.Friends.Label.FriendRequest"), IconsActionsFriendsFriendAdd
	elseif FriendStatus == Enum.FriendStatus.FriendRequestSent then
		return RobloxTranslatorModule:FormatByKey("InGame.PlayerDropDown.CancelRequest"), IconsActionsFriendsFriendAdd
	elseif FriendStatus == Enum.FriendStatus.FriendRequestReceived then
		return RobloxTranslatorModule:FormatByKey("InGame.PlayerDropDown.Accept"), IconsActionsFriendsFriendAdd
	else
		return NewLocalization:Format("Feature.Friends.Label.FriendRequest"), IconsActionsFriendsFriendAdd
	end
end

function FriendDropDownButton.init(p1) --[[ Line: 59 ]]
	p1.state = { unfriendConfirm = false }
end

function FriendDropDownButton.render(p1) --[[ Line: 65 ]]
	-- upvalues: LocalPlayer (copy), RbxAnalyticsService (copy), getFriendTextAndIcon (copy), RoactModule (copy), DropDownButtonAnimatorModule (copy)
	local PlayerRelationship = p1.props.playerRelationship
	local SelectedPlayer = p1.props.selectedPlayer
	local OnActivated = if PlayerRelationship.friendStatus == Enum.FriendStatus.Friend and not p1.state.unfriendConfirm then function() --[[ Line: 70 ]]
		-- upvalues: p1 (copy)
		p1:setState({ unfriendConfirm = true })
	end else function() --[[ Line: 76 ]]
		-- upvalues: PlayerRelationship (copy), LocalPlayer (upval), SelectedPlayer (copy), p1 (copy), RbxAnalyticsService (upval)
		if PlayerRelationship.friendStatus == Enum.FriendStatus.Friend then
			LocalPlayer:RevokeFriendship(SelectedPlayer)
			
			return
		end
		if PlayerRelationship.friendStatus == Enum.FriendStatus.Unknown or PlayerRelationship.friendStatus == Enum.FriendStatus.NotFriend then
			p1.props.requestFriendship(SelectedPlayer, false)
			
			return
		end
		if PlayerRelationship.friendStatus == Enum.FriendStatus.FriendRequestSent then
			RbxAnalyticsService:ReportCounter("PlayerDropDown-RevokeFriendship")
			RbxAnalyticsService:TrackEvent("Game", "RevokeFriendship", "PlayerDropDown")
			LocalPlayer:RevokeFriendship(SelectedPlayer)
			
			return
		end
		if PlayerRelationship.friendStatus == Enum.FriendStatus.FriendRequestReceived then
			RbxAnalyticsService:ReportCounter("PlayerDropDown-RequestFriendship")
			RbxAnalyticsService:TrackEvent("Game", "RequestFriendship", "PlayerDropDown")
			p1.props.requestFriendship(SelectedPlayer, true)
		end
	end
	local OnDecline = if PlayerRelationship.friendStatus == Enum.FriendStatus.FriendRequestReceived then function() --[[ Line: 98 ]]
		-- upvalues: LocalPlayer (upval), SelectedPlayer (copy)
		LocalPlayer:RevokeFriendship(SelectedPlayer)
	end else nil
	local OnDismiss = if p1.state.unfriendConfirm then function() --[[ Line: 104 ]]
		-- upvalues: p1 (copy)
		p1:setState({ unfriendConfirm = false })
	end else nil
	local FriendTextAndIcon, FriendTextAndIcon2 = getFriendTextAndIcon(PlayerRelationship.friendStatus)
	
	return RoactModule.createElement(DropDownButtonAnimatorModule, {
		lastButton = false,
		layoutOrder = p1.props.layoutOrder,
		text = FriendTextAndIcon,
		icon = FriendTextAndIcon2,
		onActivated = OnActivated,
		forceShowOptions = p1.state.unfriendConfirm,
		selectedPlayer = SelectedPlayer,
		onDecline = OnDecline,
		onDismiss = OnDismiss
	})
end

function FriendDropDownButton.didUpdate(p1, p2, _) --[[ Line: 125 ]]
	if p2.playerRelationship.friendStatus ~= p1.props.playerRelationship.friendStatus then
		p1:setState({ unfriendConfirm = false })
	end
	if p2.selectedPlayer ~= p1.props.selectedPlayer or p2.dropDownOpen ~= p1.props.dropDownOpen then
		p1:setState({ unfriendConfirm = false })
	end
end

return FriendDropDownButton