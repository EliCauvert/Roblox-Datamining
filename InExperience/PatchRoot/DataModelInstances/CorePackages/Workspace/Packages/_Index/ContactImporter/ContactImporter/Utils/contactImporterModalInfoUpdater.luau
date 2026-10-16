local ConstantsModule = require(script.Parent.Parent.Parent.ContactImporter.Common.Constants)
local EngineFeature = game:GetEngineFeature(ConstantsModule.UNIVERSAL_APP_CONTACT_IMPORTER_STORAGE_KEYS)

return {
	addSeenCount = function(_, p1, Text) --[[ Line: 9 ]]
		-- upvalues: EngineFeature (copy), ConstantsModule (copy)
		if not EngineFeature then return end
		local Success, Result = pcall(function() --[[ Line: 13 ]]
			-- upvalues: p1 (copy), ConstantsModule (upval)
			return p1:GetItem(ConstantsModule.LOCAL_STORAGE_KEY_MODAL_DISPLAY_COUNT)
		end)
		
		if Success then
			local Text1 = ""
			
			if Result == "" then
				Text1 = Text .. ":" .. "1"
			else
				local Flag = false
				
				for i in string.gmatch(Result or "", "([^,]+)") do
					local Parts = string.split(i, ":")
					local Part = Parts[1]
					local Number: number = tonumber(Parts[2]) or 0
					
					if Part == Text then
						Flag = true
						Number += 1
					end
					local Text2 = Part .. ":" .. tostring(Number)
					
					if Text1 == "" then
						Text1 = Text2
					else
						Text1 ..= "," .. Text2
					end
				end
				if not Flag then
					Text1 ..= "," .. Text .. ":" .. "1"
				end
			end
			pcall(function() --[[ Line: 44 ]]
				-- upvalues: p1 (copy), ConstantsModule (upval), Text1 (ref)
				p1:SetItem(ConstantsModule.LOCAL_STORAGE_KEY_MODAL_DISPLAY_COUNT, Text1)
				p1:Flush()
			end)
		end
	end,
	updateTimestamp = function(_, p2, Text, p3) --[[ Line: 51 ]]
		-- upvalues: EngineFeature (copy), ConstantsModule (copy)
		if not EngineFeature then return end
		local Success, Result = pcall(function() --[[ Line: 60 ]]
			-- upvalues: p2 (copy), ConstantsModule (upval)
			return p2:GetItem(ConstantsModule.LOCAL_STORAGE_KEY_MODAL_TIMESTAMP)
		end)
		
		if Success then
			local Text1 = ""
			
			if Result == "" then
				Text1 = Text .. ":" .. tostring(p3)
			else
				local Flag = false
				
				for i in string.gmatch(Result or "", "([^,]+)") do
					local Parts = string.split(i, ":")
					local Part = Parts[1]
					local Part1 = Parts[2]
					
					if Part == Text then
						Part1 = tostring(p3)
						Flag = true
					end
					local Text2 = Part .. ":" .. tostring(Part1)
					
					if Text1 == "" then
						Text1 = Text2
					else
						Text1 ..= "," .. Text2
					end
				end
				if not Flag then
					Text1 ..= "," .. Text .. ":" .. tostring(p3)
				end
			end
			pcall(function() --[[ Line: 92 ]]
				-- upvalues: p2 (copy), ConstantsModule (upval), Text1 (ref)
				p2:SetItem(ConstantsModule.LOCAL_STORAGE_KEY_MODAL_TIMESTAMP, Text1)
				p2:Flush()
			end)
		end
	end
}