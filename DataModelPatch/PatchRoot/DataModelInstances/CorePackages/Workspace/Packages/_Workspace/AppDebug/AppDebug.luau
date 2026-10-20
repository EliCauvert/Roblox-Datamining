local function v0() end

local DevOnly = script:FindFirstChild("DevOnly")
local Flag = false
local v1 = nil

return {
	["jest.config"] = script["jest.config"],
	dumpInstanceTree = require(script.dumpInstanceTree),
	idFor = require(script.idFor),
	littleTraceback = require(script.littleTraceback),
	logTreeGraphviz = require(script.logTreeGraphviz),
	LogTree = require(script.LogTree),
	register = function()
		-- upvalues: DevOnly (copy), v0 (copy), Flag (ref), v1 (ref)
		if DevOnly == nil then
			return v0
		elseif Flag then
			return v1 or v0
		else
			Flag = true
			local list = { (require(DevOnly.TagAnnotation.TagAnnotationSection)) }
			
			v1 = function()
				-- upvalues: list (copy), Flag (upval), v1 (upval)
				for _, value in list do
					value()
				end
				Flag = false
				v1 = nil
			end
			
			return v1
		end
	end
}