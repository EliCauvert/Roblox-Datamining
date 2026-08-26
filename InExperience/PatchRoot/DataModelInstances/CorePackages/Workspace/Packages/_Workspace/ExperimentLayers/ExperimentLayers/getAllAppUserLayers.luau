local dashModule = require(script:FindFirstAncestor("ExperimentLayers").Parent.Dash)
local appUserLayersModule = require(script.Parent.AppUserLayers)
local ixpNewLayersForRegistration = game:DefineFastString("IxpNewLayersForRegistration", "")

local function findNextKey(p1, p2)
	if not p1[p2] then
		p1[p2] = true
		
		return p2
	end
	for i = 2, 100 do
		local text = p2 .. "_" .. i
		
		if p1[text] then
			continue
		end
		p1[text] = true
		
		return text
	end
	error("Exceeded max index for next key search: " .. p1)
end

return function(p3)
	-- upvalues: ixpNewLayersForRegistration (ref), appUserLayersModule (ref), dashModule (ref), findNextKey (ref)
	p3 = p3 or ixpNewLayersForRegistration
	
	if #p3 == 0 then
		return appUserLayersModule
	end
	local var1 = dashModule.copy(appUserLayersModule)
	local t = {}
	local t_1 = {}
	
	for i, v in var1 do
		t[i] = true
		t_1[v] = true
	end
	for i_1, v_1 in dashModule.map(string.split(p3, ","), dashModule.trim) do
		if not t_1[v_1] then
			t_1[v_1] = true
			var1[findNextKey(t, v_1)] = v_1
		end
	end
	return var1
end