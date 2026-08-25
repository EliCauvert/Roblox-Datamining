game:DefineFastFlag("AddPeoplePageCardLayout4", false)
local addPeoplePageLayoutSettingsEngineFeature = game:GetEngineFeature("AddPeoplePageLayoutSettings")

return function()
	-- upvalues: addPeoplePageLayoutSettingsEngineFeature (ref)
	return game:GetFastFlag("AddPeoplePageCardLayout4") and addPeoplePageLayoutSettingsEngineFeature
end