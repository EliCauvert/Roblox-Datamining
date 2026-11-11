local ProfilePlatform = script:FindFirstAncestor("ProfilePlatform")
local Parent = ProfilePlatform.Parent
local ReactModule = require(Parent.React)
local CollectionViewsModule = require(Parent.CollectionViews)
local FooterModule = require(ProfilePlatform.Components.Videos.Footer)
local VideoPlayerModule = require(ProfilePlatform.Components.Videos.VideoPlayer)
local TextKeysModule = require(ProfilePlatform.Common.TextKeys)
local NavigateDownFunction = require(Parent.NavigationRodux).Thunks.NavigateDown
local FFlagSignalsNavP3Dispatch = require(Parent.SharedFlags).FFlagSignalsNavP3Dispatch
local NavigationCommands = if FFlagSignalsNavP3Dispatch then require(Parent.RobloxAppNavigation).NavigationCommands else nil
local AppPage = require(Parent.RobloxAppEnums).AppPage
local EnumsModule = require(ProfilePlatform.Common.Enums)
local UseDispatchFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useDispatch
local UseDynamicSizeMarginModule = require(ProfilePlatform.Hooks.useDynamicSizeMargin)
local UseProfileFormFactorModule = require(ProfilePlatform.Hooks.useProfileFormFactor)
local VideoPlaybackCoordinator = require(Parent.VideoUtils).VideoPlaybackCoordinator
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local CollectionCarousel = CollectionViewsModule.CollectionCarousel
local UseCollectionLayoutParamsFunction = CollectionViewsModule.useCollectionLayoutParams
local CollectionItemSize = CollectionViewsModule.CollectionViewTypes.CollectionItemSize

return function(p1)
	-- upvalues: ReactModule (copy), UseProfileFormFactorModule (copy), EnumsModule (copy), UseLocalizationFunction (copy), TextKeysModule (copy), UseDynamicSizeMarginModule (copy), UseCollectionLayoutParamsFunction (copy), CollectionItemSize (copy), VideoPlaybackCoordinator (copy), UseDispatchFunction (copy), AppPage (copy), FFlagSignalsNavP3Dispatch (copy), NavigationCommands (copy), NavigateDownFunction (copy), VideoPlayerModule (copy), FooterModule (copy), CollectionCarousel (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(true)
	local IsFormFactorMatch = UseProfileFormFactorModule().formFactor == EnumsModule.ProfileFormFactor.Wide
	local UseLocalizationResult = UseLocalizationFunction({ title = TextKeysModule.Videos })
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(nil)
	local UseDynamicSizeMarginModuleResult, UseDynamicSizeMarginModuleResult2 = UseDynamicSizeMarginModule()
	local UseCollectionLayoutParamsResult = UseCollectionLayoutParamsFunction(CollectionItemSize.Large, UseStateResult1, true, { sideMargin = UseDynamicSizeMarginModuleResult })
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: VideoPlaybackCoordinator (upval)
		return VideoPlaybackCoordinator.new()
	end, {})
	local UseResult = ReactModule.useCallback(function(): number
		-- upvalues: UseStateResult1 (copy), UseCollectionLayoutParamsResult (copy)
		return (if UseStateResult1 then UseStateResult1.AbsoluteSize.X else 300) - UseCollectionLayoutParamsResult.sideMargin - 60
	end, { UseStateResult1 })
	local UseResult1 = ReactModule.useCallback(function(p2): number
		-- upvalues: IsFormFactorMatch (copy), UseResult (copy)
		return (if IsFormFactorMatch then p2 else UseResult()) * 0.5625 + 32 + 8
	end, { IsFormFactorMatch, UseResult })
	local UseDispatchResult = UseDispatchFunction()
	local UseStateResult3, UseStateResult2_2 = ReactModule.useState(0)
	local UseResult2 = ReactModule.useCallback(function(p2)
		-- upvalues: UseStateResult2_2 (copy)
		UseStateResult2_2(p2)
	end, {})
	local UseResult3 = ReactModule.useCallback(function(p2, p3)
		-- upvalues: UseMemoResult (copy), AppPage (upval), UseStateResult3 (copy), UseStateResult (copy), UseStateResult2 (copy), FFlagSignalsNavP3Dispatch (upval), NavigationCommands (upval), UseDispatchResult (copy), NavigateDownFunction (upval)
		if p2 then
			if UseMemoResult then
				UseMemoResult:reset("expanding_to_fullscreen")
			end
			local config = {
				name = AppPage.VideoFullscreen,
				detail = p2.videoId,
				extraProps = {
					videoId = p2.videoId,
					title = p2.title,
					initialTimePosition = p3 or UseStateResult3,
					isMuted = UseStateResult,
					onMuteUpdate = UseStateResult2
				}
			}
			
			if FFlagSignalsNavP3Dispatch then
				NavigationCommands.down(NavigationCommands.fromLegacyPage(config))
				
				return
			end
			UseDispatchResult(NavigateDownFunction(config))
		end
	end, { UseStateResult3, UseMemoResult, UseStateResult })
	local UseResult4 = ReactModule.useCallback(function(p2)
		if p2 then
			p2.ClipsDescendants = true
		end
	end, {})
	
	return ReactModule.createElement("Frame", {
		AutomaticSize = Enum.AutomaticSize.Y,
		BackgroundTransparency = 1,
		LayoutOrder = p1.layoutOrder,
		Size = UDim2.new(1, 0, 0, 0),
		ClipsDescendants = true,
		ref = UseStateResult2_1,
		[ReactModule.Change.AbsoluteSize] = UseDynamicSizeMarginModuleResult2
	}, {
		CollectionCarousel = ReactModule.createElement(CollectionCarousel, {
			columnGap = 12,
			hideHeaderButton = true,
			LayoutOrder = 1,
			fractionalItemAmount = if IsFormFactorMatch then 0 else nil,
			getItemHeight = UseResult1,
			items = p1.videos or {},
			numColumns = if IsFormFactorMatch then 3 else 1,
			onScrollingFrameRefCallback = if IsFormFactorMatch then UseResult4 else nil,
			renderItem = ReactModule.useCallback(function(p2, LayoutOrder, p3)
				-- upvalues: IsFormFactorMatch (copy), UseResult (copy), UseResult1 (copy), ReactModule (upval), VideoPlayerModule (upval), UseResult3 (copy), UseResult2 (copy), UseMemoResult (copy), FooterModule (upval)
				return ReactModule.createElement("Frame", {
					BackgroundTransparency = 1,
					LayoutOrder = LayoutOrder,
					Size = if IsFormFactorMatch then p3 else UDim2.new(0, UseResult(), 0, UseResult1(UseResult()))
				}, {
					Layout = ReactModule.createElement("UIListLayout", {
						FillDirection = Enum.FillDirection.Vertical,
						Padding = UDim.new(0, 0),
						SortOrder = Enum.SortOrder.LayoutOrder
					}),
					VideoContainer = ReactModule.createElement("Frame", {
						BackgroundTransparency = 1,
						LayoutOrder = 1,
						Size = UDim2.new(1, 0, 1, -40)
					}, {
						VideoPlayer = ReactModule.createElement(VideoPlayerModule, {
							cornerRadius = 8,
							isFullscreen = false,
							looped = false,
							onExpandCallback = function(p4)
								-- upvalues: UseResult3 (upval), p2 (copy)
								UseResult3(p2, p4)
							end,
							onTimeUpdate = UseResult2,
							thumbnailImage = p2.thumbnailImage,
							videoId = p2.videoId,
							videoPlaybackCoordinator = UseMemoResult
						})
					}),
					PaddingBelowVideo = ReactModule.createElement("Frame", {
						BackgroundTransparency = 1,
						LayoutOrder = 2,
						Size = UDim2.new(1, 0, 0, 8)
					}),
					Footer = ReactModule.createElement(FooterModule, { LayoutOrder = 3, text = p2.title })
				}), p2.videoId
			end, { UseResult3, IsFormFactorMatch, UseResult, UseResult1 }),
			sideMargin = UseCollectionLayoutParamsResult.sideMargin,
			title = UseLocalizationResult.title
		})
	})
end