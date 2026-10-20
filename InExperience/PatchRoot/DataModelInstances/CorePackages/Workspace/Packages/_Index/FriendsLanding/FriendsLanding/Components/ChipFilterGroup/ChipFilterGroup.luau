local FriendsLanding = script:FindFirstAncestor("FriendsLanding")
local Parent = FriendsLanding.Parent
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local DependencyArrayFunction = require(Parent.RoactUtils).Hooks.dependencyArray
local ReactModule = require(Parent.React)
local Chip = require(Parent.Foundation).Chip
local FilterStatesModule = require(FriendsLanding.Friends.filterStates)
local FriendsLandingContextModule = require(FriendsLanding.FriendsLandingContext)
local FFlagDisableFriendsLandingFilterChipsWithNoFriendsModule = require(FriendsLanding.Flags.FFlagDisableFriendsLandingFilterChipsWithNoFriends)
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

function ChipFilterGroup(p1)
	-- upvalues: ReactModule (copy), FriendsLandingContextModule (copy), UseLocalizationFunction (copy), Ids (copy), list (copy), Chip (copy), config (copy), FFlagDisableFriendsLandingFilterChipsWithNoFriendsModule (copy), DependencyArrayFunction (copy)
	local Filter = ReactModule.useContext(FriendsLandingContextModule.Context).filter
	local UseLocalizationResult = UseLocalizationFunction({
		all = "Feature.Friends.Label.All",
		online = "Common.Presence.Label.Online",
		trusted = "Feature.Friends.TrustedConnection.Label.Trusted"
	})
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: Ids (upval), list (upval), ReactModule (upval), Chip (upval), UseLocalizationResult (copy), config (upval), p1 (copy), Filter (copy), FFlagDisableFriendsLandingFilterChipsWithNoFriendsModule (upval)
		local Elements = {}
		
		for LayoutOrder, id in ipairs(Ids) do
			Elements[list[LayoutOrder]] = ReactModule.createElement(Chip, {
				id = id,
				text = UseLocalizationResult[config[id]],
				LayoutOrder = LayoutOrder,
				onActivated = function()
					-- upvalues: p1 (upval), id (copy)
					p1.onActivated(id)
				end,
				isChecked = Filter == id,
				isDisabled = if FFlagDisableFriendsLandingFilterChipsWithNoFriendsModule then p1.isDisabled else nil
			})
		end
		return Elements
	end, DependencyArrayFunction(UseLocalizationResult, Filter, p1.onActivated, if FFlagDisableFriendsLandingFilterChipsWithNoFriendsModule then p1.isDisabled else nil))
	
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