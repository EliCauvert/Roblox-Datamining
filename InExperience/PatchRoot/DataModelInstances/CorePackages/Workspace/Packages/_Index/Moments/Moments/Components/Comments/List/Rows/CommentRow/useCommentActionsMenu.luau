local parent = script:FindFirstAncestor("Moments").Parent
local _ = require(parent.Foundation)
local localizationModule = require(parent.Localization)
local reactModule = require(parent.React)
local _ = require(script.Parent.CommentRowView)
local useLocalization = localizationModule.Hooks.useLocalization
local t = {
	report = "Feature.Moments.Action.Report",
	block = "Feature.Moments.Action.Block",
	delete = "Feature.Moments.Action.Delete"
}

return function(p1)
	-- upvalues: useLocalization (ref), t (ref), reactModule (ref)
	local var1 = useLocalization(t)
	local report = var1.report
	local block = var1.block
	local delete = var1.delete
	local var2, var3 = reactModule.useState(nil)
	local var4, var5 = reactModule.useState(nil)
	local commentId = p1.commentId
	reactModule.useLayoutEffect(function()
		-- upvalues: var3 (ref), var5 (ref)
		var3(nil)
		var5(nil)
	end, { commentId })
	local authorUserId = p1.authorUserId
	local onReportComment = p1.onReportComment
	local onBlockCommentAuthor = p1.onBlockCommentAuthor
	local onDeleteComment = p1.onDeleteComment
	local var6 = not p1.isAuthoredByViewer and (authorUserId ~= nil and onReportComment ~= nil)
	local var7 = not p1.isAuthoredByViewer and (authorUserId ~= nil and onBlockCommentAuthor ~= nil)
	local var8 = p1.isAuthoredByViewer and onDeleteComment ~= nil
	local var9 = reactModule.useCallback(function()
		-- upvalues: var3 (ref), commentId (ref)
		var3(commentId)
	end, { commentId })
	local var10 = reactModule.useCallback(function()
		-- upvalues: var3 (ref)
		var3(nil)
	end, {})
	local var11 = reactModule.useCallback(function()
		-- upvalues: var3 (ref), commentId (ref)
		var3(function(p2)
			-- upvalues: commentId (copy)
			return if p2 == commentId then nil else commentId
		end)
	end, { commentId })
	local var12 = reactModule.useCallback(function()
		-- upvalues: var3 (ref), onReportComment (ref), authorUserId (ref), commentId (ref)
		var3(nil)
		
		if onReportComment ~= nil and authorUserId ~= nil then
			onReportComment(commentId, authorUserId)
		end
	end, { onReportComment, commentId, authorUserId })
	local var13 = reactModule.useCallback(function()
		-- upvalues: var3 (ref), onBlockCommentAuthor (ref), authorUserId (ref), commentId (ref)
		var3(nil)
		
		if onBlockCommentAuthor ~= nil and authorUserId ~= nil then
			onBlockCommentAuthor(commentId, authorUserId)
		end
	end, { onBlockCommentAuthor, commentId, authorUserId })
	local var14 = reactModule.useCallback(function()
		-- upvalues: var3 (ref), var5 (ref), commentId (ref)
		var3(nil)
		var5(commentId)
	end, { commentId })
	
	return {
		items = reactModule.useMemo(function()
			-- upvalues: var6 (ref), report (ref), var12 (ref), var7 (ref), block (ref), var13 (ref), var8 (ref), delete (ref), var14 (ref)
			local t = {}
			
			if var6 then
				table.insert(t, { id = "report", text = report, onActivated = var12 })
			end
			if var7 then
				table.insert(t, { id = "block", text = block, onActivated = var13 })
			end
			if var8 then
				table.insert(t, { id = "delete", text = delete, onActivated = var14 })
			end
			return t
		end, {
			var6, var7, var8, var12, var13, var14, report, block, delete
		}),
		isOpen = var2 == commentId,
		openMenu = var9,
		closeMenu = var10,
		toggleMenu = var11,
		deleteConfirmation = if var8 and var4 == commentId then {
			onConfirm = reactModule.useCallback(function()
				-- upvalues: var5 (ref), onDeleteComment (ref), var4 (ref)
				var5(nil)
				
				if onDeleteComment ~= nil and var4 ~= nil then
					onDeleteComment(var4)
				end
			end, { onDeleteComment, var4 }),
			onCancel = reactModule.useCallback(function()
				-- upvalues: var5 (ref)
				var5(nil)
			end, {})
		} else nil
	}
end