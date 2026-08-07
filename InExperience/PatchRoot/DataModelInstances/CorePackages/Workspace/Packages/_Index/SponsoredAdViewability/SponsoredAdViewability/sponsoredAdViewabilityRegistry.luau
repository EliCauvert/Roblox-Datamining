local collectionService = game:GetService("CollectionService")
local _ = require(script:FindFirstAncestor("SponsoredAdViewability").Parent.DiscoveryTypes)
local constantsModule = require(script.Parent.Constants)
local t = {}
local var3 = 0

return {
	bind = function(p0, p1) --[[ line: 23 ]]
		-- upvalues: var3 (write), t (ref), constantsModule (ref), collectionService (ref)
		var3 += 1
		local var4 = tostring(var3)
		t[var4] = p1
		p0:SetAttribute(constantsModule.ViewabilityTargetIdAttribute, var4)
		collectionService:AddTag(p0, constantsModule.CandidateTag)
		
		return function() --[[ line: 30 ]]
			-- upvalues: p0 (ref), constantsModule (copy), var4 (ref), collectionService (copy), t (copy)
			if p0:GetAttribute(constantsModule.ViewabilityTargetIdAttribute) == var4 then
				collectionService:RemoveTag(p0, constantsModule.CandidateTag)
				p0:SetAttribute(constantsModule.ViewabilityTargetIdAttribute, nil)
			end
			t[var4] = nil
		end
	end,
	get = function(p2) --[[ line: 40 ]]
		-- upvalues: t (ref)
		return t[p2]
	end,
	_clear = function() --[[ line: 44 ]]
		-- upvalues: t (ref)
		for i in t do
			t[i] = nil
		end
	end,
	_size = function() --[[ line: 50 ]]
		-- upvalues: t (ref)
		local var5 = 0
		
		for i in t do
			var5 += 1
		end
		return var5
	end
}