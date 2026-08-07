local assetService = game:GetService("AssetService")
local parent = script:FindFirstAncestor("QRCodeDisplay").Parent
local reactModule = require(parent.React)
local dashModule = require(parent.Dash)
local drawImageModule = require(script.Parent.drawImage)
local t = {
	backgroundTransparency = 0,
	pixelTransparency = 0,
	sideLength = 200,
	backgroundColor3 = Color3.fromRGB(255, 255, 255),
	pixelColor3 = Color3.fromRGB(0, 0, 0)
}

local function _(p0, p1) --[[ line: 36 | named "getQrCodeImageSize" ]]
	if not p1 then
		return p0
	end
	assert(type(p1) == "number", "rotation must be a number")
	
	if p1 % 90 == 0 then
		return p0
	end
	local radians = math.rad(p1)
	
	return math.round(p0 / (math.sin(radians) + math.cos(radians)))
end

return function(p2) --[[ line: 51 ]]
	-- upvalues: dashModule (ref), t (ref), reactModule (ref), assetService (ref), drawImageModule (ref)
	local var10
	local var6 = dashModule.join(t, p2)
	local var7, var8 = reactModule.useState(nil)
	local var9 = reactModule.createRef()
	local sideLength = var6.sideLength
	local qrCodeRotation = var6.qrCodeRotation
	
	if qrCodeRotation then
		assert(type(qrCodeRotation) == "number", "rotation must be a number")
		
		if qrCodeRotation % 90 == 0 then
			var10 = sideLength
		else
			local radians = math.rad(qrCodeRotation)
			var10 = math.round(sideLength / (math.sin(radians) + math.cos(radians)))
		end
	else
		var10 = sideLength
	end
	reactModule.useEffect(function() --[[ line: 58 ]]
		-- upvalues: var9 (ref), var10 (ref), assetService (copy), var8 (ref), drawImageModule (copy), var6 (ref)
		if not var9.current or var9.current.Size.X ~= var10 then
			var9.current = assetService:CreateEditableImage({ Size = Vector2.new(var10, var10) })
			var8(Content.fromObject(var9.current))
		end
		drawImageModule(var9.current, var10, var6.qrCodeMatrix, var6.pixelColor3, var6.pixelTransparency)
	end, {
		var10,
		var6.qrCodeMatrix,
		var6.pixelColor3,
		var6.pixelTransparency
	})
	
	return reactModule.createElement("Frame", {
		BorderSizePixel = 0,
		BackgroundColor3 = var6.backgroundColor3,
		BackgroundTransparency = var6.backgroundTransparency,
		Size = UDim2.fromOffset(var6.sideLength, var6.sideLength)
	}, {
		ImageLabel = reactModule.createElement("ImageLabel", {
			BackgroundTransparency = 1,
			AnchorPoint = Vector2.new(0.5, 0.5),
			ImageContent = var7,
			Position = UDim2.fromScale(0.5, 0.5),
			Rotation = var6.qrCodeRotation,
			Size = UDim2.fromOffset(var10, var10)
		})
	})
end