local coreGuiService = game:GetService("CoreGui")
local constantsModule = require(script.Parent.Parent.Constants)
local capturesRecursiveCoreUIRemoval = game:DefineFastFlag("CapturesRecursiveCoreUIRemoval", false)

return function()
	-- upvalues: constantsModule (ref), capturesRecursiveCoreUIRemoval (ref), coreGuiService (ref)
	local t = {}
	
	local function _(p1)
		-- upvalues: constantsModule (copy)
		return if p1:IsA("LayerCollector") then if p1:IsA("BillboardGui") then false elseif p1.Enabled then p1.Name ~= constantsModule.OverlayName else false else false
	end
	
	if capturesRecursiveCoreUIRemoval then
		local function searchInstance(p1)
			-- upvalues: constantsModule (copy), t (ref), searchInstance (ref)
			if p1:IsA("Folder") or p1:IsA("CoreGui") then
				for i, v in p1:GetChildren() do
					searchInstance(v)
				end
				return
			elseif if not p1:IsA("LayerCollector") then false elseif p1:IsA("BillboardGui") then false elseif not p1.Enabled then false else p1.Name ~= constantsModule.OverlayName then
				p1.Enabled = false
				table.insert(t, p1)
			end
		end
		
		searchInstance(coreGuiService)
	else
		for i, v in coreGuiService:GetChildren() do
			if v:IsA("Folder") then
				for i_1, v_1 in v:GetChildren() do
					if if not v_1:IsA("LayerCollector") then false elseif v_1:IsA("BillboardGui") then false elseif not v_1.Enabled then false else v_1.Name ~= constantsModule.OverlayName then
						v_1.Enabled = false
						table.insert(t, v_1)
					end
				end
			end
			if if not v:IsA("LayerCollector") then false elseif v:IsA("BillboardGui") then false elseif not v.Enabled then false else v.Name ~= constantsModule.OverlayName then
				v.Enabled = false
				table.insert(t, v)
			end
		end
	end
	return function()
		-- upvalues: t (ref)
		for i, v in t do
			v.Enabled = true
		end
	end
end