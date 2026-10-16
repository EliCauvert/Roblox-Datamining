local _ = require(script:FindFirstAncestor("Moments").Parent.MomentsTypes)
local _ = require(script.Parent.FeedTypes)

local function _(p1, p2): boolean --[[ Line: 17 | Named "matches" ]]
	if p2 == nil then
		return false
	else
		local FeedItemId = p2.recommendationMetadata.feedItemId
		
		return p1.momentId == p2.momentId or FeedItemId ~= nil and (FeedItemId ~= "" and p1.recommendationMetadata.feedItemId == FeedItemId)
	end
end

return function() --[[ Line: 26 | Named "createPendingFeedOverlay" ]]
	local t = {}
	local t1 = {}
	
	local function identity(p1) --[[ Line: 55 ]]
		-- upvalues: t (copy)
		if p1.kind ~= "moment" then
			return nil
		end
		for i, value in t do
			if p1.moment.momentId ~= i then
				local Moment = p1.moment
				local Published = value.published
				local IsMomentIdMatch = nil
				
				if Published == nil then
					IsMomentIdMatch = false
				else
					local FeedItemId = Published.recommendationMetadata.feedItemId
					IsMomentIdMatch = Moment.momentId == Published.momentId or FeedItemId ~= nil and (FeedItemId ~= "" and Moment.recommendationMetadata.feedItemId == FeedItemId)
				end
				if not IsMomentIdMatch then
					continue
				end
			end
			return i
		end
		return p1.moment.momentId
	end
	
	return {
		update = function(p2, List): boolean --[[ Line: 30 ]]
			-- upvalues: t1 (ref), t (copy)
			local Flag = false
			t1 = p2
			
			for _, value in t1 do
				local Moment = value.moment
				local Entry = t[Moment.momentId]
				
				if Entry == nil then
					Entry = { retired = false, admitted = false }
					t[Moment.momentId] = Entry
					Flag = true
				end
				if value.publishedMoment ~= nil then
					Entry.published = value.publishedMoment
				end
			end
			for _, value1 in t do
				if value1.published ~= nil and table.find(List, value1.published.momentId) ~= nil then
					value1.retired = true
				end
			end
			return Flag
		end,
		retireMissing = function(List) --[[ Line: 68 ]]
			-- upvalues: identity (copy), t (copy)
			local t2 = {}
			
			for i, value in List do
				local IdentityResult = identity(value)
				
				if IdentityResult ~= nil then
					t2[IdentityResult] = true
				end
			end
			for i, value1 in t do
				if value1.admitted and not t2[i] then
					value1.retired = true
				end
			end
		end,
		merge = function(List) --[[ Line: 83 ]]
			-- upvalues: t (copy), t2 (ref), identity (copy)
			for _, value in t do
				value.admitted = false
			end
			local t3 = {}
			
			for _, value1 in t2 do
				t3[value1.moment.momentId] = true
			end
			local t4 = {}
			
			for _, value2 in List do
				local IdentityResult = identity(value2)
				local NoIdentityResult = IdentityResult == nil
				local Entry = nil
				
				if not NoIdentityResult then
					t4[IdentityResult] = true
					Entry = t[IdentityResult]
					NoIdentityResult = Entry == nil or value2.kind ~= "moment" or value2.moment.momentId == IdentityResult
				end
				if not NoIdentityResult then
					Entry.published = value2.moment
				end
			end
			local List1 = {}
			local t5 = {}
			
			local function _(p3) --[[ Line: 106 | Named "append" ]]
				-- upvalues: identity (upval), t5 (copy), List1 (copy)
				local IdentityResult = identity(p3)
				
				if IdentityResult ~= nil then
					if t5[IdentityResult] then return end
					t5[IdentityResult] = true
				end
				table.insert(List1, p3)
			end
			
			for _, value3 in t2 do
				local Moment = value3.moment
				local MomentId = Moment.momentId
				local Entry = t[MomentId]
				
				if not t4[MomentId] and not Entry.retired then
					local config = { kind = "moment", moment = Entry.published or Moment }
					local IdentityResult = identity(config)
					
					if IdentityResult ~= nil then
						if not t5[IdentityResult] then
							t5[IdentityResult] = true
						else
							Entry.admitted = true
							continue
						end
					end
					table.insert(List1, config)
				end
			end
			for _, value4 in List do
				local IdentityResult = identity(value4)
				local Entry = if IdentityResult == nil then nil else t[IdentityResult]
				
				if Entry ~= nil and value4.kind == "moment" then
					if not Entry.retired and (t3[IdentityResult] or value4.moment.momentId ~= IdentityResult) then
						local Published = Entry.published or value4.moment
						local Value = if Published == value4.moment then value4 else { kind = "moment", moment = Published }
						local IdentityResult1 = identity(Value)
						
						if IdentityResult1 ~= nil then
							if not t5[IdentityResult1] then
								t5[IdentityResult1] = true
							else
								Entry.admitted = true
								continue
							end
						end
						table.insert(List1, Value)
					end
					continue
				end
				local IdentityResult1 = identity(value4)
				
				if IdentityResult1 ~= nil then
					if not t5[IdentityResult1] then
						t5[IdentityResult1] = true
					else
						continue
					end
				end
				table.insert(List1, value4)
			end
			return List1
		end,
		identity = identity
	}
end