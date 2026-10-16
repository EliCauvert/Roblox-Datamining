local AssetService = game:GetService("AssetService")
local Parent = script:FindFirstAncestor("QRCodeDisplay").Parent
local ReactModule = require(Parent.React)
local DashModule = require(Parent.Dash)
local DrawImageModule = require(script.Parent.drawImage)
local config = {
	backgroundTransparency = 0,
	pixelTransparency = 0,
	sideLength = 200,
	backgroundColor3 = Color3.fromRGB(255, 255, 255),
	pixelColor3 = Color3.fromRGB(0, 0, 0)
}

local function _(p1, Degrees: number) --[[ Line: 36 | Named "getQrCodeImageSize" ]]
	if not Degrees then
		return p1
	end
	assert(type(Degrees) == "number", "rotation must be a number")
	
	if Degrees % 90 == 0 then
		return p1
	else
		local Radians = math.rad(Degrees)
		
		return (math.round(p1 / (math.sin(Radians) + math.cos(Radians))))
	end
end

return function(p1) --[[ Line: 51 ]]
	-- upvalues: DashModule (copy), config (copy), ReactModule (copy), AssetService (copy), DrawImageModule (copy)
	local JoinResult = DashModule.join(config, p1)
	local UseStateResult, UseStateResult2 = ReactModule.useState(nil)
	local Ref = ReactModule.createRef()
	local SideLength = JoinResult.sideLength
	local QrCodeRotation: number = JoinResult.qrCodeRotation
	local X = nil
	
	if QrCodeRotation then
		assert(type(QrCodeRotation) == "number", "rotation must be a number")
		
		if QrCodeRotation % 90 == 0 then
			X = SideLength
		else
			local Radians = math.rad(QrCodeRotation)
			X = math.round(SideLength / (math.sin(Radians) + math.cos(Radians)))
		end
	else
		X = SideLength
	end
	ReactModule.useEffect(function() --[[ Line: 58 ]]
		-- upvalues: Ref (copy), X (copy), AssetService (upval), UseStateResult2 (copy), DrawImageModule (upval), JoinResult (copy)
		if not Ref.current or Ref.current.Size.X ~= X then
			Ref.current = AssetService:CreateEditableImage({ Size = Vector2.new(X, X) })
			UseStateResult2(Content.fromObject(Ref.current))
		end
		DrawImageModule(Ref.current, X, JoinResult.qrCodeMatrix, JoinResult.pixelColor3, JoinResult.pixelTransparency)
	end, {
		X,
		JoinResult.qrCodeMatrix,
		JoinResult.pixelColor3,
		JoinResult.pixelTransparency
	})
	
	return ReactModule.createElement("Frame", {
		BorderSizePixel = 0,
		BackgroundColor3 = JoinResult.backgroundColor3,
		BackgroundTransparency = JoinResult.backgroundTransparency,
		Size = UDim2.fromOffset(JoinResult.sideLength, JoinResult.sideLength)
	}, {
		ImageLabel = ReactModule.createElement("ImageLabel", {
			BackgroundTransparency = 1,
			AnchorPoint = Vector2.new(0.5, 0.5),
			ImageContent = UseStateResult,
			Position = UDim2.fromScale(0.5, 0.5),
			Rotation = JoinResult.qrCodeRotation,
			Size = UDim2.fromOffset(X, X)
		})
	})
end