game:DefineFastFlag("AddPeoplePageCardLayout4", false)
local AddPeoplePageLayoutSettingsEngineFeature = game:GetEngineFeature("AddPeoplePageLayoutSettings")

return function() --[[ Line: 5 ]]
	-- upvalues: AddPeoplePageLayoutSettingsEngineFeature (copy)
	return game:GetFastFlag("AddPeoplePageCardLayout4") and AddPeoplePageLayoutSettingsEngineFeature
end