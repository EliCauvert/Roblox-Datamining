local var1 = function() end

local devOnly = script:FindFirstChild("DevOnly")
local var2 = false
local var3 = nil

return {
	["jest.config"] = script["jest.config"],
	dumpInstanceTree = require(script.dumpInstanceTree),
	idFor = require(script.idFor),
	littleTraceback = require(script.littleTraceback),
	logTreeGraphviz = require(script.logTreeGraphviz),
	LogTree = require(script.LogTree),
	register = function()
		-- upvalues: devOnly (ref), var1 (ref), var2 (write), var3 (write)
		if _G.IS_PRODUCTION or devOnly == nil then
			return var1
		elseif var2 then
			return var3 or var1
		end
		var2 = true
		local list = { require(devOnly.TagAnnotation.TagAnnotationSection) }
		
		var3 = function()
			-- upvalues: list (ref), var2 (copy), var3 (copy)
			for i, v in list do
				v()
			end
			var2 = false
			var3 = nil
		end
		
		return var3
	end
}