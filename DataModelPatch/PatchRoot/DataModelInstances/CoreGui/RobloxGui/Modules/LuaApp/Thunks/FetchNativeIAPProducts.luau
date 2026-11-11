local Modules = game:GetService("CoreGui").RobloxGui.Modules
local Default = require(game:GetService("CorePackages").Workspace.Packages.PaymentsProtocol).PaymentsProtocol.default
local SetNativeRobuxProductsModule = require(Modules.LuaApp.Actions.SetNativeRobuxProducts)
local PlatformService = nil
pcall(function()
	-- upvalues: PlatformService (ref)
	PlatformService = game:GetService("PlatformService")
end)
local GetFFlagNativeProductFallbackToPlatformServiceModule = require(Modules.LuaApp.Flags.GetFFlagNativeProductFallbackToPlatformService)

local function _(p1): number
	return (tonumber((string.gsub(p1.Name, "%D+", ""))))
end

return {
	Fetch = function()
		-- upvalues: Default (copy), SetNativeRobuxProductsModule (copy), GetFFlagNativeProductFallbackToPlatformServiceModule (copy), PlatformService (ref)
		return function(p1)
			-- upvalues: Default (upval), SetNativeRobuxProductsModule (upval), GetFFlagNativeProductFallbackToPlatformServiceModule (upval), PlatformService (upval)
			Default:isAvailable():andThen(function(Result)
				-- upvalues: Default (upval), p1 (copy), SetNativeRobuxProductsModule (upval), GetFFlagNativeProductFallbackToPlatformServiceModule (upval), PlatformService (upval)
				local function v6(A, B): boolean
					return A.robuxAmount < B.robuxAmount
				end
				
				if Result then
					Default:listNativeProducts():andThen(function(Result)
						-- upvalues: v6 (copy), p1 (upval), SetNativeRobuxProductsModule (upval)
						table.sort(Result.products, v6)
						p1:dispatch(SetNativeRobuxProductsModule(Result.products))
					end)
					
					return
				end
				if not GetFFlagNativeProductFallbackToPlatformServiceModule() then
					local BeginGetCatalogInfoResult = p1
					BeginGetCatalogInfoResult:dispatch(SetNativeRobuxProductsModule(nil))
					
					return
				end
				local BeginGetCatalogInfoResult = nil
				local Success, _ = pcall(function()
					-- upvalues: BeginGetCatalogInfoResult (ref), PlatformService (upval)
					BeginGetCatalogInfoResult = PlatformService:BeginGetCatalogInfo()
				end)
				
				if Success then
					local List = {}
					
					for _, value in BeginGetCatalogInfoResult do
						table.insert(List, {
							productId = value.Name,
							price = tonumber(value.Price) or 0,
							nativeProductId = value.ProductId,
							robuxAmount = tonumber((string.gsub(value.Name, "%D+", ""))) or 0,
							displayPrice = value.DisplayPrice
						})
					end
					table.sort(List, v6)
					p1:dispatch(SetNativeRobuxProductsModule(List))
				else
					p1:dispatch(SetNativeRobuxProductsModule(nil))
				end
			end)
		end
	end
}