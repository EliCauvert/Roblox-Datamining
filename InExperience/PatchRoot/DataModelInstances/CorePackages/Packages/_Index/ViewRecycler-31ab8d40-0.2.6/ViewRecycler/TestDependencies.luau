local dev = script:FindFirstAncestor("ViewRecycler").Parent:FindFirstChild("Dev")

if dev == nil then
	dev = game:GetService("CorePackages").Packages.Dev
end
return { JestGlobals = require(dev.JestGlobals) }