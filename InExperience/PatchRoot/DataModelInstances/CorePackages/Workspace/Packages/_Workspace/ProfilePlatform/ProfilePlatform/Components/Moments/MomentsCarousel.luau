local ProfilePlatform = script:FindFirstAncestor("ProfilePlatform")
local Parent = ProfilePlatform.Parent
local ReactModule = require(Parent.React)
local _ = require(Parent.DataHydration.MomentsStoreTypes)
local MomentTileModule = require(script.Parent.MomentTile)
local MomentsCarouselMediaProviderModule = require(script.Parent.MomentsCarouselMediaProvider)
local GetVisibleTileRangeModule = require(script.Parent.getVisibleTileRange)
local UseDynamicSizeMarginModule = require(ProfilePlatform.Hooks.useDynamicSizeMargin)
local UseProfileFormFactorModule = require(ProfilePlatform.Hooks.useProfileFormFactor)
local EnumsModule = require(ProfilePlatform.Common.Enums)
local CollectionCarousel = require(Parent.CollectionViews).CollectionCarousel
local UseNavigationFocusFunction = require(Parent.Navigation).useNavigationFocus
local UseTokensFunction = require(Parent.Foundation).Hooks.useTokens

return function(p1) --[[ Line: 44 | Named "MomentsCarousel" ]]
	-- upvalues: UseTokensFunction (copy), UseProfileFormFactorModule (copy), EnumsModule (copy), UseNavigationFocusFunction (copy), UseDynamicSizeMarginModule (copy), ReactModule (copy), GetVisibleTileRangeModule (copy), MomentTileModule (copy), CollectionCarousel (copy), MomentsCarouselMediaProviderModule (copy)
	local Moments = p1.moments
	local UseTokensResult = UseTokensFunction()
	local IsFormFactorMatch = UseProfileFormFactorModule().formFactor == EnumsModule.ProfileFormFactor.Wide
	local UseNavigationFocusResult = UseNavigationFocusFunction()
	local UseDynamicSizeMarginModuleResult, UseDynamicSizeMarginModuleResult2 = UseDynamicSizeMarginModule()
	local UseStateResult, UseStateResult2 = ReactModule.useState(0)
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(1)
	local UseRefResult = ReactModule.useRef(nil)
	local UseRefResult1 = ReactModule.useRef(nil)
	local UseRefResult2 = ReactModule.useRef(nil)
	local NumColumns: number = if IsFormFactorMatch then 4 else 3
	local FractionalItemAmount = if IsFormFactorMatch then nil else 0.2
	local OnTileImpressionFunction = p1.onTileImpression
	local UseRefResult3 = ReactModule.useRef({})
	local UseRefResult4 = ReactModule.useRef(nil)
	local UseMemoResult = ReactModule.useMemo(function(): boolean --[[ Line: 70 ]]
		-- upvalues: Moments (copy)
		for _, moment in Moments do
			if moment.metadata.captureType == Enum.CaptureType.Video then
				return true
			end
		end
		return false
	end, { Moments })
	local Moment = Moments[UseStateResult1]
	local IsCaptureTypeMatch: boolean = Moment ~= nil and Moment.metadata.captureType == Enum.CaptureType.Video
	local UseResult = ReactModule.useCallback(function(p2: number): number --[[ Line: 82 ]]
		-- upvalues: UseStateResult2 (copy)
		UseStateResult2(p2)
		
		return p2 * 1.5 + 48
	end, {})
	local UseResult1 = ReactModule.useCallback(function() --[[ Line: 91 ]]
		-- upvalues: OnTileImpressionFunction (copy), UseStateResult (copy), UseRefResult (copy), GetVisibleTileRangeModule (upval), NumColumns (copy), FractionalItemAmount (copy), Moments (copy), UseRefResult3 (copy)
		if OnTileImpressionFunction == nil or UseStateResult <= 0 then return end
		local Current = UseRefResult.current
		local VisibleTileRangeModule, VisibleTileRangeModule2 = GetVisibleTileRangeModule(if Current == nil then 0 else Current.CanvasPosition.X, UseStateResult, 12, NumColumns, FractionalItemAmount, #Moments)
		
		for i = VisibleTileRangeModule, VisibleTileRangeModule2 do
			if not UseRefResult3.current[i] then
				UseRefResult3.current[i] = true
				OnTileImpressionFunction(i)
			end
		end
	end, {
		OnTileImpressionFunction,
		UseStateResult,
		NumColumns,
		FractionalItemAmount,
		#Moments
	})
	ReactModule.useEffect(function() --[[ Line: 107 ]]
		-- upvalues: UseRefResult4 (copy), Moments (copy), UseRefResult3 (copy), UseResult1 (copy)
		if UseRefResult4.current ~= Moments then
			UseRefResult4.current = Moments
			UseRefResult3.current = {}
		end
		UseResult1()
	end, { Moments, UseResult1 })
	local UseResult2 = ReactModule.useCallback(function() --[[ Line: 118 ]]
		-- upvalues: UseRefResult (copy), UseStateResult (copy), UseRefResult1 (copy), Moments (copy), UseStateResult2_1 (copy), UseResult1 (copy)
		if UseRefResult.current == nil or UseStateResult <= 0 then return end
		if UseRefResult1.current ~= nil then
			task.cancel(UseRefResult1.current)
		end
		UseRefResult1.current = task.delay(0.2, function() --[[ Line: 126 ]]
			-- upvalues: UseRefResult1 (upval), UseRefResult (upval), UseStateResult (upval), Moments (upval), UseStateResult2_1 (upval), UseResult1 (upval)
			UseRefResult1.current = nil
			local Current = UseRefResult.current
			
			if Current ~= nil then
				UseStateResult2_1((math.clamp(math.round(Current.CanvasPosition.X / (UseStateResult + 12)) + 1, 1, #Moments)))
				UseResult1()
				
				return
			end
		end)
	end, { UseStateResult, #Moments, UseResult1 })
	ReactModule.useEffect(function() --[[ Line: 141 ]]
		-- upvalues: UseRefResult1 (copy)
		return function() --[[ Line: 142 ]]
			-- upvalues: UseRefResult1 (upval)
			if UseRefResult1.current ~= nil then
				task.cancel(UseRefResult1.current)
				UseRefResult1.current = nil
			end
		end
	end, {})
	local Frame = ReactModule.createElement("Frame", {
		AutomaticSize = Enum.AutomaticSize.Y,
		BackgroundTransparency = 1,
		LayoutOrder = p1.layoutOrder,
		Size = UDim2.new(1, 0, 0, UseStateResult * 1.5 + 48),
		[ReactModule.Change.AbsoluteSize] = UseDynamicSizeMarginModuleResult2
	}, {
		CollectionCarousel = ReactModule.createElement(CollectionCarousel, {
			LayoutOrder = 1,
			title = "Moments",
			columnGap = 12,
			items = Moments,
			renderItem = ReactModule.useCallback(function(Moment, LayoutOrder, ItemSize) --[[ Line: 150 ]]
				-- upvalues: ReactModule (upval), MomentTileModule (upval), UseNavigationFocusResult (copy), UseStateResult1 (copy), UseRefResult2 (copy), p1 (copy)
				return ReactModule.createElement(MomentTileModule, {
					moment = Moment,
					layoutOrder = LayoutOrder,
					itemSize = ItemSize,
					isActive = UseNavigationFocusResult and LayoutOrder == UseStateResult1,
					onActivated = function() --[[ Line: 156 ]]
						-- upvalues: UseRefResult2 (upval), p1 (upval), LayoutOrder (copy)
						local Current = UseRefResult2.current
						
						if Current ~= nil then
							Current.release()
						end
						p1.onSelectMoment(LayoutOrder)
					end
				}), Moment.momentId
			end, {
				UseNavigationFocusResult,
				UseStateResult1,
				p1.onSelectMoment
			}),
			getItemHeight = UseResult,
			scrollingFrameRef = UseRefResult,
			onChangeCanvasPosition = UseResult2,
			numColumns = NumColumns,
			fractionalItemAmount = FractionalItemAmount,
			sideMargin = UseDynamicSizeMarginModuleResult,
			onActivateHeader = p1.onActivateHeader
		})
	})
	
	return if UseNavigationFocusResult and UseMemoResult then ReactModule.createElement(MomentsCarouselMediaProviderModule, {
		moments = Moments,
		activeIndex = UseStateResult1,
		playbackActive = IsCaptureTypeMatch,
		mediaCornerRadius = UseTokensResult.Radius.Large,
		handoffRef = UseRefResult2
	}, { Carousel = Frame }) else Frame
end