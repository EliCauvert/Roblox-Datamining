local GetLegacyNavigationStoreFunction = require(script:FindFirstAncestor("AvatarExperienceAnalytics").Parent.NavigationRodux).GetLegacyNavigationStore
local SendAXCounterV2Module = require(script.Parent.Parent.sendAXCounterV2)
local PageProvider = nil

local function _()
	-- upvalues: GetLegacyNavigationStoreFunction (copy)
	local Success, Result = pcall(function()
		-- upvalues: GetLegacyNavigationStoreFunction (upval)
		return GetLegacyNavigationStoreFunction(false).getCurrentLegacyRoute(false)
	end)
	
	return if Success and Result ~= nil and #Result ~= 0 then Result[#Result].name else nil
end

return {
	UNKNOWN = "Unknown",
	UNREGISTERED = "Unregistered",
	setPageProvider = function(Value)
		-- upvalues: PageProvider (ref)
		PageProvider = Value
	end,
	getPageFields = function()
		-- upvalues: PageProvider (ref), SendAXCounterV2Module (copy), GetLegacyNavigationStoreFunction (copy)
		local PageProvider1 = PageProvider
		
		if PageProvider1 ~= nil then
			local Success, Result, Result3 = pcall(PageProvider1)
			
			if not Success then
				SendAXCounterV2Module("UnifiedEventPageResolutionFailed", { Source = "provider" })
			elseif Result ~= nil then
				return {
					navigationPage = Result,
					navigationOpaquePage = Result3 or "Unknown"
				}
			end
		end
		local Success1, Result1 = pcall(function()
			-- upvalues: GetLegacyNavigationStoreFunction (upval)
			return GetLegacyNavigationStoreFunction(false).getCurrentLegacyRoute(false)
		end)
		local Name = if Success1 and Result1 ~= nil and #Result1 ~= 0 then Result1[#Result1].name else nil
		
		return if Name == nil then {
			navigationPage = "Unknown",
			navigationOpaquePage = "Unknown"
		} else {
			navigationPage = Name,
			navigationOpaquePage = if PageProvider1 == nil then "Unregistered" else "Unknown"
		}
	end
}