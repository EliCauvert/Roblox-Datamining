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

return function(p0)
	-- upvalues: useStyle (ref), fFlagShowGameAgeRating (ref), fFlagEnableSideSheet (ref), reactModule (ref), getAgeRecommendationStore (ref), dataStatus (ref), signalsReactModule (ref), appFonts (ref)
	local var5 = useStyle()
	local var6 = if fFlagShowGameAgeRating then if fFlagEnableSideSheet then UDim2.fromOffset(-6, -2) else UDim2.fromOffset(0, 2) else p0.position
	local var7 = nil
	
	if fFlagShowGameAgeRating then
		local var8 = tostring(game.GameId)
		var7 = signalsReactModule.useSignalState(reactModule.useCallback(function(p1)
			-- upvalues: getAgeRecommendationStore (copy), var8 (ref), dataStatus (copy)
			local andFetchAgeRecommendation = getAgeRecommendationStore(p1).getAndFetchAgeRecommendation(var8)
			local var10 = andFetchAgeRecommendation.status(p1)
			
			if var10 == dataStatus.Failed then
				return "12+"
			elseif var10 == dataStatus.NotReady then
				return nil
			end
			local var11 = andFetchAgeRecommendation.data(p1)
			local minimumAgeDisplay = var11 and var11.minimumAgeDisplay
			
			return minimumAgeDisplay or "12+"
		end, { var8 }))
		
		return if var7 == nil then nil else reactModule.createElement("TextLabel", {
			BackgroundTransparency = 0,
			LineHeight = 1.25,
			ZIndex = 2,
			AnchorPoint = if fFlagShowGameAgeRating then Vector2.new(0.5, 0) else Vector2.new(0, 1),
			Position = var6,
			Text = var7 or "12+",
			Font = if fFlagShowGameAgeRating then appFonts.default:getBold() else appFonts.default:getMedium(),
			TextSize = if fFlagShowGameAgeRating then 12 else 9,
			TextColor3 = var5.Theme.TextEmphasis.Color,
			BackgroundColor3 = var5.Theme.BackgroundUIContrast.Color,
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