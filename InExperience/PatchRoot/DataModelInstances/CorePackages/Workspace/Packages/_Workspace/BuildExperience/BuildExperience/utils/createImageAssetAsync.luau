local parent = script:FindFirstAncestor("BuildExperience").Parent
local assetService = game:GetService("AssetService")
local playersService = game:GetService("Players")
local httpClientModule = require(parent.HttpClient)
local promiseModule = require(parent.Promise)
local getAssetUserAuthStore = require(parent.DataHydration.AssetUserAuth).getAssetUserAuthStore
local debug = require(parent.DataHydration.CreatorAgentChat).debug
local fetch = httpClientModule.fetch
local asPromise = httpClientModule.asPromise

local function cropToSquareAsync(p0)
	-- upvalues: promiseModule (ref), assetService (ref)
	return promiseModule.new(function(p1, p2)
		-- upvalues: assetService (copy), p0 (ref)
		local ok, status = pcall(function()
			-- upvalues: assetService (copy), p0 (copy)
			return assetService:CreateEditableImageAsync(Content.fromUri(p0))
		end)
		
		if not ok or not status then
			p2(`Failed to create EditableImage: {tostring(status)}`)
			
			return
		end
		local size = status.Size
		local x = size.X
		local y = size.Y
		local minValue = math.min(x, y)
		local var6 = status:ReadPixelsBuffer(Vector2.new(math.floor((x - minValue) / 2), math.floor((y - minValue) / 2)), Vector2.new(minValue, minValue))
		status:Destroy()
		local var7 = minValue * minValue * 4
		local var8 = var7 + 54
		local buff = buffer.create(var8)
		buffer.writeu8(buff, 0, 66)
		buffer.writeu8(buff, 1, 77)
		buffer.writeu32(buff, 2, var8)
		buffer.writeu32(buff, 6, 0)
		buffer.writeu32(buff, 10, 54)
		buffer.writeu32(buff, 14, 40)
		buffer.writei32(buff, 18, minValue)
		buffer.writei32(buff, 22, -minValue)
		buffer.writeu16(buff, 26, 1)
		buffer.writeu16(buff, 28, 32)
		buffer.writeu32(buff, 30, 0)
		buffer.writeu32(buff, 34, var7)
		buffer.writeu32(buff, 38, 2835)
		buffer.writeu32(buff, 42, 2835)
		buffer.writeu32(buff, 46, 0)
		buffer.writeu32(buff, 50, 0)
		
		for i = 0, minValue * minValue - 1 do
			local var10 = i * 4
			local var11 = i * 4 + 54
			local value = buffer.readu8(var6, var10)
			local value_1 = buffer.readu8(var6, var10 + 1)
			local value_2 = buffer.readu8(var6, var10 + 3)
			buffer.writeu8(buff, var11, buffer.readu8(var6, var10 + 2))
			buffer.writeu8(buff, var11 + 1, value_1)
			buffer.writeu8(buff, var11 + 2, value)
			buffer.writeu8(buff, var11 + 3, value_2)
		end
		p1(buffer.tostring(buff))
	end)
end

return function(value, p3, p4, p5)
	-- upvalues: playersService (ref), promiseModule (ref), cropToSquareAsync (ref), fetch (ref), asPromise (ref), debug (ref), getAssetUserAuthStore (ref)
	local localPlayer = playersService.LocalPlayer
	
	if localPlayer then
		local function getImageContent()
			-- upvalues: p4 (ref), cropToSquareAsync (copy), value (ref), fetch (copy), asPromise (copy)
			return if p4 then cropToSquareAsync(value) else asPromise(fetch({
				method = "GET",
				analyticsKey = "build-experience.download-thumbnail",
				responseEncoding = "protobuf",
				url = value,
				decode = function(p7)
					return p7
				end
			})):andThen(function(p6)
				return buffer.tostring(p6)
			end)
		end
		
		debug.log("info", "create_image_asset starting", { cropSquare = p4 })
		
		return getImageContent():andThen(function(p10)
			-- upvalues: p4 (ref), getAssetUserAuthStore (copy), p3 (ref), p5 (ref), localPlayer (ref)
			local var18 = if p4 then "image/bmp" else "image/png"
			local var19 = getAssetUserAuthStore()
			local t = { displayName = p3 or "Game Thumbnail" }
			
			if p5 and p5.creatorType == "Group" then
				t.groupId = tostring(p5.creatorTargetId)
			else
				t.userId = tostring(localPlayer.UserId)
			end
			return var19.createImageAsset(p10, var18, t)
		end):andThen(function(p9)
			-- upvalues: getAssetUserAuthStore (copy)
			return getAssetUserAuthStore().pollUntilDone(p9)
		end):andThen(function(p8)
			-- upvalues: promiseModule (copy), debug (copy)
			if typeof(p8) == "table" and p8.status == "timed_out" then
				return promiseModule.reject("Operation did not complete in time")
			end
			local var16 = if p8.status == "done" then p8.operation else p8
			local response = var16.response or var16
			debug.log("info", "create_image_asset succeeded", { assetId = response.assetId })
			
			return { assetId = response.assetId }
		end)
	end
	return promiseModule.reject("No local player")
end