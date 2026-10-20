local Parent = script.Parent.Parent
local Parent1 = Parent.Parent
local GuiService = game:GetService("GuiService")
local AvatarIdentification = require(Parent1.AvatarIdentification).AvatarIdentification
local DashModule = require(Parent1.Dash)
local GetAvatarAssetsModule = require(Parent.Utils.getAvatarAssets)
local CaptureMetadataGetAvatarsTimeoutMs = game:DefineFastInt("CaptureMetadataGetAvatarsTimeoutMs", 150)
local CaptureMetadataMaxAvatars = game:DefineFastInt("CaptureMetadataMaxAvatars", 5)
local CaptureMetadataMinAvatarBoundingBoxPixels = game:DefineFastInt("CaptureMetadataMinAvatarBoundingBoxPixels", 200)
local CaptureMetadataMinHitRatePercentage = game:DefineFastInt("CaptureMetadataMinHitRatePercentage", 50)

local function _()
	local CurrentCamera = workspace.CurrentCamera
	
	if not CurrentCamera then return end
	return CurrentCamera.ViewportSize
end

local RoundFunction = math.round

local _ = function(Vector)
	-- upvalues: RoundFunction (copy)
	return { x = RoundFunction(Vector.X), y = RoundFunction(Vector.Y) }
end

return function()
	-- upvalues: CaptureMetadataGetAvatarsTimeoutMs (copy), AvatarIdentification (copy), DashModule (copy), GuiService (copy), CaptureMetadataMaxAvatars (copy), CaptureMetadataMinHitRatePercentage (copy), CaptureMetadataMinAvatarBoundingBoxPixels (copy), GetAvatarAssetsModule (copy), RoundFunction (copy)
	local CurrentCamera = workspace.CurrentCamera
	local ViewportSize = if CurrentCamera then CurrentCamera.ViewportSize else nil
	
	if not ViewportSize then
		return {}
	end
	local ValuesResult = DashModule.values((AvatarIdentification.getVisibleAvatars(true, CaptureMetadataGetAvatarsTimeoutMs / 1000)))
	local RawScreenScale = GuiService:GetRawScreenScale()
	
	for _, value in ValuesResult do
		value.boundingBox.min = value.boundingBox.min * ViewportSize * RawScreenScale
		value.boundingBox.max = value.boundingBox.max * ViewportSize * RawScreenScale
	end
	table.sort(ValuesResult, function(A, B): boolean
		return (B.boundingBox.max - B.boundingBox.min).Magnitude < (A.boundingBox.max - A.boundingBox.min).Magnitude
	end)
	local Count = 0
	local t = {}
	
	for _, value1 in ValuesResult do
		if CaptureMetadataMaxAvatars <= Count then break end
		Count += 1
		
		if value1.hitRate >= CaptureMetadataMinHitRatePercentage / 100 then
			if (value1.boundingBox.max - value1.boundingBox.min).Magnitude < CaptureMetadataMinAvatarBoundingBoxPixels then break end
			local Player = value1.player
			local AvatarAssetsModule = GetAvatarAssetsModule(Player.Character)
			local UserId = Player.UserId
			local Min = value1.boundingBox.min
			local Min1 = { x = RoundFunction(Min.X), y = RoundFunction(Min.Y) }
			local Max = value1.boundingBox.max
			t[UserId] = {
				avatarItems = AvatarAssetsModule,
				boundingBox = {
					min = Min1,
					max = { x = RoundFunction(Max.X), y = RoundFunction(Max.Y) }
				}
			}
		end
	end
	return t
end