local Parent = script:FindFirstAncestor("ViewRecyclerRoblox").Parent
local Dev = Parent:FindFirstChild("Dev")

if Dev == nil then
	local Packages = game:GetService("CorePackages").Packages
	Dev = Packages.Dev
	Parent = Packages
end
return {
	JestGlobals = require(Dev.JestGlobals),
	ReactRoblox = require(Parent:FindFirstChild("ReactRoblox") or Dev.ReactRoblox)
}