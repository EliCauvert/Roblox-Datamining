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
	local var8, var9 = reactModule.useState(nil)
	local var10 = getCommentCollectionStoreModule(false)
	local var11 = var3 or ""
	local var12 = signalsReactModule.useSignalState(reactModule.useMemo(function()
		-- upvalues: var10 (ref), var11 (ref)
		return var10.getState(var11)
	end, { var10, var11 }))
	local var13 = if var6 == nil or var6.count == nil then if var12.initialLoadStatus == "Success" and not var12.hasMore then math.max(0, #var12.orderedCommentIds - (if var12.pendingSubmission ~= nil then 0 else 1)) else nil else var6.count
	local var14 = if var13 ~= nil then nil else localizationModule.abbreviateCount(var13, localizationService.RobloxLocaleId)
	local var15 = getCommentsPanelStateModule(var6, var12)
	local var16 = "Comments"
	
	if var13 ~= nil and var13 > 0 and var14 ~= nil then
		var16 = `Comments ({if var6 == nil or not var6.countIsCapped then var14 else `{var14}+`})`
	end
	local setSnapPointIndex = var1.setSnapPointIndex
	
	return {
		isOpen = var2,
		title = var16,
		onClose = var1.close,
		onSnapPointChanged = reactModule.useCallback(function(_, p1)
			-- upvalues: setSnapPointIndex (ref)
			setSnapPointIndex(p1)
		end, { setSnapPointIndex }),
		isListDisplayed = var15.contentState == "list" and var3 ~= nil,
		scrollingFrameRef = var7,
		actionsRef = var9,
		panelBodyProps = {
			isOpen = var2,
			feedItemId = var3,
			comments = var6,
			panelState = var15,
			sessionId = var4,
			scrollingFrameRef = var7,
			actionsFrame = var8,
			onClose = var1.close
		},
		composerProps = if var2 and (var3 ~= nil and (var3 ~= "" and var15.canCompose)) then { feedItemId = var3, sessionId = var4 } else nil
	}
end