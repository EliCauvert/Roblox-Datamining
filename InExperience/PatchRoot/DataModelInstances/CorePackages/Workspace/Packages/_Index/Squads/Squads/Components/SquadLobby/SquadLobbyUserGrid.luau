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

return function(p0)
	-- upvalues: useTokens (ref), useLocalUserId (ref), useSquadState (ref), reactModule (ref), squadState (ref), cryo (ref), squadUserPartyStatusModule (ref), fFlagEnableSquadRegroupExperimentationSmallScreenFix (ref), useSelector (ref), squadLobbyUserCardModule (ref), squadLobbyUpsellCardModule (ref), roact (ref)
	local var6 = useTokens()
	local var7 = tonumber(useLocalUserId()) or 0
	local var8 = useSquadState()
	local medium = var6.Gap.Medium
	local xLarge = var6.Padding.XLarge
	local var9, var10, var11 = reactModule.useMemo(function()
		-- upvalues: p0 (ref), xLarge (ref), var8 (ref), squadState (copy), cryo (copy), squadUserPartyStatusModule (copy), medium (ref), fFlagEnableSquadRegroupExperimentationSmallScreenFix (copy)
		if p0.containerSize.Y == 0 or p0.containerSize.X == 0 then
			return Vector2.new(0, 0), 0, 0
		end
		local var16
		local var14 = p0.containerSize.X - xLarge * 2
		local var15 = if var8 ~= squadState.Active then math.max(#cryo.List.filter(p0.users, function(p1)
			-- upvalues: squadUserPartyStatusModule (copy)
			return p1.partyStatus ~= squadUserPartyStatusModule.Inactive
		end), 2) else 1
		
		if var15 <= 3 and var14 / p0.containerSize.Y > 1.75 then
			var16 = var15 * 120 + (var15 - 1) * medium <= var14
			var16 = nil
		else
			var16 = false
		end
		local var17, var18
		local _ = nil
		local _ = nil
		
		if var16 then
			var17 = 1
			var18 = var15
		elseif var15 <= 3 then
			var17 = var15
			var18 = 1
		else
			var17 = math.ceil(var15 / 2)
			var18 = 2
		end
		local minValue = math.min(var17, math.clamp(math.floor((p0.containerSize.Y + medium) / (120 + medium)), 1, 3))
		
		return Vector2.new((var14 + medium) / var18 - medium, if fFlagEnableSquadRegroupExperimentationSmallScreenFix then math.max(120, p0.containerSize.Y + medium) / minValue - medium else (p0.containerSize.Y + medium) / minValue - medium), var17, var18
	end, { medium, p0.containerSize, p0.users, xLarge })
	local var12 = useSelector(reactModule.useCallback(function(p2)
		return p2.Squad.UserBlocking.isBlockedByMe
	end, {}))
	local var13 = reactModule.useMemo(function()
		-- upvalues: var9 (ref), reactModule (copy), squadLobbyUserCardModule (copy), var12 (ref), p0 (ref), squadUserPartyStatusModule (copy), var7 (ref), var8 (ref), squadState (copy), squadLobbyUpsellCardModule (copy), var10 (ref), var11 (ref), medium (ref)
		if var9.X == 0 or var9.Y == 0 then
			return {}
		end
		local t = {}
		
		local var21 = function(p3, p4, p5)
			-- upvalues: reactModule (copy), squadLobbyUserCardModule (copy), var9 (copy), var12 (copy), p0 (copy)
			return reactModule.createElement(squadLobbyUserCardModule, {
				size = UDim2.fromOffset(var9.X, var9.Y),
				isBlocked = var12[tostring(p4.userId)],
				isConnecting = p5,
				layoutOrder = p3,
				onActivated = p0.onUserCardActivated,
				user = p4,
				isInExperience = p0.isInExperience
			})
		end
		
		for i, v in ipairs(p0.users) do
			if v.partyStatus ~= squadUserPartyStatusModule.Inactive then
				if v.userId == var7 then
					table.insert(t, var21(0, v, v.partyStatus == squadUserPartyStatusModule.Connecting))
				else
					table.insert(t, var21(i, v, v.partyStatus == squadUserPartyStatusModule.Connecting))
				end
			end
		end
		if #t == 1 and var8 ~= squadState.Initializing then
			table.insert(t, reactModule.createElement(squadLobbyUpsellCardModule, {
				size = UDim2.fromOffset(var9.X, var9.Y),
				layoutOrder = #t + 1,
				navigateToHomePage = p0.navigateToHomePage,
				navigateToSquadInviteFriends = p0.navigateToSquadInviteFriends
			}))
		end
		local t_1 = {}
		
		for i_2 = 1, var10 do
			local t_2 = {}
			
			for i_1 = 1, var11 do
				local var24 = (i_2 - 1) * var11 + i_1
				
				if t[var24] then
					t_2["Card" .. var24] = t[var24]
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
				Size = UDim2.new(1, 0, 0, var9.Y),
				LayoutOrder = i_2
			}, t_2)
		end
		return t_1
	end, {
		var9, medium, var12, var7, var11, var10, p0.navigateToHomePage,
		p0.navigateToSquadInviteFriends, p0.onUserCardActivated, p0.users, var8
	})
	var13.UIListLayout = reactModule.createElement("UIListLayout", {
		FillDirection = Enum.FillDirection.Vertical,
		HorizontalAlignment = Enum.HorizontalAlignment.Center,
		VerticalAlignment = Enum.VerticalAlignment.Top,
		SortOrder = Enum.SortOrder.LayoutOrder,
		Padding = UDim.new(0, medium)
	})
	var13.UIPadding = reactModule.createElement("UIPadding", {
		PaddingBottom = p0.paddingBottom,
		PaddingLeft = UDim.new(0, xLarge),
		PaddingRight = UDim.new(0, xLarge)
	})
	
	return roact.createFragment(var13)
end