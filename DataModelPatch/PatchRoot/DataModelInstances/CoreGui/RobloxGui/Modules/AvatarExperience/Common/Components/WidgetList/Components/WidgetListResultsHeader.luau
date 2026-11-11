local CorePackages = game:GetService("CorePackages")
local ReactModule = require(CorePackages.Packages.React)
local ResultsHeaderModule = require(game:GetService("CoreGui").RobloxGui.Modules.AvatarExperience.Catalog.Components.Search.ResultsHeader)
local UseTokensFunction = require(CorePackages.Packages.Foundation).Hooks.useTokens

return function(p1)
	-- upvalues: UseTokensFunction (copy), ReactModule (copy), ResultsHeaderModule (copy)
	local UseTokensResult = UseTokensFunction()
	
	return ReactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		AutomaticSize = Enum.AutomaticSize.XY
	}, {
		UIListLayout = ReactModule.createElement("UIPadding", {
			PaddingBottom = UDim.new(0, UseTokensResult.Size.Size_300),
			PaddingTop = if p1.pillBarVisible then nil else UDim.new(0, UseTokensResult.Size.Size_500)
		}),
		ResultsHeader = if p1.hideResultsHeader then nil else ReactModule.createElement(ResultsHeaderModule, { searchUuid = p1.searchUuid })
	})
end