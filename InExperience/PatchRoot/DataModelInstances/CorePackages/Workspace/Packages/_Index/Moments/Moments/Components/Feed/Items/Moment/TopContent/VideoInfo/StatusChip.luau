local parent = script:FindFirstAncestor("Moments").Parent
local reactModule = require(parent.React)
local builderIconsModule = require(parent.BuilderIcons)
local foundationModule = require(parent.Foundation)
local chip = foundationModule.Chip
local view = foundationModule.View
local chipSize = foundationModule.Enums.ChipSize
local chipVariant = foundationModule.Enums.ChipVariant
local momentContextModule = require(script.Parent.Parent.Parent.MomentContext)

local function noop() --[[ line: 28 ]] end

return reactModule.memo(function(p0) --[[ line: 34 | named "StatusChip" ]]
	-- upvalues: momentContextModule (ref), reactModule (ref), view (ref), chip (ref), chipSize (ref), chipVariant (ref), builderIconsModule (ref), noop (ref)
	local data = momentContextModule.useMoment().store.getData(false)
	local var6 = nil
	
	if data.kind == "ad" then
		var6 = "Ad"
	elseif data.isSponsored then
		var6 = "Sponsored"
	end
	return if var6 == nil then nil else reactModule.createElement(view, {
		tag = "row align-x-left auto-xy",
		LayoutOrder = p0.LayoutOrder
	}, {
		Chip = reactModule.createElement(chip, {
			text = var6,
			size = chipSize.Small,
			variant = chipVariant.Standard,
			trailing = {
				iconName = builderIconsModule.Icon.CircleI,
				onActivated = noop
			},
			onActivated = noop
		})
	})
end)