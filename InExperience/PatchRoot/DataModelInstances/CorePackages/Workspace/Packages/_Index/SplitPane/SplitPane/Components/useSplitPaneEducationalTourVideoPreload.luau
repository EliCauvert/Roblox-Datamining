local parent = script:FindFirstAncestor("SplitPane").Parent
local reactModule = require(parent.React)
local responsiveModule = require(parent.Responsive)
local splitPaneEducationalTourStepsModule = require(script.Parent.SplitPaneEducationalTourSteps)
local getSplitPaneEducationalTourVideoAssetIdModule = require(script.Parent.getSplitPaneEducationalTourVideoAssetId)

local function getPreloadAssetIds(value)
	-- upvalues: splitPaneEducationalTourStepsModule (ref), getSplitPaneEducationalTourVideoAssetIdModule (ref)
	local t = {}
	local t_1 = {}
	
	local function _(p1)
		-- upvalues: t_1 (ref), t (ref)
		if not t_1[p1] then
			t_1[p1] = true
			table.insert(t, p1)
		end
	end
	
	for i, v in splitPaneEducationalTourStepsModule do
		local var1 = getSplitPaneEducationalTourVideoAssetIdModule(v, value, false)
		
		if not t_1[var1] then
			t_1[var1] = true
			table.insert(t, var1)
		end
		if i == 1 then
			local var2 = getSplitPaneEducationalTourVideoAssetIdModule(v, value, true)
			
			if not t_1[var2] then
				t_1[var2] = true
				table.insert(t, var2)
			end
		end
	end
	return t
end

return function(p1, p2)
	-- upvalues: responsiveModule (ref), reactModule (ref), getPreloadAssetIds (ref)
	local var3 = responsiveModule.usePreferredInput() == responsiveModule.Input.Directional
	local var4 = reactModule.useRef(false)
	reactModule.useEffect(function()
		-- upvalues: p1 (ref), var4 (ref), p2 (ref), getPreloadAssetIds (copy), var3 (ref)
		if p1 and not var4.current then
			var4.current = true
			local p3 = p2 or game:GetService("ContentProvider")
			local var5 = getPreloadAssetIds(var3)
			task.spawn(function()
				-- upvalues: p3 (ref), var5 (ref)
				pcall(function()
					-- upvalues: p3 (copy), var5 (copy)
					p3:PreloadAsync(var5)
				end)
			end)
			
			return
		end
	end, { p1, var3, p2 })
end