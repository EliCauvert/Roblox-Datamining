local function sortedKeys(List)
	local List1 = {}
	
	for i in List do
		if type(i) == "string" then
			table.insert(List1, i)
		end
	end
	table.sort(List1)
	
	return List1
end

local function buildVariableEvaluations(Flag, Result)
	if type(Result) == "boolean" then
		return { { flag = Flag, result = Result } }
	elseif type(Result) == "string" or type(Result) == "number" then
		local Text = tostring(Result)
		
		return {
			{ flag = Flag, result = Text },
			{ result = true, flag = Flag .. ":" .. Text }
		}
	else
		return nil
	end
end

return function(IXPService)
	-- upvalues: sortedKeys (copy), buildVariableEvaluations (copy)
	local Success, Result = pcall(function()
		-- upvalues: IXPService (copy)
		return IXPService:GetRegisteredUserLayersToStatus()
	end)
	
	if not Success or type(Result) ~= "table" then
		return nil
	end
	local Values = {}
	
	for _, value in sortedKeys(Result) do
		if Result[value] == Enum.IXPLoadingStatus.Initialized then
			local Success1, Result1 = pcall(function()
				-- upvalues: IXPService (copy), value (copy)
				return IXPService:GetUserLayerVariables(value)
			end)
			
			if Success1 and type(Result1) == "table" then
				for _, value1 in sortedKeys(Result1) do
					local VariableEvaluations = buildVariableEvaluations(string.format("ixp.%s.%s", value, value1), Result1[value1])
					
					if VariableEvaluations ~= nil and #Values + #VariableEvaluations <= 100 then
						table.move(VariableEvaluations, 1, #VariableEvaluations, #Values + 1, Values)
					end
				end
			end
		end
	end
	return if #Values == 0 then nil else { values = Values }
end