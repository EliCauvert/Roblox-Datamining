local parent = script.Parent.Parent
local roduxModule = require(parent.Parent.Rodux)
local _ = require(parent.Types.ReducerTypes)
local t = { canUploadContacts = nil }

return function(p1)
	-- upvalues: roduxModule (ref), t (ref)
	local networkingUserSettings = p1.networkingUserSettings
	
	return roduxModule.createReducer(t, {
		[networkingUserSettings.GetUserSettings.Succeeded.name] = function(_, p2)
			return {
				canUploadContacts = p2.responseBody and p2.responseBody.canUploadContacts
			}
		end,
		[networkingUserSettings.UpdateUserSettings.Succeeded.name] = function(p2, p3)
			return if p3.postBody and p3.postBody.canUploadContacts ~= nil then { canUploadContacts = p3.postBody.canUploadContacts } else p2
		end
	})
end