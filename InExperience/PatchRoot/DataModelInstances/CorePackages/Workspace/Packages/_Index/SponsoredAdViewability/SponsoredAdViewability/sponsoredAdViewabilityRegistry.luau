local CollectionService = game:GetService("CollectionService")
local ConstantsModule = require(script.Parent.Constants)
local _ = require(script.Parent.sponsoredAdViewabilityTypes)
local t = {}
local Count = 0

return {
	bind = function(Object, p1) --[[ Line: 16 ]]
		-- upvalues: Count (ref), t (copy), ConstantsModule (copy), CollectionService (copy)
		local IsVideo = p1.mediaType == "video"
		
		if p1.mediaType ~= "image" and not IsVideo then
			return function() --[[ Line: 20 ]] end
		elseif IsVideo ~= (p1.videoPlaybackStateRef ~= nil) then
			return function() --[[ Line: 23 ]] end
		elseif p1.isFullscreen == true and not IsVideo then
			return function() --[[ Line: 26 ]] end
		else
			Count += 1
			local Text = tostring(Count)
			t[Text] = p1
			Object:SetAttribute(ConstantsModule.ViewabilityTargetIdAttribute, Text)
			CollectionService:AddTag(Object, ConstantsModule.CandidateTag)
			
			return function() --[[ Line: 34 ]]
				-- upvalues: Object (copy), ConstantsModule (upval), Text (copy), CollectionService (upval), t (upval)
				if Object:GetAttribute(ConstantsModule.ViewabilityTargetIdAttribute) == Text then
					CollectionService:RemoveTag(Object, ConstantsModule.CandidateTag)
					Object:SetAttribute(ConstantsModule.ViewabilityTargetIdAttribute, nil)
				end
				t[Text] = nil
			end
		end
	end,
	get = function(p1) --[[ Line: 44 ]]
		-- upvalues: t (copy)
		return t[p1]
	end,
	_clear = function() --[[ Line: 48 ]]
		-- upvalues: t (copy)
		for i in t do
			t[i] = nil
		end
	end,
	_size = function(): number --[[ Line: 54 ]]
		-- upvalues: t (copy)
		local Count = 0
		
		for _ in t do
			Count += 1
		end
		return Count
	end
}