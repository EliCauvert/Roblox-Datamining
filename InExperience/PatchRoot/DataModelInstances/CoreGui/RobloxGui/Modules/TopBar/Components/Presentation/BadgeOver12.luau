local CorePackages = game:GetService("CorePackages")
local ReactModule = require(CorePackages.Packages.React)
local SignalsReactModule = require(CorePackages.Packages.SignalsReact)
local AppFonts = require(CorePackages.Workspace.Packages.Style).AppFonts
local UseStyleFunction = require(CorePackages.Packages.UIBlox).Core.Style.useStyle
local DataHydrationModule = require(CorePackages.Workspace.Packages.DataHydration)
local GetAgeRecommendationStoreFunction = DataHydrationModule.Game.getAgeRecommendationStore
local DataStatus = DataHydrationModule.DataHydrationTypes.DataStatus
local FFlagShowGameAgeRating = require(CorePackages.Workspace.Packages.SharedFlags).FFlagShowGameAgeRating
local IsSideSheetEnabledModule = require(CorePackages.Workspace.Packages.InExperienceSideSheetUtils.isSideSheetEnabled)

return function(p1) --[[ Line: 23 ]]
	-- upvalues: UseStyleFunction (copy), FFlagShowGameAgeRating (copy), IsSideSheetEnabledModule (copy), ReactModule (copy), GetAgeRecommendationStoreFunction (copy), DataStatus (copy), SignalsReactModule (copy), AppFonts (copy)
	local UseStyleResult = UseStyleFunction()
	local _UDim2 = if FFlagShowGameAgeRating then if IsSideSheetEnabledModule then UDim2.fromOffset(-6, -2) else UDim2.fromOffset(0, 2) else p1.position
	local UseSignalStateResult = nil
	
	if FFlagShowGameAgeRating then
		local Text = tostring(game.GameId)
		UseSignalStateResult = SignalsReactModule.useSignalState((ReactModule.useCallback(function(p2) --[[ Line: 33 ]]
			-- upvalues: GetAgeRecommendationStoreFunction (upval), Text (copy), DataStatus (upval)
			local AndFetchAgeRecommendation = GetAgeRecommendationStoreFunction(p2).getAndFetchAgeRecommendation(Text)
			local StatusResult = AndFetchAgeRecommendation.status(p2)
			
			if StatusResult == DataStatus.Failed then
				return "12+"
			elseif StatusResult == DataStatus.NotReady then
				return nil
			else
				local DataResult = AndFetchAgeRecommendation.data(p2)
				local MinimumAgeDisplay = DataResult and DataResult.minimumAgeDisplay
				
				return if MinimumAgeDisplay then MinimumAgeDisplay else "12+"
			end
		end, { Text })))
		
		if UseSignalStateResult == nil then
			return nil
		end
	end
	return ReactModule.createElement("TextLabel", {
		BackgroundTransparency = 0,
		LineHeight = 1.25,
		ZIndex = 2,
		AnchorPoint = if FFlagShowGameAgeRating then Vector2.new(0.5, 0) else Vector2.new(0, 1),
		Position = _UDim2,
		Text = UseSignalStateResult or "12+",
		Font = if FFlagShowGameAgeRating then AppFonts.default:getBold() else AppFonts.default:getMedium(),
		TextSize = if FFlagShowGameAgeRating then 12 else 9,
		TextColor3 = UseStyleResult.Theme.TextEmphasis.Color,
		BackgroundColor3 = UseStyleResult.Theme.BackgroundUIContrast.Color,
		AutomaticSize = Enum.AutomaticSize.XY
	}, {
		Padding = ReactModule.createElement("UIPadding", {
			PaddingTop = if FFlagShowGameAgeRating then UDim.new(0, 2) else nil,
			PaddingBottom = if FFlagShowGameAgeRating then UDim.new(0, 2) else nil,
			PaddingLeft = if FFlagShowGameAgeRating then UDim.new(0, 6) else UDim.new(0, 2),
			PaddingRight = if FFlagShowGameAgeRating then UDim.new(0, 6) else UDim.new(0, 2)
		}),
		Shape = ReactModule.createElement("UICorner", { CornerRadius = UDim.new(0, 8) })
	})
end