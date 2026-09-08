local experienceStoreServerDrivenUi = script:FindFirstAncestor("ExperienceStoreServerDrivenUi")
local parent = experienceStoreServerDrivenUi.Parent
local reactModule = require(parent.React)
local fFlagSduiGameItemsComponent = require(parent.SharedFlags).FFlagSduiGameItemsComponent
local fFlagSduiLocalFeedFilter = require(parent.SharedFlags).FFlagSduiLocalFeedFilter
local registerExperienceStoreActionsModule = require(experienceStoreServerDrivenUi.Actions.registerExperienceStoreActions)
local registerExperienceStoreComponentsModule = require(experienceStoreServerDrivenUi.System.registerExperienceStoreComponents)

return reactModule.memo(function()
	-- upvalues: reactModule (ref), registerExperienceStoreActionsModule (ref), fFlagSduiGameItemsComponent (ref), fFlagSduiLocalFeedFilter (ref), registerExperienceStoreComponentsModule (ref)
	reactModule.useEffect(function()
		-- upvalues: registerExperienceStoreActionsModule (copy), fFlagSduiGameItemsComponent (copy), fFlagSduiLocalFeedFilter (copy), registerExperienceStoreComponentsModule (copy)
		registerExperienceStoreActionsModule()
		
		if fFlagSduiGameItemsComponent or fFlagSduiLocalFeedFilter then
			registerExperienceStoreComponentsModule()
		end
	end, {})
	
	return nil
end)