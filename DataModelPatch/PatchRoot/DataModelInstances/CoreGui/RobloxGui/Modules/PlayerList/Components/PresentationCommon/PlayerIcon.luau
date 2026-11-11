local CorePackages = game:GetService("CorePackages")
local CryoModule = require(CorePackages.Packages.Cryo)
local RoactModule = require(CorePackages.Packages.Roact)
local ReactModule = require(CorePackages.Packages.React)
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local FoundationModule = require(CorePackages.Packages.Foundation)
local TModule = require(CorePackages.Packages.t)
local Parent = script.Parent.Parent
local WithLayoutValuesFunction = require(Parent.Connection.LayoutValues).WithLayoutValues
local PlayerListModule = require(CorePackages.Workspace.Packages.PlayerList)
local UseLayoutValuesFunction = PlayerListModule.Common.useLayoutValues
local SharedFlagsModule = require(CorePackages.Workspace.Packages.SharedFlags)
local FFlagEnableBlackbirdCheck = SharedFlagsModule.FFlagEnableBlackbirdCheck
local FFlagHidePremiumIconography = SharedFlagsModule.FFlagHidePremiumIconography
local FFlagCoreUiMigrateUIBloxToFoundation = SharedFlagsModule.FFlagCoreUiMigrateUIBloxToFoundation
local FFlagPlayerListReduceRerendersModule = require(Parent.Parent.Flags.FFlagPlayerListReduceRerenders)
local FFlagPlayerListFoundationSubscriptionIcon = PlayerListModule.Flags.FFlagPlayerListFoundationSubscriptionIcon
local ImageSetLabel = require(CorePackages.Packages.UIBlox).Core.ImageSet.ImageSetLabel

local function _(p1): boolean
	return p1 ~= nil and (p1 ~= "" and p1:match("^%w+://.*$") == nil)
end

local PlayerIcon = RoactModule.PureComponent:extend("PlayerIcon")
PlayerIcon.validateProps = TModule.strictInterface({
	player = require(game:GetService("CoreGui"):WaitForChild("RobloxGui").Modules.Interfaces.playerInterface),
	layoutOrder = TModule.optional(TModule.integer),
	isSmallTouchDevice = TModule.optional(TModule.boolean),
	playerIconInfo = TModule.strictInterface({
		isPlaceOwner = TModule.boolean,
		avatarIcon = TModule.optional(TModule.table),
		specialGroupIcon = TModule.optional(TModule.table)
	}),
	playerRelationship = TModule.strictInterface({
		isBlocked = TModule.boolean,
		friendStatus = TModule.enum(Enum.FriendStatus),
		isFollowing = TModule.boolean,
		isFollower = TModule.boolean
	}),
	layoutValues = TModule.optional(TModule.table)
})

local _ = function(p1, p2)
	local FriendIcon = p1.FriendIcons[p2.friendStatus]
	
	return if p2.isBlocked then p1.BlockedIcon elseif FriendIcon then FriendIcon else nil
end

local function getIconImage(LayoutValues, Player: Player, PlayerIconInfo, PlayerRelationship)
	-- upvalues: FFlagEnableBlackbirdCheck (copy), FFlagHidePremiumIconography (copy)
	local FriendIcon = LayoutValues.FriendIcons[PlayerRelationship.friendStatus]
	local BlockedIcon = if PlayerRelationship.isBlocked then LayoutValues.BlockedIcon elseif FriendIcon then FriendIcon else nil
	
	if BlockedIcon then
		return BlockedIcon
	end
	if PlayerIconInfo.isPlaceOwner then
		return LayoutValues.PlaceOwnerIcon
	end
	if LayoutValues.CustomPlayerIcons[Player.UserId] then
		return LayoutValues.CustomPlayerIcons[Player.UserId]
	end
	if PlayerIconInfo.specialGroupIcon then
		return PlayerIconInfo.specialGroupIcon
	end
	if PlayerRelationship.isFollowing then
		return LayoutValues.FollowingIcon
	end
	local IsMembershipTypeMatch = Player.MembershipType == Enum.MembershipType.Premium
	
	if FFlagEnableBlackbirdCheck then
		if game:GetEngineFeature("ReadHasRobloxSubscriptionLua") and Player.HasRobloxSubscription then
			return LayoutValues.SubscriptionIcon
		end
		if not FFlagHidePremiumIconography and IsMembershipTypeMatch then
			local MembershipIcon = LayoutValues.MembershipIcons[Player.MembershipType]
			
			if MembershipIcon then
				return MembershipIcon
			end
		end
	elseif IsMembershipTypeMatch then
		local MembershipIcon = LayoutValues.MembershipIcons[Player.MembershipType]
		
		if MembershipIcon then
			return MembershipIcon
		end
	end
	return ""
end

function PlayerIcon.render(p1)
	-- upvalues: WithLayoutValuesFunction (copy), RoactModule (copy), getIconImage (copy), FFlagCoreUiMigrateUIBloxToFoundation (copy), FFlagPlayerListFoundationSubscriptionIcon (copy), FoundationModule (copy), ImageSetLabel (copy)
	return WithLayoutValuesFunction(function(_)
		-- upvalues: p1 (copy), RoactModule (upval), getIconImage (upval), FFlagCoreUiMigrateUIBloxToFoundation (upval), FFlagPlayerListFoundationSubscriptionIcon (upval), FoundationModule (upval), ImageSetLabel (upval)
		local LayoutValues = p1.props.layoutValues
		local AvatarIcon = p1.props.playerIconInfo and p1.props.playerIconInfo.avatarIcon
		
		if AvatarIcon == nil then
			AvatarIcon = LayoutValues.DefaultThumbnail
		end
		if LayoutValues.IsTenFoot then
			return RoactModule.createElement("ImageLabel", {
				BackgroundTransparency = 1,
				LayoutOrder = p1.props.layoutOrder or 1,
				Size = LayoutValues.PlayerIconBackgroundSize,
				Image = LayoutValues.PlayerBackgroundImage
			}, {
				RoactModule.createElement("ImageLabel", {
					BackgroundTransparency = 1,
					BorderSizePixel = 0,
					Size = LayoutValues.PlayerIconSize,
					Position = UDim2.new(0.5, 0, 0.5, 0),
					AnchorPoint = Vector2.new(0.5, 0.5),
					Image = AvatarIcon
				})
			})
		end
		if p1.props.isSmallTouchDevice then
			local IconImage = getIconImage(LayoutValues, p1.props.player, p1.props.playerIconInfo, p1.props.playerRelationship)
			
			if not FFlagCoreUiMigrateUIBloxToFoundation and (not FFlagPlayerListFoundationSubscriptionIcon or typeof(IconImage) ~= "table" or not IconImage.isFoundationIcon) then
				return RoactModule.createElement(ImageSetLabel, {
					BackgroundTransparency = 1,
					BorderSizePixel = 0,
					AnchorPoint = Vector2.new(0, 0.5),
					Position = UDim2.new(0, LayoutValues.PlayerNamePaddingXMobile, 0.5, 0),
					Size = LayoutValues.PlayerIconSizeMobile,
					Image = IconImage
				})
			end
			local Name = if typeof(IconImage) == "table" then IconImage.name else IconImage
			
			if FFlagCoreUiMigrateUIBloxToFoundation then
				if typeof(IconImage) == "table" and IconImage.Image ~= nil then
					Name = IconImage.Image
				end
				if Name == nil or (Name == "" or Name:match("^%w+://.*$") ~= nil) then
					return RoactModule.createElement(FoundationModule.Image, {
						Image = Name,
						imageRect = if typeof(IconImage) == "table" then {
							offset = IconImage.ImageRectOffset,
							size = IconImage.ImageRectSize
						} else nil,
						Size = LayoutValues.PlayerIconSizeMobile,
						AnchorPoint = Vector2.new(0, 0.5),
						Position = UDim2.new(0, LayoutValues.PlayerNamePaddingXMobile, 0.5, 0)
					})
				end
			end
			return RoactModule.createElement(FoundationModule.Icon, {
				name = Name,
				size = FoundationModule.Enums.IconSize.Medium,
				AnchorPoint = Vector2.new(0, 0.5),
				Position = UDim2.new(0, LayoutValues.PlayerNamePaddingXMobile, 0.5, 0)
			})
		else
			local IconImage1 = getIconImage(LayoutValues, p1.props.player, p1.props.playerIconInfo, p1.props.playerRelationship)
			
			if not FFlagCoreUiMigrateUIBloxToFoundation and (not FFlagPlayerListFoundationSubscriptionIcon or typeof(IconImage1) ~= "table" or not IconImage1.isFoundationIcon) then
				return RoactModule.createElement(ImageSetLabel, {
					BackgroundTransparency = 1,
					BorderSizePixel = 0,
					LayoutOrder = p1.props.layoutOrder,
					Size = LayoutValues.PlayerIconSize,
					Image = IconImage1
				})
			end
			local Name = if typeof(IconImage1) == "table" then IconImage1.name else IconImage1
			
			if FFlagCoreUiMigrateUIBloxToFoundation then
				if typeof(IconImage1) == "table" and IconImage1.Image ~= nil then
					Name = IconImage1.Image
				end
				if Name == nil or (Name == "" or Name:match("^%w+://.*$") ~= nil) then
					return RoactModule.createElement(FoundationModule.Image, {
						Image = Name,
						imageRect = if typeof(IconImage1) == "table" then {
							offset = IconImage1.ImageRectOffset,
							size = IconImage1.ImageRectSize
						} else nil,
						Size = LayoutValues.PlayerIconSize,
						LayoutOrder = p1.props.layoutOrder
					})
				end
			end
			return RoactModule.createElement(FoundationModule.Icon, {
				name = Name,
				size = FoundationModule.Enums.IconSize.Small,
				LayoutOrder = p1.props.layoutOrder
			})
		end
	end)
end

local function mapStateToProps(p1)
	return {
		isSmallTouchDevice = p1.displayOptions.isSmallTouchDevice
	}
end

local function v21(p1)
	-- upvalues: UseLayoutValuesFunction (copy), ReactModule (copy), PlayerIcon (copy), CryoModule (copy)
	return ReactModule.createElement(PlayerIcon, CryoModule.Dictionary.join(p1, { layoutValues = UseLayoutValuesFunction() }))
end

return if FFlagPlayerListReduceRerendersModule then ReactModule.memo(RoactRoduxModule.connect(mapStateToProps, nil)(v21)) else RoactRoduxModule.connect(mapStateToProps, nil)(v21)