local _ = require(script:FindFirstAncestor("BuildExperience").Chat.chatTypes)

return {
	toChatReference = function(p1)
		return {
			path = p1.path,
			displayName = p1.displayName,
			className = p1.className or (if p1.instance ~= nil then p1.kind else p1.instance.ClassName)
		}
	end
}