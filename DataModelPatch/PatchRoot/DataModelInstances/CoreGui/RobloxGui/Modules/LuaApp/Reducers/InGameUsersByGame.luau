local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local ImmutableModule = require(Modules.Common.Immutable)
local ConvertUniverseIdToStringFunction = require(CorePackages.Workspace.Packages.SharedFlags).ConvertUniverseIdToString
local ReceivedUserPresence = require(CorePackages.Workspace.Packages.UserLib).Actions.ReceivedUserPresence
local UserModule = require(Modules.LuaApp.Models.User)

return function(p1, p2)
	-- upvalues: ImmutableModule (copy), ReceivedUserPresence (copy), UserModule (copy), ConvertUniverseIdToStringFunction (copy)
	local P0 = p1 or {}
	
	local function _(p3, p4)
		-- upvalues: P0 (ref), ImmutableModule (upval)
		if p4 then
			local Entry = P0[tostring(p4)]
			
			if Entry then
				P0 = ImmutableModule.Set(P0, tostring(p4), ImmutableModule.RemoveFromDictionary(Entry, p3))
			end
		end
	end
	
	local function AddUserIdToMap(p3, p4)
		-- upvalues: P0 (ref), ImmutableModule (upval)
		P0 = ImmutableModule.JoinDictionaries(P0, {
			[p4] = ImmutableModule.JoinDictionaries(P0[p4] or {}, { [p3] = p3 })
		})
	end
	
	if p2.type == ReceivedUserPresence.name then
		local Text = tostring(p2.userId)
		local Text1 = tostring(p2.previousUniverseId)
		
		if p2.presence == UserModule.PresenceType.IN_GAME then
			local ConvertUniverseIdToStringResult = ConvertUniverseIdToStringFunction(p2.universeId)
			
			if Text1 and ConvertUniverseIdToStringResult ~= Text1 and Text1 then
				local Entry = P0[tostring(Text1)]
				
				if Entry then
					P0 = ImmutableModule.Set(P0, tostring(Text1), ImmutableModule.RemoveFromDictionary(Entry, Text))
				end
			end
			AddUserIdToMap(Text, ConvertUniverseIdToStringResult)
		elseif Text1 then
			local Entry = P0[tostring(Text1)]
			
			if Entry then
				P0 = ImmutableModule.Set(P0, tostring(Text1), ImmutableModule.RemoveFromDictionary(Entry, Text))
			end
		end
	end
	return P0
end