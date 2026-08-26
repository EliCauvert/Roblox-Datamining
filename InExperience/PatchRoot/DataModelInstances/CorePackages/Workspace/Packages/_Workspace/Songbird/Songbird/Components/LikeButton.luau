local songbird = script:FindFirstAncestor("Songbird")
local constantsModule = require(songbird.constants)
local cryoModule = require(songbird.Parent.Cryo)
local reactModule = require(songbird.Parent.React)
local foundationModule = require(songbird.Parent.Foundation)
local t = { size = constantsModule.ICON_SIZE }

return function(p1)
	-- upvalues: cryoModule (ref), t (ref), reactModule (ref), foundationModule (ref)
	local var1 = cryoModule.Dictionary.join(t, p1)
	
	return reactModule.createElement(foundationModule.IconButton, {
		icon = if var1.isFavorited then "icons/common/ratingFilled_medium" else "icons/common/rating_medium",
		size = foundationModule.Enums.IconSize.Medium,
		onActivated = if var1.onFavorite then var1.onFavorite else function() end
	})
end