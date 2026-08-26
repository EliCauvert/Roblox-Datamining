local parent = script:FindFirstAncestor("BuildExperience").Parent
local assetService = game:GetService("AssetService")
local playersService = game:GetService("Players")
local httpClientModule = require(parent.HttpClient)
local promiseModule = require(parent.Promise)
local getAssetUserAuthStore = require(parent.DataHydration.AssetUserAuth).getAssetUserAuthStore
local debug = require(parent.DataHydration.CreatorAgentChat).debug
local fetch = httpClientModule.fetch
local asPromise = httpClientModule.asPromise

local function cropToSquareAsync(p1)
	-- upvalues: promiseModule (ref), assetService (ref)
	return promiseModule.new(function(p2, p3)
		-- upvalues: assetService (copy), p1 (ref)
		local ok, status = pcall(function()
			-- upvalues: assetService (copy), p1 (copy)
			return assetService:CreateEditableImageAsync(Content.fromUri(p1))
		end)
		
		if not ok or not status then
			p3(`Failed to create EditableImage: {tostring(status)}`)
			
			return
		end
		local size = status.Size
		local x = size.X
		local y = size.Y
		local minValue = math.min(x, y)
		local var1 = status:ReadPixelsBuffer(Vector2.new(math.floor((x - minValue) / 2), math.floor((y - minValue) / 2)), Vector2.new(minValue, minValue))
		status:Destroy()
		local var2 = minValue * minValue * 4
		local var3 = var2 + 54
		local buff = buffer.create(var3)
		buffer.writeu8(buff, 0, 66)
		buffer.writeu8(buff, 1, 77)
		buffer.writeu32(buff, 2, var3)
		buffer.writeu32(buff, 6, 0)
		buffer.writeu32(buff, 10, 54)
		buffer.writeu32(buff, 14, 40)
		buffer.writei32(buff, 18, minValue)
		buffer.writei32(buff, 22, -minValue)
		buffer.writeu16(buff, 26, 1)
		buffer.writeu16(buff, 28, 32)
		buffer.writeu32(buff, 30, 0)
		buffer.writeu32(buff, 34, var2)
		buffer.writeu32(buff, 38, 2835)
		buffer.writeu32(buff, 42, 2835)
		buffer.writeu32(buff, 46, 0)
		buffer.writeu32(buff, 50, 0)
		
		for i = 0, minValue * minValue - 1 do
			local var4 = i * 4
			local var5 = i * 4 + 54
			local value = buffer.readu8(var1, var4)
			local value_1 = buffer.readu8(var1, var4 + 1)
			local value_2 = buffer.readu8(var1, var4 + 3)
			buffer.writeu8(buff, var5, buffer.readu8(var1, var4 + 2))
			buffer.writeu8(buff, var5 + 1, value_1)
			buffer.writeu8(buff, var5 + 2, value)
			buffer.writeu8(buff, var5 + 3, value_2)
		end
		p2(buffer.tostring(buff))
	end)
end

return function(value, p2, p3, p4)
	-- upvalues: playersService (ref), promiseModule (ref), cropToSquareAsync (ref), fetch (ref), asPromise (ref), debug (ref), getAssetUserAuthStore (ref)
	local localPlayer = playersService.LocalPlayer
	
	if localPlayer then
		local function getImageContent()
			-- upvalues: p3 (ref), cropToSquareAsync (copy), value (ref), fetch (copy), asPromise (copy)
			return if p3 then cropToSquareAsync(value) else asPromise(fetch({
				method = "GET",
				analyticsKey = "build-experience.download-thumbnail",
				responseEncoding = "protobuf",
				url = value,
				decode = function(p5)
					return p5
				end
			})):andThen(function(p5)
				return buffer.tostring(p5)
			end)
		end
		
		debug.log("info", "create_image_asset starting", { cropSquare = p3 })
		
		return getImageContent():andThen(function(p5)
			-- upvalues: p3 (ref), getAssetUserAuthStore (copy), p2 (ref), p4 (ref), localPlayer (ref)
			local var1 = if p3 then "image/bmp" else "image/png"
			local var2 = getAssetUserAuthStore()
			local t = { displayName = p2 or "Game Thumbnail" }
			
			if p4 and p4.creatorType == "Group" then
				t.groupId = tostring(p4.creatorTargetId)
			else
				t.userId = tostring(localPlayer.UserId)
			end
			return var2.createImageAsset(p5, var1, t)
		end):andThen(function(p5)
			-- upvalues: getAssetUserAuthStore (copy)
			return getAssetUserAuthStore().pollUntilDone(p5)
		end):andThen(function(p5)
			-- upvalues: promiseModule (copy), debug (copy)
			if typeof(p5) == "table" and p5.status == "timed_out" then
				return promiseModule.reject("Operation did not complete in time")
			end
			local var1 = if p5.status == "done" then p5.operation else p5
			local response = var1.response or var1
			debug.log("info", "create_image_asset succeeded", { assetId = response.assetId })
			
			return { assetId = response.assetId }
		end)
	end
	return promiseModule.reject("No local player")
end