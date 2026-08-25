local argCheckModule = require(script:FindFirstAncestor("AppChat").Parent.ArgCheck)
local filterForLinksModule = require(script.Parent.filterForLinks)
local list = {
	"roblox.com", "sitetest%d%.robloxlabs.com", "gametest%d%.robloxlabs.com",
	"roblox.cn", "roblox.qq.com", "roblox%-cn.com"
}

return function(p0)
	-- upvalues: argCheckModule (ref), filterForLinksModule (ref), list (ref)
	argCheckModule.isType(p0, "table", "filterForLinks.text")
	
	return filterForLinksModule(p0, list)
end