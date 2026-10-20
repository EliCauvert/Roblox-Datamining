local Parent = script:FindFirstAncestor("SplitPane").Parent
local ReactModule = require(Parent.React)
local ResponsiveModule = require(Parent.Responsive)
local SplitPaneEducationalTourStepsModule = require(script.Parent.SplitPaneEducationalTourSteps)
local GetSplitPaneEducationalTourVideoAssetIdModule = require(script.Parent.getSplitPaneEducationalTourVideoAssetId)

local function getPreloadAssetIds(IsUsePreferredInputResultMatch)
	-- upvalues: SplitPaneEducationalTourStepsModule (copy), GetSplitPaneEducationalTourVideoAssetIdModule (copy)
	local List = {}
	local t = {}
	
	local function _(Key)
		-- upvalues: t (copy), List (copy)
		if not t[Key] then
			t[Key] = true
			table.insert(List, Key)
		end
	end
	
	for i, value in SplitPaneEducationalTourStepsModule do
		local SplitPaneEducationalTourVideoAssetIdModule = GetSplitPaneEducationalTourVideoAssetIdModule(value, IsUsePreferredInputResultMatch, false)
		
		if not t[SplitPaneEducationalTourVideoAssetIdModule] then
			t[SplitPaneEducationalTourVideoAssetIdModule] = true
			table.insert(List, SplitPaneEducationalTourVideoAssetIdModule)
		end
		if i == 1 then
			local SplitPaneEducationalTourVideoAssetIdModule1 = GetSplitPaneEducationalTourVideoAssetIdModule(value, IsUsePreferredInputResultMatch, true)
			
			if not t[SplitPaneEducationalTourVideoAssetIdModule1] then
				t[SplitPaneEducationalTourVideoAssetIdModule1] = true
				table.insert(List, SplitPaneEducationalTourVideoAssetIdModule1)
			end
		end
	end
	return List
end

return function(p1, p2)
	-- upvalues: ResponsiveModule (copy), ReactModule (copy), getPreloadAssetIds (copy)
	local IsUsePreferredInputResultMatch = ResponsiveModule.usePreferredInput() == ResponsiveModule.Input.Directional
	local UseRefResult = ReactModule.useRef(false)
	ReactModule.useEffect(function()
		-- upvalues: p1 (copy), UseRefResult (copy), p2 (copy), getPreloadAssetIds (upval), IsUsePreferredInputResultMatch (copy)
		if p1 and not UseRefResult.current then
			UseRefResult.current = true
			local P3 = p2 or game:GetService("ContentProvider")
			local PreloadAssetIds = getPreloadAssetIds(IsUsePreferredInputResultMatch)
			task.spawn(function()
				-- upvalues: P3 (copy), PreloadAssetIds (copy)
				pcall(function()
					-- upvalues: P3 (upval), PreloadAssetIds (upval)
					P3:PreloadAsync(PreloadAssetIds)
				end)
			end)
			
			return
		end
	end, { p1, IsUsePreferredInputResultMatch, p2 })
end