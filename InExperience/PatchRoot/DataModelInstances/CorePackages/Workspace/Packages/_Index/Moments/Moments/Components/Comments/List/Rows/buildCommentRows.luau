local Moments = script:FindFirstAncestor("Moments")
local Parent = Moments.Parent
local _ = require(Parent.MomentsTypes)
local ShallowEqualFunction = require(Parent.Dash).shallowEqual
local CommentCollectionTypesModule = require(Moments.Components.Comments.GetCommentCollectionStore.CommentCollectionTypes)
local _ = require(script.Parent.CommentRowTypes)

local function reusePreviousRows(PreviousRows, List)
	-- upvalues: ShallowEqualFunction (copy)
	local t = {}
	
	for _, previousRow in PreviousRows do
		t[previousRow.key] = previousRow
	end
	local v1 = #List == #PreviousRows
	for i, value in List do
		local Entry = t[value.key]
		
		if Entry ~= nil and ShallowEqualFunction(Entry, value) then
			List[i] = Entry
		end
		v1 = v1 and List[i] == PreviousRows[i]
	end
	return if v1 then PreviousRows else List
end

return function(p1)
	-- upvalues: CommentCollectionTypesModule (copy), reusePreviousRows (copy)
	local State = p1.state
	local ResolveCommentFunction = p1.resolveComment
	local PreviousRows = p1.previousRows
	local ExpandedCommentIds = p1.expandedCommentIds
	local Translation = p1.translation
	local Buffer = table.create(#State.orderedCommentIds + (if State.pendingSubmission == nil then 0 else 1))
	local PendingSubmission = State.pendingSubmission
	
	if PendingSubmission ~= nil then
		table.insert(Buffer, {
			type = "pending",
			key = CommentCollectionTypesModule.pendingSentinel(PendingSubmission.clientRequestId),
			text = PendingSubmission.text,
			status = PendingSubmission.status
		})
	end
	for _, orderedCommentId in State.orderedCommentIds do
		if not CommentCollectionTypesModule.isPendingSentinel(orderedCommentId) then
			local ResolveCommentResult = ResolveCommentFunction(orderedCommentId)
			local Text = if ResolveCommentResult == nil then "" else ResolveCommentResult.text or ""
			local TranslatedText = if ResolveCommentResult == nil then nil else ResolveCommentResult.translatedText
			local TranslationState: string? = nil
			
			if Translation ~= nil and TranslatedText ~= nil then
				if Translation.toggledCommentIds[orderedCommentId] == true == Translation.showsTranslationByDefault then
					TranslationState = "Original"
				else
					TranslationState = "Translated"
					Text = TranslatedText
				end
			end
			table.insert(Buffer, {
				type = "comment",
				key = `comment:{orderedCommentId}`,
				commentId = orderedCommentId,
				text = Text,
				createdAt = if ResolveCommentResult == nil then "" else ResolveCommentResult.createdAt,
				isExpanded = ExpandedCommentIds ~= nil and ExpandedCommentIds[orderedCommentId] == true,
				translationState = TranslationState
			})
		end
	end
	return if PreviousRows == nil then Buffer else reusePreviousRows(PreviousRows, Buffer)
end