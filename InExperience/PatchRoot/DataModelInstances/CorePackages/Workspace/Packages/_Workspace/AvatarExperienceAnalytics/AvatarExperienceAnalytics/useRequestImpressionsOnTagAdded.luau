local CollectionService = game:GetService("CollectionService")
local Parent = script:FindFirstAncestor("AvatarExperienceAnalytics").Parent
local ReactModule = require(Parent.React)
local RobloxAppEnumsModule = require(Parent.RobloxAppEnums)
local UnifiedEventLogConstantsModule = require(script.Parent.UnifiedEventLogConstants)
local UnifiedEventPageStoreModule = require(script.Parent.Store.UnifiedEventPageStore)
local config = {
	[RobloxAppEnumsModule.AppPage.AvatarExperienceWrapper] = true,
	[RobloxAppEnumsModule.AppPage.AvatarExperienceWrapperTransparent] = true,
	[RobloxAppEnumsModule.SwitchTab.AvatarExperienceTab] = true
}

for _, value in require(Parent.AvatarExperienceNavigation).Enums.AvatarScreen do
	config[value] = true
end
local function _(): boolean --[[ Line: 26 | Named "isAppOnOtherPage" ]]
	-- upvalues: UnifiedEventPageStoreModule (copy), config (copy)
	local NavigationPage = UnifiedEventPageStoreModule.getPageFields().navigationPage
	
	return NavigationPage ~= UnifiedEventPageStoreModule.UNKNOWN and not config[NavigationPage]
end

return function(p1, p2) --[[ Line: 36 | Named "useRequestImpressionsOnTagAdded" ]]
	-- upvalues: ReactModule (copy), CollectionService (copy), UnifiedEventLogConstantsModule (copy), UnifiedEventPageStoreModule (copy), config (copy)
	ReactModule.useEffect(function() --[[ Line: 37 ]]
		-- upvalues: CollectionService (upval), UnifiedEventLogConstantsModule (upval), p1 (copy), UnifiedEventPageStoreModule (upval), config (upval), p2 (copy)
		local DelayedThread = nil
		local Connection = CollectionService:GetInstanceAddedSignal(UnifiedEventLogConstantsModule.TAG_NAME):Connect(function(Tagged) --[[ Line: 40 ]]
			-- upvalues: p1 (upval), DelayedThread (ref), UnifiedEventPageStoreModule (upval), config (upval), p2 (upval)
			local Current = p1.current
			
			if not DelayedThread and Current and Tagged:IsDescendantOf(Current) then
				DelayedThread = task.delay(0, function() --[[ Line: 46 ]]
					-- upvalues: DelayedThread (upval), UnifiedEventPageStoreModule (upval), config (upval), p2 (upval)
					DelayedThread = nil
					local NavigationPage = UnifiedEventPageStoreModule.getPageFields().navigationPage
					
					if NavigationPage == UnifiedEventPageStoreModule.UNKNOWN or config[NavigationPage] then
						p2:fire()
						
						return
					end
				end)
				
				return
			end
		end)
		
		return function() --[[ Line: 55 ]]
			-- upvalues: Connection (copy), DelayedThread (ref)
			Connection:Disconnect()
			
			if DelayedThread then
				task.cancel(DelayedThread)
			end
		end
	end, { p1, p2 })
end