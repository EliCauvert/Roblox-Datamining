local parent = script:FindFirstAncestor("Moments").Parent
local _ = require(parent.Foundation)
local reactModule = require(parent.React)
local _ = require(script.Parent.CommentRowView)

return function(p1)
	-- upvalues: reactModule (ref)
	local var1, var2 = reactModule.useState(false)
	local var3, var4 = reactModule.useState(false)
	local commentId = p1.commentId
	local reportedUserId = p1.reportedUserId
	local onReportComment = p1.onReportComment
	local onDeleteComment = p1.onDeleteComment
	local var5 = not p1.isAuthoredByViewer and (reportedUserId ~= nil and onReportComment ~= nil)
	local var6 = p1.isAuthoredByViewer and onDeleteComment ~= nil
	local var7 = reactModule.useCallback(function()
		-- upvalues: var2 (ref)
		var2(true)
	end, {})
	local var8 = reactModule.useCallback(function()
		-- upvalues: var2 (ref)
		var2(false)
	end, {})
	local var9 = reactModule.useCallback(function()
		-- upvalues: var2 (ref)
		var2(function(p2)
			return not p2
		end)
	end, {})
	local var10 = reactModule.useCallback(function()
		-- upvalues: var2 (ref), onReportComment (ref), reportedUserId (ref), commentId (ref)
		var2(false)
		
		if onReportComment ~= nil and reportedUserId ~= nil then
			onReportComment(commentId, reportedUserId)
		end
	end, { onReportComment, commentId, reportedUserId })
	local var11 = reactModule.useCallback(function()
		-- upvalues: var2 (ref), var4 (ref)
		var2(false)
		var4(true)
	end, {})
	
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
		isOpen = var1,
		openMenu = var7,
		closeMenu = var8,
		toggleMenu = var9,
		deleteConfirmation = if var6 and var3 then {
			onConfirm = reactModule.useCallback(function()
				-- upvalues: var4 (ref), onDeleteComment (ref), commentId (ref)
				var4(false)
				
				if onDeleteComment ~= nil then
					onDeleteComment(commentId)
				end
			end, { onDeleteComment, commentId }),
			onCancel = reactModule.useCallback(function()
				-- upvalues: var4 (ref)
				var4(false)
			end, {})
		} else nil
	}
end