local ContactImportLayer = game:DefineFastString("ContactImportLayer", "Social.ContactList")
local ContactImportGreenFindFriendsButtonExperimentVariable = game:DefineFastString("ContactImportGreenFindFriendsButtonExperimentVariable", "green_find_friends_button")
local ContactImportRemoveCloseButtonExperimentVariable = game:DefineFastString("ContactImportRemoveCloseButtonExperimentVariable", "remove_close_button")
local UseUserExperimentFunction = require(script:FindFirstAncestor("ContactImporter").Parent.RoactAppExperiment).useUserExperiment

local function IsGreenFindFriendsButtonExperimentEnabled(p1): boolean --[[ Line: 12 ]]
	-- upvalues: ContactImportLayer (copy), ContactImportGreenFindFriendsButtonExperimentVariable (copy)
	return ((p1 or {})[ContactImportLayer] or {})[ContactImportGreenFindFriendsButtonExperimentVariable] == true
end

local function IsRemoveCloseButtonExperimentEnabled(p1): boolean --[[ Line: 18 ]]
	-- upvalues: ContactImportLayer (copy), ContactImportRemoveCloseButtonExperimentVariable (copy)
	return ((p1 or {})[ContactImportLayer] or {})[ContactImportRemoveCloseButtonExperimentVariable] == true
end

return {
	isGreenFindFriendsButtonExperimentEnabled = IsGreenFindFriendsButtonExperimentEnabled,
	isRemoveCloseButtonExperimentEnabled = IsRemoveCloseButtonExperimentEnabled,
	useIsGreenFindFriendsButtonExperimentEnabled = function(p1) --[[ Line: 27 ]]
		-- upvalues: UseUserExperimentFunction (copy), ContactImportLayer (copy), IsGreenFindFriendsButtonExperimentEnabled (copy)
		return UseUserExperimentFunction({ ContactImportLayer }, IsGreenFindFriendsButtonExperimentEnabled, p1.isExposureEnabled)
	end,
	useIsRemoveCloseButtonExperimentEnabled = function(p1) --[[ Line: 34 ]]
		-- upvalues: UseUserExperimentFunction (copy), ContactImportLayer (copy), IsRemoveCloseButtonExperimentEnabled (copy)
		return UseUserExperimentFunction({ ContactImportLayer }, IsRemoveCloseButtonExperimentEnabled, p1.isExposureEnabled)
	end
}