local parent = script:FindFirstAncestor("ViewRecyclerReact").Parent
local dev = parent:FindFirstChild("Dev")

if dev == nil then
	local packages = game:GetService("CorePackages").Packages
	dev = packages.Dev
	parent = packages
end
return {
	JestGlobals = require(dev.JestGlobals),
	ReactRoblox = require(parent:FindFirstChild("ReactRoblox") or dev.ReactRoblox)
}