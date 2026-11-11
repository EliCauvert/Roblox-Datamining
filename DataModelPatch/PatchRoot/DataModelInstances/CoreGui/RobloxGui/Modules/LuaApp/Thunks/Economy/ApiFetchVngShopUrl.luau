local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local PromiseModule = require(Modules.LuaApp.Promise)
local GetVngShopUrlModule = require(Modules.LuaApp.Http.Requests.VngPayments.GetVngShopUrl)
local _ = require(CorePackages.Workspace.Packages.Http)
local GetFStringVNGWebshopUrlFunction = require(CorePackages.Workspace.Packages.SharedFlags).GetFStringVNGWebshopUrl

return function(p1)
	-- upvalues: GetVngShopUrlModule (copy), GetFStringVNGWebshopUrlFunction (copy), PromiseModule (copy)
	return function(_)
		-- upvalues: GetVngShopUrlModule (upval), p1 (copy), GetFStringVNGWebshopUrlFunction (upval), PromiseModule (upval)
		return GetVngShopUrlModule(p1):andThen(function(Entry)
			-- upvalues: GetFStringVNGWebshopUrlFunction (upval), PromiseModule (upval)
			return if Entry == nil or Entry[1] == nil then PromiseModule.resolve({ vngShopRedirectUrl = GetFStringVNGWebshopUrlFunction() }) else PromiseModule.resolve({ vngShopRedirectUrl = Entry[1].vngShopRedirectUrl })
		end):catch(function(_)
			-- upvalues: GetFStringVNGWebshopUrlFunction (upval), PromiseModule (upval)
			return PromiseModule.resolve({ vngShopRedirectUrl = GetFStringVNGWebshopUrlFunction() })
		end)
	end
end