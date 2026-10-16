local FriendsLanding = script:FindFirstAncestor("FriendsLanding")
local Parent = FriendsLanding.Parent
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local DependencyArrayFunction = require(Parent.RoactUtils).Hooks.dependencyArray
local ReactModule = require(Parent.React)
local Chip = require(Parent.Foundation).Chip
local FilterStatesModule = require(FriendsLanding.Friends.filterStates)
local FriendsLandingContextModule = require(FriendsLanding.FriendsLandingContext)
local Ids = {
	FilterStatesModule.All,
	FilterStatesModule.Online,
	FilterStatesModule.Trusted
}
local config = {
	[FilterStatesModule.All] = "all",
	[FilterStatesModule.Online] = "online",
	[FilterStatesModule.Trusted] = "trusted"
}
local list = {
	"allFriendsChip",
	"onlineFriendsChip",
	"trustedFriendsChip"
}

function ChipFilterGroup(p1) --[[ Line: 34 ]]
	-- upvalues: ReactModule (copy), FriendsLandingContextModule (copy), UseLocalizationFunction (copy), Ids (copy), list (copy), Chip (copy), config (copy), DependencyArrayFunction (copy)
	local Filter = ReactModule.useContext(FriendsLandingContextModule.Context).filter
	local UseLocalizationResult = UseLocalizationFunction({
		all = "Feature.Friends.Label.All",
		online = "Common.Presence.Label.Online",
		trusted = "Feature.Friends.TrustedConnection.Label.Trusted"
	})
	local UseMemoResult = ReactModule.useMemo(function() --[[ Line: 43 ]]
		-- upvalues: Ids (upval), list (upval), ReactModule (upval), Chip (upval), UseLocalizationResult (copy), config (upval), p1 (copy), Filter (copy)
		local Elements = {}
		
		for LayoutOrder, id in ipairs(Ids) do
			Elements[list[LayoutOrder]] = ReactModule.createElement(Chip, {
				id = id,
				text = UseLocalizationResult[config[id]],
				LayoutOrder = LayoutOrder,
				onActivated = function() --[[ Line: 50 ]]
					-- upvalues: p1 (upval), id (copy)
					p1.onActivated(id)
				end,
				isChecked = Filter == id
			})
		end
		return Elements
	end, DependencyArrayFunction(UseLocalizationResult, Filter, p1.onActivated))
	
	return ReactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		Size = UDim2.new(1, 0, 0, 32),
		LayoutOrder = p1.layoutOrder
	}, {
		Layout = ReactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Horizontal,
			HorizontalAlignment = Enum.HorizontalAlignment.Left,
			VerticalAlignment = Enum.VerticalAlignment.Center,
			SortOrder = Enum.SortOrder.LayoutOrder,
			Padding = UDim.new(0, 8)
		}),
		allFriendsChip = UseMemoResult.allFriendsChip,
		onlineFriendsChip = UseMemoResult.onlineFriendsChip,
		trustedFriendsChip = UseMemoResult.trustedFriendsChip
	})
end

return ChipFilterGroup