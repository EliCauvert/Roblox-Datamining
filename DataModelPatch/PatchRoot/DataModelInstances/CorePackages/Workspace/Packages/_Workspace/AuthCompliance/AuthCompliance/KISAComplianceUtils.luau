local Llama = require(script.Parent.dependencies).llama
local KISAComplianceUtils = {
	createIdToAgreementMap = function(List)
		local AgreementTypes = {}
		
		for _, value in List do
			AgreementTypes[value.id] = value.agreementType
		end
		return AgreementTypes
	end
}

function KISAComplianceUtils.getCheckBoxStatusVariables(List, p1)
	-- upvalues: KISAComplianceUtils (copy)
	local Flag = true
	local Flag1 = false
	local Flag2 = true
	local IdToAgreementMap = KISAComplianceUtils.createIdToAgreementMap(p1)
	
	for i, value in List do
		local FoundAt: number? = string.find(IdToAgreementMap[i]:lower(), "optional")
		
		if FoundAt then
			Flag1 = true
		end
		local value1: number = value
		
		if not value1 then
			Flag2 = false
			value1 = FoundAt
		end
		if not value1 then
			Flag = false
		end
	end
	return Flag, Flag1, Flag2
end

function KISAComplianceUtils.getAgreedUserAgreements(p2)
	-- upvalues: Llama (copy)
	return (Llama.Dictionary.keys((Llama.Dictionary.filter(p2, function(Enabled): boolean
		return Enabled == true
	end))))
end

return KISAComplianceUtils