local corePackagesService = game:GetService("CorePackages")
local reactModule = require(corePackagesService.Packages.React)
local itemInfoList = require(corePackagesService.Workspace.Packages.ItemDetails).ItemInfoList
local useLocalization = require(corePackagesService.Workspace.Packages.Localization).Hooks.useLocalization
local var1 = require(game:GetService("CoreGui"):WaitForChild("RobloxGui").Modules.Common.httpRequest)(game:GetService("HttpRbxApiService"))
local getGameNameAndDescription = require(corePackagesService.Workspace.Packages.GameDetailRodux).GetGameNameAndDescription
local localPlayer = game:GetService("Players").LocalPlayer

return function(p1)
	-- upvalues: reactModule (ref), localPlayer (ref), useLocalization (ref), getGameNameAndDescription (ref), var1 (ref), itemInfoList (ref)
	local var2 = reactModule.useRef(false)
	assert(localPlayer, "LocalPlayer must not be nil")
	local name = localPlayer.Name
	local var3, var4 = reactModule.useState(nil)
	local typeName = p1.typeName
	local layoutOrder = p1.LayoutOrder
	local var5 = useLocalization({
		creatorText = "Feature.Catalog.Label.Filter.Creator",
		attributionText = "Feature.Catalog.Label.Attribution",
		typeText = "Feature.Catalog.Label.CategoryType"
	})
	reactModule.useEffect(function()
		-- upvalues: var2 (ref), getGameNameAndDescription (copy), var1 (copy), var4 (ref)
		var2.current = true
		getGameNameAndDescription(var1, game.GameId):andThen(function(p2)
			-- upvalues: var2 (copy), var4 (copy)
			if var2.current and p2.Name then
				var4(p2.Name)
			end
		end)
		
		return function()
			-- upvalues: var2 (copy)
			var2.current = false
		end
	end, {})
	
	return reactModule.createElement(itemInfoList, {
		rowData = {
			{
				Selectable = false,
				infoName = var5.creatorText,
				infoData = name,
				hasVerifiedBadge = localPlayer.HasVerifiedBadge,
				isLoading = name == nil
			},
			{
				Selectable = false,
				infoName = var5.attributionText,
				infoData = var3,
				isLoading = var3 == nil
			},
			{
				Selectable = false,
				infoName = var5.typeText,
				infoData = typeName,
				isLoading = typeName == nil
			}
		},
		LayoutOrder = layoutOrder
	})
end