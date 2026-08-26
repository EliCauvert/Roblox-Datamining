local squads = script:FindFirstAncestor("Squads")
local dependenciesModule = require(squads.dependencies)
local parent = squads.Parent
local reactModule = require(parent.React)
local useLocalUserId = require(parent.RobloxAppHooks).useLocalUserId
local cryo = dependenciesModule.Cryo
local foundation = dependenciesModule.Foundation
local roact = dependenciesModule.Roact
local useSelector = dependenciesModule.Hooks.useSelector
local squadState = require(parent.SquadsCore.Enums).SquadState
local useSquadState = require(parent.SquadsCore.Hooks).useSquadState
local useTokens = foundation.Hooks.useTokens
local _ = require(squads.Common.ModelTypes)
local squadUserPartyStatusModule = require(squads.Enums.SquadUserPartyStatus)
local squadLobbyUserCardModule = require(script.Parent.SquadLobbyUserCard)
local squadLobbyUpsellCardModule = require(script.Parent.SquadLobbyUpsellCard)
local fFlagEnableSquadRegroupExperimentationSmallScreenFix = require(parent.SharedFlags).FFlagEnableSquadRegroupExperimentationSmallScreenFix

return function(p1)
	-- upvalues: useTokens (ref), useLocalUserId (ref), useSquadState (ref), reactModule (ref), squadState (ref), cryo (ref), squadUserPartyStatusModule (ref), fFlagEnableSquadRegroupExperimentationSmallScreenFix (ref), useSelector (ref), squadLobbyUserCardModule (ref), squadLobbyUpsellCardModule (ref), roact (ref)
	local var1 = useTokens()
	local var2 = tonumber(useLocalUserId()) or 0
	local var3 = useSquadState()
	local medium = var1.Gap.Medium
	local xLarge = var1.Padding.XLarge
	local var4, var5, var6 = reactModule.useMemo(function()
		-- upvalues: p1 (ref), xLarge (ref), var3 (ref), squadState (copy), cryo (copy), squadUserPartyStatusModule (copy), medium (ref), fFlagEnableSquadRegroupExperimentationSmallScreenFix (copy)
		if p1.containerSize.Y == 0 or p1.containerSize.X == 0 then
			return Vector2.new(0, 0), 0, 0
		end
		local var7
		local var8 = p1.containerSize.X - xLarge * 2
		local var9 = if var3 ~= squadState.Active then math.max(#cryo.List.filter(p1.users, function(p2)
			-- upvalues: squadUserPartyStatusModule (copy)
			return p2.partyStatus ~= squadUserPartyStatusModule.Inactive
		end), 2) else 1
		
		if var9 <= 3 and var8 / p1.containerSize.Y > 1.75 then
			var7 = var9 * 120 + (var9 - 1) * medium <= var8
			var7 = nil
		else
			var7 = false
		end
		local var10, var11
		local _ = nil
		local _ = nil
		
		if var7 then
			var10 = 1
			var11 = var9
		elseif var9 <= 3 then
			var10 = var9
			var11 = 1
		else
			var10 = math.ceil(var9 / 2)
			var11 = 2
		end
		local minValue = math.min(var10, math.clamp(math.floor((p1.containerSize.Y + medium) / (120 + medium)), 1, 3))
		
		return Vector2.new((var8 + medium) / var11 - medium, if fFlagEnableSquadRegroupExperimentationSmallScreenFix then math.max(120, p1.containerSize.Y + medium) / minValue - medium else (p1.containerSize.Y + medium) / minValue - medium), var10, var11
	end, { medium, p1.containerSize, p1.users, xLarge })
	local var7 = useSelector(reactModule.useCallback(function(p2)
		return p2.Squad.UserBlocking.isBlockedByMe
	end, {}))
	local var8 = reactModule.useMemo(function()
		-- upvalues: var4 (ref), reactModule (copy), squadLobbyUserCardModule (copy), var7 (ref), p1 (ref), squadUserPartyStatusModule (copy), var2 (ref), var3 (ref), squadState (copy), squadLobbyUpsellCardModule (copy), var5 (ref), var6 (ref), medium (ref)
		if var4.X == 0 or var4.Y == 0 then
			return {}
		end
		local t = {}
		
		local var9 = function(p2, p3, p4)
			-- upvalues: reactModule (copy), squadLobbyUserCardModule (copy), var4 (copy), var7 (copy), p1 (copy)
			return reactModule.createElement(squadLobbyUserCardModule, {
				size = UDim2.fromOffset(var4.X, var4.Y),
				isBlocked = var7[tostring(p3.userId)],
				isConnecting = p4,
				layoutOrder = p2,
				onActivated = p1.onUserCardActivated,
				user = p3,
				isInExperience = p1.isInExperience
			})
		end
		
		for i, v in ipairs(p1.users) do
			if v.partyStatus ~= squadUserPartyStatusModule.Inactive then
				if v.userId == var2 then
					table.insert(t, var9(0, v, v.partyStatus == squadUserPartyStatusModule.Connecting))
				else
					table.insert(t, var9(i, v, v.partyStatus == squadUserPartyStatusModule.Connecting))
				end
			end
		end
		if #t == 1 and var3 ~= squadState.Initializing then
			table.insert(t, reactModule.createElement(squadLobbyUpsellCardModule, {
				size = UDim2.fromOffset(var4.X, var4.Y),
				layoutOrder = #t + 1,
				navigateToHomePage = p1.navigateToHomePage,
				navigateToSquadInviteFriends = p1.navigateToSquadInviteFriends
			}))
		end
		local t_1 = {}
		
		for i_2 = 1, var5 do
			local t_2 = {}
			
			for i_1 = 1, var6 do
				local var10 = (i_2 - 1) * var6 + i_1
				
				if t[var10] then
					t_2["Card" .. var24] = t[var10]
				end
			end
			t_2.UIListLayout = reactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Horizontal,
				HorizontalAlignment = Enum.HorizontalAlignment.Center,
				SortOrder = Enum.SortOrder.LayoutOrder,
				Padding = UDim.new(0, medium)
			})
			t_1["Row" .. i_2] = reactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				Size = UDim2.new(1, 0, 0, var4.Y),
				LayoutOrder = i_2
			}, t_2)
		end
		return t_1
	end, {
		var4, medium, var7, var2, var6, var5, p1.navigateToHomePage,
		p1.navigateToSquadInviteFriends, p1.onUserCardActivated, p1.users, var3
	})
	var8.UIListLayout = reactModule.createElement("UIListLayout", {
		FillDirection = Enum.FillDirection.Vertical,
		HorizontalAlignment = Enum.HorizontalAlignment.Center,
		VerticalAlignment = Enum.VerticalAlignment.Top,
		SortOrder = Enum.SortOrder.LayoutOrder,
		Padding = UDim.new(0, medium)
	})
	var8.UIPadding = reactModule.createElement("UIPadding", {
		PaddingBottom = p1.paddingBottom,
		PaddingLeft = UDim.new(0, xLarge),
		PaddingRight = UDim.new(0, xLarge)
	})
	
	return roact.createFragment(var8)
end