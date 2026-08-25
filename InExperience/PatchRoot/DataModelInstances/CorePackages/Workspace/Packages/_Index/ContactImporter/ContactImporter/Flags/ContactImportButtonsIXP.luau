local roactAppExperimentModule = require(script:FindFirstAncestor("ContactImporter").Parent.RoactAppExperiment)
local contactImportLayer = game:DefineFastString("ContactImportLayer", "Social.ContactList")
local contactImportGreenFindFriendsButtonExperimentVariable = game:DefineFastString("ContactImportGreenFindFriendsButtonExperimentVariable", "green_find_friends_button")
local contactImportRemoveCloseButtonExperimentVariable = game:DefineFastString("ContactImportRemoveCloseButtonExperimentVariable", "remove_close_button")
local useUserExperiment = roactAppExperimentModule.useUserExperiment

local var4 = function(p0)
	-- upvalues: contactImportLayer (ref), contactImportGreenFindFriendsButtonExperimentVariable (ref)
	return ((p0 or {})[contactImportLayer] or {})[contactImportGreenFindFriendsButtonExperimentVariable] == true
end

local var5 = function(p1)
	-- upvalues: contactImportLayer (ref), contactImportRemoveCloseButtonExperimentVariable (ref)
	return ((p1 or {})[contactImportLayer] or {})[contactImportRemoveCloseButtonExperimentVariable] == true
end

return {
	isGreenFindFriendsButtonExperimentEnabled = var4,
	isRemoveCloseButtonExperimentEnabled = var5,
	useIsGreenFindFriendsButtonExperimentEnabled = function(p2)
		-- upvalues: useUserExperiment (ref), contactImportLayer (ref), var4 (ref)
		return useUserExperiment({ contactImportLayer }, var4, p2.isExposureEnabled)
	end,
	useIsRemoveCloseButtonExperimentEnabled = function(p3)
		-- upvalues: useUserExperiment (ref), contactImportLayer (ref), var5 (ref)
		return useUserExperiment({ contactImportLayer }, var5, p3.isExposureEnabled)
	end
}