local AppStorageService = game:GetService("AppStorageService")
local CsatSurveyConstantsModule = require(script.Parent.CsatSurveyConstants)
local config = { BASELINE = "v10.1", CLOSED_SELF_VIEW = "v10.2" }

function canShowChromeSurvey(CurrentMenuVersion): boolean
	-- upvalues: config (copy)
	if CurrentMenuVersion == "" or CurrentMenuVersion == nil then
		return false
	end
	local CurrentMenuVersion1 = getCurrentMenuVersion()
	local Flag = false
	
	for _, value in config do
		if CurrentMenuVersion == value and CurrentMenuVersion == CurrentMenuVersion1 then
			Flag = true
			break
		end
	end
	return Flag or CurrentMenuVersion == "v10.0" and CurrentMenuVersion == CurrentMenuVersion1
end

function getCurrentMenuVersion()
	-- upvalues: AppStorageService (copy), CsatSurveyConstantsModule (copy)
	local Success, Result = pcall(function()
		-- upvalues: AppStorageService (upval), CsatSurveyConstantsModule (upval)
		return AppStorageService:GetItem(CsatSurveyConstantsModule.LOCAL_STORAGE_KEY_EXPERIENCE_MENU_VERSION)
	end)
	
	return if Success and Result ~= "" then Result else ""
end

return { canShowChromeSurvey = canShowChromeSurvey }