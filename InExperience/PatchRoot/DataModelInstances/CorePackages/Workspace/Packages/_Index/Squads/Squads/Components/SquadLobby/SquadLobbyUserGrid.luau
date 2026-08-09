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
local emptySquadIdReinviteCheckEnabled = game:DefineFastFlag("EmptySquadIdReinviteCheckEnabled", false)
local fFlagEnableSquadRegroupExperimentationSmallScreenFix = require(parent.SharedFlags).FFlagEnableSquadRegroupExperimentationSmallScreenFix

return function(p0) --[[ line: 46 ]]
	-- upvalues: useTokens (ref), useLocalUserId (ref), useSquadState (ref), reactModule (ref), squadState (ref), emptySquadIdReinviteCheckEnabled (ref), cryo (ref), squadUserPartyStatusModule (ref), fFlagEnableSquadRegroupExperimentationSmallScreenFix (ref), useSelector (ref), squadLobbyUserCardModule (ref), squadLobbyUpsellCardModule (ref), roact (ref)
	local var7 = useTokens()
	local var8 = tonumber(useLocalUserId()) or 0
	local var9 = useSquadState()
	local medium = var7.Gap.Medium
	local xLarge = var7.Padding.XLarge
	local var10, var11, var12 = reactModule.useMemo(function() --[[ line: 53 ]]
		-- upvalues: p0 (ref), xLarge (ref), var9 (ref), squadState (copy), emptySquadIdReinviteCheckEnabled (copy), cryo (copy), squadUserPartyStatusModule (copy), medium (ref), fFlagEnableSquadRegroupExperimentationSmallScreenFix (copy)
		if p0.containerSize.Y == 0 or p0.containerSize.X == 0 then
			return Vector2.new(0, 0), 0, 0
		end
		local var17
		local var15 = p0.containerSize.X - xLarge * 2
		local var16 = if var9 == squadState.Initializing and not emptySquadIdReinviteCheckEnabled or emptySquadIdReinviteCheckEnabled and var9 ~= squadState.Active then 1 else math.max(#cryo.List.filter(p0.users, function(p1) --[[ line: 66 ]]
			-- upvalues: squadUserPartyStatusModule (copy)
			return p1.partyStatus ~= squadUserPartyStatusModule.Inactive
		end), 2)
		
		if var16 <= 3 and var15 / p0.containerSize.Y > 1.75 then
			var17 = var16 * 120 + (var16 - 1) * medium <= var15
			var17 = nil
		else
			var17 = false
		end
		local var18, var19
		local _ = nil
		local _ = nil
		
		if var17 then
			var18 = 1
			var19 = var16
		elseif var16 <= 3 then
			var18 = var16
			var19 = 1
		else
			var18 = math.ceil(var16 / 2)
			var19 = 2
		end
		local minValue = math.min(var18, math.clamp(math.floor((p0.containerSize.Y + medium) / (120 + medium)), 1, 3))
		
		return Vector2.new((var15 + medium) / var19 - medium, if fFlagEnableSquadRegroupExperimentationSmallScreenFix then math.max(120, p0.containerSize.Y + medium) / minValue - medium else (p0.containerSize.Y + medium) / minValue - medium), var18, var19
	end, { medium, p0.containerSize, p0.users, xLarge })
	local var13 = useSelector(reactModule.useCallback(function(p2) --[[ line: 103 ]]
		return p2.Squad.UserBlocking.isBlockedByMe
	end, {}))
	local var14 = reactModule.useMemo(function() --[[ line: 109 ]]
		-- upvalues: var10 (ref), reactModule (copy), squadLobbyUserCardModule (copy), var13 (ref), p0 (ref), squadUserPartyStatusModule (copy), var8 (ref), var9 (ref), squadState (copy), squadLobbyUpsellCardModule (copy), var11 (ref), var12 (ref), medium (ref)
		if var10.X == 0 or var10.Y == 0 then
			return {}
		end
		local t = {}
		
		local var22 = function(p3, p4, p5) --[[ line: 115 ]]
			-- upvalues: reactModule (copy), squadLobbyUserCardModule (copy), var10 (copy), var13 (copy), p0 (copy)
			return reactModule.createElement(squadLobbyUserCardModule, {
				size = UDim2.fromOffset(var10.X, var10.Y),
				isBlocked = var13[tostring(p4.userId)],
				isConnecting = p5,
				layoutOrder = p3,
				onActivated = p0.onUserCardActivated,
				user = p4,
				isInExperience = p0.isInExperience
			})
		end
		
		for i, v in ipairs(p0.users) do
			if v.partyStatus ~= squadUserPartyStatusModule.Inactive then
				if v.userId == var8 then
					table.insert(t, var22(0, v, v.partyStatus == squadUserPartyStatusModule.Connecting))
				else
					table.insert(t, var22(i, v, v.partyStatus == squadUserPartyStatusModule.Connecting))
				end
			end
		end
		if #t == 1 and var9 ~= squadState.Initializing then
			table.insert(t, reactModule.createElement(squadLobbyUpsellCardModule, {
				size = UDim2.fromOffset(var10.X, var10.Y),
				layoutOrder = #t + 1,
				navigateToHomePage = p0.navigateToHomePage,
				navigateToSquadInviteFriends = p0.navigateToSquadInviteFriends
			}))
		end
		local t_1 = {}
		
		for i_2 = 1, var11 do
			local t_2 = {}
			
			for i_1 = 1, var12 do
				local var25 = (i_2 - 1) * var12 + i_1
				
				if t[var25] then
					t_2["Card" .. var25] = t[var25]
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
				Size = UDim2.new(1, 0, 0, var10.Y),
				LayoutOrder = i_2
			}, t_2)
		end
		return t_1
	end, {
		var10, medium, var13, var8, var12, var11, p0.navigateToHomePage,
		p0.navigateToSquadInviteFriends, p0.onUserCardActivated, p0.users, var9
	})
	var14.UIListLayout = reactModule.createElement("UIListLayout", {
		FillDirection = Enum.FillDirection.Vertical,
		HorizontalAlignment = Enum.HorizontalAlignment.Center,
		VerticalAlignment = Enum.VerticalAlignment.Top,
		SortOrder = Enum.SortOrder.LayoutOrder,
		Padding = UDim.new(0, medium)
	})
	var14.UIPadding = reactModule.createElement("UIPadding", {
		PaddingBottom = p0.paddingBottom,
		PaddingLeft = UDim.new(0, xLarge),
		PaddingRight = UDim.new(0, xLarge)
	})
	
	return roact.createFragment(var14)
end