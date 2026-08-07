local parent = script.Parent.Parent
local roduxModule = require(parent.Parent.Rodux)
local _ = require(parent.Types.ReducerTypes)
local t = { prefillDiscoverabilitySetting = false }

return function(p0) --[[ line: 10 ]]
	-- upvalues: roduxModule (ref), t (ref)
	return roduxModule.createReducer(t, {
		[p0.networkingUserSettings.GetUserSettingsMetadata.Succeeded.name] = function(_, p1) --[[ line: 14 ]]
			return {
				prefillDiscoverabilitySetting = p1.responseBody and p1.responseBody.prefillDiscoverabilitySetting
			}
		end
	})
end