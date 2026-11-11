local QRCodeDisplay = script:FindFirstAncestor("QRCodeDisplay")
local Parent = QRCodeDisplay.Parent
local ReactModule = require(Parent.React)
local DashModule = require(Parent.Dash)
local DisplayQRCodeFromMatrixModule = require(script.Parent.Parent.DisplayQRCodeFromMatrix.DisplayQRCodeFromMatrix)
local _ = require(QRCodeDisplay.Common.ECLevels)
local UseQRCodeModule = require(script.Parent.useQRCode)

return function(p1)
	-- upvalues: UseQRCodeModule (copy), ReactModule (copy), DisplayQRCodeFromMatrixModule (copy), DashModule (copy)
	return ReactModule.createElement(DisplayQRCodeFromMatrixModule, DashModule.join(p1, { qrCodeMatrix = UseQRCodeModule(p1) }))
end