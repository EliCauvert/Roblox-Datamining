local GameSettings = UserSettings().GameSettings
local IGMResetGfxQuality = game:DefineFastFlag("IGMResetGfxQuality", false)
local IGMRevertGfxQuality = game:DefineFastFlag("IGMRevertGfxQuality", false)
local IGMRevertGfxLv5Only = game:DefineFastFlag("IGMRevertGfxLv5Only", false)
local IGMResetGfxLv5Only = game:DefineFastFlag("IGMResetGfxLv5Only", false)
local IGMAlwaysResetGfxLv5 = game:DefineFastFlag("IGMAlwaysResetGfxLv5", false)
local IGMTempOverrideGfxLv5 = game:DefineFastInt("IGMTempOverrideGfxLv5", 0)

local function _(p1) --[[ Line: 16 | Named "SavedQualitySettingEnumFromValue" ]]
	for _, enumItem in Enum.SavedQualitySetting:GetEnumItems() do
		if enumItem.Value == p1 then
			return enumItem
		end
	end
	return Enum.SavedQualitySetting.Automatic
end

local function RunGfxReset() --[[ Line: 26 ]]
	-- upvalues: IGMAlwaysResetGfxLv5 (copy), GameSettings (copy), IGMRevertGfxQuality (copy), IGMRevertGfxLv5Only (copy), IGMResetGfxQuality (copy), IGMResetGfxLv5Only (copy)
	local IsSavedQualityLevelMatch = GameSettings.SavedQualityLevel == Enum.SavedQualitySetting.QualityLevel5
	
	if IGMAlwaysResetGfxLv5 and IsSavedQualityLevelMatch then
		GameSettings.SavedQualityLevel = Enum.SavedQualitySetting.Automatic
	end
	if game:GetEngineFeature("QualityLevelReset") then
		if IGMRevertGfxQuality then
			if GameSettings.QualityResetLevel >= 0 then
				local QualityResetLevel = GameSettings.QualityResetLevel
				local Automatic = nil
				
				for _, enumItem in Enum.SavedQualitySetting:GetEnumItems() do
					if enumItem.Value == QualityResetLevel then
						Automatic = enumItem
						if IGMRevertGfxLv5Only and Automatic == Enum.SavedQualitySetting.QualityLevel5 or IGMRevertGfxLv5Only == false then
							GameSettings.SavedQualityLevel = Automatic
							GameSettings.QualityResetLevel = -1
							
							return
						end
					else
						continue
					end
				end
				Automatic = Enum.SavedQualitySetting.Automatic
			end
		elseif IGMResetGfxQuality then
			local QualityResetLevel: number = GameSettings.QualityResetLevel
			
			if QualityResetLevel < 0 or QualityResetLevel == nil then
				local Value = GameSettings.SavedQualityLevel.Value
				
				if IsSavedQualityLevelMatch and IGMResetGfxLv5Only or IGMResetGfxLv5Only == false then
					GameSettings.SavedQualityLevel = Enum.SavedQualitySetting.Automatic
				end
				GameSettings.QualityResetLevel = Value
			end
		end
	end
end

function applicationId() --[[ Line: 67 ]]
	local AppStorageService = game:GetService("AppStorageService")
	
	if AppStorageService then
		local AppInstallationIdItem: string = AppStorageService:GetItem("AppInstallationId")
		local ValueType = typeof(AppInstallationIdItem)
		
		return if ValueType == "number" then tonumber(AppInstallationIdItem) or nil elseif ValueType == "string" then if string.len(AppInstallationIdItem) <= 0 then nil else tonumber((string.sub(AppInstallationIdItem, -string.len((tostring(1000)))))) else nil
	else
		return nil
	end
end

return {
	RunGfxReset = RunGfxReset,
	TemporaryOverride = function(SavedQualitySetting) --[[ Line: 93 ]]
		-- upvalues: IGMTempOverrideGfxLv5 (copy)
		if ((applicationId() or 0) + 329) % 1000 < IGMTempOverrideGfxLv5 and (SavedQualitySetting == Enum.SavedQualitySetting.QualityLevel5 or SavedQualitySetting == Enum.SavedQualitySetting.QualityLevel5.Value) then
			return true, Enum.SavedQualitySetting.Automatic.Value
		else
			return false, Enum.SavedQualitySetting.Automatic.Value
		end
	end
}