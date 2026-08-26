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

local function _(p1, p2)
	if not p2 then
		return p1
	end
	assert(type(p2) == "number", "rotation must be a number")
	
	if p2 % 90 == 0 then
		return p1
	end
	local radians = math.rad(p2)
	
	return math.round(p1 / (math.sin(radians) + math.cos(radians)))
end

return function(p1)
	-- upvalues: dashModule (ref), t (ref), reactModule (ref), assetService (ref), drawImageModule (ref)
	local var1
	local var2 = dashModule.join(t, p1)
	local var3, var4 = reactModule.useState(nil)
	local var5 = reactModule.createRef()
	local sideLength = var2.sideLength
	local qrCodeRotation = var2.qrCodeRotation
	
	if qrCodeRotation then
		assert(type(qrCodeRotation) == "number", "rotation must be a number")
		
		if qrCodeRotation % 90 == 0 then
			var1 = sideLength
		else
			local radians = math.rad(qrCodeRotation)
			var1 = math.round(sideLength / (math.sin(radians) + math.cos(radians)))
		end
	else
		var1 = sideLength
	end
	reactModule.useEffect(function()
		-- upvalues: var5 (ref), var1 (ref), assetService (copy), var4 (ref), drawImageModule (copy), var2 (ref)
		if not var5.current or var5.current.Size.X ~= var1 then
			var5.current = assetService:CreateEditableImage({ Size = Vector2.new(var1, var1) })
			var4(Content.fromObject(var5.current))
		end
		drawImageModule(var5.current, var1, var2.qrCodeMatrix, var2.pixelColor3, var2.pixelTransparency)
	end, {
		var1,
		var2.qrCodeMatrix,
		var2.pixelColor3,
		var2.pixelTransparency
	})
	
	return reactModule.createElement("Frame", {
		BorderSizePixel = 0,
		BackgroundColor3 = var2.backgroundColor3,
		BackgroundTransparency = var2.backgroundTransparency,
		Size = UDim2.fromOffset(var2.sideLength, var2.sideLength)
	}, {
		ImageLabel = reactModule.createElement("ImageLabel", {
			BackgroundTransparency = 1,
			AnchorPoint = Vector2.new(0.5, 0.5),
			ImageContent = var3,
			Position = UDim2.fromScale(0.5, 0.5),
			Rotation = var2.qrCodeRotation,
			Size = UDim2.fromOffset(var1, var1)
		})
	})
end