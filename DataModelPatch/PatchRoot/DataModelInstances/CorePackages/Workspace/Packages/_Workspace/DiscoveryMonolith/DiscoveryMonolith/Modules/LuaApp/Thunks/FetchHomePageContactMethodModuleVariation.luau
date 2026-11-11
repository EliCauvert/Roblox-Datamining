local HttpService = game:GetService("HttpService")
local Modules = script:FindFirstAncestor("DiscoveryMonolith").Modules
local GetHomePageUpsellCardVariationModule = require(Modules.LuaApp.Http.Requests.GetHomePageUpsellCardVariation)
local SetHomePageUpsellCardVariationModule = require(Modules.LuaApp.Actions.SetHomePageUpsellCardVariation)
local DebugHomePageUpsellCardVariationResponseBody = game:DefineFastString("DebugHomePageUpsellCardVariationResponseBody", "")

return function(p1)
	-- upvalues: GetHomePageUpsellCardVariationModule (copy), DebugHomePageUpsellCardVariationResponseBody (copy), HttpService (copy), SetHomePageUpsellCardVariationModule (copy)
	return function(p2)
		-- upvalues: GetHomePageUpsellCardVariationModule (upval), p1 (copy), DebugHomePageUpsellCardVariationResponseBody (upval), HttpService (upval), SetHomePageUpsellCardVariationModule (upval)
		return GetHomePageUpsellCardVariationModule(p1):andThen(function(Result)
			-- upvalues: DebugHomePageUpsellCardVariationResponseBody (upval), HttpService (upval), p2 (copy), SetHomePageUpsellCardVariationModule (upval)
			if not Result or not Result.responseBody then
				p2:dispatch(SetHomePageUpsellCardVariationModule("", "", ""))
				
				return
			end
			local ResponseBody = Result.responseBody
			
			if DebugHomePageUpsellCardVariationResponseBody ~= "" then
				local _, Result1 = pcall(function()
					-- upvalues: HttpService (upval), DebugHomePageUpsellCardVariationResponseBody (upval)
					return HttpService:JSONDecode(DebugHomePageUpsellCardVariationResponseBody)
				end)
				
				if Result1 then
					ResponseBody = Result1
				end
			end
			p2:dispatch(SetHomePageUpsellCardVariationModule(ResponseBody.upsellCardType or "", ResponseBody.localizedTitleTextOverride or "", ResponseBody.localizedBodyTextOverride or "", ResponseBody.upsellCardV2Config or nil))
		end, function(_)
			-- upvalues: p2 (copy), SetHomePageUpsellCardVariationModule (upval)
			p2:dispatch(SetHomePageUpsellCardVariationModule("", "", ""))
		end)
	end
end