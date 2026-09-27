local moments = script:FindFirstAncestor("Moments")
local _ = require(moments.Parent.MomentsTypes)
local loadStatus = require(moments.Components.Comments.GetCommentCollectionStore.CommentCollectionTypes).LoadStatus
local t = {
	MomentUnavailable = true,
	MomentNotFound = true,
	MomentNotVisible = true,
	ViewerNotEligibleToRead = true
}
local t_1 = {
	CommentsDisabledByCreator = true,
	MomentUnavailable = true,
	MomentNotFound = true,
	MomentNotVisible = true,
	ViewerNotEligibleToRead = true,
	ViewerNotEligibleToWrite = true
}

return function(p1, p2)
	-- upvalues: loadStatus (ref), t_1 (ref), t (ref)
	local errorCode = p2.errorCode
	local var1 = p1 ~= nil or errorCode == "ViewerNotEligibleToWrite"
	local var2 = p2.initialLoadStatus == loadStatus.Success
	local var3 = not var1
	
	if var3 then
		if p1 == nil then
			var3 = if errorCode ~= nil then t_1[errorCode] ~= true else true
		else
			var3 = p1.creatorEnabled
			
			if var3 then
				var3 = p1.viewerCanRead
				
				if var3 then
				end
			end
		end
	end
	local var4
	local _ = nil
	local var5 = false
	local var6 = false
	
	if not var2 and p1 ~= nil and p1.viewerCanRead == false or errorCode ~= nil and t[errorCode] == true then
		var4 = "unavailable"
		var5 = true
	elseif errorCode == "CommentsDisabledByCreator" then
		var4 = "disabled"
		var1 = false
	elseif not var2 and p1 ~= nil and p1.creatorEnabled == false then
		var4 = "disabled"
		var1 = false
	elseif p1 == nil and p2.initialLoadStatus ~= loadStatus.Failed and not var2 then
		var4 = "loading"
	elseif #p2.orderedCommentIds > 0 or p2.pendingSubmission ~= nil and p2.initialLoadStatus ~= loadStatus.Failed then
		var4 = "list"
	elseif p2.loadMoreStatus == loadStatus.Failed then
		var4 = "unavailable"
		var6 = true
	elseif var2 then
		var4 = if p2.hasMore then "loading" else "empty"
	elseif p2.initialLoadStatus == loadStatus.Failed then
		var4 = "unavailable"
		var6 = true
	else
		var4 = "loading"
	end
	return {
		contentState = var4,
		isReadOnly = var1,
		shouldClose = var5,
		canRetryInitial = var6,
		canCompose = var3
	}
end