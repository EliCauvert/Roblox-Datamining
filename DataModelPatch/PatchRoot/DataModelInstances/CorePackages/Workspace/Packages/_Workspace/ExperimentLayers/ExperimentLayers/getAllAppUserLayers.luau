local DashModule = require(script:FindFirstAncestor("ExperimentLayers").Parent.Dash)
local AppUserLayersModule = require(script.Parent.AppUserLayers)
local IxpNewLayersForRegistration = game:DefineFastString("IxpNewLayersForRegistration", "")

local function findNextKey(p1, Text)
	if not p1[Text] then
		p1[Text] = true
		
		return Text
	end
	local Text1 = nil
	for i = 2, 100 do
		Text1 = Text .. "_" .. i
		
		if not p1[Text1] then
			p1[Text1] = true
			
			return Text1
		end
	end
	error("Exceeded max index for next key search: " .. Text)
end

return function(p2)
	-- upvalues: IxpNewLayersForRegistration (copy), AppUserLayersModule (copy), DashModule (copy), findNextKey (copy)
	local Text = p2 or IxpNewLayersForRegistration
	
	if #Text == 0 then
		return AppUserLayersModule
	end
	local CopyResult = DashModule.copy(AppUserLayersModule)
	local t = {}
	local t1 = {}
	
	for i, value in CopyResult do
		t[i] = true
		t1[value] = true
	end
	for _, value1 in DashModule.map(string.split(Text, ","), DashModule.trim) do
		if not t1[value1] then
			t1[value1] = true
			CopyResult[findNextKey(t, value1)] = value1
		end
	end
	return CopyResult
end