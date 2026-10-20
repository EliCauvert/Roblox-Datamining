local LocalizationService = game:GetService("LocalizationService")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local ArgCheckModule = require(Modules.LuaApp.ArgCheck)
local CryoModule = require(game:GetService("CorePackages").Packages.Cryo)
local GetFStringLuaAppUnloadEventEnabledPageNamesModule = require(Modules.LuaApp.Flags.GetFStringLuaAppUnloadEventEnabledPageNames)

local function _(p1): boolean
	-- upvalues: GetFStringLuaAppUnloadEventEnabledPageNamesModule (copy)
	local FStringLuaAppUnloadEventEnabledPageNamesModule: string = GetFStringLuaAppUnloadEventEnabledPageNamesModule()
	
	if FStringLuaAppUnloadEventEnabledPageNamesModule and #FStringLuaAppUnloadEventEnabledPageNamesModule > 0 then
		for _, value in string.split(FStringLuaAppUnloadEventEnabledPageNamesModule, ",") do
			if value == p1 then
				return true
			end
		end
	end
	return false
end

return function(p2, p3, Page, Detail: string?, p4)
	-- upvalues: ArgCheckModule (copy), GetFStringLuaAppUnloadEventEnabledPageNamesModule (copy), LocalizationService (copy), CryoModule (copy)
	ArgCheckModule.isType(p3, "string", "eventContext")
	ArgCheckModule.isType(Page, "string", "name")
	local FStringLuaAppUnloadEventEnabledPageNamesModule: string = GetFStringLuaAppUnloadEventEnabledPageNamesModule()
	local Flag = nil
	repeat
		if FStringLuaAppUnloadEventEnabledPageNamesModule and #FStringLuaAppUnloadEventEnabledPageNamesModule > 0 then
			for _, value in string.split(FStringLuaAppUnloadEventEnabledPageNamesModule, ",") do
				if value == Page then
					Flag = true
					break
				end
			end
		end
		Flag = false
	until true
	if Flag then
		if Detail ~= nil then
			if type(Detail) == "number" then
				Detail = tostring(Detail)
			end
			if type(Detail) ~= "string" then
				Detail = nil
			end
		end
		local JoinResult = {
			page = Page,
			detail = Detail,
			locale = LocalizationService.RobloxLocaleId
		}
		
		if p4 then
			JoinResult = CryoModule.Dictionary.join(JoinResult, p4)
		end
		p2:setRBXEventStream(p3, "luaPageUnload", JoinResult)
	end
end