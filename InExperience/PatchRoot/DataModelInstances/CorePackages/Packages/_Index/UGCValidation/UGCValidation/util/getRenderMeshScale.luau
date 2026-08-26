local parent = script.Parent.Parent
local constantsModule = require(parent.Constants)
local _ = require(parent.util.Types)
local getMeshInfoModule = require(parent.util.getMeshInfo)
local getMeshMinMaxModule = require(parent.util.getMeshMinMax)
local getExpectedPartSizeModule = require(parent.util.getExpectedPartSize)

return function(p1, p2)
	-- upvalues: getMeshInfoModule (ref), constantsModule (ref), getMeshMinMaxModule (ref), getExpectedPartSizeModule (ref)
	local _ = nil
	local _ = nil
	local _ = nil
	local var1, var2, var3 = getMeshInfoModule(p1, constantsModule.MESH_CONTENT_TYPE.RENDER_MESH, p2)
	
	if not var1 then
		return var1, var2
	end
	local _ = nil
	local _ = nil
	local var4, var5, var6, var7 = getMeshMinMaxModule(var3, p2)
	
	if var4 then
		return true, nil, getExpectedPartSizeModule(p1, p2) / (var7 - var6)
	end
	return var4, var5
end