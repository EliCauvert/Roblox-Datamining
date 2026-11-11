local CorePackages = game:GetService("CorePackages")
local ReactModule = require(CorePackages.Packages.React)
local _ = require(CorePackages.Workspace.Packages.AvatarExperienceCommon)
local UseOutfitSelectionGridPropsModule = require(script.Parent.useOutfitSelectionGridProps)
local OutfitSelectionGridModule = require(script.Parent.OutfitSelectionGrid)

return ReactModule.forwardRef(function(p1, ForwardRef)
	-- upvalues: UseOutfitSelectionGridPropsModule (copy), ReactModule (copy), OutfitSelectionGridModule (copy)
	return ReactModule.createElement(OutfitSelectionGridModule, (UseOutfitSelectionGridPropsModule({
		outfitType = p1.outfitType,
		isEditable = p1.isEditable,
		onToggleOutfitCard = p1.onToggleOutfitCard,
		selectedOutfits = p1.selectedOutfits,
		setSelectedOutfits = p1.setSelectedOutfits,
		setCanScroll = p1.setCanScroll,
		multiSelect = p1.multiSelect,
		goBack = p1.goBack,
		pageOwner = p1.pageOwner,
		forwardRef = ForwardRef
	})))
end)