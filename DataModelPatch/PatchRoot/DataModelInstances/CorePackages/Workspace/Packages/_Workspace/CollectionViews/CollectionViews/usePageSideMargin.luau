local CollectionViews = script:FindFirstAncestor("CollectionViews")
local Parent = CollectionViews.Parent
local CollectionItemSize = require(CollectionViews.CollectionViewTypes).CollectionItemSize
local UseCollectionLayoutParamsModule = require(CollectionViews.useCollectionLayoutParams)
local FormFactor = require(Parent.FormFactor).Enums.FormFactor
local UseSelectorFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useSelector
local UseAppPolicyFunction = require(Parent.UniversalAppPolicy).useAppPolicy
local DiscoveryTypesModule = require(Parent.DiscoveryTypes)
local AppCompositionModule = require(Parent.AppComposition)
local FFlagLuaAppCompositionAlways = require(Parent.SharedFlags).FFlagLuaAppCompositionAlways
local GAMECAROUSELSIDECOMPACTPADDING = DiscoveryTypesModule.Constants.GAME_CAROUSEL_SIDE_COMPACT_PADDING
local GAMECAROUSELSIDEWIDEPADDING = DiscoveryTypesModule.Constants.GAME_CAROUSEL_SIDE_WIDE_PADDING

return function(p1, p2)
	-- upvalues: AppCompositionModule (copy), FFlagLuaAppCompositionAlways (copy), UseSelectorFunction (copy), UseAppPolicyFunction (copy), FormFactor (copy), GAMECAROUSELSIDECOMPACTPADDING (copy), GAMECAROUSELSIDEWIDEPADDING (copy), UseCollectionLayoutParamsModule (copy), CollectionItemSize (copy)
	local Margin = AppCompositionModule.useCompositionLayout().margin
	
	if FFlagLuaAppCompositionAlways then
		return Margin
	else
		local UseSelectorResult = UseSelectorFunction(function(p3)
			return p3.FormFactor
		end)
		local UseCollectionLayoutParamsModuleResult = UseCollectionLayoutParamsModule(CollectionItemSize.Small, p1, false, if UseAppPolicyFunction(function(p3)
			return p3.useGridPageLayout()
		end) then nil else {
			sideMargin = if UseSelectorResult == FormFactor.COMPACT then GAMECAROUSELSIDECOMPACTPADDING else GAMECAROUSELSIDEWIDEPADDING
		})
		
		return if p2 then Margin else UseCollectionLayoutParamsModuleResult.sideMargin
	end
end