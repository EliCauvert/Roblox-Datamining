local Parent = script.Parent.Parent
local RoduxModule = require(Parent.Parent.Rodux)
local _ = require(Parent.Types.ReducerTypes)
local config = { prefillDiscoverabilitySetting = false }

return function(p1)
	-- upvalues: RoduxModule (copy), config (copy)
	return RoduxModule.createReducer(config, {
		[p1.networkingUserSettings.GetUserSettingsMetadata.Succeeded.name] = function(_, p2)
			return {
				prefillDiscoverabilitySetting = p2.responseBody and p2.responseBody.prefillDiscoverabilitySetting
			}
		end
	})
end