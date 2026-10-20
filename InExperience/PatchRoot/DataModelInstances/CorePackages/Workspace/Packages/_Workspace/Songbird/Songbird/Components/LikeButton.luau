local Songbird = script:FindFirstAncestor("Songbird")
local CryoModule = require(Songbird.Parent.Cryo)
local ReactModule = require(Songbird.Parent.React)
local FoundationModule = require(Songbird.Parent.Foundation)
local config = { size = require(Songbird.constants).ICON_SIZE }

return function(p1)
	-- upvalues: CryoModule (copy), config (copy), ReactModule (copy), FoundationModule (copy)
	local JoinResult = CryoModule.Dictionary.join(config, p1)
	
	return ReactModule.createElement(FoundationModule.IconButton, {
		icon = if JoinResult.isFavorited then "icons/common/ratingFilled_medium" else "icons/common/rating_medium",
		size = FoundationModule.Enums.IconSize.Medium,
		onActivated = if JoinResult.onFavorite then JoinResult.onFavorite else function() end
	})
end