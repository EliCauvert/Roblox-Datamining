local moments = script:FindFirstAncestor("Moments")
local parent = moments.Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local signalsModule = require(parent.Signals)
local signalsReactModule = require(parent.SignalsReact)
local momentsGetMomentsCommentsStoreModule = require(parent.DataHydration.MomentsGetMomentsCommentsStore)
local momentsGetMomentsReactionsStoreModule = require(parent.DataHydration.MomentsGetMomentsReactionsStore)
local momentsResolveEmoteIdModule = require(parent.DataHydration.MomentsResolveEmoteId)
local _ = require(parent.MomentsTypes)
local getCommentCollectionStoreModule = require(moments.Components.Comments.GetCommentCollectionStore)
local getCommentsListCoordinatorModule = require(script.Parent.Parent.getCommentsListCoordinator)
local getToastStoreModule = require(moments.Stores.GetToastStore)
local useMomentsHost = require(moments.MomentsHostContext).useMomentsHost
local reactionTypeModule = require(moments.Enums.ReactionType)
local buildCommentRowsModule = require(script.Parent.Parent.Rows.buildCommentRows)
local _ = require(script.Parent.Parent.Rows.CommentRowTypes)
local useVirtualizedCommentRowsModule = require(script.Parent.Parent.Rows.useVirtualizedCommentRows)
local _ = require(script.Parent.CommentsListView)
local playersService = game:GetService("Players")

local function _(p1)
	return `{string.len(p1)}:{p1}`
end

local function showDeleteFailedToast()
	-- upvalues: getToastStoreModule (ref)
	getToastStoreModule(false).triggerToast({ title = "Couldn't delete comment", text = "" })
end

return function(p1)
	-- upvalues: playersService (ref), getCommentCollectionStoreModule (ref), reactModule (ref), signalsReactModule (ref), signalsModule (ref), buildCommentRowsModule (ref), momentsGetMomentsCommentsStoreModule (ref), momentsGetMomentsReactionsStoreModule (ref), momentsResolveEmoteIdModule (ref), reactionTypeModule (ref), foundationModule (ref), useVirtualizedCommentRowsModule (ref), getCommentsListCoordinatorModule (ref), useMomentsHost (ref), showDeleteFailedToast (ref)
	local var1
	local localPlayer = playersService.LocalPlayer
	local var2 = if localPlayer ~= nil then "" else localPlayer.Name
	local var3 = getCommentCollectionStoreModule(false)
	local var4 = reactModule.useMemo(function()
		-- upvalues: var3 (ref), p1 (ref)
		return var3.getState(p1.feedItemId)
	end, { var3, p1.feedItemId })
	local var5 = signalsReactModule.useSignalState(var4)
	local var6 = signalsReactModule.useSignalState(reactModule.useMemo(function()
		-- upvalues: signalsModule (copy), var4 (ref), buildCommentRowsModule (copy), momentsGetMomentsCommentsStoreModule (copy)
		return signalsModule.createComputed(function(p2)
			-- upvalues: var4 (copy), buildCommentRowsModule (copy), momentsGetMomentsCommentsStoreModule (copy)
			return buildCommentRowsModule(var4(p2), function(p3)
				-- upvalues: momentsGetMomentsCommentsStoreModule (copy), p2 (ref)
				return momentsGetMomentsCommentsStoreModule(false).getCachedComment(p3).data(p2)
			end)
		end)
	end, { var4 }))
	local var7 = momentsGetMomentsCommentsStoreModule(false)
	local var8 = signalsReactModule.useSignalState(reactModule.useMemo(function()
		-- upvalues: var7 (ref), p1 (ref)
		return var7.getCachedMomentComments(p1.feedItemId)
	end, { var7, p1.feedItemId }).data)
	local var9 = momentsGetMomentsReactionsStoreModule(false)
	local var10 = signalsReactModule.useSignalState(reactModule.useMemo(function()
		-- upvalues: signalsModule (copy), var9 (ref), momentsResolveEmoteIdModule (copy), reactionTypeModule (copy)
		return signalsModule.createComputed(function(p2)
			-- upvalues: var9 (copy), momentsResolveEmoteIdModule (copy), reactionTypeModule (copy)
			local getCachedEmojiCatalog = var9.getCachedEmojiCatalog
			
			if getCachedEmojiCatalog == nil then
				return nil
			end
			local var11 = getCachedEmojiCatalog(p2)
			
			return if var11.source == "cache" and var11.status == "Ready" then momentsResolveEmoteIdModule.resolveOptionalEmoteIdForReaction(var11.emojis, reactionTypeModule.ThumbsUp) else nil
		end)
	end, { var9 }))
	local var11 = foundationModule.Hooks.useTokens()
	local small = var11.Padding.Small
	local var12 = useVirtualizedCommentRowsModule(var6, 0, var11.Size.Size_2000, `{p1.feedItemId}:{p1.sessionId}`, p1.scrollingFrameRef)
	local var13 = getCommentsListCoordinatorModule(false)
	local var14 = reactModule.useCallback(function()
		-- upvalues: var13 (ref), p1 (ref)
		return var13.loadMore(p1.feedItemId, p1.sessionId)
	end, { var13, p1.feedItemId, p1.sessionId })
	local var15 = reactModule.useCallback(function()
		-- upvalues: var13 (ref), p1 (ref)
		var13.retryLoadMore(p1.feedItemId, p1.sessionId)
	end, { var13, p1.feedItemId, p1.sessionId })
	local var16 = reactModule.useCallback(function()
		-- upvalues: var13 (ref), p1 (ref)
		var13.retryPendingSubmission(p1.feedItemId, p1.sessionId)
	end, { var13, p1.feedItemId, p1.sessionId })
	local var17 = reactModule.useCallback(function()
		-- upvalues: var13 (ref), p1 (ref)
		var13.editPendingSubmission(p1.feedItemId, p1.sessionId)
	end, { var13, p1.feedItemId, p1.sessionId })
	local var18 = reactModule.useCallback(function(p2, p3, p4, p5)
		-- upvalues: var13 (ref), p1 (ref)
		return if p5 then var13.ensureReactionAbsent(p1.feedItemId, p2, p3, p4) else var13.ensureReactionPresent(p1.feedItemId, p2, p3, p4)
	end, { var13, p1.feedItemId })
	local var19 = reactModule.useCallback(function(p2, p3, p4)
		-- upvalues: var13 (ref), p1 (ref)
		return var13.ensureReactionPresent(p1.feedItemId, p2, p3, p4)
	end, { var13, p1.feedItemId })
	local openMomentCommentReport = useMomentsHost().openMomentCommentReport
	local channelId = var5.channelId
	local var20 = reactModule.useMemo(function()
		-- upvalues: openMomentCommentReport (ref), channelId (ref)
		return if openMomentCommentReport == nil or channelId == nil then nil else function(p2, p3)
			-- upvalues: openMomentCommentReport (copy), channelId (copy)
			openMomentCommentReport({
				commentId = p2,
				channelId = channelId,
				reportedUserId = p3
			})
		end
	end, { openMomentCommentReport, channelId })
	local var21 = reactModule.useCallback(function(p2)
		-- upvalues: var13 (ref), p1 (ref), showDeleteFailedToast (copy)
		return var13.deleteComment(p1.feedItemId, p2, showDeleteFailedToast)
	end, { var13, p1.feedItemId })
	
	if var5.nextCursor == nil then
		var1 = "nil"
	else
		local nextCursor = var5.nextCursor
		var1 = `{string.len(nextCursor)}:{nextCursor}`
	end
	local concat = table.concat
	local t = {}
	local feedItemId = p1.feedItemId
	-- Unknown statement at pc 3: <SetList>
	concat = concat(t, "|")
	
	return {
		geometry = var12.geometry,
		rowBleed = small,
		avatarBackgroundStyle = var11.Color.Shift.Shift_300,
		viewerUsername = var2,
		feedItemId = p1.feedItemId,
		thumbsUpEmoteId = var10,
		creatorEnabled = var8 ~= nil and var8.creatorEnabled,
		viewerCanWrite = var8 ~= nil and var8.viewerCanWrite,
		scrollingFrameRef = p1.scrollingFrameRef,
		loadMoreStatus = var5.loadMoreStatus,
		paginationStateKey = concat,
		onNearEnd = var14,
		onUnderfilled = var14,
		onRetryLoadMore = var15,
		onRetryPendingSubmission = var16,
		onEditPendingSubmission = var17,
		onToggleReaction = var18,
		onAddReaction = var19,
		onReportComment = var20,
		onDeleteComment = var21,
		onRowHeightChanged = var12.onRowHeightChanged
	}
end