local CorePackages = game:GetService("CorePackages")
local HttpService = game:GetService("HttpService")
local ReactModule = require(CorePackages.Packages.React)
local UseDesignTokensFunction = require(CorePackages.Workspace.Packages.Style).useDesignTokens
local PlayerSearchModule = require(game:GetService("CoreGui").RobloxGui.Modules.LuaApp.Components.UserSearch.Players.PlayerSearch)
local SearchTypes = require(CorePackages.Workspace.Packages.RobloxAppEnums).SearchTypes

return function(p1)
	-- upvalues: UseDesignTokensFunction (copy), SearchTypes (copy), ReactModule (copy), HttpService (copy), PlayerSearchModule (copy)
	local SearchKeyword = p1.searchKeyword
	local LayoutOrder = p1.layoutOrder
	local SearchType = p1.searchType
	local SearchBoxAndTypeOffset = UseDesignTokensFunction().LuaApps.Search.SearchBoxAndTypeOffset
	
	return if SearchType == SearchTypes.Players then ReactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		Size = UDim2.new(1, 0, 1, -SearchBoxAndTypeOffset),
		LayoutOrder = LayoutOrder
	}, {
		["PlayerSearch_" .. SearchKeyword] = ReactModule.createElement(PlayerSearchModule, {
			backgroundTransparency = 1,
			enableNewEmptySearchUI = false,
			searchParameters = {
				isKeywordSuggestionEnabled = true,
				searchKeyword = SearchKeyword
			},
			searchUuid = ReactModule.useRef(HttpService:GenerateGUID(false)).current
		})
	}) else ReactModule.createElement(ReactModule.Fragment, nil, {})
end