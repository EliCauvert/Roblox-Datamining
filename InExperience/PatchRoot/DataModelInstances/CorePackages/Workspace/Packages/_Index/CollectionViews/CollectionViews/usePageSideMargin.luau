local collectionViews = script:FindFirstAncestor("CollectionViews")
local parent = collectionViews.Parent
local collectionItemSize = require(collectionViews.CollectionViewTypes).CollectionItemSize
local useCollectionLayoutParamsModule = require(collectionViews.useCollectionLayoutParams)
local formFactor = require(parent.FormFactor).Enums.FormFactor
local useSelector = require(parent.RoactUtils).Hooks.RoactRodux.useSelector
local useAppPolicy = require(parent.UniversalAppPolicy).useAppPolicy
local discoveryTypesModule = require(parent.DiscoveryTypes)
local appCompositionModule = require(parent.AppComposition)
local sharedFlagsModule = require(parent.SharedFlags)
local fFlagLuaAppCompositionSupport = sharedFlagsModule.FFlagLuaAppCompositionSupport
local fFlagLuaAppCompositionAlways = sharedFlagsModule.FFlagLuaAppCompositionAlways
local GAME_CAROUSEL_SIDE_COMPACT_PADDING = discoveryTypesModule.Constants.GAME_CAROUSEL_SIDE_COMPACT_PADDING
local GAME_CAROUSEL_SIDE_WIDE_PADDING = discoveryTypesModule.Constants.GAME_CAROUSEL_SIDE_WIDE_PADDING

return function(p0, p1) --[[ line: 19 | named "usePageSideMargin" ]]
	-- upvalues: fFlagLuaAppCompositionSupport (ref), appCompositionModule (ref), fFlagLuaAppCompositionAlways (ref), useSelector (ref), useAppPolicy (ref), formFactor (ref), GAME_CAROUSEL_SIDE_COMPACT_PADDING (ref), GAME_CAROUSEL_SIDE_WIDE_PADDING (ref), useCollectionLayoutParamsModule (ref), collectionItemSize (ref)
	local var5 = if fFlagLuaAppCompositionSupport then appCompositionModule.useCompositionLayout().margin else nil
	
	return if fFlagLuaAppCompositionAlways then var5 elseif fFlagLuaAppCompositionSupport and p1 then var5 else useCollectionLayoutParamsModule(collectionItemSize.Small, p0, false, if useAppPolicy(function(p3) --[[ line: 34 ]]
		return p3.useGridPageLayout()
	end) then nil else {
		sideMargin = if useSelector(function(p2) --[[ line: 30 ]]
			return p2.FormFactor
		end) == formFactor.COMPACT then GAME_CAROUSEL_SIDE_COMPACT_PADDING else GAME_CAROUSEL_SIDE_WIDE_PADDING
	}).sideMargin
end