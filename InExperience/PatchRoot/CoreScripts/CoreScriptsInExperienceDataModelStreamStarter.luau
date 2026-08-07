local corePackagesService = game:GetService("CorePackages")
local ok, status = pcall(function() --[[ line: 3 ]]
	-- upvalues: corePackagesService (ref)
	return require(corePackagesService.Workspace.Packages.DataModelStreaming)
end)

if not ok or type(status) ~= "table" then return end
local initDataModelStreamWsClient = status.initDataModelStreamWsClient

if type(initDataModelStreamWsClient) == "function" then
	initDataModelStreamWsClient("experience")
	
	return
end