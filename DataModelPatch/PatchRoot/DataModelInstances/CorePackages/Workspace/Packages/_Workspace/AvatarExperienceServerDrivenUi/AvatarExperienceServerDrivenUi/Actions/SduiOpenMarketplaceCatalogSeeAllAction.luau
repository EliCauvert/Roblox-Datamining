local AvatarExperienceServerDrivenUi = script:FindFirstAncestor("AvatarExperienceServerDrivenUi")
local MarketplaceCatalogSduiSelectionBridgeModule = require(AvatarExperienceServerDrivenUi.System.MarketplaceCatalogSduiSelectionBridge)
local SduiCoreSystemModule = require(AvatarExperienceServerDrivenUi.Parent.SduiCoreSystem)
local SduiActionType = SduiCoreSystemModule.SduiActionType
local SduiErrorType = SduiCoreSystemModule.SduiErrors.SduiErrorType

local function _(p1)
	return if typeof(p1) == "string" and p1 ~= "" then p1 else nil
end

return function(p1, _, p2, _)
	-- upvalues: SduiErrorType (copy), SduiActionType (copy), MarketplaceCatalogSduiSelectionBridgeModule (copy)
	local ActionParams = p1 and p1.actionParams or nil
	
	if ActionParams == nil then
		p2.dependencies.logger.reportError(SduiErrorType.InvalidActionParams, {
			message = "Missing actionParams",
			name = SduiActionType.OpenMarketplaceCatalogSeeAll
		}, p2.appPage)
		
		return
	end
	local SortId = ActionParams.sortId
	
	if typeof(SortId) == "string" and SortId ~= "" then
		local Title = ActionParams.title
		local Title1 = if typeof(Title) == "string" and Title ~= "" then Title else nil
		local Description = ActionParams.description
		local Description1 = if typeof(Description) == "string" and Description ~= "" then Description else nil
		local TooltipText = ActionParams.tooltipText
		MarketplaceCatalogSduiSelectionBridgeModule.requestFocusedSort({
			sortId = SortId,
			title = Title1,
			description = Description1,
			tooltipText = if typeof(TooltipText) == "string" and TooltipText ~= "" then TooltipText else nil
		})
		
		return
	else
		p2.dependencies.logger.reportError(SduiErrorType.InvalidActionParams, {
			name = SduiActionType.OpenMarketplaceCatalogSeeAll,
			message = `Invalid or missing sortId: {SortId}`
		}, p2.appPage)
	end
end