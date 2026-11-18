local InExperienceSideSheetStore = script:FindFirstAncestor("InExperienceSideSheetStore")
local _ = require(InExperienceSideSheetStore.Parent.Signals)
local GetSideSheetStoreModule = require(InExperienceSideSheetStore.Stores.GetSideSheetStore)
local _ = require(InExperienceSideSheetStore.Types)

return function(IntegrationId, p1)
	-- upvalues: GetSideSheetStoreModule (copy)
	local SideSheetStoreModule = GetSideSheetStoreModule(false)
	
	if SideSheetStoreModule.getWindowShownBesideSideSheet(p1) == IntegrationId then
		local ClaimedWindowArea = SideSheetStoreModule.getClaimedWindowArea(p1)
		
		return if ClaimedWindowArea == nil or ClaimedWindowArea.integrationId ~= IntegrationId then nil else ClaimedWindowArea.area
	else
		return nil
	end
end