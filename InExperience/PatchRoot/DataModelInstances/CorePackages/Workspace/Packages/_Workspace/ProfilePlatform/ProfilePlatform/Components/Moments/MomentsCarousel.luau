local profilePlatform = script:FindFirstAncestor("ProfilePlatform")
local parent = profilePlatform.Parent
local reactModule = require(parent.React)
local collectionViewsModule = require(parent.CollectionViews)
local foundationModule = require(parent.Foundation)
local navigationModule = require(parent.Navigation)
local _ = require(parent.DataHydration.MomentsStoreTypes)
local momentTileModule = require(script.Parent.MomentTile)
local momentsCarouselMediaProviderModule = require(script.Parent.MomentsCarouselMediaProvider)
local useDynamicSizeMarginModule = require(profilePlatform.Hooks.useDynamicSizeMargin)
local useProfileFormFactorModule = require(profilePlatform.Hooks.useProfileFormFactor)
local enumsModule = require(profilePlatform.Common.Enums)
local collectionCarousel = collectionViewsModule.CollectionCarousel
local useNavigationFocus = navigationModule.useNavigationFocus
local useTokens = foundationModule.Hooks.useTokens

return function(p0) --[[ line: 40 | named "MomentsCarousel" ]]
	-- upvalues: useTokens (ref), useProfileFormFactorModule (ref), enumsModule (ref), useNavigationFocus (ref), useDynamicSizeMarginModule (ref), reactModule (ref), momentTileModule (ref), collectionCarousel (ref), momentsCarouselMediaProviderModule (ref)
	local moments = p0.moments
	local var10 = useTokens()
	local var11 = useProfileFormFactorModule().formFactor == enumsModule.ProfileFormFactor.Wide
	local var12 = useNavigationFocus()
	local var13, var14 = useDynamicSizeMarginModule()
	local var15, var16 = reactModule.useState(0)
	local var17, var18 = reactModule.useState(1)
	local var19 = reactModule.useRef(nil)
	local var20 = reactModule.useRef(nil)
	local var21 = reactModule.useMemo(function() --[[ line: 53 ]]
		-- upvalues: moments (ref)
		for i, v in moments do
			if v.metadata.captureType == Enum.CaptureType.Video then
				return true
			end
		end
		return false
	end, { moments })
	local var22 = moments[var17]
	local var23 = var22 ~= nil and var22.metadata.captureType == Enum.CaptureType.Video
	local var24 = reactModule.useCallback(function(p1) --[[ line: 65 ]]
		-- upvalues: var16 (ref)
		var16(p1)
		
		return p1 * 1.5 + 48
	end, {})
	local var25 = reactModule.useCallback(function() --[[ line: 70 ]]
		-- upvalues: var19 (ref), var15 (ref), var20 (ref), moments (ref), var18 (ref)
		if var19.current == nil or var15 <= 0 then return end
		if var20.current ~= nil then
			task.cancel(var20.current)
		end
		var20.current = task.delay(0.2, function() --[[ line: 78 ]]
			-- upvalues: var20 (copy), var19 (copy), var15 (copy), moments (copy), var18 (copy)
			var20.current = nil
			local current = var19.current
			
			if current == nil then
				return
			end
			var18(math.clamp(math.round(current.CanvasPosition.X / (var15 + 12)) + 1, 1, #moments))
		end)
	end, { var15, #moments })
	reactModule.useEffect(function() --[[ line: 90 ]]
		-- upvalues: var20 (ref)
		return function() --[[ line: 91 ]]
			-- upvalues: var20 (copy)
			if var20.current ~= nil then
				task.cancel(var20.current)
				var20.current = nil
			end
		end
	end, {})
	local frame = reactModule.createElement("Frame", {
		AutomaticSize = Enum.AutomaticSize.Y,
		BackgroundTransparency = 1,
		LayoutOrder = p0.layoutOrder,
		Size = UDim2.new(1, 0, 0, var15 * 1.5 + 48),
		[reactModule.Change.AbsoluteSize] = var14
	}, {
		CollectionCarousel = reactModule.createElement(collectionCarousel, {
			LayoutOrder = 1,
			title = "Moments",
			columnGap = 12,
			items = moments,
			renderItem = reactModule.useCallback(function(p2, p3, p4) --[[ line: 99 ]]
				-- upvalues: reactModule (copy), momentTileModule (copy), var12 (ref), var17 (ref), p0 (ref)
				return reactModule.createElement(momentTileModule, {
					moment = p2,
					layoutOrder = p3,
					itemSize = p4,
					isActive = var12 and p3 == var17,
					onActivated = function() --[[ line: 105 ]]
						-- upvalues: p0 (copy), p3 (ref)
						p0.onSelectMoment(p3)
					end
				}), p2.momentId
			end, { var12, var17, p0.onSelectMoment }),
			getItemHeight = var24,
			scrollingFrameRef = var19,
			onChangeCanvasPosition = var25,
			numColumns = if var11 then 4 else 3,
			fractionalItemAmount = if var11 then nil else 0.2,
			sideMargin = var13,
			onActivateHeader = p0.onActivateHeader
		})
	})
	
	return if var12 and var21 then reactModule.createElement(momentsCarouselMediaProviderModule, {
		moments = moments,
		activeIndex = var17,
		playbackActive = var23,
		mediaCornerRadius = var10.Radius.Large
	}, { Carousel = frame }) else frame
end