local parent = script.Parent.Parent
local parent_1 = parent.Parent
local guiService = game:GetService("GuiService")
local avatarIdentification = require(parent_1.AvatarIdentification).AvatarIdentification
local dashModule = require(parent_1.Dash)
local getAvatarAssetsModule = require(parent.Utils.getAvatarAssets)
local captureMetadataGetAvatarsTimeoutMs = game:DefineFastInt("CaptureMetadataGetAvatarsTimeoutMs", 150)
local captureMetadataMaxAvatars = game:DefineFastInt("CaptureMetadataMaxAvatars", 5)
local captureMetadataMinAvatarBoundingBoxPixels = game:DefineFastInt("CaptureMetadataMinAvatarBoundingBoxPixels", 200)
local captureMetadataMinHitRatePercentage = game:DefineFastInt("CaptureMetadataMinHitRatePercentage", 50)

local function _()
	local currentCamera = workspace.CurrentCamera
	
	if currentCamera then
		return currentCamera.ViewportSize
	end
end

local round = math.round

local _ = function(p0)
	-- upvalues: round (ref)
	return { x = round(p0.X), y = round(p0.Y) }
end

return function()
	-- upvalues: captureMetadataGetAvatarsTimeoutMs (ref), avatarIdentification (ref), dashModule (ref), guiService (ref), captureMetadataMaxAvatars (ref), captureMetadataMinHitRatePercentage (ref), captureMetadataMinAvatarBoundingBoxPixels (ref), getAvatarAssetsModule (ref), round (ref)
	local currentCamera = workspace.CurrentCamera
	local var7 = if not currentCamera then nil else currentCamera.ViewportSize
	
	if not var7 then
		return {}
	end
	local var8 = dashModule.values(avatarIdentification.getVisibleAvatars(true, captureMetadataGetAvatarsTimeoutMs / 1000))
	local rawScreenScale = guiService:GetRawScreenScale()
	
	for i, v in var8 do
		v.boundingBox.min = v.boundingBox.min * var7 * rawScreenScale
		v.boundingBox.max = v.boundingBox.max * var7 * rawScreenScale
	end
	table.sort(var8, function(p1, p2)
		return (p2.boundingBox.max - p2.boundingBox.min).Magnitude < (p1.boundingBox.max - p1.boundingBox.min).Magnitude
	end)
	local var10 = 0
	local t = {}
	
	for i_1, v_1 in var8 do
		if captureMetadataMaxAvatars <= var10 then break end
		var10 += 1
		
		if v_1.hitRate >= captureMetadataMinHitRatePercentage / 100 then
			if (v_1.boundingBox.max - v_1.boundingBox.min).Magnitude < captureMetadataMinAvatarBoundingBoxPixels then break end
			local player = v_1.player
			local userId = player.UserId
			local t_1 = { avatarItems = getAvatarAssetsModule(player.Character) }
			local t_2 = {}
			local min = v_1.boundingBox.min
			t_2.min = { x = round(min.X), y = round(min.Y) }
			local max = v_1.boundingBox.max
			t_2.max = { x = round(max.X), y = round(max.Y) }
			t_1.boundingBox = t_2
			t[userId] = t_1
		end
	end
	return t
end