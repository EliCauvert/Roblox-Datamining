local CollectionService = game:GetService("CollectionService")
local _ = require(script:FindFirstAncestor("SponsoredAdViewability").Parent.DiscoveryTypes)
local ConstantsModule = require(script.Parent.Constants)
local t = {}
local Count = 0

return {
	bind = function(Object, p1)
		-- upvalues: Count (ref), t (copy), ConstantsModule (copy), CollectionService (copy)
		Count += 1
		local Text = tostring(Count)
		t[Text] = p1
		Object:SetAttribute(ConstantsModule.ViewabilityTargetIdAttribute, Text)
		CollectionService:AddTag(Object, ConstantsModule.CandidateTag)
		
		return function()
			-- upvalues: Object (copy), ConstantsModule (upval), Text (copy), CollectionService (upval), t (upval)
			if Object:GetAttribute(ConstantsModule.ViewabilityTargetIdAttribute) == Text then
				CollectionService:RemoveTag(Object, ConstantsModule.CandidateTag)
				Object:SetAttribute(ConstantsModule.ViewabilityTargetIdAttribute, nil)
			end
			t[Text] = nil
		end
	end,
	get = function(p1)
		-- upvalues: t (copy)
		return t[p1]
	end,
	_clear = function()
		-- upvalues: t (copy)
		for i in t do
			t[i] = nil
		end
	end,
	_size = function(): number
		-- upvalues: t (copy)
		local Count = 0
		
		for _ in t do
			Count += 1
		end
		return Count
	end
}