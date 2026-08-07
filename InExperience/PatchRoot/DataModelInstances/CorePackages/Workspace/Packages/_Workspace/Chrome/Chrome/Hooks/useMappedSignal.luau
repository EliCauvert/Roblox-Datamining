local chrome = script:FindFirstAncestor("Chrome")
local parent = chrome.Parent
local reactModule = require(parent.React)
local _ = require(chrome.Common.Types)
local fFlagChromeActivatedMappedSignal = require(parent.SharedFlags).FFlagChromeActivatedMappedSignal

return function(p0) --[[ line: 14 ]]
	-- upvalues: fFlagChromeActivatedMappedSignal (ref), reactModule (ref)
	local var2, var3 = reactModule.useState(if fFlagChromeActivatedMappedSignal and p0 == nil then nil else p0:get())
	reactModule.useEffect(function() --[[ line: 19 ]]
		-- upvalues: fFlagChromeActivatedMappedSignal (copy), p0 (ref), var3 (ref), var2 (ref)
		if fFlagChromeActivatedMappedSignal and p0 == nil then return end
		local var4 = p0:connect(function(p1) --[[ line: 24 ]]
			-- upvalues: var3 (copy)
			var3(p1)
		end)
		
		if var2 ~= p0:get() then
			var3(p0:get())
		end
		return function() --[[ line: 34 ]]
			-- upvalues: var4 (ref)
			var4:disconnect()
		end
	end, { p0 })
	
	return var2
end