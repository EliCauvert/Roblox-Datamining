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

return function(p1)
	-- upvalues: useTokens (ref), useProfileFormFactorModule (ref), enumsModule (ref), useNavigationFocus (ref), useDynamicSizeMarginModule (ref), reactModule (ref), getVisibleTileRangeModule (ref), momentTileModule (ref), collectionCarousel (ref), momentsCarouselMediaProviderModule (ref)
	local moments = p1.moments
	local var1 = useTokens()
	local var2 = useProfileFormFactorModule().formFactor == enumsModule.ProfileFormFactor.Wide
	local var3 = useNavigationFocus()
	local var4, var5 = useDynamicSizeMarginModule()
	local var6, var7 = reactModule.useState(0)
	local var8, var9 = reactModule.useState(1)
	local var10 = reactModule.useRef(nil)
	local var11 = reactModule.useRef(nil)
	local var12 = reactModule.useRef(nil)
	local var13 = if var2 then 4 else 3
	local var14 = if var2 then nil else 0.2
	local onTileImpression = p1.onTileImpression
	local var15 = reactModule.useRef({})
	local var16 = reactModule.useRef(nil)
	local var17 = reactModule.useMemo(function()
		-- upvalues: moments (ref)
		for i, v in moments do
			if v.metadata.captureType == Enum.CaptureType.Video then
				return true
			end
		end
		return false
	end, { moments })
	local var18 = moments[var8]
	local var19 = var18 ~= nil and var18.metadata.captureType == Enum.CaptureType.Video
	local var20 = reactModule.useCallback(function(p2)
		-- upvalues: var7 (ref)
		var7(p2)
		
		return p2 * 1.5 + 48
	end, {})
	local var21 = reactModule.useCallback(function()
		-- upvalues: onTileImpression (ref), var6 (ref), var10 (ref), getVisibleTileRangeModule (copy), var13 (ref), var14 (ref), moments (ref), var15 (ref)
		if onTileImpression == nil or var6 <= 0 then return end
		local current = var10.current
		local var22, var23 = getVisibleTileRangeModule(if current ~= nil then 0 else current.CanvasPosition.X, var6, 12, var13, var14, #moments)
		
		for i = var22, var23 do
			if not var15.current[i] then
				var15.current[i] = true
				onTileImpression(i)
			end
		end
	end, {
		onTileImpression,
		var6,
		var13,
		var14,
		#moments
	})
	reactModule.useEffect(function()
		-- upvalues: var16 (ref), moments (ref), var15 (ref), var21 (ref)
		if var16.current ~= moments then
			var16.current = moments
			var15.current = {}
		end
		var21()
	end, { moments, var21 })
	local var24 = reactModule.useCallback(function()
		-- upvalues: var10 (ref), var6 (ref), var11 (ref), moments (ref), var9 (ref), var21 (ref)
		if var10.current == nil or var6 <= 0 then return end
		if var11.current ~= nil then
			task.cancel(var11.current)
		end
		var11.current = task.delay(0.2, function()
			-- upvalues: var11 (copy), var10 (copy), var6 (copy), moments (copy), var9 (copy), var21 (copy)
			var11.current = nil
			local current = var10.current
			
			if current == nil then
				return
			end
			var9(math.clamp(math.round(current.CanvasPosition.X / (var6 + 12)) + 1, 1, #moments))
			var21()
		end)
	end, { var6, #moments, var21 })
	reactModule.useEffect(function()
		-- upvalues: var11 (ref)
		return function()
			-- upvalues: var11 (copy)
			if var11.current ~= nil then
				task.cancel(var11.current)
				var11.current = nil
			end
		end
	end, {})
	local frame = reactModule.createElement("Frame", {
		AutomaticSize = Enum.AutomaticSize.Y,
		BackgroundTransparency = 1,
		LayoutOrder = p1.layoutOrder,
		Size = UDim2.new(1, 0, 0, var6 * 1.5 + 48),
		[reactModule.Change.AbsoluteSize] = var5
	}, {
		CollectionCarousel = reactModule.createElement(collectionCarousel, {
			LayoutOrder = 1,
			title = "Moments",
			columnGap = 12,
			items = moments,
			renderItem = reactModule.useCallback(function(p2, p3, p4)
				-- upvalues: reactModule (copy), momentTileModule (copy), var3 (ref), var8 (ref), var12 (ref), p1 (ref)
				return reactModule.createElement(momentTileModule, {
					moment = p2,
					layoutOrder = p3,
					itemSize = p4,
					isActive = var3 and p3 == var8,
					onActivated = function()
						-- upvalues: var12 (copy), p1 (copy), p3 (ref)
						local current = var12.current
						
						if current ~= nil then
							current.release()
						end
						p1.onSelectMoment(p3)
					end
				}), p2.momentId
			end, { var3, var8, p1.onSelectMoment }),
			getItemHeight = var20,
			scrollingFrameRef = var10,
			onChangeCanvasPosition = var24,
			numColumns = var13,
			fractionalItemAmount = var14,
			sideMargin = var4,
			onActivateHeader = p1.onActivateHeader
		})
	})
	
	return if var3 and var17 then reactModule.createElement(momentsCarouselMediaProviderModule, {
		moments = moments,
		activeIndex = var8,
		playbackActive = var19,
		mediaCornerRadius = var1.Radius.Large,
		handoffRef = var12
	}, { Carousel = frame }) else frame
end