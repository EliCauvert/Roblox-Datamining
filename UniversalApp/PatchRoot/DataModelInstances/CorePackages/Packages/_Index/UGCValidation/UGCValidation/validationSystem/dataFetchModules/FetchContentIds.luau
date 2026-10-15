local parent = script.Parent.Parent.Parent
local constantsModule = require(parent.Constants)
local parseContentIdsModule = require(parent.util.ParseContentIds)
local _ = require(parent.util.Types)
local getFFlagUGCValidateVersionedContentIdsModule = require(parent.flags.getFFlagUGCValidateVersionedContentIds)

return {
	getData = function(p1)
		-- upvalues: constantsModule (ref), getFFlagUGCValidateVersionedContentIdsModule (ref), parseContentIdsModule (ref)
		local rootInstance = p1.rootInstance
		local t = {}
		local descendants = rootInstance:GetDescendants()
		table.insert(descendants, rootInstance)
		
		for i, v in descendants do
			local className = constantsModule.CONTENT_ID_FIELDS[v.ClassName]
			
			if className then
				local v_2, var1
				for i_1, v_1 in className do
					v_2 = v[v_1]
					
					if v_2 ~= "" then
						var1 = nil
						local var2 = nil
						
						if getFFlagUGCValidateVersionedContentIdsModule() then
							local var3, var4 = parseContentIdsModule.tryParseContentId(v_2)
							var1 = var3
							var2 = var4
						else
							var1 = parseContentIdsModule.tryGetAssetIdFromContentId(v_2)
						end
						if var1 ~= nil then
							if t[var1] == nil then
								t[var1] = {}
							end
							table.insert(t[var1], { fieldName = v_1, instance = v, version = var2 })
						end
					end
				end
				local className_1 = constantsModule.CONTENT_FIELDS_WITHOUT_CONTENTID[v.ClassName]
				
				if className_1 then
					for v_1, v_2 in className_1 do
						var1 = v[v_2]
						
						if var1.SourceType == Enum.ContentSourceType.Uri then
							local var5
							local _ = nil
							local var6 = nil
							
							if getFFlagUGCValidateVersionedContentIdsModule() then
								local var7, var8 = parseContentIdsModule.tryParseContentId(var1.Uri)
								var5 = var7
								var6 = var8
							else
								var5 = parseContentIdsModule.tryGetAssetIdFromContentId(var1.Uri)
							end
							if var5 ~= nil then
								if t[var5] == nil then
									t[var5] = {}
								end
								table.insert(t[var5], { fieldName = v_2, instance = v, version = var6 })
							end
						end
					end
				end
			end
		end
		return t
	end
}