local localizationService = game:GetService("LocalizationService")
local moments = script:FindFirstAncestor("Moments")
local parent = moments.Parent
local localizationModule = require(parent.Localization)
local reactModule = require(parent.React)
local signalsReactModule = require(parent.SignalsReact)
local momentsGetMomentsCommentsStoreModule = require(parent.DataHydration.MomentsGetMomentsCommentsStore)
local _ = require(moments.Components.Comments.Composer.CommentsComposerContainer)
local _ = require(moments.Components.Comments.Panel.CommentsPanelBody.CommentsPanelBodyContainer)
local getCommentCollectionStoreModule = require(moments.Components.Comments.GetCommentCollectionStore)
local getCommentsPanelStateModule = require(moments.Components.Comments.Panel.getCommentsPanelState)
local _ = require(script.Parent.CommentsSheetView)
local getCommentsSheetStoreModule = require(script.Parent.getCommentsSheetStore)

return function()
	-- upvalues: getCommentsSheetStoreModule (ref), signalsReactModule (ref), momentsGetMomentsCommentsStoreModule (ref), reactModule (ref), getCommentCollectionStoreModule (ref), localizationModule (ref), localizationService (ref), getCommentsPanelStateModule (ref)
	local var1 = getCommentsSheetStoreModule(false)
	local var2 = signalsReactModule.useSignalState(var1.getIsOpen)
	local var3 = signalsReactModule.useSignalState(var1.getFeedItemId)
	local var4 = signalsReactModule.useSignalState(var1.getOpenSessionId)
	local var5 = momentsGetMomentsCommentsStoreModule(false)
	local var6 = signalsReactModule.useSignalState(reactModule.useMemo(function()
		-- upvalues: var5 (ref), var3 (ref)
		return var5.getCachedMomentComments(var3 or "")
	end, { var5, var3 }).data)
	local var7 = reactModule.useRef(nil)
	local var8 = getCommentCollectionStoreModule(false)
	local var9 = var3 or ""
	local var10 = signalsReactModule.useSignalState(reactModule.useMemo(function()
		-- upvalues: var8 (ref), var9 (ref)
		return var8.getState(var9)
	end, { var8, var9 }))
	local var11 = if var6 == nil or var6.count == nil then if var10.initialLoadStatus == "Success" and not var10.hasMore then math.max(0, #var10.orderedCommentIds - (if var10.pendingSubmission ~= nil then 0 else 1)) else nil else var6.count
	local var12 = if var11 ~= nil then nil else localizationModule.abbreviateCount(var11, localizationService.RobloxLocaleId)
	local var13 = getCommentsPanelStateModule(var6, var10)
	local var14 = "Comments"
	
	if var11 ~= nil and var11 > 0 and var12 ~= nil then
		var14 = `Comments ({if var6 == nil or not var6.countIsCapped then var12 else `{var12}+`})`
	end
	return {
		isOpen = var2,
		title = var14,
		onClose = var1.close,
		scrollingFrameRef = var7,
		panelBodyProps = {
			isOpen = var2,
			feedItemId = var3,
			comments = var6,
			panelState = var13,
			sessionId = var4,
			scrollingFrameRef = var7,
			onClose = var1.close
		},
		composerProps = if var2 and (var3 ~= nil and (var3 ~= "" and var13.canCompose)) then { feedItemId = var3, sessionId = var4 } else nil
	}
end