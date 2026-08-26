local gameSettings = UserSettings().GameSettings
local IGMResetGfxQuality = game:DefineFastFlag("IGMResetGfxQuality", false)
local IGMRevertGfxQuality = game:DefineFastFlag("IGMRevertGfxQuality", false)
local IGMRevertGfxLv5Only = game:DefineFastFlag("IGMRevertGfxLv5Only", false)
local IGMResetGfxLv5Only = game:DefineFastFlag("IGMResetGfxLv5Only", false)
local IGMAlwaysResetGfxLv5 = game:DefineFastFlag("IGMAlwaysResetGfxLv5", false)
local IGMTempOverrideGfxLv5 = game:DefineFastInt("IGMTempOverrideGfxLv5", 0)

local function _(value)
	for i, v in Enum.SavedQualitySetting:GetEnumItems() do
		if v.Value == value then
			return v
		end
	end
	return Enum.SavedQualitySetting.Automatic
end

local function RunGfxReset()
	-- upvalues: IGMAlwaysResetGfxLv5 (ref), gameSettings (ref), IGMRevertGfxQuality (ref), IGMRevertGfxLv5Only (ref), IGMResetGfxQuality (ref), IGMResetGfxLv5Only (ref)
	local var1 = gameSettings.SavedQualityLevel == Enum.SavedQualitySetting.QualityLevel5
	
	if IGMAlwaysResetGfxLv5 and var1 then
		gameSettings.SavedQualityLevel = Enum.SavedQualitySetting.Automatic
	end
	if game:GetEngineFeature("QualityLevelReset") then
		local qualityResetLevel
		if IGMRevertGfxQuality then
			if gameSettings.QualityResetLevel >= 0 then
				local automatic
				qualityResetLevel = gameSettings.QualityResetLevel
				
				for i, v in Enum.SavedQualitySetting:GetEnumItems() do
					if v.Value == qualityResetLevel then
						automatic = v
						if IGMRevertGfxLv5Only and automatic == Enum.SavedQualitySetting.QualityLevel5 or IGMRevertGfxLv5Only == false then
							gameSettings.SavedQualityLevel = automatic
							gameSettings.QualityResetLevel = -1
							
							return
						end
					end
				end
				automatic = Enum.SavedQualitySetting.Automatic
			end
		elseif IGMResetGfxQuality then
			local var2 = IGMResetGfxLv5Only
			qualityResetLevel = gameSettings.QualityResetLevel
			
			if qualityResetLevel < 0 or qualityResetLevel == nil then
				local value = gameSettings.SavedQualityLevel.Value
				
				if var1 and var2 or var2 == false then
					gameSettings.SavedQualityLevel = Enum.SavedQualitySetting.Automatic
				end
				gameSettings.QualityResetLevel = value
			end
		end
	end
end

function applicationId()
	local appStorageService = game:GetService("AppStorageService")
	
	if not appStorageService then
		return nil
	end
	local appInstallationIdItem = appStorageService:GetItem("AppInstallationId")
	local var3 = typeof(appInstallationIdItem)
	
	return if var3 == "number" then tonumber(appInstallationIdItem) or nil elseif var3 == "string" then if string.len(appInstallationIdItem) <= 0 then nil else tonumber(string.sub(appInstallationIdItem, -string.len(tostring(1000)))) else nil
end

return {
	RunGfxReset = RunGfxReset,
	TemporaryOverride = function(p1)
		-- upvalues: IGMTempOverrideGfxLv5 (ref)
		if ((applicationId() or 0) + 329) % 1000 < IGMTempOverrideGfxLv5 and (p1 == Enum.SavedQualitySetting.QualityLevel5 or p1 == Enum.SavedQualitySetting.QualityLevel5.Value) then
			return true, Enum.SavedQualitySetting.Automatic.Value
		end
		return false, Enum.SavedQualitySetting.Automatic.Value
	end
}