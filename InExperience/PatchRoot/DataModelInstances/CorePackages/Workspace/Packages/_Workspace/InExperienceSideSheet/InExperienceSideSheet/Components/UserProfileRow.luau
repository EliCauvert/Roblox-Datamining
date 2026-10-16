local Players = game:GetService("Players")
local InExperienceSideSheet = script:FindFirstAncestor("InExperienceSideSheet")
local Parent = InExperienceSideSheet.Parent
local ProfileCardModule = require(Parent.ProfileCard)
local ReactModule = require(Parent.React)
local SharedFlagsModule = require(Parent.SharedFlags)
local View = require(Parent.Foundation).View
local FFlagEnableBlackbirdCheck = SharedFlagsModule.FFlagEnableBlackbirdCheck
local FFlagFlyoutSidePanelUseProfileFrameThumbnail = SharedFlagsModule.FFlagFlyoutSidePanelUseProfileFrameThumbnail
local UnibarListModule = require(InExperienceSideSheet.Components.UnibarList)
local ReadHasRobloxSubscriptionLuaEngineFeature = FFlagEnableBlackbirdCheck and game:GetEngineFeature("ReadHasRobloxSubscriptionLua")
local List = if ReadHasRobloxSubscriptionLuaEngineFeature then {
	"Name",
	"DisplayName",
	"MembershipType",
	"HasRobloxSubscription"
} else { "Name", "DisplayName", "MembershipType" }

local function _(Player: Player) --[[ Line: 31 | Named "createLocalUserModel" ]]
	return if Player then {
		id = tostring(Player.UserId),
		name = Player.Name,
		displayName = Player.DisplayName,
		membership = Player.MembershipType
	} else nil
end

local _ = function(p1): boolean --[[ Line: 42 | Named "isRobloxSubscriber" ]]
	-- upvalues: ReadHasRobloxSubscriptionLuaEngineFeature (copy)
	return ReadHasRobloxSubscriptionLuaEngineFeature and (p1 ~= nil and p1.HasRobloxSubscription == true)
end

local _ = function(p1, p2): boolean --[[ Line: 48 | Named "isSameLocalUserModel" ]]
	return if p1 == nil or p2 == nil then p1 == p2 else p1.id == p2.id and (p1.name == p2.name and p1.displayName == p2.displayName) and p1.membership == p2.membership
end

local function useLocalUser() --[[ Line: 56 ]]
	-- upvalues: ReactModule (copy), Players (copy), ReadHasRobloxSubscriptionLuaEngineFeature (copy), List (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(function() --[[ Line: 57 ]]
		-- upvalues: Players (upval)
		local LocalPlayer = Players.LocalPlayer
		
		return if LocalPlayer then {
			id = tostring(LocalPlayer.UserId),
			name = LocalPlayer.Name,
			displayName = LocalPlayer.DisplayName,
			membership = LocalPlayer.MembershipType
		} else nil
	end)
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(function(): boolean --[[ Line: 60 ]]
		-- upvalues: Players (upval), ReadHasRobloxSubscriptionLuaEngineFeature (upval)
		local LocalPlayer = Players.LocalPlayer
		
		return ReadHasRobloxSubscriptionLuaEngineFeature and (LocalPlayer ~= nil and LocalPlayer.HasRobloxSubscription == true)
	end)
	ReactModule.useEffect(function() --[[ Line: 64 ]]
		-- upvalues: UseStateResult2 (copy), UseStateResult2_1 (copy), ReadHasRobloxSubscriptionLuaEngineFeature (upval), List (upval), Players (upval)
		local Connections = {}
		
		local function listenToPlayer(Player: Player) --[[ Line: 67 ]]
			-- upvalues: Connections (copy), UseStateResult2 (upval), UseStateResult2_1 (upval), ReadHasRobloxSubscriptionLuaEngineFeature (upval), List (upval)
			for _, connection in Connections do
				connection:Disconnect()
			end
			table.clear(Connections)
			UseStateResult2(if Player then {
				id = tostring(Player.UserId),
				name = Player.Name,
				displayName = Player.DisplayName,
				membership = Player.MembershipType
			} else nil)
			UseStateResult2_1(ReadHasRobloxSubscriptionLuaEngineFeature and (Player ~= nil and Player.HasRobloxSubscription == true))
			
			if Player then
				for _, PropertyName in List do
					table.insert(Connections, Player:GetPropertyChangedSignal(PropertyName):Connect(function() --[[ Line: 80 ]]
						-- upvalues: UseStateResult2 (upval), Player (copy), UseStateResult2_1 (upval), ReadHasRobloxSubscriptionLuaEngineFeature (upval)
						UseStateResult2(function(p1) --[[ Line: 81 ]]
							-- upvalues: Player (upval)
							local Config = if Player then {
								id = tostring(Player.UserId),
								name = Player.Name,
								displayName = Player.DisplayName,
								membership = Player.MembershipType
							} else nil
							local IsConfigMatch: boolean = if p1 == nil or Config == nil then p1 == Config else p1.id == Config.id and (p1.name == Config.name and p1.displayName == Config.displayName) and p1.membership == Config.membership
							
							return if IsConfigMatch then p1 else Config
						end)
						UseStateResult2_1(ReadHasRobloxSubscriptionLuaEngineFeature and (Player ~= nil and Player.HasRobloxSubscription == true))
					end))
				end
			end
		end
		
		local Connection = Players:GetPropertyChangedSignal("LocalPlayer"):Connect(function() --[[ Line: 94 ]]
			-- upvalues: listenToPlayer (copy), Players (upval)
			listenToPlayer(Players.LocalPlayer)
		end)
		listenToPlayer(Players.LocalPlayer)
		
		return function() --[[ Line: 99 ]]
			-- upvalues: Connection (copy), Connections (copy)
			Connection:Disconnect()
			
			for _, connection in Connections do
				connection:Disconnect()
			end
		end
	end, {})
	
	return UseStateResult, UseStateResult1
end

return ReactModule.memo(function(p1) --[[ Line: 110 | Named "UserProfileRow" ]]
	-- upvalues: useLocalUser (copy), ReactModule (copy), View (copy), ProfileCardModule (copy), FFlagEnableBlackbirdCheck (copy), FFlagFlyoutSidePanelUseProfileFrameThumbnail (copy), UnibarListModule (copy)
	local UseLocalUserResult, UseLocalUserResult2 = useLocalUser()
	
	return ReactModule.createElement(View, {
		tag = "row align-y-center gap-small size-full-0 auto-y padding-top-small",
		testId = "user-profile-row",
		LayoutOrder = p1.layoutOrder
	}, {
		ProfileCardContainer = ReactModule.createElement(View, { tag = "fill auto-y", LayoutOrder = 0 }, {
			ProfileCard = ReactModule.createElement(ProfileCardModule.ProfileCard, {
				layoutOrder = 0,
				isCompact = true,
				localUserModel = UseLocalUserResult,
				isRobloxSubscriber = if FFlagEnableBlackbirdCheck then UseLocalUserResult2 else nil,
				useProfileFrameThumbnail = FFlagFlyoutSidePanelUseProfileFrameThumbnail
			})
		}),
		UnibarList = ReactModule.createElement(UnibarListModule, { layoutOrder = 1 })
	})
end)