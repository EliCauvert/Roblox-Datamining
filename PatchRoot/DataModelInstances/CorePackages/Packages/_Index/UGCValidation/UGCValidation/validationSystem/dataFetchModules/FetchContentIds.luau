-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:32:49 2026 Pacific Standard Time.

local parent = script.Parent.Parent.Parent
local constantsModule = require(parent.Constants)
local parseContentIdsModule = require(parent.util.ParseContentIds)
local _ = require(parent.util.Types)
local getFFlagUGCValidateAllowEmissivesModule = require(parent.flags.getFFlagUGCValidateAllowEmissives)

return {
	getData = function(p0) --[[ line: 11 ]]
		-- upvalues: constantsModule (ref), parseContentIdsModule (ref), getFFlagUGCValidateAllowEmissivesModule (ref)
		local rootInstance = p0.rootInstance
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
						local var7 = parseContentIdsModule.tryGetAssetIdFromContentId(v_2)
						
						if var7 ~= nil then
							if t[var7] == nil then
								t[var7] = {}
							end
							table.insert(t[var7], { fieldName = v_1, instance = v })
						end
					end
				end
				if getFFlagUGCValidateAllowEmissivesModule() then
					local className_1 = constantsModule.CONTENT_FIELDS_WITHOUT_CONTENTID[v.ClassName]
					
					if className_1 then
						for v_1, v_2 in className_1 do
							local var5 = v[v_2]
							
							if var5.SourceType == Enum.ContentSourceType.Uri then
								local var6 = parseContentIdsModule.tryGetAssetIdFromContentId(var5.Uri)
								
								if var6 ~= nil then
									if t[var6] == nil then
										t[var6] = {}
									end
									table.insert(t[var6], { fieldName = v_2, instance = v })
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