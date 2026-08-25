local dashModule = require(script:FindFirstAncestor("ExperimentLayers").Parent.Dash)
local appUserLayersModule = require(script.Parent.AppUserLayers)
local ixpNewLayersForRegistration = game:DefineFastString("IxpNewLayersForRegistration", "")

local function findNextKey(p0, p1)
	if not p0[p1] then
		p0[p1] = true
		
		return p1
	end
	for i = 2, 100 do
		local text = p1 .. "_" .. i
		
		if p0[text] then
			continue
		end
		p0[text] = true
		
		return text
	end
	error("Exceeded max index for next key search: " .. p1)
end

return function(p2)
	-- upvalues: ixpNewLayersForRegistration (ref), appUserLayersModule (ref), dashModule (ref), findNextKey (ref)
	p2 = p2 or ixpNewLayersForRegistration
	
	if #p2 == 0 then
		return appUserLayersModule
	end
	local var6 = dashModule.copy(appUserLayersModule)
	local t = {}
	local t_1 = {}
	
	for i, v in var6 do
		t[i] = true
		t_1[v] = true
	end
	for i_1, v_1 in dashModule.map(string.split(p2, ","), dashModule.trim) do
		if not t_1[v_1] then
			t_1[v_1] = true
			var6[findNextKey(t, v_1)] = v_1
		end
	end
	return var6
end