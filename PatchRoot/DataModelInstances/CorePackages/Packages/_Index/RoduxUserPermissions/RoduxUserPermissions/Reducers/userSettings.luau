-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:31:09 2026 Pacific Standard Time.

local parent = script.Parent.Parent
local roduxModule = require(parent.Parent.Rodux)
local _ = require(parent.Types.ReducerTypes)
local t = { canUploadContacts = nil }

return function(p0) --[[ line: 10 ]]
	-- upvalues: roduxModule (ref), t (ref)
	local networkingUserSettings = p0.networkingUserSettings
	
	return roduxModule.createReducer(t, {
		[networkingUserSettings.GetUserSettings.Succeeded.name] = function(_, p1) --[[ line: 14 ]]
			return {
				canUploadContacts = p1.responseBody and p1.responseBody.canUploadContacts
			}
		end,
		[networkingUserSettings.UpdateUserSettings.Succeeded.name] = function(p2, p3) --[[ line: 22 ]]
			return if p3.postBody and p3.postBody.canUploadContacts ~= nil then { canUploadContacts = p3.postBody.canUploadContacts } else p2
		end
	})
end