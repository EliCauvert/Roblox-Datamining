local profilePlatform = script:FindFirstAncestor("ProfilePlatform")
local parent = profilePlatform.Parent
local reactModule = require(parent.React)
local collectionViewsModule = require(parent.CollectionViews)
local foundationModule = require(parent.Foundation)
local navigationModule = require(parent.Navigation)
local _ = require(parent.DataHydration.MomentsStoreTypes)
local momentTileModule = require(script.Parent.MomentTile)
local momentsCarouselMediaProviderModule = require(script.Parent.MomentsCarouselMediaProvider)
local getVisibleTileRangeModule = require(script.Parent.getVisibleTileRange)
local useDynamicSizeMarginModule = require(profilePlatform.Hooks.useDynamicSizeMargin)
local useProfileFormFactorModule = require(profilePlatform.Hooks.useProfileFormFactor)
local enumsModule = require(profilePlatform.Common.Enums)
local collectionCarousel = collectionViewsModule.CollectionCarousel
local useNavigationFocus = navigationModule.useNavigationFocus
local useTokens = foundationModule.Hooks.useTokens

return function(p0) --[[ line: 44 | named "MomentsCarousel" ]]
	-- upvalues: useTokens (ref), useProfileFormFactorModule (ref), enumsModule (ref), useNavigationFocus (ref), useDynamicSizeMarginModule (ref), reactModule (ref), getVisibleTileRangeModule (ref), momentTileModule (ref), collectionCarousel (ref), momentsCarouselMediaProviderModule (ref)
	local moments = p0.moments
	local var11 = useTokens()
	local var12 = useProfileFormFactorModule().formFactor == enumsModule.ProfileFormFactor.Wide
	local var13 = useNavigationFocus()
	local var14, var15 = useDynamicSizeMarginModule()
	local var16, var17 = reactModule.useState(0)
	local var18, var19 = reactModule.useState(1)
	local var20 = reactModule.useRef(nil)
	local var21 = reactModule.useRef(nil)
	local var22 = if var12 then 4 else 3
	local var23 = if var12 then nil else 0.2
	local onTileImpression = p0.onTileImpression
	local var24 = reactModule.useRef({})
	local var25 = reactModule.useRef(nil)
	local var26 = reactModule.useMemo(function() --[[ line: 69 ]]
		-- upvalues: moments (ref)
		for i, v in moments do
			if v.metadata.captureType == Enum.CaptureType.Video then
				return true
			end
		end
		return false
	end, { moments })
	local var27 = moments[var18]
	local var28 = var27 ~= nil and var27.metadata.captureType == Enum.CaptureType.Video
	local var29 = reactModule.useCallback(function(p1) --[[ line: 81 ]]
		-- upvalues: var17 (ref)
		var17(p1)
		
		return p1 * 1.5 + 48
	end, {})
	local var30 = reactModule.useCallback(function() --[[ line: 90 ]]
		-- upvalues: onTileImpression (ref), var16 (ref), var20 (ref), getVisibleTileRangeModule (copy), var22 (ref), var23 (ref), moments (ref), var24 (ref)
		if onTileImpression == nil or var16 <= 0 then return end
		local current = var20.current
		local var33, var34 = getVisibleTileRangeModule(if current ~= nil then 0 else current.CanvasPosition.X, var16, 12, var22, var23, #moments)
		
		for i = var33, var34 do
			if not var24.current[i] then
				var24.current[i] = true
				onTileImpression(i)
			end
		end
	end, {
		onTileImpression,
		var16,
		var22,
		var23,
		#moments
	})
	reactModule.useEffect(function() --[[ line: 106 ]]
		-- upvalues: var25 (ref), moments (ref), var24 (ref), var30 (ref)
		if var25.current ~= moments then
			var25.current = moments
			var24.current = {}
		end
		var30()
	end, { moments, var30 })
	local var31 = reactModule.useCallback(function() --[[ line: 117 ]]
		-- upvalues: var20 (ref), var16 (ref), var21 (ref), moments (ref), var19 (ref), var30 (ref)
		if var20.current == nil or var16 <= 0 then return end
		if var21.current ~= nil then
			task.cancel(var21.current)
		end
		var21.current = task.delay(0.2, function() --[[ line: 125 ]]
			-- upvalues: var21 (copy), var20 (copy), var16 (copy), moments (copy), var19 (copy), var30 (copy)
			var21.current = nil
			local current = var20.current
			
			if current == nil then
				return
			end
			var19(math.clamp(math.round(current.CanvasPosition.X / (var16 + 12)) + 1, 1, #moments))
			var30()
		end)
	end, { var16, #moments, var30 })
	reactModule.useEffect(function() --[[ line: 140 ]]
		-- upvalues: var21 (ref)
		return function() --[[ line: 141 ]]
			-- upvalues: var21 (copy)
			if var21.current ~= nil then
				task.cancel(var21.current)
				var21.current = nil
			end
		end
	end, {})
	local frame = reactModule.createElement("Frame", {
		AutomaticSize = Enum.AutomaticSize.Y,
		BackgroundTransparency = 1,
		LayoutOrder = p0.layoutOrder,
		Size = UDim2.new(1, 0, 0, var16 * 1.5 + 48),
		[reactModule.Change.AbsoluteSize] = var15
	}, {
		CollectionCarousel = reactModule.createElement(collectionCarousel, {
			LayoutOrder = 1,
			title = "Moments",
			columnGap = 12,
			items = moments,
			renderItem = reactModule.useCallback(function(p2, p3, p4) --[[ line: 149 ]]
				-- upvalues: reactModule (copy), momentTileModule (copy), var13 (ref), var18 (ref), p0 (ref)
				return reactModule.createElement(momentTileModule, {
					moment = p2,
					layoutOrder = p3,
					itemSize = p4,
					isActive = var13 and p3 == var18,
					onActivated = function() --[[ line: 155 ]]
						-- upvalues: p0 (copy), p3 (ref)
						p0.onSelectMoment(p3)
					end
				}), p2.momentId
			end, { var13, var18, p0.onSelectMoment }),
			getItemHeight = var29,
			scrollingFrameRef = var20,
			onChangeCanvasPosition = var31,
			numColumns = var22,
			fractionalItemAmount = var23,
			sideMargin = var14,
			onActivateHeader = p0.onActivateHeader
		})
	})
	
	return if var13 and var26 then reactModule.createElement(momentsCarouselMediaProviderModule, {
		moments = moments,
		activeIndex = var18,
		playbackActive = var28,
		mediaCornerRadius = var11.Radius.Large
	}, { Carousel = frame }) else frame
end