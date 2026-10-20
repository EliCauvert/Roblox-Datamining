local LocalizationService = game:GetService("LocalizationService")
local UserInputService = game:GetService("UserInputService")
local Moments = script:FindFirstAncestor("Moments")
local Parent = Moments.Parent
local FoundationModule = require(Parent.Foundation)
local LocalizationModule = require(Parent.Localization)
local ReactModule = require(Parent.React)
local SignalsReactModule = require(Parent.SignalsReact)
local MomentsGetMomentsCommentsStoreModule = require(Parent.DataHydration.MomentsGetMomentsCommentsStore)
local _ = require(Moments.Components.Comments.Composer.CommentsComposerContainer)
local _ = require(Moments.Components.Comments.Panel.CommentsPanelBody.CommentsPanelBodyContainer)
local GetCommentCollectionStoreModule = require(Moments.Components.Comments.GetCommentCollectionStore)
local GetCommentsPanelStateModule = require(Moments.Components.Comments.Panel.getCommentsPanelState)
local _ = require(Moments.Components.SheetShim)
local UseCommentCapabilitiesModule = require(Moments.Components.Comments.useCommentCapabilities)
local _ = require(script.Parent.CommentsSheetView)
local GetCommentsSheetStoreModule = require(script.Parent.getCommentsSheetStore)
local GetCommentsVideoLiftModule = require(script.Parent.getCommentsVideoLift)
local UseLocalizationFunction = LocalizationModule.Hooks.useLocalization

return function()
	-- upvalues: GetCommentsSheetStoreModule (copy), SignalsReactModule (copy), MomentsGetMomentsCommentsStoreModule (copy), ReactModule (copy), UseCommentCapabilitiesModule (copy), GetCommentCollectionStoreModule (copy), LocalizationModule (copy), LocalizationService (copy), GetCommentsPanelStateModule (copy), UseLocalizationFunction (copy), FoundationModule (copy), GetCommentsVideoLiftModule (copy), UserInputService (copy)
	local CommentsSheetStoreModule = GetCommentsSheetStoreModule(false)
	local UseSignalStateResult = SignalsReactModule.useSignalState(CommentsSheetStoreModule.getIsOpen)
	local UseSignalStateResult1 = SignalsReactModule.useSignalState(CommentsSheetStoreModule.getFeedItemId)
	local UseSignalStateResult2 = SignalsReactModule.useSignalState(CommentsSheetStoreModule.getOpenSessionId)
	local MomentsGetMomentsCommentsStoreModuleResult = MomentsGetMomentsCommentsStoreModule(false)
	local UseSignalStateResult3 = SignalsReactModule.useSignalState(ReactModule.useMemo(function()
		-- upvalues: MomentsGetMomentsCommentsStoreModuleResult (copy), UseSignalStateResult1 (copy)
		return MomentsGetMomentsCommentsStoreModuleResult.getCachedMomentComments(UseSignalStateResult1 or "")
	end, {
		MomentsGetMomentsCommentsStoreModuleResult,
		UseSignalStateResult1
	}).data)
	local UseCommentCapabilitiesModuleResult = UseCommentCapabilitiesModule()
	local CloseFunction = CommentsSheetStoreModule.close
	ReactModule.useEffect(function()
		-- upvalues: UseSignalStateResult (copy), UseCommentCapabilitiesModuleResult (copy), CloseFunction (copy)
		if UseSignalStateResult and not UseCommentCapabilitiesModuleResult.canRead then
			CloseFunction()
		end
	end, {
		UseSignalStateResult,
		UseCommentCapabilitiesModuleResult.canRead,
		CloseFunction
	})
	local UseRefResult = ReactModule.useRef(nil)
	local UseStateResult, UseStateResult2 = ReactModule.useState(nil)
	local CommentCollectionStoreModule = GetCommentCollectionStoreModule(false)
	local UseSignalStateResult1_1 = UseSignalStateResult1 or ""
	local UseSignalStateResult4 = SignalsReactModule.useSignalState((ReactModule.useMemo(function()
		-- upvalues: CommentCollectionStoreModule (copy), UseSignalStateResult1_1 (copy)
		return CommentCollectionStoreModule.getState(UseSignalStateResult1_1)
	end, { CommentCollectionStoreModule, UseSignalStateResult1_1 })))
	local v1: number = if UseSignalStateResult4.pendingSubmission == nil then 0 else 1
	local Largest = if UseSignalStateResult4.initialLoadStatus == "Success" and not UseSignalStateResult4.hasMore then math.max(0, #UseSignalStateResult4.orderedCommentIds - v1) else nil
	local Largest1 = if UseSignalStateResult3 == nil or UseSignalStateResult3.count == nil then Largest else UseSignalStateResult3.count
	local AbbreviateCountResult = if Largest1 == nil then nil else LocalizationModule.abbreviateCount(Largest1, LocalizationService.RobloxLocaleId)
	local CommentsPanelStateModule = GetCommentsPanelStateModule(UseSignalStateResult3, UseSignalStateResult4)
	local Title = UseLocalizationFunction({
		title = if Largest1 == nil or Largest1 <= 0 or AbbreviateCountResult == nil then "Feature.Moments.Title.Comments" else {
			if UseSignalStateResult3 == nil or not UseSignalStateResult3.countIsCapped then "Feature.Moments.Title.CommentsWithCount" else "Feature.Moments.Title.CommentsWithCappedCount",
			count = AbbreviateCountResult
		}
	}).title
	local CanCompose = UseSignalStateResult and (UseSignalStateResult1 ~= nil and (UseSignalStateResult1 ~= "" and (UseCommentCapabilitiesModuleResult.canRead and (UseCommentCapabilitiesModuleResult.canWrite and CommentsPanelStateModule.canCompose))))
	local SetSnapPointIndexFunction = CommentsSheetStoreModule.setSnapPointIndex
	local UseResult = ReactModule.useCallback(function(_, p1)
		-- upvalues: SetSnapPointIndexFunction (copy)
		SetSnapPointIndexFunction(p1)
	end, { SetSnapPointIndexFunction })
	local UseOverlayResult = FoundationModule.Hooks.useOverlay()
	local GetVideoLiftFunction = CommentsSheetStoreModule.getVideoLift
	local SetVideoLiftFunction = CommentsSheetStoreModule.setVideoLift
	local UseResult1 = ReactModule.useCallback(function(p1)
		-- upvalues: UseOverlayResult (copy), SetVideoLiftFunction (copy), GetCommentsVideoLiftModule (upval), UserInputService (upval), GetVideoLiftFunction (copy)
		if UseOverlayResult == nil then
			SetVideoLiftFunction(nil)
			
			return
		else
			SetVideoLiftFunction(GetCommentsVideoLiftModule({
				sheetInset = p1.bottom,
				overlayTop = UseOverlayResult.AbsolutePosition.Y,
				overlayHeight = UseOverlayResult.AbsoluteSize.Y,
				isKeyboardVisible = UserInputService.OnScreenKeyboardVisible
			}, GetVideoLiftFunction(false)))
		end
	end, {
		UseOverlayResult,
		GetVideoLiftFunction,
		SetVideoLiftFunction
	})
	ReactModule.useEffect(function()
		-- upvalues: SetVideoLiftFunction (copy)
		return function()
			-- upvalues: SetVideoLiftFunction (upval)
			SetVideoLiftFunction(nil)
		end
	end, { SetVideoLiftFunction })
	
	return {
		isOpen = UseSignalStateResult,
		title = Title,
		onClose = CommentsSheetStoreModule.close,
		onSnapPointChanged = UseResult,
		onContentInsetChanged = UseResult1,
		isListDisplayed = CommentsPanelStateModule.contentState == "list" and UseSignalStateResult1 ~= nil,
		scrollingFrameRef = UseRefResult,
		actionsRef = UseStateResult2,
		panelBodyProps = {
			isOpen = UseSignalStateResult,
			feedItemId = UseSignalStateResult1,
			comments = UseSignalStateResult3,
			panelState = CommentsPanelStateModule,
			sessionId = UseSignalStateResult2,
			scrollingFrameRef = UseRefResult,
			actionsFrame = UseStateResult,
			onClose = CommentsSheetStoreModule.close
		},
		composerProps = if CanCompose then {
			feedItemId = UseSignalStateResult1,
			sessionId = UseSignalStateResult2
		} else nil
	}
end