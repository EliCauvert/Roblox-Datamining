local ExperienceStoreServerDrivenUi = script:FindFirstAncestor("ExperienceStoreServerDrivenUi")
local Parent = ExperienceStoreServerDrivenUi.Parent
local ReactModule = require(Parent.React)
local FFlagSduiGameItemsComponent = require(Parent.SharedFlags).FFlagSduiGameItemsComponent
local FFlagSduiLocalFeedFilter = require(Parent.SharedFlags).FFlagSduiLocalFeedFilter
local RegisterExperienceStoreActionsModule = require(ExperienceStoreServerDrivenUi.Actions.registerExperienceStoreActions)
local RegisterExperienceStoreComponentsModule = require(ExperienceStoreServerDrivenUi.System.registerExperienceStoreComponents)

return ReactModule.memo(function() --[[ Line: 13 | Named "SduiExperienceStoreRegister" ]]
	-- upvalues: ReactModule (copy), RegisterExperienceStoreActionsModule (copy), FFlagSduiGameItemsComponent (copy), FFlagSduiLocalFeedFilter (copy), RegisterExperienceStoreComponentsModule (copy)
	ReactModule.useEffect(function() --[[ Line: 14 ]]
		-- upvalues: RegisterExperienceStoreActionsModule (upval), FFlagSduiGameItemsComponent (upval), FFlagSduiLocalFeedFilter (upval), RegisterExperienceStoreComponentsModule (upval)
		RegisterExperienceStoreActionsModule()
		
		if FFlagSduiGameItemsComponent or FFlagSduiLocalFeedFilter then
			RegisterExperienceStoreComponentsModule()
		end
	end, {})
	
	return nil
end)