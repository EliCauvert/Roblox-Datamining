local QRCodeDisplay = script:FindFirstAncestor("QRCodeDisplay")
local parent = QRCodeDisplay.Parent
local reactModule = require(parent.React)
local dashModule = require(parent.Dash)
local displayQRCodeFromMatrixModule = require(script.Parent.Parent.DisplayQRCodeFromMatrix.DisplayQRCodeFromMatrix)
local _ = require(QRCodeDisplay.Common.ECLevels)
local useQRCodeModule = require(script.Parent.useQRCode)

return function(p1)
	-- upvalues: useQRCodeModule (ref), reactModule (ref), displayQRCodeFromMatrixModule (ref), dashModule (ref)
	return reactModule.createElement(displayQRCodeFromMatrixModule, dashModule.join(p1, { qrCodeMatrix = useQRCodeModule(p1) }))
end