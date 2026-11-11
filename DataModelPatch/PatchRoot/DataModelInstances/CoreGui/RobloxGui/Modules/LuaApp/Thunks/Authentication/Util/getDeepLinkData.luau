local GetMetaDataFromShareLinkModule = require(game:GetService("CoreGui").RobloxGui.Modules.LuaApp.Thunks.Authentication.AuthIntent.GetMetaDataFromShareLink)

function getDeepLinkData(p1, p2)
	-- upvalues: GetMetaDataFromShareLinkModule (copy)
	local CodeTypeStamp, CodeTypeStamp2, CodeTypeStamp3 = p2:match("code=(.-)&type=(.-)&stamp=(.*)")
	
	if not CodeTypeStamp3 then
		CodeTypeStamp, CodeTypeStamp2 = p2:match("code=(.-)&type=(.*)")
	end
	if not CodeTypeStamp or not CodeTypeStamp2 then
		warn("Failed to parse deep link data for url:", p2)
		
		return nil
	end
	local v1, v2 = GetMetaDataFromShareLinkModule(p1, CodeTypeStamp, CodeTypeStamp2):await()
	
	if v1 and v2 then
		return {
			universeId = v2.universeId,
			inviterId = v2.inviterId,
			placeId = v2.placeId
		}
	else
		warn("Failed to get deep link data for url:", p2, "Got:", v2)
		
		return nil
	end
end

return getDeepLinkData