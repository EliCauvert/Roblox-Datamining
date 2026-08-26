local QRCodeDisplay = script:FindFirstAncestor("QRCodeDisplay")
local parent = QRCodeDisplay.Parent
local reactModule = require(parent.React)
local QRCodeModule = require(parent.QRCode)
local ecToNumberModule = require(script.Parent.ecToNumber)
local _ = require(QRCodeDisplay.Common.ECLevels)

return function(p1)
	-- upvalues: reactModule (ref), QRCodeModule (ref), ecToNumberModule (ref)
	return reactModule.useMemo(function()
		-- upvalues: QRCodeModule (copy), p1 (ref), ecToNumberModule (copy)
		local _, var1 = QRCodeModule.qrcode(p1.toEncode, ecToNumberModule(p1.ecLevel))
		
		return var1
	end, { p1.toEncode, p1.ecLevel })
end