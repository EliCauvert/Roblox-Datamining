local Chrome = script:FindFirstAncestor("Chrome")
local Parent = Chrome.Parent
local ReactModule = require(Parent.React)
local _ = require(Chrome.Common.Types)
local FFlagChromeActivatedMappedSignal = require(Parent.SharedFlags).FFlagChromeActivatedMappedSignal

return function(p1)
	-- upvalues: FFlagChromeActivatedMappedSignal (copy), ReactModule (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(if FFlagChromeActivatedMappedSignal and p1 == nil then nil else p1:get())
	ReactModule.useEffect(function()
		-- upvalues: FFlagChromeActivatedMappedSignal (upval), p1 (copy), UseStateResult2 (copy), UseStateResult (copy)
		if FFlagChromeActivatedMappedSignal and p1 == nil then return end
		local Connection = p1:connect(function(p2)
			-- upvalues: UseStateResult2 (upval)
			UseStateResult2(p2)
		end)
		
		if UseStateResult ~= p1:get() then
			UseStateResult2(p1:get())
		end
		return function()
			-- upvalues: Connection (copy)
			Connection:disconnect()
		end
	end, { p1 })
	
	return UseStateResult
end