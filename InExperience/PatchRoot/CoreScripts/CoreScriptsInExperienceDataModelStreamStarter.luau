local CorePackages = game:GetService("CorePackages")
local Success, Result = pcall(function() --[[ Line: 3 ]]
	-- upvalues: CorePackages (copy)
	return require(CorePackages.Workspace.Packages.DataModelStreaming)
end)

if not Success or type(Result) ~= "table" then return end
local InitDataModelStreamWsClientFunction: (any) -> () = Result.initDataModelStreamWsClient

if type(InitDataModelStreamWsClientFunction) == "function" then
	InitDataModelStreamWsClientFunction("experience")
	
	return
end