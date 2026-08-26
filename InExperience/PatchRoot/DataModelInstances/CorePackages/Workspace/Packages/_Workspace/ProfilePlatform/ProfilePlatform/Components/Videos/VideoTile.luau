local profilePlatform = script:FindFirstAncestor("ProfilePlatform")
local parent = profilePlatform.Parent
local reactModule = require(parent.React)
local collectionViewsModule = require(parent.CollectionViews)
local footerModule = require(profilePlatform.Components.Videos.Footer)
local videoPlayerModule = require(profilePlatform.Components.Videos.VideoPlayer)
local textKeysModule = require(profilePlatform.Common.TextKeys)
local navigateDown = require(parent.NavigationRodux).Thunks.NavigateDown
local fFlagSignalsNavP3Dispatch = require(parent.SharedFlags).FFlagSignalsNavP3Dispatch
local var1 = if fFlagSignalsNavP3Dispatch then require(parent.RobloxAppNavigation).NavigationCommands else nil
local appPage = require(parent.RobloxAppEnums).AppPage
local enumsModule = require(profilePlatform.Common.Enums)
local useDispatch = require(parent.RoactUtils).Hooks.RoactRodux.useDispatch
local useDynamicSizeMarginModule = require(profilePlatform.Hooks.useDynamicSizeMargin)
local useProfileFormFactorModule = require(profilePlatform.Hooks.useProfileFormFactor)
local videoPlaybackCoordinator = require(parent.VideoUtils).VideoPlaybackCoordinator
local useLocalization = require(parent.Localization).Hooks.useLocalization
local collectionCarousel = collectionViewsModule.CollectionCarousel
local useCollectionLayoutParams = collectionViewsModule.useCollectionLayoutParams
local collectionItemSize = collectionViewsModule.CollectionViewTypes.CollectionItemSize

return function(p1)
	-- upvalues: reactModule (ref), useProfileFormFactorModule (ref), enumsModule (ref), useLocalization (ref), textKeysModule (ref), useDynamicSizeMarginModule (ref), useCollectionLayoutParams (ref), collectionItemSize (ref), videoPlaybackCoordinator (ref), useDispatch (ref), appPage (ref), fFlagSignalsNavP3Dispatch (ref), var1 (ref), navigateDown (ref), videoPlayerModule (ref), footerModule (ref), collectionCarousel (ref)
	local var2, var3 = reactModule.useState(true)
	local var4 = useProfileFormFactorModule().formFactor == enumsModule.ProfileFormFactor.Wide
	local var5 = useLocalization({ title = textKeysModule.Videos })
	local var6, var7 = reactModule.useState(nil)
	local var8, var9 = useDynamicSizeMarginModule()
	local var10 = useCollectionLayoutParams(collectionItemSize.Large, var6, true, { sideMargin = var8 })
	local var11 = reactModule.useMemo(function()
		-- upvalues: videoPlaybackCoordinator (copy)
		return videoPlaybackCoordinator.new()
	end, {})
	local var12 = reactModule.useCallback(function()
		-- upvalues: var6 (ref), var10 (ref)
		return (if var6 then var6.AbsoluteSize.X else 300) - var10.sideMargin - 60
	end, { var6 })
	local var13 = reactModule.useCallback(function(p2)
		-- upvalues: var4 (ref), var12 (ref)
		return (if var4 then p2 else var12()) * 0.5625 + 32 + 8
	end, { var4, var12 })
	local var14 = useDispatch()
	local var15, var16 = reactModule.useState(0)
	local var17 = reactModule.useCallback(function(p2)
		-- upvalues: var16 (ref)
		var16(p2)
	end, {})
	local var18 = reactModule.useCallback(function(p2, p3)
		-- upvalues: var11 (ref), appPage (copy), var15 (ref), var2 (ref), var3 (ref), fFlagSignalsNavP3Dispatch (copy), var1 (copy), var14 (ref), navigateDown (copy)
		if p2 then
			if var11 then
				var11:reset("expanding_to_fullscreen")
			end
			local t = {
				name = appPage.VideoFullscreen,
				detail = p2.videoId,
				extraProps = {
					videoId = p2.videoId,
					title = p2.title,
					initialTimePosition = p3 or var15,
					isMuted = var2,
					onMuteUpdate = var3
				}
			}
			
			if fFlagSignalsNavP3Dispatch then
				var1.down(var1.fromLegacyPage(t))
				
				return
			end
			var14(navigateDown(t))
		end
	end, { var15, var11, var2 })
	
	return reactModule.createElement("Frame", {
		AutomaticSize = Enum.AutomaticSize.Y,
		BackgroundTransparency = 1,
		LayoutOrder = p1.layoutOrder,
		Size = UDim2.new(1, 0, 0, 0),
		ClipsDescendants = true,
		ref = var7,
		[reactModule.Change.AbsoluteSize] = var9
	}, {
		CollectionCarousel = reactModule.createElement(collectionCarousel, {
			columnGap = 12,
			hideHeaderButton = true,
			LayoutOrder = 1,
			fractionalItemAmount = if var4 then 0 else nil,
			getItemHeight = var13,
			items = p1.videos or {},
			numColumns = if var4 then 3 else 1,
			onScrollingFrameRefCallback = if var4 then reactModule.useCallback(function(p2)
				if p2 then
					p2.ClipsDescendants = true
				end
			end, {}) else nil,
			renderItem = reactModule.useCallback(function(p2, p3, p4)
				-- upvalues: var4 (ref), var12 (ref), var13 (ref), reactModule (copy), videoPlayerModule (copy), var18 (ref), var17 (ref), var11 (ref), footerModule (copy)
				return reactModule.createElement("Frame", {
					BackgroundTransparency = 1,
					LayoutOrder = p3,
					Size = if var4 then p4 else UDim2.new(0, var12(), 0, var13(var12()))
				}, {
					Layout = reactModule.createElement("UIListLayout", {
						FillDirection = Enum.FillDirection.Vertical,
						Padding = UDim.new(0, 0),
						SortOrder = Enum.SortOrder.LayoutOrder
					}),
					VideoContainer = reactModule.createElement("Frame", {
						BackgroundTransparency = 1,
						LayoutOrder = 1,
						Size = UDim2.new(1, 0, 1, -40)
					}, {
						VideoPlayer = reactModule.createElement(videoPlayerModule, {
							cornerRadius = 8,
							isFullscreen = false,
							looped = false,
							onExpandCallback = function(p5)
								-- upvalues: var18 (copy), p2 (ref)
								var18(p2, p5)
							end,
							onTimeUpdate = var17,
							thumbnailImage = p2.thumbnailImage,
							videoId = p2.videoId,
							videoPlaybackCoordinator = var11
						})
					}),
					PaddingBelowVideo = reactModule.createElement("Frame", {
						BackgroundTransparency = 1,
						LayoutOrder = 2,
						Size = UDim2.new(1, 0, 0, 8)
					}),
					Footer = reactModule.createElement(footerModule, { LayoutOrder = 3, text = p2.title })
				}), p2.videoId
			end, { var18, var4, var12, var13 }),
			sideMargin = var10.sideMargin,
			title = var5.title
		})
	})
end