local collectionService = game:GetService("CollectionService")
local parent = script:FindFirstAncestor("AvatarExperienceAnalytics").Parent
local reactModule = require(parent.React)
local robloxAppEnumsModule = require(parent.RobloxAppEnums)
local avatarScreen = require(parent.AvatarExperienceNavigation).Enums.AvatarScreen
local unifiedEventLogConstantsModule = require(script.Parent.UnifiedEventLogConstants)
local unifiedEventPageStoreModule = require(script.Parent.Store.UnifiedEventPageStore)
local t = {
	[robloxAppEnumsModule.AppPage.AvatarExperienceWrapper] = true,
	[robloxAppEnumsModule.AppPage.AvatarExperienceWrapperTransparent] = true,
	[robloxAppEnumsModule.SwitchTab.AvatarExperienceTab] = true
}

for i, v in avatarScreen do
	t[v] = true
end
local function _()
	-- upvalues: unifiedEventPageStoreModule (ref), t (ref)
	local navigationPage = unifiedEventPageStoreModule.getPageFields().navigationPage
	
	return navigationPage ~= unifiedEventPageStoreModule.UNKNOWN and not t[navigationPage]
end

return function(p1, p2)
	-- upvalues: reactModule (ref), collectionService (ref), unifiedEventLogConstantsModule (ref), unifiedEventPageStoreModule (ref), t (ref)
	reactModule.useEffect(function()
		-- upvalues: collectionService (copy), unifiedEventLogConstantsModule (copy), p1 (ref), unifiedEventPageStoreModule (copy), t (copy), p2 (ref)
		local var1 = nil
		local var2 = collectionService:GetInstanceAddedSignal(unifiedEventLogConstantsModule.TAG_NAME):Connect(function(p3)
			-- upvalues: p1 (copy), var1 (write), unifiedEventPageStoreModule (copy), t (copy), p2 (copy)
			local current = p1.current
			
			if var1 or not current or not p3:IsDescendantOf(current) then
				return
			end
			var1 = task.delay(0, function()
				-- upvalues: var1 (copy), unifiedEventPageStoreModule (copy), t (copy), p2 (copy)
				var1 = nil
				local navigationPage = unifiedEventPageStoreModule.getPageFields().navigationPage
				
				if navigationPage ~= unifiedEventPageStoreModule.UNKNOWN and not t[navigationPage] then
					return
				end
				p2:fire()
			end)
		end)
		
		return function()
			-- upvalues: var2 (ref), var1 (write)
			var2:Disconnect()
			
			if var1 then
				task.cancel(var1)
			end
		end
	end, { p1, p2 })
end