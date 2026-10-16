local UnifiedEventLogConstantsModule = require(script:FindFirstAncestor("AvatarExperienceAnalytics").UnifiedEventLogConstants)

return function(Frames, Frame, p1, p2) --[[ Line: 22 | Named "getDeferredPurchaseSourceTile" ]]
	-- upvalues: UnifiedEventLogConstantsModule (copy)
	if p1 == nil then
		return nil
	end
	local Text = UnifiedEventLogConstantsModule.ATTRIBUTE_PREFIX .. "itemId"
	local Text1 = UnifiedEventLogConstantsModule.ATTRIBUTE_PREFIX .. "itemType"
	local v1 = nil
	
	for _, frame in Frames do
		if frame ~= Frame and tostring(frame:GetAttribute(Text)) == tostring(p1) and tostring(frame:GetAttribute(Text1)) == tostring(p2) then
			local IsYAbove: boolean = frame:IsA("GuiObject") and (frame.AbsoluteSize.X > 0 and frame.AbsoluteSize.Y > 0)
			
			if frame:GetAttribute(UnifiedEventLogConstantsModule.SKIP_IMPRESSION_DETECTION) == true and IsYAbove then
				return frame
			elseif v1 == nil then
				v1 = frame
			end
		end
	end
	return v1
end