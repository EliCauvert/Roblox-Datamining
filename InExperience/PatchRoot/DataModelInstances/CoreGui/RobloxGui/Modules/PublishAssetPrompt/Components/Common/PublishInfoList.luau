local CorePackages = game:GetService("CorePackages")
local ReactModule = require(CorePackages.Packages.React)
local ItemInfoList = require(CorePackages.Workspace.Packages.ItemDetails).ItemInfoList
local UseLocalizationFunction = require(CorePackages.Workspace.Packages.Localization).Hooks.useLocalization
local v1 = require(game:GetService("CoreGui"):WaitForChild("RobloxGui").Modules.Common.httpRequest)((game:GetService("HttpRbxApiService")))
local GetGameNameAndDescriptionFunction = require(CorePackages.Workspace.Packages.GameDetailRodux).GetGameNameAndDescription
local LocalPlayer = game:GetService("Players").LocalPlayer

return function(Frame)
	-- upvalues: ReactModule (copy), LocalPlayer (copy), UseLocalizationFunction (copy), GetGameNameAndDescriptionFunction (copy), v1 (copy), ItemInfoList (copy)
	local UseRefResult = ReactModule.useRef(false)
	assert(LocalPlayer, "LocalPlayer must not be nil")
	local Name = LocalPlayer.Name
	local UseStateResult, UseStateResult2 = ReactModule.useState(nil)
	local TypeName = Frame.typeName
	local LayoutOrder = Frame.LayoutOrder
	local UseLocalizationResult = UseLocalizationFunction({
		creatorText = "Feature.Catalog.Label.Filter.Creator",
		attributionText = "Feature.Catalog.Label.Attribution",
		typeText = "Feature.Catalog.Label.CategoryType"
	})
	ReactModule.useEffect(function()
		-- upvalues: UseRefResult (copy), GetGameNameAndDescriptionFunction (upval), v1 (upval), UseStateResult2 (copy)
		UseRefResult.current = true
		GetGameNameAndDescriptionFunction(v1, game.GameId):andThen(function(Result)
			-- upvalues: UseRefResult (upval), UseStateResult2 (upval)
			if UseRefResult.current and Result.Name then
				UseStateResult2(Result.Name)
			end
		end)
		
		return function()
			-- upvalues: UseRefResult (upval)
			UseRefResult.current = false
		end
	end, {})
	
	return ReactModule.createElement(ItemInfoList, {
		rowData = {
			{
				Selectable = false,
				infoName = UseLocalizationResult.creatorText,
				infoData = Name,
				hasVerifiedBadge = LocalPlayer.HasVerifiedBadge,
				isLoading = Name == nil
			},
			{
				Selectable = false,
				infoName = UseLocalizationResult.attributionText,
				infoData = UseStateResult,
				isLoading = UseStateResult == nil
			},
			{
				Selectable = false,
				infoName = UseLocalizationResult.typeText,
				infoData = TypeName,
				isLoading = TypeName == nil
			}
		},
		LayoutOrder = LayoutOrder
	})
end