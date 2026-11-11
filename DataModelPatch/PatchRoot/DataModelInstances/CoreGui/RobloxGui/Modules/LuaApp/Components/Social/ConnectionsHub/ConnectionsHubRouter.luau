local _ = require(game:GetService("CorePackages").Workspace.Packages.Navigation)
local ConnectionsHubRouter = {}

for _, value in require(script.Parent.TabConfig) do
	table.insert(ConnectionsHubRouter, { [value.id] = { getScreen = value.getScreen } })
end
return ConnectionsHubRouter