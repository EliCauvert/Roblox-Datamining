local Mock = require(script:FindFirstAncestor("AppChat").Parent.LuaSocialLibrariesDeps).Mock

return function(p1)
	-- upvalues: Mock (copy)
	local NewResult = Mock.MagicMock.new()
	NewResult.id = if p1.id == nil then p1.title else p1.id
	NewResult.title = p1.title
	NewResult.participants = p1.participants or {}
	local _DateTime = DateTime.fromUnixTimestamp(p1.unixTime or 0)
	NewResult.lastUpdated = {
		GetShortRelativeTime = function()
			-- upvalues: p1 (copy)
			return p1.shortRelativeTime or "0"
		end,
		GetLongRelativeTime = function()
			-- upvalues: p1 (copy)
			return p1.longRelativeTime or "0"
		end,
		GetUnixTimestamp = function()
			-- upvalues: p1 (copy)
			return p1.unixTime or 0
		end,
		dateTime = _DateTime,
		Format = function(_, p2)
			-- upvalues: _DateTime (copy)
			return _DateTime:FormatLocalTime(p2, "en-us")
		end
	}
	NewResult.serverState = "CREATED"
	NewResult.messages = p1.messages
	NewResult.isDefaultTitle = p1.isDefaultTitle ~= nil and p1.isDefaultTitle
	NewResult.previewContent = nil
	NewResult.osaAcknowledgementStatus = "not_applicable"
	NewResult.hasUnreadMessages = p1.hasUnreadMessages ~= nil and p1.hasUnreadMessages
	NewResult.moderationType = nil
	NewResult.userPendingStatus = nil
	NewResult.shortRelativeTime = p1.shortRelativeTime or "0"
	NewResult.hasGroupUp = false
	NewResult.lastMessageContent = nil
	
	return NewResult
end