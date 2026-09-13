local playersService = game:GetService("Players")
local parent = script:FindFirstAncestor("InExperienceSideSheet").Parent
local foundationModule = require(parent.Foundation)
local profileCardModule = require(parent.ProfileCard)
local reactModule = require(parent.React)
local sharedFlagsModule = require(parent.SharedFlags)
local view = foundationModule.View
local fFlagEnableBlackbirdCheck = sharedFlagsModule.FFlagEnableBlackbirdCheck
local fFlagFlyoutSidePanelUseProfileFrameThumbnail = sharedFlagsModule.FFlagFlyoutSidePanelUseProfileFrameThumbnail
local readHasRobloxSubscriptionLua = fFlagEnableBlackbirdCheck and game:GetEngineFeature("ReadHasRobloxSubscriptionLua")
local var1 = if readHasRobloxSubscriptionLua then {
	"Name",
	"DisplayName",
	"MembershipType",
	"HasRobloxSubscription"
} else { "Name", "DisplayName", "MembershipType" }

local function _(p1)
	return if p1 then {
		id = tostring(p1.UserId),
		name = p1.Name,
		displayName = p1.DisplayName,
		membership = p1.MembershipType
	} else nil
end

local _ = function(p1)
	-- upvalues: readHasRobloxSubscriptionLua (ref)
	return readHasRobloxSubscriptionLua and (p1 ~= nil and p1.HasRobloxSubscription == true)
end

local _ = function(p1, p2)
	return if p1 == nil or p2 == nil then p1 == p2 else p1.id == p2.id and (p1.name == p2.name and (p1.displayName == p2.displayName and p1.membership == p2.membership))
end

local function useLocalUser()
	-- upvalues: reactModule (ref), playersService (ref), readHasRobloxSubscriptionLua (ref), var1 (ref)
	local var2, var3 = reactModule.useState(function()
		-- upvalues: playersService (copy)
		local localPlayer = playersService.LocalPlayer
		
		return if localPlayer then {
			id = tostring(localPlayer.UserId),
			name = localPlayer.Name,
			displayName = localPlayer.DisplayName,
			membership = localPlayer.MembershipType
		} else nil
	end)
	local var4, var5 = reactModule.useState(function()
		-- upvalues: playersService (copy), readHasRobloxSubscriptionLua (copy)
		local localPlayer = playersService.LocalPlayer
		
		return readHasRobloxSubscriptionLua and (localPlayer ~= nil and localPlayer.HasRobloxSubscription == true)
	end)
	reactModule.useEffect(function()
		-- upvalues: var3 (ref), var5 (ref), readHasRobloxSubscriptionLua (copy), var1 (copy), playersService (copy)
		local t = {}
		
		local function listenToPlayer(p1)
			-- upvalues: t (ref), var3 (copy), var5 (copy), readHasRobloxSubscriptionLua (copy), var1 (copy)
			for i, v in t do
				v:Disconnect()
			end
			table.clear(t)
			var3(if p1 then {
				id = tostring(p1.UserId),
				name = p1.Name,
				displayName = p1.DisplayName,
				membership = p1.MembershipType
			} else nil)
			var5(readHasRobloxSubscriptionLua and (p1 ~= nil and p1.HasRobloxSubscription == true))
			
			if p1 then
				for i, v_1 in var1 do
					table.insert(t, p1:GetPropertyChangedSignal(v_1):Connect(function()
						-- upvalues: var3 (copy), p1 (ref), var5 (copy), readHasRobloxSubscriptionLua (copy)
						var3(function(p2)
							-- upvalues: p1 (copy)
							local var6
							local var7 = p1
							local var8 = if var7 then {
								id = tostring(var7.UserId),
								name = var7.Name,
								displayName = var7.DisplayName,
								membership = var7.MembershipType
							} else nil
							
							if p2 == nil or var8 == nil then
								var6 = p2 == var8
								var6 = nil
							else
								var6 = p2.id == var8.id and (p2.name == var8.name and (p2.displayName == var8.displayName and p2.membership == var8.membership))
							end
							return if var6 then p2 else var8
						end)
						var5(readHasRobloxSubscriptionLua and (p1 ~= nil and p1.HasRobloxSubscription == true))
					end))
				end
			end
		end
		
		local var6 = playersService:GetPropertyChangedSignal("LocalPlayer"):Connect(function()
			-- upvalues: listenToPlayer (ref), playersService (copy)
			listenToPlayer(playersService.LocalPlayer)
		end)
		listenToPlayer(playersService.LocalPlayer)
		
		return function()
			-- upvalues: var6 (ref), t (ref)
			var6:Disconnect()
			
			for i, v in t do
				v:Disconnect()
			end
		end
	end, {})
	
	return var2, var4
end

return reactModule.memo(function(p2)
	-- upvalues: useLocalUser (ref), reactModule (ref), view (ref), profileCardModule (ref), fFlagEnableBlackbirdCheck (ref), fFlagFlyoutSidePanelUseProfileFrameThumbnail (ref)
	local var7, var8 = useLocalUser()
	
	return reactModule.createElement(view, {
		tag = "size-full-0 auto-y padding-right-xlarge padding-top-large",
		testId = "user-profile-row",
		LayoutOrder = p2.layoutOrder
	}, {
		ProfileCard = reactModule.createElement(profileCardModule.ProfileCard, {
			layoutOrder = 0,
			isCompact = true,
			localUserModel = var7,
			isRobloxSubscriber = if fFlagEnableBlackbirdCheck then var8 else nil,
			useProfileFrameThumbnail = fFlagFlyoutSidePanelUseProfileFrameThumbnail
		})
	})
end)