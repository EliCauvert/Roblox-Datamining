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
local fFlagCoreUiMigrateUIBloxToFoundation = sharedFlagsModule.FFlagCoreUiMigrateUIBloxToFoundation
local fFlagPlayerListReduceRerendersModule = require(parent.Parent.Flags.FFlagPlayerListReduceRerenders)
local fFlagPlayerListFoundationSubscriptionIcon = playerListModule.Flags.FFlagPlayerListFoundationSubscriptionIcon
local imageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel

local function _(p1)
	return p1 ~= nil and (p1 ~= "" and p1:match("^%w+://.*$") == nil)
end

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

local _ = function(p1, p2)
	local friendStatus = p1.FriendIcons[p2.friendStatus]
	
	return if p2.isBlocked then p1.BlockedIcon else friendStatus or nil
end

local function getIconImage(p1, p2, p3, p4)
	-- upvalues: fFlagEnableBlackbirdCheck (ref), fFlagHidePremiumIconography (ref)
	local friendStatus = p1.FriendIcons[p4.friendStatus]
	local var1 = if p4.isBlocked then p1.BlockedIcon else friendStatus or nil
	
	if var1 then
		return var1
	elseif p3.isPlaceOwner then
		return p1.PlaceOwnerIcon
	elseif p1.CustomPlayerIcons[p2.UserId] then
		return p1.CustomPlayerIcons[p2.UserId]
	elseif p3.specialGroupIcon then
		return p3.specialGroupIcon
	elseif p4.isFollowing then
		return p1.FollowingIcon
	end
	local var2 = p2.MembershipType == Enum.MembershipType.Premium
	
	if fFlagEnableBlackbirdCheck then
		if game:GetEngineFeature("ReadHasRobloxSubscriptionLua") and p2.HasRobloxSubscription then
			return p1.SubscriptionIcon
		elseif not fFlagHidePremiumIconography and var2 then
			local membershipType = p1.MembershipIcons[p2.MembershipType]
			
			return membershipType or ""
		end
	elseif var2 then
		local membershipType = p1.MembershipIcons[p2.MembershipType]
		
		if membershipType then
			return membershipType
		end
	end
end

function playerIcon.render(p1)
	-- upvalues: withLayoutValues (ref), roactModule (ref), getIconImage (ref), fFlagCoreUiMigrateUIBloxToFoundation (ref), fFlagPlayerListFoundationSubscriptionIcon (ref), foundationModule (ref), imageSetLabel (ref)
	return withLayoutValues(function(_)
		-- upvalues: p1 (ref), roactModule (copy), getIconImage (copy), fFlagCoreUiMigrateUIBloxToFoundation (copy), fFlagPlayerListFoundationSubscriptionIcon (copy), foundationModule (copy), imageSetLabel (copy)
		layoutValues = p1.props.layoutValues
		local avatarIcon = p1.props.playerIconInfo and p1.props.playerIconInfo.avatarIcon
		
		if avatarIcon == nil then
			avatarIcon = layoutValues.DefaultThumbnail
		end
		if layoutValues.IsTenFoot then
			return roactModule.createElement("ImageLabel", {
				BackgroundTransparency = 1,
				LayoutOrder = p1.props.layoutOrder or 1,
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
		elseif p1.props.isSmallTouchDevice then
			local var1 = getIconImage(layoutValues, p1.props.player, p1.props.playerIconInfo, p1.props.playerRelationship)
			
			if fFlagCoreUiMigrateUIBloxToFoundation or fFlagPlayerListFoundationSubscriptionIcon and typeof(var1) == "table" and var1.isFoundationIcon then
				local var2 = if typeof(var1) == "table" then var1.name else var1
				
				if fFlagCoreUiMigrateUIBloxToFoundation then
					if typeof(var1) == "table" and var1.Image ~= nil then
						var2 = var1.Image
					end
					local var3 = var2
					
					return if var3 ~= nil and (var3 ~= "" and var3:match("^%w+://.*$") == nil) then roactModule.createElement(foundationModule.Icon, {
						name = var2,
						size = foundationModule.Enums.IconSize.Medium,
						AnchorPoint = Vector2.new(0, 0.5),
						Position = UDim2.new(0, layoutValues.PlayerNamePaddingXMobile, 0.5, 0)
					}) else roactModule.createElement(foundationModule.Image, {
						Image = var2,
						imageRect = if typeof(var1) == "table" then {
							offset = var1.ImageRectOffset,
							size = var1.ImageRectSize
						} else nil,
						Size = layoutValues.PlayerIconSizeMobile,
						AnchorPoint = Vector2.new(0, 0.5),
						Position = UDim2.new(0, layoutValues.PlayerNamePaddingXMobile, 0.5, 0)
					})
				end
			else
				return roactModule.createElement(imageSetLabel, {
					BackgroundTransparency = 1,
					BorderSizePixel = 0,
					AnchorPoint = Vector2.new(0, 0.5),
					Position = UDim2.new(0, layoutValues.PlayerNamePaddingXMobile, 0.5, 0),
					Size = layoutValues.PlayerIconSizeMobile,
					Image = var1
				})
			end
		else
			local var4 = getIconImage(layoutValues, p1.props.player, p1.props.playerIconInfo, p1.props.playerRelationship)
			
			if not fFlagCoreUiMigrateUIBloxToFoundation and (not fFlagPlayerListFoundationSubscriptionIcon or typeof(var4) ~= "table" or not var4.isFoundationIcon) then
				return roactModule.createElement(imageSetLabel, {
					BackgroundTransparency = 1,
					BorderSizePixel = 0,
					LayoutOrder = p1.props.layoutOrder,
					Size = layoutValues.PlayerIconSize,
					Image = var4
				})
			end
			local var5 = if typeof(var4) == "table" then var4.name else var4
			
			if fFlagCoreUiMigrateUIBloxToFoundation then
				if typeof(var4) == "table" and var4.Image ~= nil then
					var5 = var4.Image
				end
				local var6 = var5
				
				return if var6 ~= nil and (var6 ~= "" and var6:match("^%w+://.*$") == nil) then roactModule.createElement(foundationModule.Icon, {
					name = var5,
					size = foundationModule.Enums.IconSize.Small,
					LayoutOrder = p1.props.layoutOrder
				}) else roactModule.createElement(foundationModule.Image, {
					Image = var5,
					imageRect = if typeof(var4) == "table" then {
						offset = var4.ImageRectOffset,
						size = var4.ImageRectSize
					} else nil,
					Size = layoutValues.PlayerIconSize,
					LayoutOrder = p1.props.layoutOrder
				})
			end
		end
	end)
end

local function mapStateToProps(p1)
	return {
		isSmallTouchDevice = p1.displayOptions.isSmallTouchDevice
	}
end

local var1 = function(p1)
	-- upvalues: useLayoutValues (ref), reactModule (ref), playerIcon (ref), cryoModule (ref)
	return reactModule.createElement(playerIcon, cryoModule.Dictionary.join(p1, { layoutValues = useLayoutValues() }))
end

return if fFlagPlayerListReduceRerendersModule then reactModule.memo(roactRoduxModule.connect(mapStateToProps, nil)(var1)) else roactRoduxModule.connect(mapStateToProps, nil)(var1)