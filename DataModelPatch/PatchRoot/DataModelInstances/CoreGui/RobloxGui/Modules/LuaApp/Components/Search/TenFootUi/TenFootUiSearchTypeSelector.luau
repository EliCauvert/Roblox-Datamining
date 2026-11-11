local CorePackages = game:GetService("CorePackages")
local ReactModule = require(CorePackages.Packages.React)
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local UseDesignTokensFunction = require(CorePackages.Workspace.Packages.Style).useDesignTokens
local SearchTypes = require(CorePackages.Workspace.Packages.RobloxAppEnums).SearchTypes
local UseLocalizationModule = require(game:GetService("CoreGui").RobloxGui.Modules.LuaApp.Hooks.useLocalization)
local IconTabGroup = UIBloxModule.App.Navigation.PrimaryNavBar.IconTabGroup
local Images = UIBloxModule.App.ImageSet.Images
local FFlagLuaAppSearchStandardizeAssetCategorization = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppSearchStandardizeAssetCategorization

return function(p1)
	-- upvalues: UseDesignTokensFunction (copy), UseLocalizationModule (copy), FFlagLuaAppSearchStandardizeAssetCategorization (copy), ReactModule (copy), IconTabGroup (copy), Images (copy), SearchTypes (copy)
	local LayoutOrder = p1.layoutOrder
	local SearchType = p1.searchType
	local OnSearchTypeSelectedFunction = p1.onSearchTypeSelected
	local UseDesignTokensResult = UseDesignTokensFunction()
	local UseLocalizationModuleResult = UseLocalizationModule({
		players = "CommonUI.Features.Label.Players",
		games = if FFlagLuaAppSearchStandardizeAssetCategorization then "CommonUI.Features.Label.Games" else "CommonUI.Features.Label.Game"
	})
	
	return ReactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = UDim2.new(UseDesignTokensResult.LuaApps.Search.SearchHeadingScale, 0, 0, 0),
		Position = UDim2.fromScale(1 - UseDesignTokensResult.LuaApps.Search.SearchHeadingScale, 0),
		LayoutOrder = LayoutOrder,
		AutomaticSize = Enum.AutomaticSize.Y
	}, {
		Padding = ReactModule.createElement("UIPadding", {
			PaddingTop = UDim.new(0, UseDesignTokensResult.LuaApps.Search.SearchTypePaddingVertical),
			PaddingBottom = UDim.new(0, UseDesignTokensResult.LuaApps.Search.SearchTypePaddingVertical)
		}),
		SearchTypeSelector = ReactModule.createElement(IconTabGroup, {
			items = {
				{
					title = UseLocalizationModuleResult.games,
					icon = Images["icons/common/play"],
					onActivated = function()
						-- upvalues: OnSearchTypeSelectedFunction (copy), SearchTypes (upval)
						OnSearchTypeSelectedFunction(SearchTypes.Games)
					end,
					showRoundedBackground = SearchType == SearchTypes.Games
				},
				{
					title = UseLocalizationModuleResult.players,
					icon = Images["icons/menu/profile"],
					onActivated = function()
						-- upvalues: OnSearchTypeSelectedFunction (copy), SearchTypes (upval)
						OnSearchTypeSelectedFunction(SearchTypes.Players)
					end,
					showRoundedBackground = SearchType == SearchTypes.Players
				}
			}
		})
	})
end