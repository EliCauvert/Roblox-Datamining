local _ = require(script:FindFirstAncestor("Moments").Parent.MomentsTypes)
local _ = require(script.Parent.FeedTypes)

local function _(p1, p2)
	if p2 == nil then
		return false
	end
	local feedItemId = p2.recommendationMetadata.feedItemId
	
	return if p1.momentId ~= p2.momentId then feedItemId ~= nil and (feedItemId ~= "" and p1.recommendationMetadata.feedItemId == feedItemId) else true
end

return function()
	local t = {}
	local t_1 = {}
	
	local function identity(p1)
		-- upvalues: t (ref)
		if p1.kind ~= "moment" then
			return nil
		end
		for i, v in t do
			if p1.moment.momentId ~= i then
				local var1
				local moment = p1.moment
				local published = v.published
				
				if published == nil then
					var1 = false
				else
					local feedItemId = published.recommendationMetadata.feedItemId
					var1 = if moment.momentId ~= published.momentId then feedItemId ~= nil and (feedItemId ~= "" and moment.recommendationMetadata.feedItemId == feedItemId) else true
				end
				if var1 then
					return i
				end
			end
		end
		return p1.moment.momentId
	end
	
	return {
		update = function(p2, p3)
			-- upvalues: t_1 (write), t (ref)
			local var2 = false
			t_1 = p2
			
			for i, v in t_1 do
				local moment = v.moment
				local momentId = t[moment.momentId]
				
				if momentId == nil then
					momentId = { retired = false, admitted = false }
					t[moment.momentId] = momentId
					var2 = true
				end
				if v.publishedMoment ~= nil then
					momentId.published = v.publishedMoment
				end
			end
			for i, v_1 in t do
				if v_1.published ~= nil and table.find(p3, v_1.published.momentId) ~= nil then
					v_1.retired = true
				end
			end
			return var2
		end,
		retireMissing = function(p4)
			-- upvalues: identity (ref), t (ref)
			local t_1 = {}
			
			for i, v in p4 do
				local var3 = identity(v)
				
				if var3 ~= nil then
					t_1[var3] = true
				end
			end
			for i_1, v_1 in t do
				if v_1.admitted and not t_1[i_1] then
					v_1.retired = true
				end
			end
		end,
		merge = function(p5)
			-- upvalues: t (ref), t_1 (write), identity (ref)
			for i, v in t do
				v.admitted = false
			end
			local t_2 = {}
			
			for i_1, v_1 in t_1 do
				t_2[v_1.moment.momentId] = true
			end
			local t_3 = {}
			
			for i_2, v_2 in p5 do
				local var4 = identity(v_2)
				
				if var4 ~= nil then
					t_3[var4] = true
					local var5 = t[var4]
					
					if var5 ~= nil and v_2.kind == "moment" and v_2.moment.momentId ~= var4 then
						var5.published = v_2.moment
					end
				end
			end
			local var6
			local t_4 = {}
			local t_5 = {}
			
			local function _(p6)
				-- upvalues: identity (copy), t_5 (ref), t_4 (ref)
				local var7 = identity(p6)
				
				if var7 ~= nil then
					if t_5[var7] then return end
					t_5[var7] = true
				end
				table.insert(t_4, p6)
			end
			
			for i_3, v_3 in t_1 do
				local moment = v_3.moment
				local momentId = moment.momentId
				local var7 = t[momentId]
				
				if not t_3[momentId] and not var7.retired then
					local t_6 = { kind = "moment", moment = var7.published or moment }
					var6 = identity(t_6)
					
					if var6 ~= nil then
						if not t_5[var6] then
							t_5[var6] = true
						end
						var7.admitted = true
					end
					table.insert(t_4, t_6)
				end
			end
			for i_4, v_4 in p5 do
				local published
				local var8 = identity(v_4)
				local var9 = if var8 ~= nil then nil else t[var8]
				
				if var9 == nil or v_4.kind ~= "moment" then
					published = identity(v_4)
					
					if published ~= nil then
						if not t_5[published] then
							t_5[published] = true
						end
					end
					table.insert(t_4, v_4)
				elseif not var9.retired and (t_2[var8] or v_4.moment.momentId ~= var8) then
					published = var9.published or v_4.moment
					local var10 = if published == v_4.moment then v_4 else { kind = "moment", moment = published }
					var6 = identity(var10)
					
					if var6 ~= nil then
						if not t_5[var6] then
							t_5[var6] = true
						end
						var9.admitted = true
					end
					table.insert(t_4, var10)
				end
			end
			return t_4
		end,
		identity = identity
	}
end