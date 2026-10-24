local InsertService = game:GetService("InsertService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")

return {
	PREVIEW_REMOTE_NAME = "PreviewLoadAsset",
	loadAsset = function(AssetId)
		-- upvalues: RunService (copy), ReplicatedStorage (copy), InsertService (copy)
		if RunService:IsStudio() and RunService:IsClient() then
			local PreviewLoadAsset = ReplicatedStorage:FindFirstChild("PreviewLoadAsset")
			
			if PreviewLoadAsset ~= nil and PreviewLoadAsset:IsA("RemoteFunction") then
				local ServerResult = PreviewLoadAsset:InvokeServer(AssetId)
				
				if ServerResult == nil or typeof(ServerResult) ~= "Instance" then
					error(`loadAsset: PreviewLoadAsset returned nil for {AssetId}`)
				end
				local ServerResultClone = ServerResult:Clone()
				ServerResult:Destroy()
				
				return ServerResultClone
			end
		end
		return InsertService:LoadAsset(AssetId)
	end,
	takePreviewResult = function(Object, p1)
		if Object == nil or typeof(Object) ~= "Instance" then
			error(`loadAsset: PreviewLoadAsset returned nil for {p1}`)
		end
		local ObjectClone = Object:Clone()
		Object:Destroy()
		
		return ObjectClone
	end
}