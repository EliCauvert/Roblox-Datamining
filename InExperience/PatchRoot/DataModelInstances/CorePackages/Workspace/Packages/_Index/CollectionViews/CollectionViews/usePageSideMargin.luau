local collectionViews = script:FindFirstAncestor("CollectionViews")
local parent = collectionViews.Parent
local collectionItemSize = require(collectionViews.CollectionViewTypes).CollectionItemSize
local useCollectionLayoutParamsModule = require(collectionViews.useCollectionLayoutParams)
local formFactor = require(parent.FormFactor).Enums.FormFactor
local useSelector = require(parent.RoactUtils).Hooks.RoactRodux.useSelector
local useAppPolicy = require(parent.UniversalAppPolicy).useAppPolicy
local discoveryTypesModule = require(parent.DiscoveryTypes)
local appCompositionModule = require(parent.AppComposition)
local fFlagLuaAppCompositionAlways = require(parent.SharedFlags).FFlagLuaAppCompositionAlways
local GAME_CAROUSEL_SIDE_COMPACT_PADDING = discoveryTypesModule.Constants.GAME_CAROUSEL_SIDE_COMPACT_PADDING
local GAME_CAROUSEL_SIDE_WIDE_PADDING = discoveryTypesModule.Constants.GAME_CAROUSEL_SIDE_WIDE_PADDING

return function(p0, p1)
	-- upvalues: appCompositionModule (ref), fFlagLuaAppCompositionAlways (ref), useSelector (ref), useAppPolicy (ref), formFactor (ref), GAME_CAROUSEL_SIDE_COMPACT_PADDING (ref), GAME_CAROUSEL_SIDE_WIDE_PADDING (ref), useCollectionLayoutParamsModule (ref), collectionItemSize (ref)
	local margin = appCompositionModule.useCompositionLayout().margin
	
	return if fFlagLuaAppCompositionAlways then margin elseif p1 then margin else useCollectionLayoutParamsModule(collectionItemSize.Small, p0, false, if useAppPolicy(function(p3)
		return p3.useGridPageLayout()
	end) then nil else {
		sideMargin = if useSelector(function(p2)
			return p2.FormFactor
		end) == formFactor.COMPACT then GAME_CAROUSEL_SIDE_COMPACT_PADDING else GAME_CAROUSEL_SIDE_WIDE_PADDING
	}).sideMargin
end