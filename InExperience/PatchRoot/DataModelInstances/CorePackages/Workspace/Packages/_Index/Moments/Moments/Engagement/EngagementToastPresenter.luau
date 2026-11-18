local Moments = script:FindFirstAncestor("Moments")
local Parent = Moments.Parent
local HttpService = game:GetService("HttpService")
local LocalizationService = game:GetService("LocalizationService")
local LocalizationModule = require(Parent.Localization)
local MomentsTypesModule = require(Parent.MomentsTypes)
local PromiseModule = require(Parent.Promise)
local ReactModule = require(Parent.React)
local SignalsModule = require(Parent.Signals)
local SignalsReactModule = require(Parent.SignalsReact)
local UserProfileModule = require(Parent.DataHydration.UserProfile)
local GetNextToastCoordinatorModule = require(Moments.Engagement.GetNextToastCoordinator)
local GetToastStoreModule = require(Moments.Stores.GetToastStore)
local FetchMomentsByIdsModule = require(Moments.Stores.GetMomentsStore.fetchMomentsByIds)
local OpenEngagementToastTargetModule = require(Moments.Engagement.openEngagementToastTarget)
local SelectEngagementToastCopyModule = require(Moments.Engagement.selectEngagementToastCopy)
local ShouldShowMomentInFeedModule = require(Moments.Stores.GetMomentsStore.shouldShowMomentInFeed)
local ShareLinkTargetIdType = MomentsTypesModule.Enums.ShareLinkTargetIdType
local AbbreviateCountFunction = LocalizationModule.abbreviateCount
local UseSignalStateFunction = SignalsReactModule.useSignalState
local FFlagMomentsEngagementDigestToastModule = require(Moments.Flags.FFlagMomentsEngagementDigestToast)
local List = { "comments", "reactionMilestone", "likes" }

if FFlagMomentsEngagementDigestToastModule then
	table.insert(List, "rollup")
end
local Signal = SignalsModule.createSignal(nil)
local Thumbnails = {}
local v1 = nil

local function formatCount(p1)
	-- upvalues: AbbreviateCountFunction (copy), LocalizationService (copy)
	return AbbreviateCountFunction(p1, LocalizationService.RobloxLocaleId)
end

local function _(p1, p2, p3)
	if p1 == nil or p2 == nil then
		return ""
	else
		local Success, Result = pcall(p1.Format, p1, p2, p3)
		
		return if Success and type(Result) == "string" then Result else ""
	end
end

local function defaultSchedule(Delay, p1)
	local DelayedThread = task.delay(Delay, p1)
	
	return function()
		-- upvalues: DelayedThread (copy)
		pcall(task.cancel, DelayedThread)
	end
end

local function useWaitTimedOut(Toast, Callback): boolean
	-- upvalues: ReactModule (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(nil)
	ReactModule.useEffect(function()
		-- upvalues: Toast (copy), Callback (copy), UseStateResult2 (copy)
		return if Toast == nil then nil else Callback(2, function()
			-- upvalues: UseStateResult2 (upval), Toast (upval)
			UseStateResult2(Toast)
		end)
	end, { Toast, Callback })
	
	return Toast ~= nil and UseStateResult == Toast
end

local function useActorName(Toast)
	-- upvalues: ReactModule (copy), Signal (copy), UserProfileModule (copy), UseSignalStateFunction (copy)
	local ActorUserId = if Toast == nil or Toast.kind ~= "comments" then nil else Toast.actorUserIds[1]
	local UseSignalStateResult = UseSignalStateFunction((ReactModule.useMemo(function()
		-- upvalues: ActorUserId (copy), Signal (upval), UserProfileModule (upval)
		return if ActorUserId == nil then Signal else UserProfileModule.getAndFetchUserNamesByUserIds({ (tostring(ActorUserId)) })
	end, { ActorUserId })))
	
	if ActorUserId == nil then
		return nil, true
	else
		local NamesByUserIdEntry = if UseSignalStateResult == nil then nil else UseSignalStateResult.namesByUserId[tostring(ActorUserId)]
		local CombinedName = if NamesByUserIdEntry == nil then nil else NamesByUserIdEntry.combinedName
		
		return CombinedName, CombinedName ~= nil or UseSignalStateResult ~= nil and UseSignalStateResult.status ~= "NotReady"
	end
end

local function useMomentThumbnail(Toast)
	-- upvalues: ReactModule (copy), Thumbnails (copy), PromiseModule (copy), FetchMomentsByIdsModule (copy), ShareLinkTargetIdType (copy), ShouldShowMomentInFeedModule (copy), HttpService (copy)
	local FeedItemId = if Toast == nil then nil else Toast.feedItemId
	local UseStateResult, UseStateResult2 = ReactModule.useState(nil)
	ReactModule.useEffect(function()
		-- upvalues: FeedItemId (copy), Thumbnails (upval), UseStateResult2 (copy), PromiseModule (upval), FetchMomentsByIdsModule (upval), ShareLinkTargetIdType (upval), ShouldShowMomentInFeedModule (upval), HttpService (upval)
		if FeedItemId == nil then
			return nil
		end
		local Thumbnail = Thumbnails[FeedItemId]
		
		if Thumbnail == nil then
			local Flag = true
			PromiseModule.try(FetchMomentsByIdsModule, { FeedItemId }, ShareLinkTargetIdType.FeedItemId):andThen(function(Result): string?
				-- upvalues: FeedItemId (upval), ShouldShowMomentInFeedModule (upval), HttpService (upval)
				for _, moment in Result.moments do
					if moment.momentId == FeedItemId or moment.recommendationMetadata.feedItemId == FeedItemId then
						if ShouldShowMomentInFeedModule(moment) and moment.metadata.captureType == Enum.CaptureType.Screenshot and moment.assetId > 0 then
							local RbxthumbName: string = `rbxthumb://type=Asset&id={moment.assetId}&w=150&h=150`
							local AssetAccessContext = moment.metadata.assetAccessContext
							
							return if AssetAccessContext == nil or AssetAccessContext == "" then RbxthumbName else `{RbxthumbName}&accessContext={HttpService:UrlEncode(AssetAccessContext)}`
						else
							return nil
						end
					end
				end
				return nil
			end):catch(function()
				return nil
			end):andThen(function(Result)
				-- upvalues: Thumbnails (upval), FeedItemId (upval), Flag (ref), UseStateResult2 (upval)
				if Result ~= nil then
					Thumbnails[FeedItemId] = Result
				end
				if Flag then
					UseStateResult2({ feedItemId = FeedItemId, thumbnail = Result })
				end
			end)
			
			return function()
				-- upvalues: Flag (ref)
				Flag = false
			end
		else
			UseStateResult2({ feedItemId = FeedItemId, thumbnail = Thumbnail })
			
			return nil
		end
	end, { FeedItemId })
	
	if FeedItemId == nil then
		return nil, true
	elseif UseStateResult == nil or UseStateResult.feedItemId ~= FeedItemId then
		return nil, false
	else
		return UseStateResult.thumbnail, true
	end
end

local _ = function(p1, p2)
	-- upvalues: GetToastStoreModule (copy), SignalsModule (copy)
	local ToastStoreModule = GetToastStoreModule(false)
	local v2 = false
	
	return SignalsModule.createEffect(function(p3)
		-- upvalues: ToastStoreModule (copy), p1 (copy), v2 (ref), p2 (copy)
		for _, value in ToastStoreModule.getToasts(p3) do
			if value.id == p1 then return end
		end
		if not v2 then
			v2 = true
			p2()
		end
	end)
end

return function(p3)
	-- upvalues: GetNextToastCoordinatorModule (copy), ReactModule (copy), List (copy), UseSignalStateFunction (copy), useActorName (copy), useMomentThumbnail (copy), useWaitTimedOut (copy), defaultSchedule (copy), LocalizationModule (copy), v1 (ref), SelectEngagementToastCopyModule (copy), formatCount (copy), GetToastStoreModule (copy), OpenEngagementToastTargetModule (copy), SignalsModule (copy)
	local NextToastCoordinatorModule = GetNextToastCoordinatorModule(false)
	ReactModule.useEffect(function()
		-- upvalues: NextToastCoordinatorModule (copy), List (upval)
		return NextToastCoordinatorModule.registerKinds(List)
	end, { NextToastCoordinatorModule })
	local UseSignalStateResult = UseSignalStateFunction(NextToastCoordinatorModule.getCurrentToast)
	local UseActorNameResult, UseActorNameResult2 = useActorName(UseSignalStateResult)
	local UseMomentThumbnailResult, UseMomentThumbnailResult2 = useMomentThumbnail(UseSignalStateResult)
	local UseWaitTimedOutResult = useWaitTimedOut(UseSignalStateResult, p3.schedule or defaultSchedule) or UseActorNameResult2 and UseMomentThumbnailResult2
	local UseContextResult = ReactModule.useContext(LocalizationModule.LocalizationRoactContext)
	ReactModule.useEffect(function()
		-- upvalues: UseSignalStateResult (copy), UseWaitTimedOutResult (copy), v1 (upval), SelectEngagementToastCopyModule (upval), UseActorNameResult (copy), formatCount (upval), UseContextResult (copy), NextToastCoordinatorModule (copy), GetToastStoreModule (upval), UseMomentThumbnailResult (copy), OpenEngagementToastTargetModule (upval), SignalsModule (upval)
		if UseSignalStateResult == nil or not UseWaitTimedOutResult or v1 ~= nil and v1.toast == UseSignalStateResult then return end
		local SelectEngagementToastCopyModuleResult = SelectEngagementToastCopyModule(UseSignalStateResult, UseActorNameResult, formatCount)
		local Title = nil
		
		if SelectEngagementToastCopyModuleResult == nil then
			Title = ""
		else
			local TitleKey = SelectEngagementToastCopyModuleResult.titleKey
			local Args = SelectEngagementToastCopyModuleResult.args
			
			if UseContextResult == nil or TitleKey == nil then
				Title = ""
			else
				local Success, Result = pcall(UseContextResult.Format, UseContextResult, TitleKey, Args)
				Title = if Success and type(Result) == "string" then Result else ""
			end
		end
		if Title == "" then
			NextToastCoordinatorModule.toastClosed()
			
			return
		end
		local ToastStoreModule = GetToastStoreModule(false)
		local v3 = nil
		local TriggerToastFunction = ToastStoreModule.triggerToast
		local config = { placement = "belowHeader", duration = 7, title = Title }
		local Text = nil
		
		if SelectEngagementToastCopyModuleResult == nil then
			Text = ""
		else
			local UseContextResult1 = UseContextResult
			local TextKey = SelectEngagementToastCopyModuleResult.textKey
			local Args = SelectEngagementToastCopyModuleResult.args
			
			if UseContextResult1 == nil or TextKey == nil then
				Text = ""
			else
				local Success1, Result1 = pcall(UseContextResult1.Format, UseContextResult1, TextKey, Args)
				Text = if Success1 and type(Result1) == "string" then Result1 else ""
			end
		end
		config.text = Text
		config.thumbnail = UseMomentThumbnailResult
		local Actions = {}
		local t = {}
		local Text1 = nil
		
		if UseContextResult == nil then
			Text1 = ""
		else
			local Success2, Result2 = pcall(UseContextResult.Format, UseContextResult, "CommonUI.Messages.Action.Dismiss", nil)
			Text1 = if Success2 and type(Result2) == "string" then Result2 else ""
		end
		t.text = Text1
		
		function t.onActivated()
			-- upvalues: ToastStoreModule (copy), v3 (ref)
			ToastStoreModule.dismissToast(v3)
		end
		
		local t1 = {}
		local Text2 = nil
		
		if UseContextResult == nil then
			Text2 = ""
		else
			local Success3, Result3 = pcall(UseContextResult.Format, UseContextResult, "Feature.Moments.Action.View", nil)
			Text2 = if Success3 and type(Result3) == "string" then Result3 else ""
		end
		t1.text = Text2
		
		function t1.onActivated()
			-- upvalues: OpenEngagementToastTargetModule (upval), UseSignalStateResult (upval), ToastStoreModule (copy), v3 (ref)
			OpenEngagementToastTargetModule(UseSignalStateResult)
			ToastStoreModule.dismissToast(v3)
		end
		
		Actions[1] = t
		Actions[2] = t1
		config.actions = Actions
		v3 = TriggerToastFunction(config)
		local config1 = {
			toast = UseSignalStateResult,
			stopWatching = function() end
		}
		v1 = config1
		local Id = v3
		
		local function v82()
			-- upvalues: v1 (upval), config1 (copy), NextToastCoordinatorModule (upval)
			if v1 == config1 then
				v1 = nil
			end
			NextToastCoordinatorModule.toastClosed()
		end
		
		local ToastStoreModule1 = GetToastStoreModule(false)
		local v4 = false
		config1.stopWatching = SignalsModule.createEffect(function(p4)
			-- upvalues: ToastStoreModule1 (copy), Id (copy), v4 (ref), v82 (copy)
			for _, value in ToastStoreModule1.getToasts(p4) do
				if value.id == Id then return end
			end
			if not v4 then
				v4 = true
				v82()
			end
		end)
	end, {
		NextToastCoordinatorModule, UseContextResult, UseSignalStateResult,
		UseWaitTimedOutResult, UseActorNameResult, UseMomentThumbnailResult
	})
	
	return nil
end