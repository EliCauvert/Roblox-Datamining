local QRCodeDisplay = script:FindFirstAncestor("QRCodeDisplay")
local parent = QRCodeDisplay.Parent
local reactModule = require(parent.React)
local QRCodeModule = require(parent.QRCode)
local ecToNumberModule = require(script.Parent.ecToNumber)
local _ = require(QRCodeDisplay.Common.ECLevels)

return function(p0) --[[ line: 8 ]]
	-- upvalues: reactModule (ref), QRCodeModule (ref), ecToNumberModule (ref)
	return reactModule.useMemo(function() --[[ line: 9 ]]
		-- upvalues: QRCodeModule (copy), p0 (ref), ecToNumberModule (copy)
		local _, var4 = QRCodeModule.qrcode(p0.toEncode, ecToNumberModule(p0.ecLevel))
		
		return var4
	end, { p0.toEncode, p0.ecLevel })
end