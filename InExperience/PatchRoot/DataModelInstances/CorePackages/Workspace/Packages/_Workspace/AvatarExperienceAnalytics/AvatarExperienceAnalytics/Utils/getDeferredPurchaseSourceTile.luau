local unifiedEventLogConstantsModule = require(script:FindFirstAncestor("AvatarExperienceAnalytics").UnifiedEventLogConstants)

return function(p1, p2, p3, p4)
	-- upvalues: unifiedEventLogConstantsModule (ref)
	if p3 == nil then
		return nil
	end
	local text = unifiedEventLogConstantsModule.ATTRIBUTE_PREFIX .. "itemId"
	local text_1 = unifiedEventLogConstantsModule.ATTRIBUTE_PREFIX .. "itemType"
	local var1 = nil
	
	for i, v in p1 do
		if v ~= p2 and tostring(v:GetAttribute(text)) == tostring(p3) and tostring(v:GetAttribute(text_1)) == tostring(p4) then
			if v:GetAttribute(unifiedEventLogConstantsModule.SKIP_IMPRESSION_DETECTION) ~= true or not (v:IsA("GuiObject") and (v.AbsoluteSize.X > 0 and v.AbsoluteSize.Y > 0)) then
				if var1 == nil then
					var1 = v
				end
			end
			return v
		end
	end
	return var1
end