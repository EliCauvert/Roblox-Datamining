local Moments = script:FindFirstAncestor("Moments")
local Parent = Moments.Parent
local _ = require(Parent.MomentsTypes)
local PromiseModule = require(Parent.Promise)
local SharedFlagsModule = require(Parent.SharedFlags)
local SignalsModule = require(Parent.Signals)
local _ = require(Parent.DataHydration.MomentsStoreTypes)
local MomentsGetMomentsUserStoreModule = require(Parent.DataHydration.MomentsGetMomentsUserStore)
local GetLocalUserIdModule = require(Moments.Utils.getLocalUserId)
local ShouldShowMomentInFeedModule = require(Moments.Stores.GetMomentsStore.shouldShowMomentInFeed)
local PostLifecycleSubscriptionModule = require(script.Parent.postLifecycleSubscription)
game:DefineFastInt("MomentsPublishedPostPollIntervalSeconds", 10)
game:DefineFastInt("MomentsPublishedPostMaxPollAttempts", 30)
local MomentsUpload = nil

local function _() --[[ Line: 44 | Named "getLogger" ]]
	-- upvalues: MomentsUpload (ref), Parent (copy)
	if MomentsUpload == nil then
		MomentsUpload = require(Parent.Loggers).Logger:new("Moments.Upload")
	end
	return MomentsUpload
end

local Count = 0

local function waitForLifecycleChange(WakeVersion, LocalUserId, Largest, Callback): boolean --[[ Line: 97 ]]
	-- upvalues: PromiseModule (copy), SignalsModule (copy), PostLifecycleSubscriptionModule (copy)
	local function Effect() --[[ Line: 103 ]] end
	
	local DeferredThread = nil
	local _, v1 = PromiseModule.race({
		PromiseModule.new(function(Callback) --[[ Line: 105 ]]
			-- upvalues: Effect (ref), SignalsModule (upval), PostLifecycleSubscriptionModule (upval), LocalUserId (copy), WakeVersion (copy), DeferredThread (ref)
			Effect = SignalsModule.createEffect(function(p1) --[[ Line: 106 ]]
				-- upvalues: PostLifecycleSubscriptionModule (upval), LocalUserId (upval), WakeVersion (upval), DeferredThread (upval), Callback (copy)
				if PostLifecycleSubscriptionModule.getWakeVersion(p1, LocalUserId) ~= WakeVersion and DeferredThread == nil then
					DeferredThread = task.defer(function() --[[ Line: 109 ]]
						-- upvalues: DeferredThread (upval), Callback (upval)
						DeferredThread = nil
						Callback(true)
					end)
				end
			end)
		end),
		(PromiseModule.new(function(Callback1: (any) -> ()) --[[ Line: 116 ]]
			-- upvalues: Callback (copy), Largest (copy)
			Callback(Largest)
			Callback1(false)
		end))
	}):await()
	Effect()
	
	if DeferredThread ~= nil then
		task.cancel(DeferredThread)
	end
	return v1 == true
end

local _ = function(p1, p2, p3) --[[ Line: 128 | Named "fetchPage" ]]
	local v1, v2 = p1.getFreshUserMoments(p2, p3):await()
	
	return if v1 then v2 else nil
end

local function addToSnapshot(p1, p2) --[[ Line: 135 ]]
	for _, moment in p2.moments do
		p1.knownMomentIds[moment.momentId] = true
		local FeedItemId = moment.recommendationMetadata.feedItemId
		
		if FeedItemId ~= nil then
			p1.knownMomentIds[FeedItemId] = true
		end
	end
	local ExcludedMomentIds = p2.excludedMomentIds or {}
	for _, excludedMomentId in ExcludedMomentIds do
		p1.knownMomentIds[excludedMomentId] = true
	end
end

local _ = function(p3, p4): boolean --[[ Line: 149 | Named "isKnown" ]]
	local FeedItemId = p4.recommendationMetadata.feedItemId
	
	return p3.knownMomentIds[p4.momentId] == true or FeedItemId ~= nil and p3.knownMomentIds[FeedItemId] == true
end

local _ = function(p3): string --[[ Line: 155 | Named "trim" ]]
	return string.match(p3 or "", "^%s*(.-)%s*$") or ""
end

local function textMatches(Description, Description1): boolean --[[ Line: 160 ]]
	local Match: string = string.match(Description or "", "^%s*(.-)%s*$") or ""
	local Match1: string = string.match(Description1 or "", "^%s*(.-)%s*$") or ""
	
	if Match == Match1 then
		return true
	end
	local Length = utf8.len(Match)
	
	if Length == nil or Length ~= utf8.len(Match1) then
		return false
	end
	local List = {}
	
	for _, value in utf8.codes(Match) do
		table.insert(List, value)
	end
	local Count = 0
	
	for _, value1 in utf8.codes(Match1) do
		Count += 1
		
		if value1 ~= List[Count] and value1 ~= 35 then
			return false
		end
	end
	return true
end

local _ = function(p3) --[[ Line: 184 | Named "getMusicAssetId" ]]
	local Music = if p3 == nil then nil else p3.music
	
	return if Music == nil then nil else tonumber(Music.assetId)
end

local function getOverlayTexts(Edits) --[[ Line: 189 ]]
	local List = {}
	local T = if Edits == nil or Edits.textOverlays == nil then {} else Edits.textOverlays
	for _, value in T do
		table.insert(List, value.text)
	end
	return List
end

local _ = function(p3): number --[[ Line: 200 | Named "getTextLength" ]]
	return (utf8.len(string.match(p3 or "", "^%s*(.-)%s*$") or ""))
end

local function overlayTextsMatch(Edits, Edits1): boolean --[[ Line: 205 ]]
	-- upvalues: getOverlayTexts (copy), textMatches (copy)
	local OverlayTexts = getOverlayTexts(Edits)
	local OverlayTexts1 = getOverlayTexts(Edits1)
	
	if #OverlayTexts ~= #OverlayTexts1 then
		return false
	end
	for i, overlayText in OverlayTexts do
		if not textMatches(overlayText, OverlayTexts1[i]) then
			return false
		end
	end
	return true
end

local _ = function(p3: number): boolean --[[ Line: 219 | Named "isKnownPlace" ]]
	return p3 ~= nil and p3 > 0
end

local _ = function(p3: number, p4: number): boolean --[[ Line: 223 | Named "placeMatches" ]]
	return not (p3 ~= nil and p3 > 0) or (not (p4 ~= nil and p4 > 0) or p3 == p4)
end

local function evaluate(Moment, Position, p3) --[[ Line: 227 ]]
	-- upvalues: ShouldShowMomentInFeedModule (copy), textMatches (copy), overlayTextsMatch (copy)
	local Metadata = Moment.metadata
	local Edits = p3.edits
	local Music = if Edits == nil then nil else Edits.music
	local Number = if Music == nil then nil else tonumber(Music.assetId)
	local Edits1 = Metadata.edits
	local Music1 = if Edits1 == nil then nil else Edits1.music
	local PlaceId: number = p3.placeId
	local PlaceId1: number = Metadata.placeId
	
	return {
		moment = Moment,
		position = Position,
		visible = ShouldShowMomentInFeedModule(Moment),
		captureType = Metadata.captureType == p3.captureType,
		caption = textMatches(p3.description, Metadata.description),
		music = Number == (if Music1 == nil then nil else tonumber(Music1.assetId)),
		overlays = overlayTextsMatch(p3.edits, Metadata.edits),
		place = not (PlaceId ~= nil and PlaceId > 0) or (not (PlaceId1 ~= nil and PlaceId1 > 0) or PlaceId == PlaceId1)
	}
end

local _ = function(p3) --[[ Line: 242 | Named "isMatch" ]]
	return p3.visible and (p3.captureType and (p3.caption and (p3.music and (p3.overlays and p3.place))))
end

local function findPublishedPost(p3, p4, p5) --[[ Line: 251 ]]
	-- upvalues: evaluate (copy)
	local v1 = nil
	local List = {}
	
	for i, moment in p3.moments do
		local FeedItemId = moment.recommendationMetadata.feedItemId
		
		if p4.knownMomentIds[moment.momentId] ~= true and (FeedItemId == nil or p4.knownMomentIds[FeedItemId] ~= true) then
			local EvaluateResult = evaluate(moment, i, p5)
			table.insert(List, EvaluateResult)
			
			if v1 == nil and (EvaluateResult.visible and (EvaluateResult.captureType and (EvaluateResult.caption and (EvaluateResult.music and (EvaluateResult.overlays and EvaluateResult.place))))) then
				v1 = moment
			end
		end
	end
	return v1, List
end

local function logIds(p6, List) --[[ Line: 271 ]]
	-- upvalues: MomentsUpload (ref), Parent (copy)
	for i = 1, #List, 6 do
		local Smallest = math.min(i + 6 - 1, #List)
		
		if MomentsUpload == nil then
			MomentsUpload = require(Parent.Loggers).Logger:new("Moments.Upload")
		end
		MomentsUpload:debug("event={} from={} ids=[{}]", p6, tostring(i), table.concat(List, ",", i, Smallest))
	end
end

local function logSnapshotPage(Count, p7, p8) --[[ Line: 278 ]]
	-- upvalues: MomentsUpload (ref), Parent (copy), logIds (copy)
	local ExcludedMomentIds = p8.excludedMomentIds or {}
	
	if MomentsUpload == nil then
		MomentsUpload = require(Parent.Loggers).Logger:new("Moments.Upload")
	end
	MomentsUpload:debug("event=published_post_snapshot_page resolverId={} page={} moments={} excluded={} hasNext={}", tostring(Count), tostring(p7), tostring(#p8.moments), tostring(#ExcludedMomentIds), (tostring(p8.nextCursor ~= nil)))
	local List = {}
	
	for _, moment in p8.moments do
		table.insert(List, `{moment.momentId}:{moment.assetId}`)
	end
	logIds("published_post_snapshot_moments", List)
	logIds("published_post_snapshot_excluded", ExcludedMomentIds)
end

local function logExpectation(p9) --[[ Line: 296 ]]
	-- upvalues: MomentsUpload (ref), Parent (copy), getOverlayTexts (copy)
	if MomentsUpload == nil then
		MomentsUpload = require(Parent.Loggers).Logger:new("Moments.Upload")
	end
	local Edits = p9.edits
	local Music = if Edits == nil then nil else Edits.music
	MomentsUpload:debug("event=published_post_expectation captureType={} captionLength={} musicAssetId={} overlayCount={} placeId={}", p9.captureType.Name, tostring((utf8.len(string.match(p9.description or "", "^%s*(.-)%s*$") or ""))), tostring(if Music == nil then nil else tonumber(Music.assetId)), tostring(#getOverlayTexts(p9.edits)), (tostring(p9.placeId)))
end

local function logCandidate(Count, p9) --[[ Line: 307 ]]
	-- upvalues: MomentsUpload (ref), Parent (copy), getOverlayTexts (copy)
	local Moment = p9.moment
	local Metadata = Moment.metadata
	
	if MomentsUpload == nil then
		MomentsUpload = require(Parent.Loggers).Logger:new("Moments.Upload")
	end
	local Edits = Metadata.edits
	local Music = if Edits == nil then nil else Edits.music
	MomentsUpload:debug("event=published_post_candidate attempt={} position={} momentId={} feedItemId={} assetId={} status={} matched={} visible={} captureType={} caption={} music={} overlays={} place={} storedCaptureType={} storedCaptionLength={} storedMusicAssetId={} storedOverlayCount={} storedPlaceId={}", tostring(Count), tostring(p9.position), Moment.momentId, tostring(Moment.recommendationMetadata.feedItemId), tostring(Moment.assetId), tostring(Moment.status), tostring(p9.visible and (p9.captureType and (p9.caption and (p9.music and (p9.overlays and p9.place))))), tostring(p9.visible), tostring(p9.captureType), tostring(p9.caption), tostring(p9.music), tostring(p9.overlays), tostring(p9.place), Metadata.captureType.Name, tostring((utf8.len(string.match(Metadata.description or "", "^%s*(.-)%s*$") or ""))), tostring(if Music == nil then nil else tonumber(Music.assetId)), tostring(#getOverlayTexts(Metadata.edits)), (tostring(Metadata.placeId)))
end

return function(p9, p10) --[[ Line: 333 | Named "createPublishedPostResolver" ]]
	-- upvalues: MomentsGetMomentsUserStoreModule (copy), Count (ref), MomentsUpload (ref), Parent (copy), addToSnapshot (copy), logSnapshotPage (copy), GetLocalUserIdModule (copy), logExpectation (copy), PromiseModule (copy), SharedFlagsModule (copy), PostLifecycleSubscriptionModule (copy), waitForLifecycleChange (copy), findPublishedPost (copy), logCandidate (copy)
	local P37 = p10 or {}
	local MomentsGetMomentsUserStoreModuleResult = if P37.userStore == nil then MomentsGetMomentsUserStoreModule(false) else P37.userStore
	local Wait = P37.wait or function(Duration) --[[ Line: 341 ]]
		task.wait(Duration)
	end
	local Count1 = 0
	local LocalUserId = nil
	local NewResult = nil
	
	local function takeSnapshot(LocalUserId) --[[ Line: 353 ]]
		-- upvalues: Wait (copy), MomentsGetMomentsUserStoreModuleResult (copy), MomentsUpload (upval), Parent (upval), Count1 (ref), addToSnapshot (upval), logSnapshotPage (upval)
		local v2 = nil
		
		for i = 1, 3 do
			if i > 1 then
				Wait(2)
			end
			local v3, v4 = MomentsGetMomentsUserStoreModuleResult.getFreshUserMoments(LocalUserId, nil):await()
			v2 = if v3 then v4 else nil
			
			if v2 ~= nil then break end
			if MomentsUpload == nil then
				MomentsUpload = require(Parent.Loggers).Logger:new("Moments.Upload")
			end
			MomentsUpload:debug("event=published_post_snapshot_read_failed resolverId={} attempt={}", tostring(Count1), (tostring(i)))
		end
		if v2 == nil then
			return nil
		end
		local config = { knownMomentIds = {} }
		addToSnapshot(config, v2)
		logSnapshotPage(Count1, 1, v2)
		local NextCursor = v2.nextCursor
		
		for i1 = 2, 3 do
			if NextCursor == nil then break end
			local v5, v6 = MomentsGetMomentsUserStoreModuleResult.getFreshUserMoments(LocalUserId, NextCursor):await()
			local v7 = if v5 then v6 else nil
			
			if v7 == nil then break end
			addToSnapshot(config, v7)
			logSnapshotPage(Count1, i1, v7)
			NextCursor = if v7.nextCursor == NextCursor then nil else v7.nextCursor
		end
		return config
	end
	
	return {
		captureSnapshot = function() --[[ Line: 394 ]]
			-- upvalues: Count (upval), Count1 (ref), P37 (copy), LocalUserId (ref), GetLocalUserIdModule (upval), MomentsUpload (upval), Parent (upval), logExpectation (upval), p9 (copy), NewResult (ref), PromiseModule (upval), takeSnapshot (copy)
			Count += 1
			Count1 = Count
			LocalUserId = if P37.getLocalUserId == nil then GetLocalUserIdModule() else P37.getLocalUserId()
			
			if MomentsUpload == nil then
				MomentsUpload = require(Parent.Loggers).Logger:new("Moments.Upload")
			end
			MomentsUpload:debug("event=published_post_snapshot_started resolverId={} hasUser={}", tostring(Count1), (tostring(LocalUserId ~= nil)))
			logExpectation(p9)
			local LocalUserId1 = LocalUserId
			NewResult = PromiseModule.new(function(Callback: (any) -> ()) --[[ Line: 412 ]]
				-- upvalues: LocalUserId1 (copy), takeSnapshot (upval)
				Callback(if LocalUserId1 == nil then nil else takeSnapshot(LocalUserId1))
			end)
		end,
		resolve = function(MomentId) --[[ Line: 417 ]]
			-- upvalues: NewResult (ref), MomentsUpload (upval), Parent (upval), LocalUserId (ref), Count1 (ref), SharedFlagsModule (upval), PostLifecycleSubscriptionModule (upval), waitForLifecycleChange (upval), Wait (copy), Count (upval), MomentsGetMomentsUserStoreModuleResult (copy), findPublishedPost (upval), p9 (copy), logCandidate (upval)
			if NewResult == nil then
				if MomentsUpload == nil then
					MomentsUpload = require(Parent.Loggers).Logger:new("Moments.Upload")
				end
				MomentsUpload:debug("event=published_post_unresolved reason=no_snapshot_started")
				
				return nil
			else
				local v8, v9 = NewResult:await()
				local LocalUserId1 = LocalUserId
				
				if v8 and v9 ~= nil and LocalUserId1 ~= nil then
					local MomentsPublishedPostPollIntervalSecondsFastInt = game:GetFastInt("MomentsPublishedPostPollIntervalSeconds")
					local MomentsPublishedPostMaxPollAttemptsFastInt = game:GetFastInt("MomentsPublishedPostMaxPollAttempts")
					
					if MomentsUpload == nil then
						MomentsUpload = require(Parent.Loggers).Logger:new("Moments.Upload")
					end
					MomentsUpload:debug("event=published_post_polling resolverId={} intervalSeconds={} maxAttempts={}", tostring(Count1), tostring(MomentsPublishedPostPollIntervalSecondsFastInt), (tostring(MomentsPublishedPostMaxPollAttemptsFastInt)))
					local HasMomentId: boolean = SharedFlagsModule.FFlagMomentsOptimisticProfilePending and MomentId ~= nil
					local WakeVersion = if HasMomentId then PostLifecycleSubscriptionModule.getWakeVersion(false, LocalUserId1) else 0
					local NewClockTime = os.clock() + MomentsPublishedPostPollIntervalSecondsFastInt
					local Count2 = 0
					local Count3 = 0
					local Flag = nil
					local PublishedPost = nil
					while Count2 < MomentsPublishedPostMaxPollAttemptsFastInt do
						if HasMomentId then
							if Count3 > 0 and not waitForLifecycleChange(WakeVersion, LocalUserId1, math.max(0, NewClockTime - os.clock()), Wait) then
								Count2 += 1
								NewClockTime = os.clock() + MomentsPublishedPostPollIntervalSecondsFastInt
							end
							WakeVersion = PostLifecycleSubscriptionModule.getWakeVersion(false, LocalUserId1)
						else
							Wait(MomentsPublishedPostPollIntervalSecondsFastInt)
							Count2 += 1
						end
						Count3 += 1
						
						if (Count1 == 0 or Count1 ~= Count) and (not SharedFlagsModule.FFlagMomentsOptimisticProfilePending or MomentId == nil) then
							if MomentsUpload == nil then
								MomentsUpload = require(Parent.Loggers).Logger:new("Moments.Upload")
							end
							MomentsUpload:debug("event=published_post_unresolved resolverId={} reason=superseded attempt={}", tostring(Count1), (tostring(Count3)))
							
							return nil
						end
						if SharedFlagsModule.FFlagMomentsOptimisticProfilePending and MomentId ~= nil then
							Flag = false
							local PendingUserMoment = MomentsGetMomentsUserStoreModuleResult.getPendingUserMoments(false)[LocalUserId1] or {}
							for _, value in PendingUserMoment do
								if value.moment.momentId == MomentId then
									if value.publishedMoment ~= nil then
										return value.publishedMoment
									end
									Flag = true
									break
								end
							end
							if not Flag then
								return nil
							end
						end
						local v10, v11 = MomentsGetMomentsUserStoreModuleResult.getFreshUserMoments(LocalUserId1, nil):await()
						local Tbl = if v10 then v11 else nil
						
						if SharedFlagsModule.FFlagMomentsOptimisticProfilePending and MomentId ~= nil and Tbl ~= nil then
							local t = {}
							local PendingUserMoment = MomentsGetMomentsUserStoreModuleResult.getPendingUserMoments(false)[LocalUserId1] or {}
							for _, value1 in PendingUserMoment do
								local PublishedMoment = value1.publishedMoment
								local NoPublishedMoment = PublishedMoment == nil
								local FeedItemId = nil
								
								if not NoPublishedMoment then
									t[PublishedMoment.momentId] = true
									FeedItemId = PublishedMoment.recommendationMetadata.feedItemId
									NoPublishedMoment = FeedItemId == nil or FeedItemId == ""
								end
								if not NoPublishedMoment then
									t[FeedItemId] = true
								end
							end
							local Moments = {}
							
							for _, moment in Tbl.moments do
								local FeedItemId = moment.recommendationMetadata.feedItemId
								
								if not t[moment.momentId] and (FeedItemId == nil or not t[FeedItemId]) then
									table.insert(Moments, moment)
								end
							end
							Tbl = table.clone(Tbl)
							Tbl.moments = Moments
						end
						if Tbl == nil then
							if MomentsUpload == nil then
								MomentsUpload = require(Parent.Loggers).Logger:new("Moments.Upload")
							end
							MomentsUpload:debug("event=published_post_poll_read_failed resolverId={} attempt={}", tostring(Count1), (tostring(Count3)))
						else
							local PublishedPost2
							PublishedPost, PublishedPost2 = findPublishedPost(Tbl, v9, p9)
							local ExcludedMomentIds = Tbl.excludedMomentIds or {}
							
							if MomentsUpload == nil then
								MomentsUpload = require(Parent.Loggers).Logger:new("Moments.Upload")
							end
							MomentsUpload:debug("event=published_post_poll resolverId={} attempt={} moments={} excluded={} unknown={}", tostring(Count1), tostring(Count3), tostring(#Tbl.moments), tostring(#ExcludedMomentIds), (tostring(#PublishedPost2)))
							
							for _, value2 in PublishedPost2 do
								logCandidate(Count3, value2)
							end
							if PublishedPost == nil then continue end
							if SharedFlagsModule.FFlagMomentsOptimisticProfilePending and MomentId ~= nil and not MomentsGetMomentsUserStoreModuleResult.resolvePendingUserMoment(LocalUserId1, MomentId, PublishedPost) then
								return nil
							end
							MomentsGetMomentsUserStoreModuleResult.invalidateUser(LocalUserId1)
							
							if MomentsUpload == nil then
								MomentsUpload = require(Parent.Loggers).Logger:new("Moments.Upload")
							end
							MomentsUpload:debug("event=published_post_resolved resolverId={} attempt={} momentId={} feedItemId={} assetId={}", tostring(Count1), tostring(Count3), PublishedPost.momentId, tostring(PublishedPost.recommendationMetadata.feedItemId), (tostring(PublishedPost.assetId)))
							
							return PublishedPost
						end
					end
					if MomentsUpload == nil then
						MomentsUpload = require(Parent.Loggers).Logger:new("Moments.Upload")
					end
					MomentsUpload:debug("event=published_post_unresolved resolverId={} reason=budget_exhausted attempts={}", tostring(Count1), (tostring(MomentsPublishedPostMaxPollAttemptsFastInt)))
					
					return nil
				else
					if MomentsUpload == nil then
						MomentsUpload = require(Parent.Loggers).Logger:new("Moments.Upload")
					end
					MomentsUpload:debug("event=published_post_unresolved resolverId={} reason=snapshot_unavailable", (tostring(Count1)))
					
					return nil
				end
			end
		end,
		isCurrent = function(): boolean --[[ Line: 349 ]]
			-- upvalues: Count1 (ref), Count (upval)
			return Count1 ~= 0 and Count1 == Count
		end
	}
end