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

local function _(p0) --[[ line: 34 | named "isFoundationImage" ]]
	return p0 ~= nil and (p0 ~= "" and p0:match("^%w+://.*$") == nil)
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

local _ = function(p1, p2) --[[ line: 61 | named "getSocialIconImage" ]]
	local friendStatus = p1.FriendIcons[p2.friendStatus]
	
	return if p2.isBlocked then p1.BlockedIcon else friendStatus or nil
end

local function getIconImage(p3, p4, p5, p6) --[[ line: 73 ]]
	-- upvalues: fFlagEnableBlackbirdCheck (ref), fFlagHidePremiumIconography (ref)
	local friendStatus = p3.FriendIcons[p6.friendStatus]
	local var17 = if p6.isBlocked then p3.BlockedIcon else friendStatus or nil
	
	if var17 then
		return var17
	elseif p5.isPlaceOwner then
		return p3.PlaceOwnerIcon
	elseif p3.CustomPlayerIcons[p4.UserId] then
		return p3.CustomPlayerIcons[p4.UserId]
	elseif p5.specialGroupIcon then
		return p5.specialGroupIcon
	elseif p6.isFollowing then
		return p3.FollowingIcon
	end
	local var18 = p4.MembershipType == Enum.MembershipType.Premium
	
	if fFlagEnableBlackbirdCheck then
		if game:GetEngineFeature("ReadHasRobloxSubscriptionLua") and p4.HasRobloxSubscription then
			return p3.SubscriptionIcon
		elseif not fFlagHidePremiumIconography and var18 then
			local membershipType = p3.MembershipIcons[p4.MembershipType]
			
			return membershipType or ""
		end
	elseif var18 then
		local membershipType = p3.MembershipIcons[p4.MembershipType]
		
		if membershipType then
			return membershipType
		end
	end
end

function playerIcon.render(p7) --[[ line: 115 ]]
	-- upvalues: withLayoutValues (ref), roactModule (ref), getIconImage (ref), fFlagCoreUiMigrateUIBloxToFoundation (ref), fFlagPlayerListFoundationSubscriptionIcon (ref), foundationModule (ref), imageSetLabel (ref)
	return withLayoutValues(function(_) --[[ line: 116 ]]
		-- upvalues: p7 (ref), roactModule (copy), getIconImage (copy), fFlagCoreUiMigrateUIBloxToFoundation (copy), fFlagPlayerListFoundationSubscriptionIcon (copy), foundationModule (copy), imageSetLabel (copy)
		layoutValues = p7.props.layoutValues
		local avatarIcon = p7.props.playerIconInfo and p7.props.playerIconInfo.avatarIcon
		
		if avatarIcon == nil then
			avatarIcon = layoutValues.DefaultThumbnail
		end
		if layoutValues.IsTenFoot then
			return roactModule.createElement("ImageLabel", {
				BackgroundTransparency = 1,
				LayoutOrder = p7.props.layoutOrder or 1,
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
		elseif p7.props.isSmallTouchDevice then
			local var20 = getIconImage(layoutValues, p7.props.player, p7.props.playerIconInfo, p7.props.playerRelationship)
			
			if fFlagCoreUiMigrateUIBloxToFoundation or fFlagPlayerListFoundationSubscriptionIcon and typeof(var20) == "table" and var20.isFoundationIcon then
				local var21 = if typeof(var20) == "table" then var20.name else var20
				
				if fFlagCoreUiMigrateUIBloxToFoundation then
					if typeof(var20) == "table" and var20.Image ~= nil then
						var21 = var20.Image
					end
					local var22 = var21
					
					return if var22 ~= nil and (var22 ~= "" and var22:match("^%w+://.*$") == nil) then roactModule.createElement(foundationModule.Icon, {
						name = var21,
						size = foundationModule.Enums.IconSize.Medium,
						AnchorPoint = Vector2.new(0, 0.5),
						Position = UDim2.new(0, layoutValues.PlayerNamePaddingXMobile, 0.5, 0)
					}) else roactModule.createElement(foundationModule.Image, {
						Image = var21,
						imageRect = if typeof(var20) == "table" then {
							offset = var20.ImageRectOffset,
							size = var20.ImageRectSize
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
					Image = var20
				})
			end
		else
			local var23 = getIconImage(layoutValues, p7.props.player, p7.props.playerIconInfo, p7.props.playerRelationship)
			
			if not fFlagCoreUiMigrateUIBloxToFoundation and (not fFlagPlayerListFoundationSubscriptionIcon or typeof(var23) ~= "table" or not var23.isFoundationIcon) then
				return roactModule.createElement(imageSetLabel, {
					BackgroundTransparency = 1,
					BorderSizePixel = 0,
					LayoutOrder = p7.props.layoutOrder,
					Size = layoutValues.PlayerIconSize,
					Image = var23
				})
			end
			local var24 = if typeof(var23) == "table" then var23.name else var23
			
			if fFlagCoreUiMigrateUIBloxToFoundation then
				if typeof(var23) == "table" and var23.Image ~= nil then
					var24 = var23.Image
				end
				local var25 = var24
				
				return if var25 ~= nil and (var25 ~= "" and var25:match("^%w+://.*$") == nil) then roactModule.createElement(foundationModule.Icon, {
					name = var24,
					size = foundationModule.Enums.IconSize.Small,
					LayoutOrder = p7.props.layoutOrder
				}) else roactModule.createElement(foundationModule.Image, {
					Image = var24,
					imageRect = if typeof(var23) == "table" then {
						offset = var23.ImageRectOffset,
						size = var23.ImageRectSize
					} else nil,
					Size = layoutValues.PlayerIconSize,
					LayoutOrder = p7.props.layoutOrder
				})
			end
		end
	end)
end

local function mapStateToProps(p8) --[[ line: 239 ]]
	return {
		isSmallTouchDevice = p8.displayOptions.isSmallTouchDevice
	}
end

local var16 = function(p9) --[[ line: 245 ]]
	-- upvalues: useLayoutValues (ref), reactModule (ref), playerIcon (ref), cryoModule (ref)
	return reactModule.createElement(playerIcon, cryoModule.Dictionary.join(p9, { layoutValues = useLayoutValues() }))
end

return if fFlagPlayerListReduceRerendersModule then reactModule.memo(roactRoduxModule.connect(mapStateToProps, nil)(var16)) else roactRoduxModule.connect(mapStateToProps, nil)(var16)