local Parent = script:FindFirstAncestor("DiscoveryMonolith").Parent
local OmniFeedTypes = require(Parent.DiscoveryTypes).OmniFeedTypes
local ServerDrivenUiModule = require(Parent.ServerDrivenUi)
local SduiErrors = ServerDrivenUiModule.SduiErrors
local SduiLogger = ServerDrivenUiModule.SduiLogger

local function getSduiV2SortTopicIds(Sorts)
	-- upvalues: OmniFeedTypes (copy)
	local List = {}
	
	for _, sort in Sorts do
		if sort.treatmentType == OmniFeedTypes.ServerDrivenUiV2 then
			table.insert(List, sort.topicId or "nil")
		end
	end
	return List
end

local function filterSduiV2Sorts(Sorts)
	-- upvalues: OmniFeedTypes (copy)
	local List = {}
	
	for _, sort in Sorts do
		if sort.treatmentType ~= OmniFeedTypes.ServerDrivenUiV2 then
			table.insert(List, sort)
		end
	end
	return List
end

local function _(List): string
	return table.concat(List, " ")
end

return function(p1, p2, p3)
	-- upvalues: getSduiV2SortTopicIds (copy), SduiLogger (copy), SduiErrors (copy), filterSduiV2Sorts (copy)
	local SduiV2SortTopicIds = getSduiV2SortTopicIds(p1.sorts)
	
	if #SduiV2SortTopicIds == 0 then return end
	local ReportError: (any, any, any) -> () = if p3.reportError then p3.reportError else SduiLogger.reportError
	local Flag = false
	local ErrorStoringOmniData = SduiErrors.SduiErrorType.ErrorStoringOmniData
	local Message: string? = nil
	
	if p1.sduiv2 == nil or typeof(p1.sduiv2) ~= "table" then
		Flag = true
		ErrorStoringOmniData = SduiErrors.SduiErrorType.NilSduiTreeInResponse
		Message = "Has V2 sdui sorts, but no sduiv2 tree in response."
	else
		local Success, Result = pcall(function()
			-- upvalues: p3 (copy), p1 (copy), p2 (copy)
			p3.seedSduiV2Payload(p1.sduiv2, p2)
		end)
		
		if not Success then
			Flag = true
			Message = `Error seeding V2 SDUI store: {Result}`
		end
	end
	if Flag then
		ReportError(ErrorStoringOmniData, {
			name = "discovery-api/omni-recommendation/sduiv2",
			message = `{Message} topicIds: {table.concat(SduiV2SortTopicIds, " ")}`
		}, p2)
		p1.sorts = filterSduiV2Sorts(p1.sorts)
		p1.sduiv2 = nil
		
		return
	else
		p1.sduiv2 = nil
	end
end