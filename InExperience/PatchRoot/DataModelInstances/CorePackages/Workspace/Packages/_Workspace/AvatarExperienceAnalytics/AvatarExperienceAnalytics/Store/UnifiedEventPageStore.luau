local getLegacyNavigationStore = require(script:FindFirstAncestor("AvatarExperienceAnalytics").Parent.NavigationRodux).GetLegacyNavigationStore
local sendAXCounterV2Module = require(script.Parent.Parent.sendAXCounterV2)
local var1 = nil

local function _()
	-- upvalues: getLegacyNavigationStore (ref)
	local ok, status = pcall(function()
		-- upvalues: getLegacyNavigationStore (copy)
		return getLegacyNavigationStore(false).getCurrentLegacyRoute(false)
	end)
	
	return if ok and status ~= nil and #status ~= 0 then status[#status].name else nil
end

return {
	UNKNOWN = "Unknown",
	UNREGISTERED = "Unregistered",
	setPageProvider = function(value)
		-- upvalues: var1 (write)
		var1 = value
	end,
	getPageFields = function()
		-- upvalues: var1 (write), sendAXCounterV2Module (ref), getLegacyNavigationStore (ref)
		if var1 ~= nil then
			local ok, status, var2 = pcall(var1)
			
			if ok then
				if status ~= nil then
					return {
						navigationPage = status,
						navigationOpaquePage = var2 or "Unknown"
					}
				end
			else
				sendAXCounterV2Module("UnifiedEventPageResolutionFailed", { Source = "provider" })
			end
		end
		local ok, status = pcall(function()
			-- upvalues: getLegacyNavigationStore (copy)
			return getLegacyNavigationStore(false).getCurrentLegacyRoute(false)
		end)
		local var3 = if ok and status ~= nil and #status ~= 0 then status[#status].name else nil
		
		return if var3 == nil then {
			navigationPage = "Unknown",
			navigationOpaquePage = "Unknown"
		} else {
			navigationPage = var3,
			navigationOpaquePage = if var1 == nil then "Unregistered" else "Unknown"
		}
	end
}