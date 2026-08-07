local corePackagesService = game:GetService("CorePackages")
local reactModule = require(corePackagesService.Packages.React)
local itemInfoList = require(corePackagesService.Workspace.Packages.ItemDetails).ItemInfoList
local useLocalization = require(corePackagesService.Workspace.Packages.Localization).Hooks.useLocalization
local var2 = require(game:GetService("CoreGui"):WaitForChild("RobloxGui").Modules.Common.httpRequest)(game:GetService("HttpRbxApiService"))
local getGameNameAndDescription = require(corePackagesService.Workspace.Packages.GameDetailRodux).GetGameNameAndDescription
local localPlayer = game:GetService("Players").LocalPlayer

return function(p0) --[[ line: 27 | named "PublishInfoList" ]]
	-- upvalues: reactModule (ref), localPlayer (ref), useLocalization (ref), getGameNameAndDescription (ref), var2 (ref), itemInfoList (ref)
	local var3 = reactModule.useRef(false)
	assert(localPlayer, "LocalPlayer must not be nil")
	local name = localPlayer.Name
	local var4, var5 = reactModule.useState(nil)
	local typeName = p0.typeName
	local layoutOrder = p0.LayoutOrder
	local var6 = useLocalization({
		creatorText = "Feature.Catalog.Label.Filter.Creator",
		attributionText = "Feature.Catalog.Label.Attribution",
		typeText = "Feature.Catalog.Label.CategoryType"
	})
	reactModule.useEffect(function() --[[ line: 43 ]]
		-- upvalues: var3 (ref), getGameNameAndDescription (copy), var2 (copy), var5 (ref)
		var3.current = true
		getGameNameAndDescription(var2, game.GameId):andThen(function(p1) --[[ line: 45 ]]
			-- upvalues: var3 (copy), var5 (copy)
			if var3.current and p1.Name then
				var5(p1.Name)
			end
		end)
		
		return function() --[[ line: 50 ]]
			-- upvalues: var3 (copy)
			var3.current = false
		end
	end, {})
	
	return reactModule.createElement(itemInfoList, {
		rowData = {
			{
				Selectable = false,
				infoName = var6.creatorText,
				infoData = name,
				hasVerifiedBadge = localPlayer.HasVerifiedBadge,
				isLoading = name == nil
			},
			{
				Selectable = false,
				infoName = var6.attributionText,
				infoData = var4,
				isLoading = var4 == nil
			},
			{
				Selectable = false,
				infoName = var6.typeText,
				infoData = typeName,
				isLoading = typeName == nil
			}
		},
		LayoutOrder = layoutOrder
	})
end