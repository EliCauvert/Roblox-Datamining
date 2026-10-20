local Parent = script:FindFirstAncestor("Moments").Parent
local _ = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local _ = require(script.Parent.CommentRowView)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local config = {
	report = "Feature.Moments.Action.Report",
	block = "Feature.Moments.Action.Block",
	delete = "Feature.Moments.Action.Delete"
}

return function(p1)
	-- upvalues: UseLocalizationFunction (copy), config (copy), ReactModule (copy)
	local UseLocalizationResult = UseLocalizationFunction(config)
	local Report = UseLocalizationResult.report
	local Block = UseLocalizationResult.block
	local Delete = UseLocalizationResult.delete
	local UseStateResult, UseStateResult2 = ReactModule.useState(nil)
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(nil)
	local CommentId = p1.commentId
	ReactModule.useLayoutEffect(function()
		-- upvalues: UseStateResult2 (copy), UseStateResult2_1 (copy)
		UseStateResult2(nil)
		UseStateResult2_1(nil)
	end, { CommentId })
	local AuthorUserId = p1.authorUserId
	local OnReportCommentFunction = p1.onReportComment
	local OnBlockCommentAuthorFunction = p1.onBlockCommentAuthor
	local OnDeleteCommentFunction = p1.onDeleteComment
	local HasOnReportCommentFunction: boolean = not p1.isAuthoredByViewer and (AuthorUserId ~= nil and OnReportCommentFunction ~= nil)
	local HasOnBlockCommentAuthorFunction: boolean = not p1.isAuthoredByViewer and (AuthorUserId ~= nil and OnBlockCommentAuthorFunction ~= nil)
	local HasOnDeleteCommentFunction: boolean = p1.isAuthoredByViewer and OnDeleteCommentFunction ~= nil
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: UseStateResult2 (copy), OnReportCommentFunction (copy), AuthorUserId (copy), CommentId (copy)
		UseStateResult2(nil)
		
		if OnReportCommentFunction ~= nil and AuthorUserId ~= nil then
			OnReportCommentFunction(CommentId, AuthorUserId)
		end
	end, { OnReportCommentFunction, CommentId, AuthorUserId })
	local UseResult1 = ReactModule.useCallback(function()
		-- upvalues: UseStateResult2 (copy), OnBlockCommentAuthorFunction (copy), AuthorUserId (copy), CommentId (copy)
		UseStateResult2(nil)
		
		if OnBlockCommentAuthorFunction ~= nil and AuthorUserId ~= nil then
			OnBlockCommentAuthorFunction(CommentId, AuthorUserId)
		end
	end, { OnBlockCommentAuthorFunction, CommentId, AuthorUserId })
	local UseResult2 = ReactModule.useCallback(function()
		-- upvalues: UseStateResult2 (copy), UseStateResult2_1 (copy), CommentId (copy)
		UseStateResult2(nil)
		UseStateResult2_1(CommentId)
	end, { CommentId })
	local UseResult3 = ReactModule.useCallback(function()
		-- upvalues: UseStateResult2_1 (copy), OnDeleteCommentFunction (copy), UseStateResult1 (copy)
		UseStateResult2_1(nil)
		
		if OnDeleteCommentFunction ~= nil and UseStateResult1 ~= nil then
			OnDeleteCommentFunction(UseStateResult1)
		end
	end, { OnDeleteCommentFunction, UseStateResult1 })
	local UseResult4 = ReactModule.useCallback(function()
		-- upvalues: UseStateResult2_1 (copy)
		UseStateResult2_1(nil)
	end, {})
	
	return {
		items = ReactModule.useMemo(function()
			-- upvalues: HasOnReportCommentFunction (copy), Report (copy), UseResult (copy), HasOnBlockCommentAuthorFunction (copy), Block (copy), UseResult1 (copy), HasOnDeleteCommentFunction (copy), Delete (copy), UseResult2 (copy)
			local List = {}
			
			if HasOnReportCommentFunction then
				table.insert(List, { id = "report", text = Report, onActivated = UseResult })
			end
			if HasOnBlockCommentAuthorFunction then
				table.insert(List, { id = "block", text = Block, onActivated = UseResult1 })
			end
			if HasOnDeleteCommentFunction then
				table.insert(List, { id = "delete", text = Delete, onActivated = UseResult2 })
			end
			return List
		end, {
			HasOnReportCommentFunction, HasOnBlockCommentAuthorFunction,
			HasOnDeleteCommentFunction, UseResult, UseResult1, UseResult2, Report, Block,
			Delete
		}),
		isOpen = UseStateResult == CommentId,
		openMenu = ReactModule.useCallback(function()
			-- upvalues: UseStateResult2 (copy), CommentId (copy)
			UseStateResult2(CommentId)
		end, { CommentId }),
		closeMenu = ReactModule.useCallback(function()
			-- upvalues: UseStateResult2 (copy)
			UseStateResult2(nil)
		end, {}),
		toggleMenu = ReactModule.useCallback(function()
			-- upvalues: UseStateResult2 (copy), CommentId (copy)
			UseStateResult2(function(CommentId1)
				-- upvalues: CommentId (upval)
				return if CommentId1 == CommentId then nil else CommentId
			end)
		end, { CommentId }),
		deleteConfirmation = if HasOnDeleteCommentFunction and UseStateResult1 == CommentId then { onConfirm = UseResult3, onCancel = UseResult4 } else nil
	}
end