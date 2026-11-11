local Chrome = script:FindFirstAncestor("Chrome")
assert(require(game:GetService("CorePackages").Workspace.Packages.Chrome).Enabled(), "Chrome.Service should not be initialized when Chrome is not enabled")

return (require(Chrome.ChromeShared.Service))