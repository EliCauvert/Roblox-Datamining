local Squads = script:FindFirstAncestor("Squads")
local DependenciesModule = require(Squads.dependencies)
local Parent = Squads.Parent
local ReactModule = require(Parent.React)
local UseLocalUserIdFunction = require(Parent.RobloxAppHooks).useLocalUserId
local Cryo = DependenciesModule.Cryo
local Roact = DependenciesModule.Roact
local UseSelectorFunction = DependenciesModule.Hooks.useSelector
local SquadState = require(Parent.SquadsCore.Enums).SquadState
local UseSquadStateFunction = require(Parent.SquadsCore.Hooks).useSquadState
local UseTokensFunction = DependenciesModule.Foundation.Hooks.useTokens
local _ = require(Squads.Common.ModelTypes)
local SquadUserPartyStatusModule = require(Squads.Enums.SquadUserPartyStatus)
local SquadLobbyUserCardModule = require(script.Parent.SquadLobbyUserCard)
local SquadLobbyUpsellCardModule = require(script.Parent.SquadLobbyUpsellCard)
local FFlagEnableSquadRegroupExperimentationSmallScreenFix = require(Parent.SharedFlags).FFlagEnableSquadRegroupExperimentationSmallScreenFix

return function(p1) --[[ Line: 45 ]]
	-- upvalues: UseTokensFunction (copy), UseLocalUserIdFunction (copy), UseSquadStateFunction (copy), ReactModule (copy), SquadState (copy), Cryo (copy), SquadUserPartyStatusModule (copy), FFlagEnableSquadRegroupExperimentationSmallScreenFix (copy), UseSelectorFunction (copy), SquadLobbyUserCardModule (copy), SquadLobbyUpsellCardModule (copy), Roact (copy)
	local UseTokensResult = UseTokensFunction()
	local Number: number = tonumber(UseLocalUserIdFunction()) or 0
	local UseSquadStateResult = UseSquadStateFunction()
	local Medium = UseTokensResult.Gap.Medium
	local XLarge = UseTokensResult.Padding.XLarge
	local UseMemoResult, UseMemoResult2, UseMemoResult3 = ReactModule.useMemo(function() --[[ Line: 52 ]]
		-- upvalues: p1 (copy), XLarge (copy), UseSquadStateResult (copy), SquadState (upval), Cryo (upval), SquadUserPartyStatusModule (upval), Medium (copy), FFlagEnableSquadRegroupExperimentationSmallScreenFix (upval)
		if p1.containerSize.Y == 0 or p1.containerSize.X == 0 then
			return Vector2.new(0, 0), 0, 0
		end
		local XDelta = p1.containerSize.X - XLarge * 2
		local XDeltaRatio = XDelta / p1.containerSize.Y
		local Largest: number = if UseSquadStateResult == SquadState.Active then math.max(#Cryo.List.filter(p1.users, function(p2): boolean --[[ Line: 64 ]]
			-- upvalues: SquadUserPartyStatusModule (upval)
			return p2.partyStatus ~= SquadUserPartyStatusModule.Inactive
		end), 2) else 1
		local Ceiled = nil
		local Largest1 = nil
		
		if Largest <= 3 and XDeltaRatio > 1.75 and Largest * 120 + (Largest - 1) * Medium <= XDelta then
			Ceiled = 1
			Largest1 = Largest
		elseif Largest <= 3 then
			Ceiled = Largest
			Largest1 = 1
		else
			Ceiled = math.ceil(Largest / 2)
			Largest1 = 2
		end
		local Smallest = math.min(Ceiled, (math.clamp(math.floor((p1.containerSize.Y + Medium) / (120 + Medium)), 1, 3)))
		
		return Vector2.new((XDelta + Medium) / Largest1 - Medium, if FFlagEnableSquadRegroupExperimentationSmallScreenFix then math.max(120, p1.containerSize.Y + Medium) / Smallest - Medium else (p1.containerSize.Y + Medium) / Smallest - Medium), Ceiled, Largest1
	end, { Medium, p1.containerSize, p1.users, XLarge })
	local UseSelectorResult = UseSelectorFunction((ReactModule.useCallback(function(p2) --[[ Line: 101 ]]
		return p2.Squad.UserBlocking.isBlockedByMe
	end, {})))
	local UseMemoResult1 = ReactModule.useMemo(function() --[[ Line: 107 ]]
		-- upvalues: UseMemoResult (copy), ReactModule (upval), SquadLobbyUserCardModule (upval), UseSelectorResult (copy), p1 (copy), SquadUserPartyStatusModule (upval), Number (copy), UseSquadStateResult (copy), SquadState (upval), SquadLobbyUpsellCardModule (upval), UseMemoResult2 (copy), UseMemoResult3 (copy), Medium (copy)
		if UseMemoResult.X == 0 or UseMemoResult.Y == 0 then
			return {}
		end
		local List = {}
		
		local function v29(LayoutOrder, User, IsPartyStatusMatch) --[[ Line: 113 ]]
			-- upvalues: ReactModule (upval), SquadLobbyUserCardModule (upval), UseMemoResult (upval), UseSelectorResult (upval), p1 (upval)
			return ReactModule.createElement(SquadLobbyUserCardModule, {
				size = UDim2.fromOffset(UseMemoResult.X, UseMemoResult.Y),
				isBlocked = UseSelectorResult[tostring(User.userId)],
				isConnecting = IsPartyStatusMatch,
				layoutOrder = LayoutOrder,
				onActivated = p1.onUserCardActivated,
				user = User,
				isInExperience = p1.isInExperience
			})
		end
		
		for i, user in ipairs(p1.users) do
			if user.partyStatus ~= SquadUserPartyStatusModule.Inactive then
				if user.userId == Number then
					table.insert(List, v29(0, user, user.partyStatus == SquadUserPartyStatusModule.Connecting))
				else
					table.insert(List, v29(i, user, user.partyStatus == SquadUserPartyStatusModule.Connecting))
				end
			end
		end
		if #List == 1 and UseSquadStateResult ~= SquadState.Initializing then
			table.insert(List, (ReactModule.createElement(SquadLobbyUpsellCardModule, {
				size = UDim2.fromOffset(UseMemoResult.X, UseMemoResult.Y),
				layoutOrder = #List + 1,
				navigateToHomePage = p1.navigateToHomePage,
				navigateToSquadInviteFriends = p1.navigateToSquadInviteFriends
			})))
		end
		local Frames = {}
		
		for i1 = 1, UseMemoResult2 do
			local t = {}
			
			for i2 = 1, UseMemoResult3 do
				local NewI = (i1 - 1) * UseMemoResult3 + i2
				
				if List[NewI] then
					t["Card" .. NewI] = List[NewI]
				end
			end
			t.UIListLayout = ReactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Horizontal,
				HorizontalAlignment = Enum.HorizontalAlignment.Center,
				SortOrder = Enum.SortOrder.LayoutOrder,
				Padding = UDim.new(0, Medium)
			})
			Frames["Row" .. i1] = ReactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				Size = UDim2.new(1, 0, 0, UseMemoResult.Y),
				LayoutOrder = i1
			}, t)
		end
		return Frames
	end, {
		UseMemoResult, Medium, UseSelectorResult, Number, UseMemoResult3,
		UseMemoResult2, p1.navigateToHomePage, p1.navigateToSquadInviteFriends,
		p1.onUserCardActivated, p1.users, UseSquadStateResult
	})
	UseMemoResult1.UIListLayout = ReactModule.createElement("UIListLayout", {
		FillDirection = Enum.FillDirection.Vertical,
		HorizontalAlignment = Enum.HorizontalAlignment.Center,
		VerticalAlignment = Enum.VerticalAlignment.Top,
		SortOrder = Enum.SortOrder.LayoutOrder,
		Padding = UDim.new(0, Medium)
	})
	UseMemoResult1.UIPadding = ReactModule.createElement("UIPadding", {
		PaddingBottom = p1.paddingBottom,
		PaddingLeft = UDim.new(0, XLarge),
		PaddingRight = UDim.new(0, XLarge)
	})
	
	return Roact.createFragment(UseMemoResult1)
end