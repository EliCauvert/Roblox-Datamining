local Moments = script:FindFirstAncestor("Moments")
local Parent = Moments.Parent
local _ = require(Parent.MomentsTypes)
local ShallowEqualFunction = require(Parent.Dash).shallowEqual
local CommentCollectionTypesModule = require(Moments.Components.Comments.GetCommentCollectionStore.CommentCollectionTypes)
local _ = require(script.Parent.CommentRowTypes)

local function reusePreviousRows(List, List1)
	-- upvalues: ShallowEqualFunction (copy)
	local t = {}
	
	for _, value in List do
		t[value.key] = value
	end
	local v1 = #List1 == #List
	for i, value1 in List1 do
		local Entry = t[value1.key]
		
		if Entry ~= nil and ShallowEqualFunction(Entry, value1) then
			List1[i] = Entry
		end
		v1 = v1 and List1[i] == List[i]
	end
	return if v1 then List else List1
end

return function(p1, Callback, p2, p3)
	-- upvalues: CommentCollectionTypesModule (copy), reusePreviousRows (copy)
	local Buffer = table.create(#p1.orderedCommentIds + (if p1.pendingSubmission == nil then 0 else 1))
	local PendingSubmission = p1.pendingSubmission
	
	if PendingSubmission ~= nil then
		table.insert(Buffer, {
			type = "pending",
			key = CommentCollectionTypesModule.pendingSentinel(PendingSubmission.clientRequestId),
			text = PendingSubmission.text,
			status = PendingSubmission.status
		})
	end
	for _, orderedCommentId in p1.orderedCommentIds do
		if not CommentCollectionTypesModule.isPendingSentinel(orderedCommentId) then
			local CallbackResult = Callback(orderedCommentId)
			table.insert(Buffer, {
				type = "comment",
				key = `comment:{orderedCommentId}`,
				commentId = orderedCommentId,
				text = if CallbackResult == nil then "" else CallbackResult.text or "",
				createdAt = if CallbackResult == nil then "" else CallbackResult.createdAt,
				isExpanded = p3 ~= nil and p3[orderedCommentId] == true
			})
		end
	end
	return if p2 == nil then Buffer else reusePreviousRows(p2, Buffer)
end