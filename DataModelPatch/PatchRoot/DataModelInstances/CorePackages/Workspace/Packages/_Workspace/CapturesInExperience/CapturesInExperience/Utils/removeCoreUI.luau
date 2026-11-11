local CoreGui = game:GetService("CoreGui")
local ConstantsModule = require(script.Parent.Parent.Constants)
local CapturesRecursiveCoreUIRemoval = game:DefineFastFlag("CapturesRecursiveCoreUIRemoval", false)

return function()
	-- upvalues: ConstantsModule (copy), CapturesRecursiveCoreUIRemoval (copy), CoreGui (copy)
	local List = {}
	
	local function _(Object): boolean
		-- upvalues: ConstantsModule (upval)
		return if Object:IsA("LayerCollector") then not Object:IsA("BillboardGui") and (if Object.Enabled then Object.Name ~= ConstantsModule.OverlayName else false) else false
	end
	
	if CapturesRecursiveCoreUIRemoval then
		local function searchInstance(Object)
			-- upvalues: ConstantsModule (upval), List (copy), searchInstance (copy)
			if Object:IsA("Folder") or Object:IsA("CoreGui") then
				for _, child in Object:GetChildren() do
					searchInstance(child)
				end
				return
			elseif if Object:IsA("LayerCollector") then not Object:IsA("BillboardGui") and (if Object.Enabled then Object.Name ~= ConstantsModule.OverlayName else false) else false then
				Object.Enabled = false
				table.insert(List, Object)
			end
		end
		
		searchInstance(CoreGui)
	else
		for _, child in CoreGui:GetChildren() do
			if child:IsA("Folder") then
				for _, child1 in child:GetChildren() do
					if if child1:IsA("LayerCollector") then not child1:IsA("BillboardGui") and (if child1.Enabled then child1.Name ~= ConstantsModule.OverlayName else false) else false then
						child1.Enabled = false
						table.insert(List, child1)
					end
				end
			end
			if if child:IsA("LayerCollector") then not child:IsA("BillboardGui") and (if child.Enabled then child.Name ~= ConstantsModule.OverlayName else false) else false then
				child.Enabled = false
				table.insert(List, child)
			end
		end
	end
	return function()
		-- upvalues: List (copy)
		for _, value in List do
			value.Enabled = true
		end
	end
end