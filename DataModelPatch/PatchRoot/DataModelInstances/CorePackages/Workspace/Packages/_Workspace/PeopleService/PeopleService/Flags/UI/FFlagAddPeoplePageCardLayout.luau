game:DefineFastFlag("AddPeoplePageCardLayout4", false)
local AddPeoplePageLayoutSettingsEngineFeature = game:GetEngineFeature("AddPeoplePageLayoutSettings")

return function()
	-- upvalues: AddPeoplePageLayoutSettingsEngineFeature (copy)
	return game:GetFastFlag("AddPeoplePageCardLayout4") and AddPeoplePageLayoutSettingsEngineFeature
end