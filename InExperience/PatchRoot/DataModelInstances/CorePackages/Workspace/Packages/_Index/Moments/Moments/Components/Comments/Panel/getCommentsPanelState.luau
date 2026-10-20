local Moments = script:FindFirstAncestor("Moments")
local _ = require(Moments.Parent.MomentsTypes)
local LoadStatus = require(Moments.Components.Comments.GetCommentCollectionStore.CommentCollectionTypes).LoadStatus
local config = {
	MomentUnavailable = true,
	MomentNotFound = true,
	MomentNotVisible = true,
	ViewerNotEligibleToRead = true
}
local config1 = {
	CommentsDisabledByCreator = true,
	MomentUnavailable = true,
	MomentNotFound = true,
	MomentNotVisible = true,
	ViewerNotEligibleToRead = true,
	ViewerNotEligibleToWrite = true
}

return function(p1, p2)
	-- upvalues: LoadStatus (copy), config1 (copy), config (copy)
	local ErrorCode = p2.errorCode
	local IsViewerNotEligibleToWrite: boolean = if p1 == nil then ErrorCode == "ViewerNotEligibleToWrite" else p1.viewerCanWrite == false or ErrorCode == "ViewerNotEligibleToWrite"
	local IsInitialLoadStatusMatch = p2.initialLoadStatus == LoadStatus.Success
	local NoErrorCode: boolean = not IsViewerNotEligibleToWrite and (if p1 == nil then ErrorCode == nil or config1[ErrorCode] ~= true else p1.creatorEnabled and (p1.viewerCanRead and (ErrorCode == nil or config1[ErrorCode] ~= true)))
	local ShouldClose = false
	local CanRetryInitial = false
	local Loading = nil
	
	if (IsInitialLoadStatusMatch or p1 == nil or p1.viewerCanRead ~= false) and (ErrorCode == nil or config[ErrorCode] ~= true) then
		if ErrorCode == "CommentsDisabledByCreator" then
			Loading = "disabled"
			IsViewerNotEligibleToWrite = false
		elseif IsInitialLoadStatusMatch or p1 == nil or p1.creatorEnabled ~= false then
			if p1 == nil and p2.initialLoadStatus ~= LoadStatus.Failed and not IsInitialLoadStatusMatch then
				Loading = "loading"
			elseif #p2.orderedCommentIds > 0 or p2.pendingSubmission ~= nil and p2.initialLoadStatus ~= LoadStatus.Failed then
				Loading = "list"
			elseif p2.loadMoreStatus == LoadStatus.Failed then
				Loading = "unavailable"
				CanRetryInitial = true
			elseif IsInitialLoadStatusMatch then
				Loading = if p2.hasMore then "loading" else "empty"
			elseif p2.initialLoadStatus == LoadStatus.Failed then
				Loading = "unavailable"
				CanRetryInitial = true
			else
				Loading = "loading"
			end
		else
			Loading = "disabled"
			IsViewerNotEligibleToWrite = false
		end
	else
		Loading = "unavailable"
		ShouldClose = true
	end
	return {
		contentState = Loading,
		isReadOnly = IsViewerNotEligibleToWrite,
		shouldClose = ShouldClose,
		canRetryInitial = CanRetryInitial,
		canCompose = NoErrorCode
	}
end