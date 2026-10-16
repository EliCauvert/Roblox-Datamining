local Dev = script:FindFirstAncestor("ViewRecycler").Parent:FindFirstChild("Dev")

if Dev == nil then
	Dev = game:GetService("CorePackages").Packages.Dev
end
return { JestGlobals = require(Dev.JestGlobals) }