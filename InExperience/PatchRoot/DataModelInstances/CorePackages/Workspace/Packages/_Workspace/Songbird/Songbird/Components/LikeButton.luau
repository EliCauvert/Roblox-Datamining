local songbird = script:FindFirstAncestor("Songbird")
local constantsModule = require(songbird.constants)
local cryoModule = require(songbird.Parent.Cryo)
local reactModule = require(songbird.Parent.React)
local foundationModule = require(songbird.Parent.Foundation)
local t = { size = constantsModule.ICON_SIZE }

return function(p0) --[[ line: 20 | named "LikeButton" ]]
	-- upvalues: cryoModule (ref), t (ref), reactModule (ref), foundationModule (ref)
	local var6 = cryoModule.Dictionary.join(t, p0)
	
	return reactModule.createElement(foundationModule.IconButton, {
		icon = if var6.isFavorited then "icons/common/ratingFilled_medium" else "icons/common/rating_medium",
		size = foundationModule.Enums.IconSize.Medium,
		onActivated = if var6.onFavorite then var6.onFavorite else function() --[[ line: 26 ]] end
	})
end