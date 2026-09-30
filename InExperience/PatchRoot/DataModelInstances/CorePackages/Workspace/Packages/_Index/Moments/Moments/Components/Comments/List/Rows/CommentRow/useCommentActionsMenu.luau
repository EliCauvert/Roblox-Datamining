local parent = script:FindFirstAncestor("Moments").Parent
local _ = require(parent.Foundation)
local reactModule = require(parent.React)
local _ = require(script.Parent.CommentRowView)

return function(p1)
	-- upvalues: reactModule (ref)
	local var1, var2 = reactModule.useState(nil)
	local var3, var4 = reactModule.useState(nil)
	local commentId = p1.commentId
	reactModule.useLayoutEffect(function()
		-- upvalues: var2 (ref), var4 (ref)
		var2(nil)
		var4(nil)
	end, { commentId })
	local reportedUserId = p1.reportedUserId
	local onReportComment = p1.onReportComment
	local onDeleteComment = p1.onDeleteComment
	local var5 = not p1.isAuthoredByViewer and (reportedUserId ~= nil and onReportComment ~= nil)
	local var6 = p1.isAuthoredByViewer and onDeleteComment ~= nil
	local var7 = reactModule.useCallback(function()
		-- upvalues: var2 (ref), commentId (ref)
		var2(commentId)
	end, { commentId })
	local var8 = reactModule.useCallback(function()
		-- upvalues: var2 (ref)
		var2(nil)
	end, {})
	local var9 = reactModule.useCallback(function()
		-- upvalues: var2 (ref), commentId (ref)
		var2(function(p2)
			-- upvalues: commentId (copy)
			return if p2 == commentId then nil else commentId
		end)
	end, { commentId })
	local var10 = reactModule.useCallback(function()
		-- upvalues: var2 (ref), onReportComment (ref), reportedUserId (ref), commentId (ref)
		var2(nil)
		
		if onReportComment ~= nil and reportedUserId ~= nil then
			onReportComment(commentId, reportedUserId)
		end
	end, { onReportComment, commentId, reportedUserId })
	local var11 = reactModule.useCallback(function()
		-- upvalues: var2 (ref), var4 (ref), commentId (ref)
		var2(nil)
		var4(commentId)
	end, { commentId })
	
	return {
		items = reactModule.useMemo(function()
			-- upvalues: var5 (ref), var10 (ref), var6 (ref), var11 (ref)
			local t = {}
			
			if var5 then
				table.insert(t, { id = "report", text = "Report", onActivated = var10 })
			end
			if var6 then
				table.insert(t, { id = "delete", text = "Delete", onActivated = var11 })
			end
			return t
		end, { var5, var6, var10, var11 }),
		isOpen = var1 == commentId,
		openMenu = var7,
		closeMenu = var8,
		toggleMenu = var9,
		deleteConfirmation = if var6 and var3 == commentId then {
			onConfirm = reactModule.useCallback(function()
				-- upvalues: var4 (ref), onDeleteComment (ref), var3 (ref)
				var4(nil)
				
				if onDeleteComment ~= nil and var3 ~= nil then
					onDeleteComment(var3)
				end
			end, { onDeleteComment, var3 }),
			onCancel = reactModule.useCallback(function()
				-- upvalues: var4 (ref)
				var4(nil)
			end, {})
		} else nil
	}
end