local friendsLanding = script:FindFirstAncestor("FriendsLanding")
local parent = friendsLanding.Parent
local useLocalization = require(parent.Localization).Hooks.useLocalization
local dependencyArray = require(parent.RoactUtils).Hooks.dependencyArray
local reactModule = require(parent.React)
local chip = require(parent.Foundation).Chip
local filterStatesModule = require(friendsLanding.Friends.filterStates)
local friendsLandingContextModule = require(friendsLanding.FriendsLandingContext)
local list = {
	filterStatesModule.All,
	filterStatesModule.Online,
	filterStatesModule.Trusted
}
local t = {
	[filterStatesModule.All] = "all",
	[filterStatesModule.Online] = "online",
	[filterStatesModule.Trusted] = "trusted"
}
local list_1 = {
	"allFriendsChip",
	"onlineFriendsChip",
	"trustedFriendsChip"
}

function ChipFilterGroup(p0)
	-- upvalues: reactModule (ref), friendsLandingContextModule (ref), useLocalization (ref), list (ref), list_1 (ref), chip (ref), t (ref), dependencyArray (ref)
	local filter = reactModule.useContext(friendsLandingContextModule.Context).filter
	local var7 = useLocalization({
		all = "Feature.Friends.Label.All",
		online = "Common.Presence.Label.Online",
		trusted = "Feature.Friends.TrustedConnection.Label.Trusted"
	})
	local var8 = reactModule.useMemo(function()
		-- upvalues: list (copy), list_1 (copy), reactModule (copy), chip (copy), var7 (ref), t (copy), p0 (ref), filter (ref)
		local t_1 = {}
		
		for i, v in ipairs(list) do
			t_1[list_1[i]] = reactModule.createElement(chip, {
				id = v,
				text = var7[t[v]],
				LayoutOrder = i,
				onActivated = function()
					-- upvalues: p0 (copy), v (ref)
					p0.onActivated(v)
				end,
				isChecked = filter == v
			})
		end
		return t_1
	end, dependencyArray(var7, filter, p0.onActivated))
	
	return reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		Size = UDim2.new(1, 0, 0, 32),
		LayoutOrder = p0.layoutOrder
	}, {
		Layout = reactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Horizontal,
			HorizontalAlignment = Enum.HorizontalAlignment.Left,
			VerticalAlignment = Enum.VerticalAlignment.Center,
			SortOrder = Enum.SortOrder.LayoutOrder,
			Padding = UDim.new(0, 8)
		}),
		allFriendsChip = var8.allFriendsChip,
		onlineFriendsChip = var8.onlineFriendsChip,
		trustedFriendsChip = var8.trustedFriendsChip
	})
end

return ChipFilterGroup