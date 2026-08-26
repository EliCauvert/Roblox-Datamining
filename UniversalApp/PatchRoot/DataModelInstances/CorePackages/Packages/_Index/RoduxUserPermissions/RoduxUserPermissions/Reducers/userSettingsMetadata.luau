local parent = script.Parent.Parent
local roduxModule = require(parent.Parent.Rodux)
local _ = require(parent.Types.ReducerTypes)
local t = { prefillDiscoverabilitySetting = false }

return function(p1)
	-- upvalues: roduxModule (ref), t (ref)
	return roduxModule.createReducer(t, {
		[p1.networkingUserSettings.GetUserSettingsMetadata.Succeeded.name] = function(_, p2)
			return {
				prefillDiscoverabilitySetting = p2.responseBody and p2.responseBody.prefillDiscoverabilitySetting
			}
		end
	})
end