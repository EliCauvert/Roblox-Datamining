local corePackagesService = game:GetService("CorePackages")
local reactModule = require(corePackagesService.Packages.React)
local signalsReactModule = require(corePackagesService.Packages.SignalsReact)
local appFonts = require(corePackagesService.Workspace.Packages.Style).AppFonts
local useStyle = require(corePackagesService.Packages.UIBlox).Core.Style.useStyle
local dataHydrationModule = require(corePackagesService.Workspace.Packages.DataHydration)
local getAgeRecommendationStore = dataHydrationModule.Game.getAgeRecommendationStore
local dataStatus = dataHydrationModule.DataHydrationTypes.DataStatus
local sharedFlagsModule = require(corePackagesService.Workspace.Packages.SharedFlags)
local fFlagShowGameAgeRating = sharedFlagsModule.FFlagShowGameAgeRating
local fFlagEnableSideSheet = sharedFlagsModule.FFlagEnableSideSheet

return function(p1)
	-- upvalues: useStyle (ref), fFlagShowGameAgeRating (ref), fFlagEnableSideSheet (ref), reactModule (ref), getAgeRecommendationStore (ref), dataStatus (ref), signalsReactModule (ref), appFonts (ref)
	local var1 = useStyle()
	local var2 = if fFlagShowGameAgeRating then if fFlagEnableSideSheet then UDim2.fromOffset(-6, -2) else UDim2.fromOffset(0, 2) else p1.position
	local var3 = nil
	
	if fFlagShowGameAgeRating then
		local var4 = tostring(game.GameId)
		var3 = signalsReactModule.useSignalState(reactModule.useCallback(function(p2)
			-- upvalues: getAgeRecommendationStore (copy), var4 (ref), dataStatus (copy)
			local andFetchAgeRecommendation = getAgeRecommendationStore(p2).getAndFetchAgeRecommendation(var4)
			local var5 = andFetchAgeRecommendation.status(p2)
			
			if var5 == dataStatus.Failed then
				return "12+"
			elseif var5 == dataStatus.NotReady then
				return nil
			end
			local var6 = andFetchAgeRecommendation.data(p2)
			local minimumAgeDisplay = var6 and var6.minimumAgeDisplay
			
			return minimumAgeDisplay or "12+"
		end, { var4 }))
		
		return if var3 == nil then nil else reactModule.createElement("TextLabel", {
			BackgroundTransparency = 0,
			LineHeight = 1.25,
			ZIndex = 2,
			AnchorPoint = if fFlagShowGameAgeRating then Vector2.new(0.5, 0) else Vector2.new(0, 1),
			Position = var2,
			Text = var3 or "12+",
			Font = if fFlagShowGameAgeRating then appFonts.default:getBold() else appFonts.default:getMedium(),
			TextSize = if fFlagShowGameAgeRating then 12 else 9,
			TextColor3 = var1.Theme.TextEmphasis.Color,
			BackgroundColor3 = var1.Theme.BackgroundUIContrast.Color,
			AutomaticSize = Enum.AutomaticSize.XY
		}, {
			Padding = reactModule.createElement("UIPadding", {
				PaddingTop = if fFlagShowGameAgeRating then UDim.new(0, 2) else nil,
				PaddingBottom = if fFlagShowGameAgeRating then UDim.new(0, 2) else nil,
				PaddingLeft = if fFlagShowGameAgeRating then UDim.new(0, 6) else UDim.new(0, 2),
				PaddingRight = if fFlagShowGameAgeRating then UDim.new(0, 6) else UDim.new(0, 2)
			}),
			Shape = reactModule.createElement("UICorner", { CornerRadius = UDim.new(0, 8) })
		})
	end
end