local profilePlatform = script:FindFirstAncestor("ProfilePlatform")
local parent = profilePlatform.Parent
local reactModule = require(parent.React)
local collectionViewsModule = require(parent.CollectionViews)
local footerModule = require(profilePlatform.Components.Videos.Footer)
local videoPlayerModule = require(profilePlatform.Components.Videos.VideoPlayer)
local textKeysModule = require(profilePlatform.Common.TextKeys)
local navigateDown = require(parent.NavigationRodux).Thunks.NavigateDown
local fFlagSignalsNavP3Dispatch = require(parent.SharedFlags).FFlagSignalsNavP3Dispatch
local var6 = if fFlagSignalsNavP3Dispatch then require(parent.RobloxAppNavigation).NavigationCommands else nil
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

return function(p0) --[[ line: 44 | named "VideoTile" ]]
	-- upvalues: reactModule (ref), useProfileFormFactorModule (ref), enumsModule (ref), useLocalization (ref), textKeysModule (ref), useDynamicSizeMarginModule (ref), useCollectionLayoutParams (ref), collectionItemSize (ref), videoPlaybackCoordinator (ref), useDispatch (ref), appPage (ref), fFlagSignalsNavP3Dispatch (ref), var6 (ref), navigateDown (ref), videoPlayerModule (ref), footerModule (ref), collectionCarousel (ref)
	local var10, var11 = reactModule.useState(true)
	local var12 = useProfileFormFactorModule().formFactor == enumsModule.ProfileFormFactor.Wide
	local var13 = useLocalization({ title = textKeysModule.Videos })
	local var14, var15 = reactModule.useState(nil)
	local var16, var17 = useDynamicSizeMarginModule()
	local var18 = useCollectionLayoutParams(collectionItemSize.Large, var14, true, { sideMargin = var16 })
	local var19 = reactModule.useMemo(function() --[[ line: 60 ]]
		-- upvalues: videoPlaybackCoordinator (copy)
		return videoPlaybackCoordinator.new()
	end, {})
	local var20 = reactModule.useCallback(function() --[[ line: 64 ]]
		-- upvalues: var14 (ref), var18 (ref)
		return (if var14 then var14.AbsoluteSize.X else 300) - var18.sideMargin - 60
	end, { var14 })
	local var21 = reactModule.useCallback(function(p1) --[[ line: 70 ]]
		-- upvalues: var12 (ref), var20 (ref)
		return (if var12 then p1 else var20()) * 0.5625 + 32 + 8
	end, { var12, var20 })
	local var22 = useDispatch()
	local var23, var24 = reactModule.useState(0)
	local var25 = reactModule.useCallback(function(p2) --[[ line: 79 ]]
		-- upvalues: var24 (ref)
		var24(p2)
	end, {})
	local var26 = reactModule.useCallback(function(p3, p4) --[[ line: 84 ]]
		-- upvalues: var19 (ref), appPage (copy), var23 (ref), var10 (ref), var11 (ref), fFlagSignalsNavP3Dispatch (copy), var6 (copy), var22 (ref), navigateDown (copy)
		if p3 then
			if var19 then
				var19:reset("expanding_to_fullscreen")
			end
			local t = {
				name = appPage.VideoFullscreen,
				detail = p3.videoId,
				extraProps = {
					videoId = p3.videoId,
					title = p3.title,
					initialTimePosition = p4 or var23,
					isMuted = var10,
					onMuteUpdate = var11
				}
			}
			
			if fFlagSignalsNavP3Dispatch then
				var6.down(var6.fromLegacyPage(t))
				
				return
			end
			var22(navigateDown(t))
		end
	end, { var23, var19, var10 })
	
	return reactModule.createElement("Frame", {
		AutomaticSize = Enum.AutomaticSize.Y,
		BackgroundTransparency = 1,
		LayoutOrder = p0.layoutOrder,
		Size = UDim2.new(1, 0, 0, 0),
		ClipsDescendants = true,
		ref = var15,
		[reactModule.Change.AbsoluteSize] = var17
	}, {
		CollectionCarousel = reactModule.createElement(collectionCarousel, {
			columnGap = 12,
			hideHeaderButton = true,
			LayoutOrder = 1,
			fractionalItemAmount = if var12 then 0 else nil,
			getItemHeight = var21,
			items = p0.videos or {},
			numColumns = if var12 then 3 else 1,
			onScrollingFrameRefCallback = if var12 then reactModule.useCallback(function(p5) --[[ line: 115 ]]
				if p5 then
					p5.ClipsDescendants = true
				end
			end, {}) else nil,
			renderItem = reactModule.useCallback(function(p6, p7, p8) --[[ line: 122 ]]
				-- upvalues: var12 (ref), var20 (ref), var21 (ref), reactModule (copy), videoPlayerModule (copy), var26 (ref), var25 (ref), var19 (ref), footerModule (copy)
				return reactModule.createElement("Frame", {
					BackgroundTransparency = 1,
					LayoutOrder = p7,
					Size = if var12 then p8 else UDim2.new(0, var20(), 0, var21(var20()))
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
							onExpandCallback = function(p9) --[[ line: 146 ]]
								-- upvalues: var26 (copy), p6 (ref)
								var26(p6, p9)
							end,
							onTimeUpdate = var25,
							thumbnailImage = p6.thumbnailImage,
							videoId = p6.videoId,
							videoPlaybackCoordinator = var19
						})
					}),
					PaddingBelowVideo = reactModule.createElement("Frame", {
						BackgroundTransparency = 1,
						LayoutOrder = 2,
						Size = UDim2.new(1, 0, 0, 8)
					}),
					Footer = reactModule.createElement(footerModule, { LayoutOrder = 3, text = p6.title })
				}), p6.videoId
			end, { var26, var12, var20, var21 }),
			sideMargin = var18.sideMargin,
			title = var13.title
		})
	})
end