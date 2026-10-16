local ArgCheckModule = require(script:FindFirstAncestor("AppChat").Parent.ArgCheck)
local FilterForLinksModule = require(script.Parent.filterForLinks)
local list = {
	"roblox.com", "sitetest%d%.robloxlabs.com", "gametest%d%.robloxlabs.com",
	"roblox.cn", "roblox.qq.com", "roblox%-cn.com"
}

return function(p1) --[[ Line: 18 ]]
	-- upvalues: ArgCheckModule (copy), FilterForLinksModule (copy), list (copy)
	ArgCheckModule.isType(p1, "table", "filterForLinks.text")
	
	return FilterForLinksModule(p1, list)
end