local Parent = script:FindFirstAncestor("BuildExperience").Parent
local AssetService = game:GetService("AssetService")
local Players = game:GetService("Players")
local HttpClientModule = require(Parent.HttpClient)
local PromiseModule = require(Parent.Promise)
local GetAssetUserAuthStoreFunction = require(Parent.DataHydration.AssetUserAuth).getAssetUserAuthStore
local Debug = require(Parent.DataHydration.CreatorAgentChat).debug
local FetchFunction = HttpClientModule.fetch
local AsPromiseFunction = HttpClientModule.asPromise

local function cropToSquareAsync(Url) --[[ Line: 19 ]]
	-- upvalues: PromiseModule (copy), AssetService (copy)
	return PromiseModule.new(function(Callback1: (any) -> (), Callback: (any) -> ()) --[[ Line: 20 ]]
		-- upvalues: AssetService (upval), Url (copy)
		local Success, Result = pcall(function() --[[ Line: 21 ]]
			-- upvalues: AssetService (upval), Url (upval)
			return AssetService:CreateEditableImageAsync(Content.fromUri(Url))
		end)
		
		if not Success or not Result then
			Callback(`Failed to create EditableImage: {tostring(Result)}`)
			
			return
		end
		local Size = Result.Size
		local X: number = Size.X
		local Y: number = Size.Y
		local Smallest = math.min(X, Y)
		local PixelsBuffer = Result:ReadPixelsBuffer(Vector2.new(math.floor((X - Smallest) / 2), (math.floor((Y - Smallest) / 2))), Vector2.new(Smallest, Smallest))
		Result:Destroy()
		local Value1 = Smallest * Smallest * 4
		local Value = Value1 + 54
		local Buf = buffer.create(Value)
		buffer.writeu8(Buf, 0, 66)
		buffer.writeu8(Buf, 1, 77)
		buffer.writeu32(Buf, 2, Value)
		buffer.writeu32(Buf, 6, 0)
		buffer.writeu32(Buf, 10, 54)
		buffer.writeu32(Buf, 14, 40)
		buffer.writei32(Buf, 18, Smallest)
		buffer.writei32(Buf, 22, -Smallest)
		buffer.writeu16(Buf, 26, 1)
		buffer.writeu16(Buf, 28, 32)
		buffer.writeu32(Buf, 30, 0)
		buffer.writeu32(Buf, 34, Value1)
		buffer.writeu32(Buf, 38, 2835)
		buffer.writeu32(Buf, 42, 2835)
		buffer.writeu32(Buf, 46, 0)
		buffer.writeu32(Buf, 50, 0)
		
		for i = 0, Smallest * Smallest - 1 do
			local Offset = i * 4
			local Offset1 = i * 4 + 54
			local ByteValue = buffer.readu8(PixelsBuffer, Offset)
			local ByteValue1 = buffer.readu8(PixelsBuffer, Offset + 1)
			local ByteValue2 = buffer.readu8(PixelsBuffer, Offset + 3)
			buffer.writeu8(Buf, Offset1, (buffer.readu8(PixelsBuffer, Offset + 2)))
			buffer.writeu8(Buf, Offset1 + 1, ByteValue1)
			buffer.writeu8(Buf, Offset1 + 2, ByteValue)
			buffer.writeu8(Buf, Offset1 + 3, ByteValue2)
		end
		Callback1(buffer.tostring(Buf))
	end)
end

return function(Url, p1, CropSquare, p2) --[[ Line: 87 | Named "createImageAssetAsync" ]]
	-- upvalues: Players (copy), PromiseModule (copy), cropToSquareAsync (copy), FetchFunction (copy), AsPromiseFunction (copy), Debug (copy), GetAssetUserAuthStoreFunction (copy)
	local LocalPlayer = Players.LocalPlayer
	
	if LocalPlayer then
		local function getImageContent() --[[ Line: 98 ]]
			-- upvalues: CropSquare (copy), cropToSquareAsync (upval), Url (copy), FetchFunction (upval), AsPromiseFunction (upval)
			return if CropSquare then cropToSquareAsync(Url) else AsPromiseFunction((FetchFunction({
				method = "GET",
				analyticsKey = "build-experience.download-thumbnail",
				responseEncoding = "protobuf",
				url = Url,
				decode = function(p3) --[[ Line: 107 ]]
					return p3
				end
			}))):andThen(function(Buf): string --[[ Line: 111 ]]
				return buffer.tostring(Buf)
			end)
		end
		
		Debug.log("info", "create_image_asset starting", { cropSquare = CropSquare })
		
		return getImageContent():andThen(function(Result) --[[ Line: 120 ]]
			-- upvalues: CropSquare (copy), GetAssetUserAuthStoreFunction (upval), p1 (copy), p2 (copy), LocalPlayer (copy)
			local Bmp: string = if CropSquare then "image/bmp" else "image/png"
			local AssetUserAuthStore = GetAssetUserAuthStoreFunction()
			local config = { displayName = p1 or "Game Thumbnail" }
			
			if p2 and p2.creatorType == "Group" then
				config.groupId = tostring(p2.creatorTargetId)
			else
				config.userId = tostring(LocalPlayer.UserId)
			end
			return AssetUserAuthStore.createImageAsset(Result, Bmp, config)
		end):andThen(function(Result) --[[ Line: 133 ]]
			-- upvalues: GetAssetUserAuthStoreFunction (upval)
			return GetAssetUserAuthStoreFunction().pollUntilDone(Result)
		end):andThen(function(Result) --[[ Line: 137 ]]
			-- upvalues: PromiseModule (upval), Debug (upval)
			if typeof(Result) == "table" and Result.status == "timed_out" then
				return PromiseModule.reject("Operation did not complete in time")
			else
				local Operation = if Result.status == "done" then Result.operation else Result
				local Response = Operation.response or Operation
				Debug.log("info", "create_image_asset succeeded", { assetId = Response.assetId })
				
				return { assetId = Response.assetId }
			end
		end)
	else
		return PromiseModule.reject("No local player")
	end
end