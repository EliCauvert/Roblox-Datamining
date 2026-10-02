local localizationService = game:GetService("LocalizationService")
local userInputService = game:GetService("UserInputService")
local moments = script:FindFirstAncestor("Moments")
local parent = moments.Parent
local foundationModule = require(parent.Foundation)
local localizationModule = require(parent.Localization)
local reactModule = require(parent.React)
local signalsReactModule = require(parent.SignalsReact)
local momentsGetMomentsCommentsStoreModule = require(parent.DataHydration.MomentsGetMomentsCommentsStore)
local _ = require(moments.Components.Comments.Composer.CommentsComposerContainer)
local _ = require(moments.Components.Comments.Panel.CommentsPanelBody.CommentsPanelBodyContainer)
local getCommentCollectionStoreModule = require(moments.Components.Comments.GetCommentCollectionStore)
local getCommentsPanelStateModule = require(moments.Components.Comments.Panel.getCommentsPanelState)
local _ = require(moments.Components.SheetShim)
local useCommentCapabilitiesModule = require(moments.Components.Comments.useCommentCapabilities)
local _ = require(script.Parent.CommentsSheetView)
local getCommentsSheetStoreModule = require(script.Parent.getCommentsSheetStore)
local getCommentsVideoLiftModule = require(script.Parent.getCommentsVideoLift)
local useLocalization = localizationModule.Hooks.useLocalization

return function()
	-- upvalues: getCommentsSheetStoreModule (ref), signalsReactModule (ref), momentsGetMomentsCommentsStoreModule (ref), reactModule (ref), useCommentCapabilitiesModule (ref), getCommentCollectionStoreModule (ref), localizationModule (ref), localizationService (ref), getCommentsPanelStateModule (ref), useLocalization (ref), foundationModule (ref), getCommentsVideoLiftModule (ref), userInputService (ref)
	local var1 = getCommentsSheetStoreModule(false)
	local var2 = signalsReactModule.useSignalState(var1.getIsOpen)
	local var3 = signalsReactModule.useSignalState(var1.getFeedItemId)
	local var4 = signalsReactModule.useSignalState(var1.getOpenSessionId)
	local var5 = momentsGetMomentsCommentsStoreModule(false)
	local var6 = signalsReactModule.useSignalState(reactModule.useMemo(function()
		-- upvalues: var5 (ref), var3 (ref)
		return var5.getCachedMomentComments(var3 or "")
	end, { var5, var3 }).data)
	local var7 = useCommentCapabilitiesModule()
	local close = var1.close
	reactModule.useEffect(function()
		-- upvalues: var2 (ref), var7 (ref), close (ref)
		if var2 and not var7.canRead then
			close()
		end
	end, { var2, var7.canRead, close })
	local var8 = reactModule.useRef(nil)
	local var9, var10 = reactModule.useState(nil)
	local var11 = getCommentCollectionStoreModule(false)
	local var12 = var3 or ""
	local var13 = signalsReactModule.useSignalState(reactModule.useMemo(function()
		-- upvalues: var11 (ref), var12 (ref)
		return var11.getState(var12)
	end, { var11, var12 }))
	local var14 = if var6 == nil or var6.count == nil then if var13.initialLoadStatus == "Success" and not var13.hasMore then math.max(0, #var13.orderedCommentIds - (if var13.pendingSubmission ~= nil then 0 else 1)) else nil else var6.count
	local var15 = if var14 ~= nil then nil else localizationModule.abbreviateCount(var14, localizationService.RobloxLocaleId)
	local var16 = getCommentsPanelStateModule(var6, var13)
	local var17 = "Feature.Moments.Title.Comments"
	
	if var14 ~= nil and var14 > 0 and var15 ~= nil then
		var17 = {
			if var6 == nil or not var6.countIsCapped then "Feature.Moments.Title.CommentsWithCount" else "Feature.Moments.Title.CommentsWithCappedCount",
			count = var15
		}
	end
	local title = useLocalization({ title = var17 }).title
	local var18 = var2 and (var3 ~= nil and (var3 ~= "" and (var7.canRead and (var7.canWrite and var16.canCompose))))
	local setSnapPointIndex = var1.setSnapPointIndex
	local var19 = reactModule.useCallback(function(_, p1)
		-- upvalues: setSnapPointIndex (ref)
		setSnapPointIndex(p1)
	end, { setSnapPointIndex })
	local var20 = foundationModule.Hooks.useOverlay()
	local getVideoLift = var1.getVideoLift
	local setVideoLift = var1.setVideoLift
	local var21 = reactModule.useCallback(function(p1)
		-- upvalues: var20 (ref), setVideoLift (ref), getCommentsVideoLiftModule (copy), userInputService (copy), getVideoLift (ref)
		if var20 == nil then
			setVideoLift(nil)
			
			return
		end
		setVideoLift(getCommentsVideoLiftModule({
			sheetInset = p1.bottom,
			overlayTop = var20.AbsolutePosition.Y,
			overlayHeight = var20.AbsoluteSize.Y,
			isKeyboardVisible = userInputService.OnScreenKeyboardVisible
		}, getVideoLift(false)))
	end, { var20, getVideoLift, setVideoLift })
	reactModule.useEffect(function()
		-- upvalues: setVideoLift (ref)
		return function()
			-- upvalues: setVideoLift (copy)
			setVideoLift(nil)
		end
	end, { setVideoLift })
	
	return {
		isOpen = var2,
		title = title,
		onClose = var1.close,
		onSnapPointChanged = var19,
		onContentInsetChanged = var21,
		isListDisplayed = var16.contentState == "list" and var3 ~= nil,
		scrollingFrameRef = var8,
		actionsRef = var10,
		panelBodyProps = {
			isOpen = var2,
			feedItemId = var3,
			comments = var6,
			panelState = var16,
			sessionId = var4,
			scrollingFrameRef = var8,
			actionsFrame = var9,
			onClose = var1.close
		},
		composerProps = if var18 then { feedItemId = var3, sessionId = var4 } else nil
	}
end