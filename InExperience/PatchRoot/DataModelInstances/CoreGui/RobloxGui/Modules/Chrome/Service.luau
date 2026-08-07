local chrome = script:FindFirstAncestor("Chrome")
assert(require(game:GetService("CorePackages").Workspace.Packages.Chrome).Enabled(), "Chrome.Service should not be initialized when Chrome is not enabled")

return require(chrome.ChromeShared.Service)