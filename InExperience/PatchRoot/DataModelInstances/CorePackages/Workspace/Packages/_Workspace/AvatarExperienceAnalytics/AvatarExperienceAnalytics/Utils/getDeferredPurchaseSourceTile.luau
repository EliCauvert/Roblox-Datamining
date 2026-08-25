local unifiedEventLogConstantsModule = require(script:FindFirstAncestor("AvatarExperienceAnalytics").UnifiedEventLogConstants)

return function(p0, p1, p2, p3)
	-- upvalues: unifiedEventLogConstantsModule (ref)
	if p2 == nil then
		return nil
	end
	local text = unifiedEventLogConstantsModule.ATTRIBUTE_PREFIX .. "itemId"
	local text_1 = unifiedEventLogConstantsModule.ATTRIBUTE_PREFIX .. "itemType"
	local var3 = nil
	
	for i, v in p0 do
		if v ~= p1 and tostring(v:GetAttribute(text)) == tostring(p2) and tostring(v:GetAttribute(text_1)) == tostring(p3) then
			if v:GetAttribute(unifiedEventLogConstantsModule.SKIP_IMPRESSION_DETECTION) ~= true or not (v:IsA("GuiObject") and (v.AbsoluteSize.X > 0 and v.AbsoluteSize.Y > 0)) then
				if var3 == nil then
					var3 = v
				end
			end
			return v
		end
	end
	return var3
end