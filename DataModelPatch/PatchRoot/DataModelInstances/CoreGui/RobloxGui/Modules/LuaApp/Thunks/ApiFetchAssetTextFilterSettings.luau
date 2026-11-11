local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CorePackages = game:GetService("CorePackages")
local Logging = require(CorePackages.Workspace.Packages.AppCommonLib).Logging
local PromiseModule = require(Modules.LuaApp.Promise)
local PerformFetch = require(CorePackages.Workspace.Packages.Http).PerformFetch
local SetNetworkingErrorToastModule = require(Modules.LuaApp.Thunks.SetNetworkingErrorToast)
local SetAssetTextFilterSettingsModule = require(Modules.LuaApp.Actions.SetAssetTextFilterSettings)
local GetAssetTextFilterSettingsModule = require(Modules.LuaApp.Http.Requests.GetAssetTextFilterSettings)

local function _(Text): string
	return "luaapp.asset-text-filter-settings.get-settings" .. Text
end

return {
	Fetch = function(p1, Text)
		-- upvalues: PerformFetch (copy), GetAssetTextFilterSettingsModule (copy), Logging (copy), PromiseModule (copy), SetAssetTextFilterSettingsModule (copy), SetNetworkingErrorToastModule (copy)
		return PerformFetch.Single("luaapp.asset-text-filter-settings.get-settings" .. Text, function(p2)
			-- upvalues: GetAssetTextFilterSettingsModule (upval), p1 (copy), Text (copy), Logging (upval), PromiseModule (upval), SetAssetTextFilterSettingsModule (upval), SetNetworkingErrorToastModule (upval)
			return GetAssetTextFilterSettingsModule(p1, Text):andThen(function(Result)
				-- upvalues: Logging (upval), Text (upval), PromiseModule (upval), p2 (copy), SetAssetTextFilterSettingsModule (upval)
				local ResponseBody = Result.responseBody
				
				if ResponseBody == nil then
					p2:dispatch(SetAssetTextFilterSettingsModule(Text, false))
					
					return PromiseModule.reject({ HttpError = Enum.HttpError.OK })
				end
				local Profanity = false
				
				if ResponseBody.Profanity == nil then
					Logging.warn("Failed to parse GetAssetTextFilterSettings for `" .. Text .. "`")
					
					return PromiseModule.reject(false)
				end
				Profanity = ResponseBody.Profanity
				p2:dispatch(SetAssetTextFilterSettingsModule(Text, Profanity))
				
				return PromiseModule.resolve(Profanity)
			end, function(p3)
				-- upvalues: p2 (copy), SetAssetTextFilterSettingsModule (upval), Text (upval), SetNetworkingErrorToastModule (upval), PromiseModule (upval)
				p2:dispatch(SetAssetTextFilterSettingsModule(Text, false))
				p2:dispatch(SetNetworkingErrorToastModule(p3))
				
				return PromiseModule.reject(p3)
			end)
		end)
	end,
	GetFetchingStatus = function(p1, Text)
		-- upvalues: PerformFetch (copy)
		return PerformFetch.GetStatus(p1, "luaapp.asset-text-filter-settings.get-settings" .. Text)
	end
}