local corePackagesService = game:GetService("CorePackages")
local robloxGui = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local cryoModule = require(corePackagesService.Packages.Cryo)
local roactModule = require(corePackagesService.Packages.Roact)
local reactModule = require(corePackagesService.Packages.React)
local roactRoduxModule = require(corePackagesService.Packages.RoactRodux)
local UIBloxModule = require(corePackagesService.Packages.UIBlox)
local foundationModule = require(corePackagesService.Packages.Foundation)
local tModule = require(corePackagesService.Packages.t)
local playerInterfaceModule = require(robloxGui.Modules.Interfaces.playerInterface)
local parent = script.Parent.Parent
local withLayoutValues = require(parent.Connection.LayoutValues).WithLayoutValues
local playerListModule = require(corePackagesService.Workspace.Packages.PlayerList)
local useLayoutValues = playerListModule.Common.useLayoutValues
local sharedFlagsModule = require(corePackagesService.Workspace.Packages.SharedFlags)
local fFlagEnableBlackbirdCheck = sharedFlagsModule.FFlagEnableBlackbirdCheck
local fFlagHidePremiumIconography = sharedFlagsModule.FFlagHidePremiumIconography
local fFlagPlayerListReduceRerendersModule = require(parent.Parent.Flags.FFlagPlayerListReduceRerenders)
local fFlagPlayerListFoundationSubscriptionIcon = playerListModule.Flags.FFlagPlayerListFoundationSubscriptionIcon
local imageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local playerIcon = roactModule.PureComponent:extend("PlayerIcon")
playerIcon.validateProps = tModule.strictInterface({
	player = playerInterfaceModule,
	layoutOrder = tModule.optional(tModule.integer),
	isSmallTouchDevice = tModule.optional(tModule.boolean),
	playerIconInfo = tModule.strictInterface({
		isPlaceOwner = tModule.boolean,
		avatarIcon = tModule.optional(tModule.table),
		specialGroupIcon = tModule.optional(tModule.table)
	}),
	playerRelationship = tModule.strictInterface({
		isBlocked = tModule.boolean,
		friendStatus = tModule.enum(Enum.FriendStatus),
		isFollowing = tModule.boolean,
		isFollower = tModule.boolean
	}),
	layoutValues = tModule.optional(tModule.table)
})

local function _(p0, p1) --[[ line: 57 | named "getSocialIconImage" ]]
	local friendStatus = p0.FriendIcons[p1.friendStatus]
	
	return if p1.isBlocked then p0.BlockedIcon else friendStatus or nil
end

local function getIconImage(p2, p3, p4, p5) --[[ line: 69 ]]
	-- upvalues: fFlagEnableBlackbirdCheck (ref), fFlagHidePremiumIconography (ref)
	local friendStatus = p2.FriendIcons[p5.friendStatus]
	local var17 = if p5.isBlocked then p2.BlockedIcon else friendStatus or nil
	
	if var17 then
		return var17
	elseif p4.isPlaceOwner then
		return p2.PlaceOwnerIcon
	elseif p2.CustomPlayerIcons[p3.UserId] then
		return p2.CustomPlayerIcons[p3.UserId]
	elseif p4.specialGroupIcon then
		return p4.specialGroupIcon
	elseif p5.isFollowing then
		return p2.FollowingIcon
	end
	local var18 = p3.MembershipType == Enum.MembershipType.Premium
	
	if fFlagEnableBlackbirdCheck then
		if game:GetEngineFeature("ReadHasRobloxSubscriptionLua") and p3.HasRobloxSubscription then
			return p2.SubscriptionIcon
		elseif not fFlagHidePremiumIconography and var18 then
			local membershipType = p2.MembershipIcons[p3.MembershipType]
			
			return membershipType or ""
		end
	elseif var18 then
		local membershipType = p2.MembershipIcons[p3.MembershipType]
		
		if membershipType then
			return membershipType
		end
	end
end

function playerIcon.render(p6) --[[ line: 111 ]]
	-- upvalues: withLayoutValues (ref), roactModule (ref), getIconImage (ref), fFlagPlayerListFoundationSubscriptionIcon (ref), foundationModule (ref), imageSetLabel (ref)
	return withLayoutValues(function(_) --[[ line: 112 ]]
		-- upvalues: p6 (ref), roactModule (copy), getIconImage (copy), fFlagPlayerListFoundationSubscriptionIcon (copy), foundationModule (copy), imageSetLabel (copy)
		layoutValues = p6.props.layoutValues
		local avatarIcon = p6.props.playerIconInfo and p6.props.playerIconInfo.avatarIcon
		
		if avatarIcon == nil then
			avatarIcon = layoutValues.DefaultThumbnail
		end
		if layoutValues.IsTenFoot then
			return roactModule.createElement("ImageLabel", {
				BackgroundTransparency = 1,
				LayoutOrder = p6.props.layoutOrder or 1,
				Size = layoutValues.PlayerIconBackgroundSize,
				Image = layoutValues.PlayerBackgroundImage
			}, {
				roactModule.createElement("ImageLabel", {
					BackgroundTransparency = 1,
					BorderSizePixel = 0,
					Size = layoutValues.PlayerIconSize,
					Position = UDim2.new(0.5, 0, 0.5, 0),
					AnchorPoint = Vector2.new(0.5, 0.5),
					Image = avatarIcon
				})
			})
		elseif p6.props.isSmallTouchDevice then
			local var20 = getIconImage(layoutValues, p6.props.player, p6.props.playerIconInfo, p6.props.playerRelationship)
			
			return if fFlagPlayerListFoundationSubscriptionIcon and typeof(var20) == "table" and var20.isFoundationIcon then roactModule.createElement(foundationModule.Icon, {
				name = var20.name,
				size = foundationModule.Enums.IconSize.Medium,
				AnchorPoint = Vector2.new(0, 0.5),
				Position = UDim2.new(0, layoutValues.PlayerNamePaddingXMobile, 0.5, 0)
			}) else roactModule.createElement(imageSetLabel, {
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				AnchorPoint = Vector2.new(0, 0.5),
				Position = UDim2.new(0, layoutValues.PlayerNamePaddingXMobile, 0.5, 0),
				Size = layoutValues.PlayerIconSizeMobile,
				Image = var20
			})
		end
		local var21 = getIconImage(layoutValues, p6.props.player, p6.props.playerIconInfo, p6.props.playerRelationship)
		
		return if fFlagPlayerListFoundationSubscriptionIcon and typeof(var21) == "table" and var21.isFoundationIcon then roactModule.createElement(foundationModule.Icon, {
			name = var21.name,
			size = foundationModule.Enums.IconSize.Small,
			LayoutOrder = p6.props.layoutOrder
		}) else roactModule.createElement(imageSetLabel, {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			LayoutOrder = p6.props.layoutOrder,
			Size = layoutValues.PlayerIconSize,
			Image = var21
		})
	end)
end

local function mapStateToProps(p7) --[[ line: 188 ]]
	return {
		isSmallTouchDevice = p7.displayOptions.isSmallTouchDevice
	}
end

local var16 = function(p8) --[[ line: 194 ]]
	-- upvalues: useLayoutValues (ref), reactModule (ref), playerIcon (ref), cryoModule (ref)
	return reactModule.createElement(playerIcon, cryoModule.Dictionary.join(p8, { layoutValues = useLayoutValues() }))
end

return if fFlagPlayerListReduceRerendersModule then reactModule.memo(roactRoduxModule.connect(mapStateToProps, nil)(var16)) else roactRoduxModule.connect(mapStateToProps, nil)(var16)