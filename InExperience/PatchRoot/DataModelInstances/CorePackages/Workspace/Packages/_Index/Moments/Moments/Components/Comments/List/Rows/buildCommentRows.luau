local moments = script:FindFirstAncestor("Moments")
local parent = moments.Parent
local _ = require(parent.MomentsTypes)
local shallowEqual = require(parent.Dash).shallowEqual
local commentCollectionTypesModule = require(moments.Components.Comments.GetCommentCollectionStore.CommentCollectionTypes)
local _ = require(script.Parent.CommentRowTypes)

local function reusePreviousRows(p1, p2)
	-- upvalues: shallowEqual (ref)
	local t = {}
	
	for i, v in p1 do
		t[v.key] = v
	end
	local var1 = #p2 == #p1
	
	for i_1, v_1 in p2 do
		local key = t[v_1.key]
		
		if key ~= nil and shallowEqual(key, v_1) then
			p2[i_1] = key
		end
		var1 = var1 and p2[i_1] == p1[i_1]
	end
	return if var1 then p1 else p2
end

return function(p3, p4, p5, p6)
	-- upvalues: commentCollectionTypesModule (ref), reusePreviousRows (ref)
	local list = table.create(#p3.orderedCommentIds + (if p3.pendingSubmission ~= nil then 0 else 1))
	local pendingSubmission = p3.pendingSubmission
	
	if pendingSubmission ~= nil then
		table.insert(list, {
			type = "pending",
			key = commentCollectionTypesModule.pendingSentinel(pendingSubmission.clientRequestId),
			text = pendingSubmission.text,
			status = pendingSubmission.status
		})
	end
	for i, v in p3.orderedCommentIds do
		if not commentCollectionTypesModule.isPendingSentinel(v) then
			local var2 = p4(v)
			local t = { type = "comment", key = `comment:{v}`, commentId = v }
			local var3 = var2 == nil and ((if var2 == nil then var2.text else nil) or "")
			t.text = var3
			t.createdAt = if var2 ~= nil then "" else var2.createdAt
			t.isExpanded = p6 ~= nil and p6[v] == true
			table.insert(list, t)
		end
	end
	return if p5 == nil then list else reusePreviousRows(p5, list)
end