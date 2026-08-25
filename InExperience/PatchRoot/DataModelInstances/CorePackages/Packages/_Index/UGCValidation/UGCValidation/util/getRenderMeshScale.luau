local parent = script.Parent.Parent
local constantsModule = require(parent.Constants)
local _ = require(parent.util.Types)
local getMeshInfoModule = require(parent.util.getMeshInfo)
local getMeshMinMaxModule = require(parent.util.getMeshMinMax)
local getExpectedPartSizeModule = require(parent.util.getExpectedPartSize)

return function(p0, p1)
	-- upvalues: getMeshInfoModule (ref), constantsModule (ref), getMeshMinMaxModule (ref), getExpectedPartSizeModule (ref)
	local _ = nil
	local _ = nil
	local _ = nil
	local var4, var5, var6 = getMeshInfoModule(p0, constantsModule.MESH_CONTENT_TYPE.RENDER_MESH, p1)
	
	if not var4 then
		return var4, var5
	end
	local _ = nil
	local _ = nil
	local var7, var8, var9, var10 = getMeshMinMaxModule(var6, p1)
	
	if var7 then
		return true, nil, getExpectedPartSizeModule(p0, p1) / (var10 - var9)
	end
	return var7, var8
end