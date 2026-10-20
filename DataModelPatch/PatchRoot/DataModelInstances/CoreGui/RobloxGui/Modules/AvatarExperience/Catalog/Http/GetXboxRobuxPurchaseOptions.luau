local PlatformService = nil
pcall(function()
	-- upvalues: PlatformService (ref)
	PlatformService = game:GetService("PlatformService")
end)
local PromiseModule = require(game:GetService("CorePackages").Packages.Promise)

local function _(p1): number
	local Replaced = string.gsub(p1 and p1.Name, ",", "")
	local Match: string = Replaced and string.match(Replaced, "[0-9]+") or nil
	
	return Match and tonumber(Match) or 1000
end

local function createAvailableProductsTable(List)
	local List1 = {}
	
	for _, value in List do
		local Replaced = string.gsub(value and value.Name, ",", "")
		local Match: string = Replaced and string.match(Replaced, "[0-9]+") or nil
		table.insert(List1, {
			robuxValue = Match and tonumber(Match) or 1000,
			productId = value.ProductId
		})
	end
	return List1
end

return function()
	-- upvalues: PromiseModule (copy), PlatformService (ref), createAvailableProductsTable (copy)
	return PromiseModule.new(function(Callback1: (any) -> (), Callback: (any) -> ())
		-- upvalues: PlatformService (upval)
		local Success, Result = pcall(function()
			-- upvalues: PlatformService (upval)
			return PlatformService:BeginGetCatalogInfo()
		end)
		
		if Success and Result then
			Callback1(Result)
			
			return
		else
			Callback(Result)
		end
	end):andThen(function(Result)
		-- upvalues: PromiseModule (upval), createAvailableProductsTable (upval)
		return PromiseModule.resolve((createAvailableProductsTable(Result)))
	end)
end