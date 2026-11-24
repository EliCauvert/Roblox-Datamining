local CorePackages = game:GetService("CorePackages")
local ReactModule = require(CorePackages.Packages.React)
local SignalsReactModule = require(CorePackages.Packages.SignalsReact)
local AppFonts = require(CorePackages.Workspace.Packages.Style).AppFonts
local UseStyleFunction = require(CorePackages.Packages.UIBlox).Core.Style.useStyle
local DataHydrationModule = require(CorePackages.Workspace.Packages.DataHydration)
local GetAgeRecommendationStoreFunction = DataHydrationModule.Game.getAgeRecommendationStore
local DataStatus = DataHydrationModule.DataHydrationTypes.DataStatus
local IsSideSheetEnabledModule = require(CorePackages.Workspace.Packages.InExperienceSideSheetUtils.isSideSheetEnabled)

return function()
	-- upvalues: UseStyleFunction (copy), IsSideSheetEnabledModule (copy), ReactModule (copy), GetAgeRecommendationStoreFunction (copy), DataStatus (copy), SignalsReactModule (copy), AppFonts (copy)
	local UseStyleResult = UseStyleFunction()
	local _UDim2: UDim2 = if IsSideSheetEnabledModule then UDim2.fromOffset(-6, -2) else UDim2.fromOffset(0, 2)
	local Text = tostring(game.GameId)
	local UseSignalStateResult = SignalsReactModule.useSignalState((ReactModule.useCallback(function(p1)
		-- upvalues: GetAgeRecommendationStoreFunction (upval), Text (copy), DataStatus (upval)
		local AndFetchAgeRecommendation = GetAgeRecommendationStoreFunction(p1).getAndFetchAgeRecommendation(Text)
		local StatusResult = AndFetchAgeRecommendation.status(p1)
		
		if StatusResult == DataStatus.Failed then
			return "12+"
		elseif StatusResult == DataStatus.NotReady then
			return nil
		else
			local DataResult = AndFetchAgeRecommendation.data(p1)
			local MinimumAgeDisplay = DataResult and DataResult.minimumAgeDisplay
			
			return if MinimumAgeDisplay then MinimumAgeDisplay else "12+"
		end
	end, { Text })))
	
	return if UseSignalStateResult == nil then nil else ReactModule.createElement("TextLabel", {
		TextSize = 12,
		BackgroundTransparency = 0,
		LineHeight = 1.25,
		ZIndex = 2,
		AnchorPoint = Vector2.new(0.5, 0),
		Position = _UDim2,
		Text = UseSignalStateResult or "12+",
		Font = AppFonts.default:getBold(),
		TextColor3 = UseStyleResult.Theme.TextEmphasis.Color,
		BackgroundColor3 = UseStyleResult.Theme.BackgroundUIContrast.Color,
		AutomaticSize = Enum.AutomaticSize.XY
	}, {
		Padding = ReactModule.createElement("UIPadding", {
			PaddingTop = UDim.new(0, 2),
			PaddingBottom = UDim.new(0, 2),
			PaddingLeft = UDim.new(0, 6),
			PaddingRight = UDim.new(0, 6)
		}),
		Shape = ReactModule.createElement("UICorner", { CornerRadius = UDim.new(0, 8) })
	})
end