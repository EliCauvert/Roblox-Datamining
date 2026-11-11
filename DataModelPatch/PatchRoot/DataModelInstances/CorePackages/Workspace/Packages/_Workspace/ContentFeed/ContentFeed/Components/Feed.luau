local Parent = script.Parent.Parent
local Parent1 = Parent.Parent
local FoundationModule = require(Parent1.Foundation)
local ReactModule = require(Parent1.React)
local ResponsiveModule = require(Parent1.Responsive)
local RoactUtilsModule = require(Parent1.RoactUtils)
local EventNamesModule = require(Parent.Analytics.EventNames)
local FeedContextModule = require(Parent.App.FeedContext)
local FeedDirectionTypeModule = require(Parent.Enums.FeedDirectionType)
local FeedItemModule = require(Parent.Components.FeedItem.FeedItem)
local FeedItemPlaceholderModule = require(Parent.Components.FeedItem.FeedItemPlaceholder)
local FeedItemPostsNotFoundModule = require(Parent.Components.FeedItem.FeedItemPostsNotFound)
local FeedTopBarModule = require(Parent.Components.FeedHeader.FeedTopBar)
local GetDeepValueFunction = require(Parent1.LuaSocialLibrariesDeps).SocialLibraries.config({}).Dictionary.getDeepValue
local GetFeedPostElementsModule = require(Parent.Utils.getFeedPostElements)
local GetIsPlaceholderModule = require(Parent.Utils.getIsPlaceholder)
local GetPostIndexModule = require(Parent.Utils.getPostIndex)
local InspectClosedModule = require(Parent.Actions.InspectClosed)
local NavigationSidebarModule = require(Parent.Components.NavigationSidebar.NavigationSidebar)
local _ = require(Parent.Enums.NavigationType)
local PlaceholderTypeModule = require(Parent.Enums.PlaceholderType)
local RetrievePostsModule = require(Parent.Thunks.RetrievePosts)
local SortOrderTypeModule = require(Parent.Enums.SortOrderType)
local _ = require(Parent.Types)
local View = FoundationModule.View
local UseAnalyticsModule = require(Parent.Hooks.useAnalytics)
local UseDispatchFunction = RoactUtilsModule.Hooks.RoactRodux.useDispatch
local UseEffectFunction = ReactModule.useEffect
local UseEffectOnceFunction = RoactUtilsModule.Hooks.useEffectOnce
local UseFeedMotionControllerModule = require(Parent.Hooks.useFeedMotionController)
local UseGuiInsetFunction = require(Parent1.CapturesCommon).Hooks.useGuiInset
local UsePreferredInputFunction = ResponsiveModule.usePreferredInput
local UseScreenSizeFunction = require(Parent1.RobloxAppHooks).useScreenSize
local UseSelectorFunction = RoactUtilsModule.Hooks.RoactRodux.useSelector
local UseStateFunction = ReactModule.useState
local UseTokensFunction = FoundationModule.Hooks.useTokens
local ContentFeedCloseInspectOnOpen = game:DefineFastFlag("ContentFeedCloseInspectOnOpen", false)
local FIntContentFeedZoomEventThrottleModule = require(Parent.Flags.FIntContentFeedZoomEventThrottle)
local FIntContentPostFetchThresholdModule = require(Parent.Flags.FIntContentPostFetchThreshold)

local function v29(p1, p2, p3, p4, InitialPostsCallFailed, CurrentPostId)
	-- upvalues: PlaceholderTypeModule (copy), ReactModule (copy), FeedItemPostsNotFoundModule (copy), FeedItemPlaceholderModule (copy), FeedItemModule (copy)
	local Elements = {}
	
	if InitialPostsCallFailed then
		Elements[PlaceholderTypeModule.PostsNotFound] = ReactModule.createElement(FeedItemPostsNotFoundModule, { layoutOrder = 1 })
		
		return Elements
	end
	if #p1 == 0 or p4 == nil then
		Elements[PlaceholderTypeModule.PostsNotLoaded] = ReactModule.createElement(FeedItemPlaceholderModule, { layoutOrder = 1 })
		
		return Elements
	end
	if p2 then
		Elements[PlaceholderTypeModule.NextPostsLoading] = ReactModule.createElement(FeedItemPlaceholderModule, { layoutOrder = 0 })
	end
	for i = 1, #p1 do
		local v1 = p1[i]
		Elements[v1.postId] = ReactModule.createElement(FeedItemModule, {
			additionalInfo = v1.additionalInfo,
			assetId = v1.assetId,
			caption = v1.caption,
			creatorUserId = v1.creatorUserId,
			currentPostId = CurrentPostId,
			layoutOrder = i,
			placeId = v1.experienceContext.placeId,
			postId = v1.postId,
			screenshotMetadata = v1.screenshotMetadata,
			universeId = v1.experienceContext.experienceId,
			type = v1.type,
			uploadedAtTimestamp = v1.uploadedAtTimestamp
		})
	end
	if p3 then
		Elements[PlaceholderTypeModule.PreviousPostsLoading] = ReactModule.createElement(FeedItemPlaceholderModule, { layoutOrder = #p1 + 1 })
	end
	return Elements
end

local function v30(Ref, Top)
	-- upvalues: GetFeedPostElementsModule (copy)
	local Name = nil
	for _, Frame in pairs((GetFeedPostElementsModule(Ref))) do
		Name = Frame.Name
		
		if math.abs(Frame.AbsolutePosition.Y + Top) < 5 then
			return Name
		end
	end
	return nil
end

local function _(p5, PostId): boolean
	-- upvalues: FIntContentPostFetchThresholdModule (copy)
	for i = 1, math.min(#p5, FIntContentPostFetchThresholdModule) do
		if p5[i].postId == PostId then
			return true
		end
	end
	return false
end

local _ = function(p6, PostId): boolean
	-- upvalues: FIntContentPostFetchThresholdModule (copy)
	for i = math.max(1, #p6 - (FIntContentPostFetchThresholdModule - 1)), #p6 do
		if p6[i].postId == PostId then
			return true
		end
	end
	return false
end

return function(p7)
	-- upvalues: UseGuiInsetFunction (copy), UsePreferredInputFunction (copy), UseScreenSizeFunction (copy), ReactModule (copy), FeedContextModule (copy), UseStateFunction (copy), UseAnalyticsModule (copy), UseDispatchFunction (copy), UseTokensFunction (copy), UseSelectorFunction (copy), GetDeepValueFunction (copy), ContentFeedCloseInspectOnOpen (copy), UseEffectOnceFunction (copy), InspectClosedModule (copy), UseEffectFunction (copy), GetPostIndexModule (copy), PlaceholderTypeModule (copy), UseFeedMotionControllerModule (copy), EventNamesModule (copy), FIntContentFeedZoomEventThrottleModule (copy), v30 (copy), FeedDirectionTypeModule (copy), FIntContentPostFetchThresholdModule (copy), RetrievePostsModule (copy), SortOrderTypeModule (copy), GetIsPlaceholderModule (copy), v29 (copy), View (copy), FeedTopBarModule (copy), ResponsiveModule (copy), NavigationSidebarModule (copy), FoundationModule (copy)
	local UseGuiInsetResult = UseGuiInsetFunction()
	local UsePreferredInputResult = UsePreferredInputFunction()
	local UseScreenSizeResult = UseScreenSizeFunction()
	local UseContextResult = ReactModule.useContext(FeedContextModule)
	local UseStateResult, UseStateResult2 = UseStateFunction(UseScreenSizeResult)
	local UseAnalyticsModuleResult = UseAnalyticsModule()
	local UseDispatchResult = UseDispatchFunction()
	local UseTokensResult = UseTokensFunction()
	local UseStateResult1, UseStateResult2_1 = UseStateFunction({})
	local UseSelectorResult = UseSelectorFunction(function(p8)
		-- upvalues: GetDeepValueFunction (upval), p7 (copy), UseStateResult1 (copy)
		local List = {}
		local DeepValue = GetDeepValueFunction(p8, "ContentSharing.byUserId." .. p7.creatorUserId .. ".posts") or {}
		for _, value in pairs(DeepValue) do
			if not table.find(UseStateResult1, value.postId) then
				table.insert(List, value)
			end
		end
		return List
	end)
	local UseStateResult3, UseStateResult2_2 = UseStateFunction(nil)
	local UseSelectorResult1 = UseSelectorFunction(function(p9)
		return p9.ContentFeed.Inspect.IsOpen
	end)
	
	if ContentFeedCloseInspectOnOpen then
		UseEffectOnceFunction(function()
			-- upvalues: UseSelectorResult1 (copy), UseDispatchResult (copy), InspectClosedModule (upval)
			if UseSelectorResult1 then
				UseDispatchResult(InspectClosedModule())
			end
		end, {})
	end
	UseEffectFunction(function()
		-- upvalues: GetPostIndexModule (upval), UseSelectorResult (copy), p7 (copy), UseStateResult2_2 (copy)
		local PostIndexModule: number = GetPostIndexModule(UseSelectorResult, p7.initialPostId)
		
		if #UseSelectorResult ~= 0 and PostIndexModule ~= nil then
			UseStateResult2_2(PostIndexModule - 1)
			
			return
		end
	end, { UseSelectorResult, p7.initialPostId })
	local UseSelectorResult2 = UseSelectorFunction(function(p9)
		-- upvalues: GetDeepValueFunction (upval), p7 (copy)
		return GetDeepValueFunction(p9, "ContentSharing.byUserId." .. p7.creatorUserId .. ".nextTimeCursor")
	end)
	local UseSelectorResult3 = UseSelectorFunction(function(p9)
		-- upvalues: GetDeepValueFunction (upval), p7 (copy)
		return GetDeepValueFunction(p9, "ContentSharing.byUserId." .. p7.creatorUserId .. ".previousTimeCursor")
	end)
	local UseStateResult4, UseStateResult2_3 = UseStateFunction(if #UseSelectorResult == 0 then PlaceholderTypeModule.PostsNotLoaded else p7.initialPostId)
	local IsTerminalInitialPost: boolean = #UseSelectorResult == 0 or ((if UseSelectorResult2 == nil then UseSelectorResult2 == nil and UseStateResult4 == UseSelectorResult[1].postId else UseStateResult4 == PlaceholderTypeModule.NextPostsLoading or UseSelectorResult2 == nil and UseStateResult4 == UseSelectorResult[1].postId) or (UseStateResult4 == PlaceholderTypeModule.PostsNotLoaded or UseStateResult4 == PlaceholderTypeModule.PostsNotFound))
	local IsTerminalFinalPost: boolean = #UseSelectorResult == 0 or ((if UseSelectorResult3 == nil then UseSelectorResult3 == nil and UseStateResult4 == UseSelectorResult[#UseSelectorResult].postId else UseStateResult4 == PlaceholderTypeModule.PreviousPostsLoading or UseSelectorResult3 == nil and UseStateResult4 == UseSelectorResult[#UseSelectorResult].postId) or (UseStateResult4 == PlaceholderTypeModule.PostsNotLoaded or UseStateResult4 == PlaceholderTypeModule.PostsNotFound))
	local UseFeedMotionControllerModuleResult, UseFeedMotionControllerModuleResult2, UseFeedMotionControllerModuleResult3 = UseFeedMotionControllerModule(IsTerminalInitialPost, IsTerminalFinalPost, #UseSelectorResult, UseSelectorResult1)
	UseEffectFunction(function()
		-- upvalues: UseAnalyticsModuleResult (copy), EventNamesModule (upval), UseStateResult4 (copy)
		UseAnalyticsModuleResult.fireEvent(EventNamesModule.ContentFeedPostViewed, { postId = UseStateResult4 })
	end, { UseAnalyticsModuleResult.fireEvent, UseStateResult4 })
	UseEffectFunction(function()
		-- upvalues: UseContextResult (copy), FIntContentFeedZoomEventThrottleModule (upval), UseAnalyticsModuleResult (copy), EventNamesModule (upval), UseStateResult4 (copy)
		if UseContextResult.isZooming and math.random() < 1 / FIntContentFeedZoomEventThrottleModule then
			UseAnalyticsModuleResult.fireEvent(EventNamesModule.ContentFeedZoomOccurred, { postId = UseStateResult4 })
		end
	end, {
		UseAnalyticsModuleResult.fireEvent,
		UseStateResult4,
		UseContextResult.isZooming
	})
	UseEffectFunction(function()
		-- upvalues: v30 (upval), UseFeedMotionControllerModuleResult (copy), UseGuiInsetResult (copy), UseStateResult2_3 (copy)
		local v2 = v30(UseFeedMotionControllerModuleResult, UseGuiInsetResult.top)
		
		if v2 then
			UseStateResult2_3(v2)
		end
	end, { UseSelectorResult, UseGuiInsetResult.top })
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: v30 (upval), UseFeedMotionControllerModuleResult (copy), UseGuiInsetResult (copy), UseStateResult2_3 (copy), UseStateResult1 (copy), UseStateResult4 (copy), UseSelectorResult (copy), UseContextResult (copy), UseFeedMotionControllerModuleResult3 (copy), FeedDirectionTypeModule (upval), UseStateResult2_1 (copy)
		local v2 = v30(UseFeedMotionControllerModuleResult, UseGuiInsetResult.top)
		
		if v2 then
			UseStateResult2_3(v2)
		end
		local List = {}
		
		for _, value in pairs(UseStateResult1) do
			table.insert(List, value)
		end
		table.insert(List, UseStateResult4)
		
		if #UseSelectorResult == 1 then
			UseContextResult.navigateBack(true)
		elseif UseStateResult4 ~= UseSelectorResult[1].postId then
			UseFeedMotionControllerModuleResult3(FeedDirectionTypeModule.Up)
			task.wait(0.1)
		end
		UseStateResult2_1(List)
	end, {
		UseSelectorResult, UseContextResult.navigateBack, UseGuiInsetResult.top,
		UseFeedMotionControllerModuleResult2, UseStateResult1, UseStateResult3,
		UseFeedMotionControllerModuleResult3
	})
	UseEffectFunction(function()
		-- upvalues: UseFeedMotionControllerModuleResult2 (copy), v30 (upval), UseFeedMotionControllerModuleResult (copy), UseGuiInsetResult (copy), UseStateResult2_3 (copy)
		local Connection = UseFeedMotionControllerModuleResult2:connect(function(_)
			-- upvalues: v30 (upval), UseFeedMotionControllerModuleResult (upval), UseGuiInsetResult (upval), UseStateResult2_3 (upval)
			local v3 = v30(UseFeedMotionControllerModuleResult, UseGuiInsetResult.top)
			
			if v3 then
				UseStateResult2_3(v3)
			end
		end)
		
		return function()
			-- upvalues: Connection (copy)
			Connection:disconnect()
		end
	end, {
		UseSelectorResult, UseStateResult4, UseGuiInsetResult.top,
		UseFeedMotionControllerModuleResult2, UseSelectorResult2, UseSelectorResult3
	})
	local Flag = false
	
	for i = 1, math.min(#UseSelectorResult, FIntContentPostFetchThresholdModule) do
		if UseSelectorResult[i].postId ~= UseStateResult4 then
			continue
		end
		Flag = true
		break
	end
	local Flag1 = false
	
	for i1 = math.max(1, #UseSelectorResult - (FIntContentPostFetchThresholdModule - 1)), #UseSelectorResult do
		if UseSelectorResult[i1].postId ~= UseStateResult4 then
			continue
		end
		Flag1 = true
		break
	end
	UseEffectFunction(function()
		-- upvalues: Flag (copy), UseSelectorResult2 (copy), UseDispatchResult (copy), RetrievePostsModule (upval), p7 (copy), SortOrderTypeModule (upval), Flag1 (copy), UseSelectorResult3 (copy)
		if Flag and UseSelectorResult2 then
			assert(UseSelectorResult2 ~= nil, "nextTimeCursor should not be nil")
			UseDispatchResult(RetrievePostsModule(p7.creatorUserId, UseSelectorResult2, SortOrderTypeModule.Ascending))
		end
		if Flag1 and UseSelectorResult3 then
			assert(UseSelectorResult3 ~= nil, "previousTimeCursor should not be nil")
			UseDispatchResult(RetrievePostsModule(p7.creatorUserId, UseSelectorResult3, SortOrderTypeModule.Descending))
		end
	end, {
		UseDispatchResult, Flag, Flag1, UseSelectorResult2, UseSelectorResult3,
		RetrievePostsModule
	})
	local UseResult1 = ReactModule.useCallback(function()
		-- upvalues: UseDispatchResult (copy), InspectClosedModule (upval)
		UseDispatchResult(InspectClosedModule())
	end, { UseDispatchResult, InspectClosedModule })
	local UseResult2 = ReactModule.useCallback(function()
		-- upvalues: UseFeedMotionControllerModuleResult3 (copy), FeedDirectionTypeModule (upval)
		UseFeedMotionControllerModuleResult3(FeedDirectionTypeModule.Up)
	end, { UseFeedMotionControllerModuleResult3 })
	local UseResult3 = ReactModule.useCallback(function()
		-- upvalues: UseFeedMotionControllerModuleResult3 (copy), FeedDirectionTypeModule (upval)
		UseFeedMotionControllerModuleResult3(FeedDirectionTypeModule.Down)
	end, { UseFeedMotionControllerModuleResult3 })
	local IsPlaceholderModule = GetIsPlaceholderModule(UseStateResult4)
	local Count = 0
	
	if UseSelectorResult2 then
		Count += 1
	end
	local Smallest = math.min(UseStateResult.X, UseStateResult.Y * 0.5625)
	local NewSmallest = Smallest / 2 + UseTokensResult.Padding.Medium
	
	return ReactModule.createElement(View, {
		tag = "bg-surface-0",
		onAbsoluteSizeChanged = function(Frame)
			-- upvalues: UseStateResult2 (copy)
			UseStateResult2(Frame.AbsoluteSize)
		end,
		Size = UDim2.new(1, 0, 0, UseScreenSizeResult.Y)
	}, {
		TopBar = ReactModule.createElement(FeedTopBarModule, {
			ZIndex = 3,
			creatorId = p7.creatorUserId,
			isPlaceholderPost = IsPlaceholderModule,
			postId = UseStateResult4,
			removePostTransition = UseResult
		}),
		FeedContainer = ReactModule.createElement(View, {
			tag = "anchor-top-center bg-action-subtle position-top-center shrink size-0-full",
			Size = UDim2.new(0, Smallest, 1, 0)
		}, {
			ContentFeed = ReactModule.createElement(View, {
				LayoutOrder = 1,
				tag = "align-x-center bg-action-subtle col no-clip",
				Position = UDim2.fromOffset(0, -UseScreenSizeResult.Y * (Count + (if UseStateResult3 == nil then 0 else UseStateResult3)) - UseGuiInsetResult.top),
				ref = UseFeedMotionControllerModuleResult,
				Size = UDim2.new(1, 0, 0, #UseSelectorResult * UseScreenSizeResult.Y)
			}, (v29(UseSelectorResult, UseSelectorResult2, UseSelectorResult3, UseStateResult3, p7.initialPostsCallFailed, UseStateResult4)))
		}),
		NavigationSidebar = if UsePreferredInputResult == ResponsiveModule.Input.Pointer and (NewSmallest + UseTokensResult.Size.Size_1200) * 2 <= UseStateResult.X then ReactModule.createElement(NavigationSidebarModule, {
			isTerminalFinalPost = IsTerminalFinalPost,
			isTerminalInitialPost = IsTerminalInitialPost,
			position = UDim2.new(0.5, NewSmallest, 0.5, 0),
			onNavigateDown = UseResult3,
			onNavigateUp = UseResult2
		}) else nil,
		ShadowBlock = if UseSelectorResult1 then ReactModule.createElement(View, {
			tag = "align-x-center bg-over-media-0 col items-center size-full-full",
			ZIndex = 3,
			onActivated = UseResult1,
			stateLayer = {
				affordance = FoundationModule.Enums.StateLayerAffordance.None
			}
		}) else nil
	})
end