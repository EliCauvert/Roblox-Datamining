local parent = script.Parent.Parent.Parent
local constantsModule = require(parent.Constants)
local parseContentIdsModule = require(parent.util.ParseContentIds)
local _ = require(parent.util.Types)
local getFFlagUGCValidateAllowEmissivesModule = require(parent.flags.getFFlagUGCValidateAllowEmissives)

return {
	getData = function(p1)
		-- upvalues: constantsModule (ref), parseContentIdsModule (ref), getFFlagUGCValidateAllowEmissivesModule (ref)
		local rootInstance = p1.rootInstance
		local t = {}
		local descendants = rootInstance:GetDescendants()
		table.insert(descendants, rootInstance)
		
		for i, v in descendants do
			local className = constantsModule.CONTENT_ID_FIELDS[v.ClassName]
			
			if className then
				local v_2
				for i_1, v_1 in className do
					v_2 = v[v_1]
					
					if v_2 ~= "" then
						local var1 = parseContentIdsModule.tryGetAssetIdFromContentId(v_2)
						
						if var1 ~= nil then
							if t[var1] == nil then
								t[var1] = {}
							end
							table.insert(t[var1], { fieldName = v_1, instance = v })
						end
					end
				end
				if getFFlagUGCValidateAllowEmissivesModule() then
					local className_1 = constantsModule.CONTENT_FIELDS_WITHOUT_CONTENTID[v.ClassName]
					
					if className_1 then
						for v_1, v_2 in className_1 do
							local var2 = v[v_2]
							
							if var2.SourceType == Enum.ContentSourceType.Uri then
								local var3 = parseContentIdsModule.tryGetAssetIdFromContentId(var2.Uri)
								
								if var3 ~= nil then
									if t[var3] == nil then
										t[var3] = {}
									end
									table.insert(t[var3], { fieldName = v_2, instance = v })
								end
							end
						end
					end
				end
			end
		end
		return t
	end
}