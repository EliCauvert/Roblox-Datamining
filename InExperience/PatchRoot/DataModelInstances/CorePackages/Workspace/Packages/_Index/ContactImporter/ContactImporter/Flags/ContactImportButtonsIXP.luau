local roactAppExperimentModule = require(script:FindFirstAncestor("ContactImporter").Parent.RoactAppExperiment)
local contactImportLayer = game:DefineFastString("ContactImportLayer", "Social.ContactList")
local contactImportGreenFindFriendsButtonExperimentVariable = game:DefineFastString("ContactImportGreenFindFriendsButtonExperimentVariable", "green_find_friends_button")
local contactImportRemoveCloseButtonExperimentVariable = game:DefineFastString("ContactImportRemoveCloseButtonExperimentVariable", "remove_close_button")
local useUserExperiment = roactAppExperimentModule.useUserExperiment

local var1 = function(p1)
	-- upvalues: contactImportLayer (ref), contactImportGreenFindFriendsButtonExperimentVariable (ref)
	return ((p1 or {})[contactImportLayer] or {})[contactImportGreenFindFriendsButtonExperimentVariable] == true
end

local var2 = function(p1)
	-- upvalues: contactImportLayer (ref), contactImportRemoveCloseButtonExperimentVariable (ref)
	return ((p1 or {})[contactImportLayer] or {})[contactImportRemoveCloseButtonExperimentVariable] == true
end

return {
	isGreenFindFriendsButtonExperimentEnabled = var1,
	isRemoveCloseButtonExperimentEnabled = var2,
	useIsGreenFindFriendsButtonExperimentEnabled = function(p1)
		-- upvalues: useUserExperiment (ref), contactImportLayer (ref), var1 (ref)
		return useUserExperiment({ contactImportLayer }, var1, p1.isExposureEnabled)
	end,
	useIsRemoveCloseButtonExperimentEnabled = function(p1)
		-- upvalues: useUserExperiment (ref), contactImportLayer (ref), var2 (ref)
		return useUserExperiment({ contactImportLayer }, var2, p1.isExposureEnabled)
	end
}