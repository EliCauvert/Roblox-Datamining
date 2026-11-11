local Parent = script:FindFirstAncestor("DiscoveryMonolith").Parent
local CollectionViewsModule = require(Parent.CollectionViews)
local CollectionItemSize = CollectionViewsModule.CollectionViewTypes.CollectionItemSize
local UseCollectionLayoutParamsFunction = CollectionViewsModule.useCollectionLayoutParams
local FormFactor = require(Parent.FormFactor).Enums.FormFactor
local UseSelectorFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useSelector
local UseAppPolicyFunction = require(Parent.UniversalAppPolicy).useAppPolicy
local DiscoveryTypesModule = require(Parent.DiscoveryTypes)
local GAMECAROUSELSIDECOMPACTPADDING = DiscoveryTypesModule.Constants.GAME_CAROUSEL_SIDE_COMPACT_PADDING
local GAMECAROUSELSIDEWIDEPADDING = DiscoveryTypesModule.Constants.GAME_CAROUSEL_SIDE_WIDE_PADDING

return function(p1)
	-- upvalues: UseSelectorFunction (copy), UseAppPolicyFunction (copy), FormFactor (copy), GAMECAROUSELSIDECOMPACTPADDING (copy), GAMECAROUSELSIDEWIDEPADDING (copy), UseCollectionLayoutParamsFunction (copy), CollectionItemSize (copy)
	local UseSelectorResult = UseSelectorFunction(function(p2)
		return p2.FormFactor
	end)
	
	return UseCollectionLayoutParamsFunction(CollectionItemSize.Small, p1, false, if UseAppPolicyFunction(function(p2)
		return p2.useGridPageLayout()
	end) then nil else {
		sideMargin = if UseSelectorResult == FormFactor.COMPACT then GAMECAROUSELSIDECOMPACTPADDING else GAMECAROUSELSIDEWIDEPADDING
	}).sideMargin
end