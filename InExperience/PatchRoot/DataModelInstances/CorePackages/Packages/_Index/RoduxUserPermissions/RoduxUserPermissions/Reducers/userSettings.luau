local Parent = script.Parent.Parent
local RoduxModule = require(Parent.Parent.Rodux)
local _ = require(Parent.Types.ReducerTypes)
local config = { canUploadContacts = nil }

return function(p1) --[[ Line: 10 ]]
	-- upvalues: RoduxModule (copy), config (copy)
	local NetworkingUserSettings = p1.networkingUserSettings
	
	return RoduxModule.createReducer(config, {
		[NetworkingUserSettings.GetUserSettings.Succeeded.name] = function(_, p2) --[[ Line: 14 ]]
			return {
				canUploadContacts = p2.responseBody and p2.responseBody.canUploadContacts
			}
		end,
		[NetworkingUserSettings.UpdateUserSettings.Succeeded.name] = function(p2, p3) --[[ Line: 22 ]]
			return if p3.postBody and p3.postBody.canUploadContacts ~= nil then { canUploadContacts = p3.postBody.canUploadContacts } else p2
		end
	})
end