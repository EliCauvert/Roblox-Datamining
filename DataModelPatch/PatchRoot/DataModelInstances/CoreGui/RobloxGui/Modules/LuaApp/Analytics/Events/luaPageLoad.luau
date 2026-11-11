local LocalizationService = game:GetService("LocalizationService")
local CorePackages = game:GetService("CorePackages")
local CryoModule = require(CorePackages.Packages.Cryo)
local ArgCheckModule = require(CorePackages.Workspace.Packages.ArgCheck)

return function(p1, p2, Page, Detail: string?, p3)
	-- upvalues: ArgCheckModule (copy), LocalizationService (copy), CryoModule (copy)
	ArgCheckModule.isType(p2, "string", "eventContext")
	ArgCheckModule.isType(Page, "string", "name")
	
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
	
	if p3 ~= nil then
		JoinResult = CryoModule.Dictionary.join(JoinResult, p3)
	end
	p1:setRBXEventStream(p2, "luaPageLoad", JoinResult)
end